library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.pipe_types.all;  -- brings in: type pipe_array_type is array(3 downto 0) of std_logic_vector(9 downto 0);

entity pipe_generator is
  generic (
    NUM_PIPES     : integer := 3;        -- Matches array range 3 downto 0
    PIPE_SPACING  : integer := 150;
    MOVE_INTERVAL : integer := 500_000;  -- # of clk ticks between moves (25 MHz/500k ≈ 50 moves/sec)
    START_OFFSET  : integer := 10;
    PIPE_WIDTH    : integer := 40;
    PIPE_GAP      : integer := 120       -- vertical size of the gap between pipes
  );
  port (
    clk           : in  std_logic;
    reset         : in  std_logic;
    pix_row       : in  std_logic_vector(9 downto 0);
    pix_col       : in  std_logic_vector(9 downto 0);
    pipe_x_array  : out pipe_array_type;
    pipe_y_array  : out pipe_array_type;
    green_out     : out std_logic
  );
end entity;

architecture rtl of pipe_generator is
  -- Constants for screen layout
  constant SCREEN_WIDTH  : integer := 640;
  constant SCREEN_HEIGHT : integer := 480;
  constant MIN_Y         : integer := 40;
  constant MAX_Y         : integer := SCREEN_HEIGHT - PIPE_GAP - MIN_Y;

  -- Throttle counter & enable pulse
  signal move_counter : integer range 0 to MOVE_INTERVAL := 0;
  signal move_enable  : std_logic := '0';

  -- Internal storage of pipe positions
  signal pipe_x_internal : pipe_array_type;
  signal pipe_y_internal : pipe_array_type;

  -- LFSR interface
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

  signal lfsr_random  : std_logic_vector(9 downto 0);
  signal load_seed    : std_logic := '0';
  signal seed_counter : std_logic_vector(9 downto 0) := (others => '0');

begin
  ----------------------------------------------------------------
  -- 1) Free-running seed counter
  seed_proc : process(clk)
  begin
    if rising_edge(clk) then
      seed_counter <= std_logic_vector(unsigned(seed_counter) + 1);
    end if;
  end process;

  ----------------------------------------------------------------
  -- 2) Instantiate LFSR
  lfsr_inst : lfsr
    port map (
      clk        => clk,
      reset      => reset,
      enable     => move_enable,
      load_seed  => load_seed,
      seed_in    => seed_counter,
      random_out => lfsr_random
    );

  ----------------------------------------------------------------
  -- 3) Generate a one-cycle move_enable pulse every MOVE_INTERVAL ticks
  process(clk, reset)
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
  -- 4) Pipe movement & gap assignment
  process(clk, reset)
    variable rand_idx : integer;
    variable rand_y   : integer;
  begin
    if reset = '1' then
      load_seed <= '0';
      for i in NUM_PIPES-1 downto 0 loop
        -- X position staggered off-screen
        pipe_x_internal(i) <= std_logic_vector(
          to_unsigned(SCREEN_WIDTH + START_OFFSET + i * (PIPE_SPACING + PIPE_WIDTH), 10)
        );
        -- Y position randomized within [MIN_Y, MAX_Y]
        rand_idx := to_integer(unsigned(seed_counter)) mod (MAX_Y - MIN_Y + 1);
        rand_y   := MIN_Y + rand_idx;
        pipe_y_internal(i) <= std_logic_vector(to_unsigned(rand_y, 10));
      end loop;

    elsif rising_edge(clk) then
      load_seed <= '0';
      if move_enable = '1' then
        for i in NUM_PIPES-1 downto 0 loop
          if to_integer(unsigned(pipe_x_internal(i))) > -PIPE_WIDTH then
            -- Move left by one
            pipe_x_internal(i) <= std_logic_vector(unsigned(pipe_x_internal(i)) - 1);
          else
            -- Wrap around & assign new gap Y
            pipe_x_internal(i) <= std_logic_vector(
              to_unsigned(SCREEN_WIDTH + START_OFFSET + i * (PIPE_SPACING + PIPE_WIDTH), 10)
            );
            load_seed <= '1';
            rand_idx := to_integer(unsigned(lfsr_random)) mod (MAX_Y - MIN_Y + 1);
            rand_y   := MIN_Y + rand_idx;
            pipe_y_internal(i) <= std_logic_vector(to_unsigned(rand_y, 10));
          end if;
        end loop;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
  -- 5) Expose internal positions
  pipe_x_array <= pipe_x_internal;
  pipe_y_array <= pipe_y_internal;

  ----------------------------------------------------------------
  -- 6) Pipe rendering logic: draws pipes above and below the gap
  process(pix_row, pix_col, pipe_x_internal, pipe_y_internal)
    variable hit_pipe : std_logic := '0';
    variable row      : integer := to_integer(unsigned(pix_row));
    variable col      : integer := to_integer(unsigned(pix_col));
  begin
    hit_pipe := '0';
    for i in NUM_PIPES-1 downto 0 loop
      if (col >= to_integer(unsigned(pipe_x_internal(i))) and
          col <  to_integer(unsigned(pipe_x_internal(i))) + PIPE_WIDTH) then
        if (row <  to_integer(unsigned(pipe_y_internal(i))) or
            row >= to_integer(unsigned(pipe_y_internal(i))) + PIPE_GAP) then
          hit_pipe := '1';
        end if;
      end if;
    end loop;
    green_out <= hit_pipe;
  end process;

end architecture;
