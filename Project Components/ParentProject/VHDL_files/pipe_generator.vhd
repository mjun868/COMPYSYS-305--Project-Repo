library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.pipe_types.all;  -- type pipe_array_type is array (2 downto 0) of std_logic_vector(10 downto 0);

entity pipe_generator is
  generic (
    NUM_PIPES     : integer := 3;        -- # of pipes
    PIPE_SPACING  : integer := 185;      -- horizontal distance between pipes
    MOVE_INTERVAL : integer := 500_000;  -- ticks between moves (~50 moves/sec)
    START_OFFSET  : integer := 10;
    PIPE_WIDTH    : integer := 40;
    PIPE_GAP      : integer := 120       -- gap height
  );
  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    pix_row      : in  std_logic_vector(9 downto 0);
    pix_col      : in  std_logic_vector(9 downto 0);
    game_on      : in  std_logic;
    pipe_x_array : out pipe_array_type;
    pipe_y_array : out pipe_array_type;
    green_out    : out std_logic;
    number_of_pipe : out std_logic_vector(5 downto 0)
  );
end entity;

architecture rtl of pipe_generator is
  -- Screen constants
  constant SCREEN_WIDTH  : integer := 640;
  constant SCREEN_HEIGHT : integer := 480;
  constant MIN_Y         : integer := 40;
  constant MAX_Y         : integer := SCREEN_HEIGHT - PIPE_GAP - MIN_Y;

  -- Move-enable pulse
  signal move_counter : integer range 0 to MOVE_INTERVAL := 0;
  signal move_enable  : std_logic := '0';

  -- Internal integer positions for pipes
  type int_array is array (pipe_x_array'range) of integer;
  signal pipe_x_int : int_array;
  signal pipe_y_int : int_array;

  -- Seed counter and LFSR for randomness
  signal seed_counter : std_logic_vector(9 downto 0) := (others => '0');
  signal load_seed    : std_logic := '0';
  signal lfsr_random  : std_logic_vector(9 downto 0);

  component lfsr is
    port (
      clk        : in  std_logic;
      reset      : in  std_logic;
      enable     : in  std_logic;
      load_seed  : in  std_logic;
      seed_in    : in  std_logic_vector(9 downto 0);
      random_out : out std_logic_vector(9 downto 0)
    );
  end component;

begin
  ----------------------------------------------------------------
  -- 1) Free-running seed counter (vector)
  seed_proc : process(clk)
  begin
    if rising_edge(clk) then
      seed_counter <= std_logic_vector(unsigned(seed_counter) + 1);
    end if;
  end process;

  ----------------------------------------------------------------
  -- 2) Instantiate LFSR: reload on move_enable
  lfsr_inst : lfsr
    port map(
      clk       => clk,
      reset     => reset,
      enable    => move_enable,
      load_seed => move_enable,
      seed_in   => seed_counter,
      random_out=> lfsr_random
    );

  ----------------------------------------------------------------
  -- 3) Generate move_enable pulse every MOVE_INTERVAL ticks
  move_enable_proc : process(clk, reset)
  begin
    if reset = '1' then
      move_counter <= 0;
      move_enable  <= '0';
    elsif rising_edge(clk) then
      if move_counter = MOVE_INTERVAL then
        move_counter <= 0;
        move_enable  <= '1';
      else
        move_counter <= move_counter + 1;
        move_enable  <= '0';
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
  -- 4) Shift pipes and respawn with LFSR gaps
  shift_respawn_proc : process(clk, reset)
    variable i    : integer;
    variable gap  : integer;
  begin
    if reset = '1' or game_on = '0' then
      -- initialize positions and first gaps: seed_counter for the very first pipe, then LFSR for the others
      for i in pipe_x_int'range loop
        pipe_x_int(i) <= SCREEN_WIDTH + START_OFFSET + i*(PIPE_SPACING + PIPE_WIDTH);
        -- first pipe gap via seed_counter; subsequent via LFSR
        if i = pipe_x_int'low then
          gap := MIN_Y + (to_integer(unsigned(seed_counter)) mod (MAX_Y - MIN_Y + 1));
        else
          gap := MIN_Y + (to_integer(unsigned(lfsr_random)) mod (MAX_Y - MIN_Y + 1));
        end if;
        pipe_y_int(i) <= gap;
      end loop;

    elsif rising_edge(clk) and move_enable = '1' then
      for i in pipe_x_int'range loop
        -- shift left by 1
        pipe_x_int(i) <= pipe_x_int(i) - 1;
        -- respawn when rightmost pixel exits
        if pipe_x_int(i) + PIPE_WIDTH - 1 < 0 then
          pipe_x_int(i) <= SCREEN_WIDTH + START_OFFSET;
          -- use LFSR output for new gap
          gap := MIN_Y + (to_integer(unsigned(lfsr_random)) mod (MAX_Y - MIN_Y + 1));
          pipe_y_int(i) <= gap;
        end if;
      end loop;
    end if;
  end process;

  ----------------------------------------------------------------
  -- 5) Cast integer positions back to std_logic_vector outputs
  cast_proc : process(pipe_x_int, pipe_y_int)
    variable i : integer;
  begin
    for i in pipe_x_int'range loop
      pipe_x_array(i) <= std_logic_vector(to_unsigned(pipe_x_int(i), pipe_x_array(i)'length));
      pipe_y_array(i) <= std_logic_vector(to_unsigned(pipe_y_int(i), pipe_y_array(i)'length));
    end loop;
  end process;

  ----------------------------------------------------------------
  -- 6) Render logic remains unchanged
  render_proc : process(pix_row, pix_col, pipe_x_int, pipe_y_int)
    variable hit_pipe : std_logic := '0';
    variable row      : integer := to_integer(unsigned(pix_row));
    variable col      : integer := to_integer(unsigned(pix_col));
    variable i        : integer;
  begin
    hit_pipe := '0';
    for i in pipe_x_int'range loop
      if col >= pipe_x_int(i) and col < pipe_x_int(i) + PIPE_WIDTH then
        if row < pipe_y_int(i) or row >= pipe_y_int(i) + PIPE_GAP then
          hit_pipe := '1';
        end if;
      end if;
    end loop;
    green_out <= hit_pipe;
  end process;

end architecture;
