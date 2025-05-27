library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.pipe_types.all;  -- brings in: type pipe_array_type is array(3 downto 0) of std_logic_vector(9 downto 0);

entity pipe_generator is
  generic (
    NUM_PIPES     : integer := 4;    -- Matches array range 3 downto 0
    PIPE_SPACING  : integer := 150;
    MOVE_INTERVAL : integer := 500_000  -- # of clk ticks between moves (25 MHz/500k ≈ 50 moves/sec)
  );
  port (
    clk           : in  std_logic;
    reset         : in  std_logic;
    pix_row       : in  std_logic_vector(9 downto 0);
    pix_col       : in  std_logic_vector(9 downto 0);
    pipe_gap      : in  std_logic_vector(9 downto 0);
    pipe_x_array  : out pipe_array_type;
    pipe_y_array  : out pipe_array_type;
    green_out     : out std_logic
  );
end entity;

architecture rtl of pipe_generator is

  -- Throttle counter & enable pulse
  signal move_counter : integer range 0 to MOVE_INTERVAL := 0;
  signal move_enable  : std_logic := '0';

  -- Internal storage of pipe positions
  signal pipe_x_internal : pipe_array_type;
  signal pipe_y_internal : pipe_array_type;
  
  signal seed_counter        : std_logic_vector(9 downto 0) := (others => '0');
  signal load_lfsr           : std_logic := '0';
  signal lfsr_random         : std_logic_vector(9 downto 0);
  
    constant screen_width : integer := 640;
  constant pipe_width : integer := 40; 
  
  constant SPACING_VARIATION : integer := 50;  -- max extra random gap
  
    -- Random value from LFSR
  signal random_val : std_logic_vector(9 downto 0);

  -- LFSR component declaration
  component lfsr is
    port(
      clk        : in  std_logic;
      reset      : in  std_logic;
      enable     : in  std_logic;
		load_seed : in  std_logic;       -- load new seed when '1'
      seed_in   : in  std_logic_vector(9 downto 0);
      random_out : out std_logic_vector(9 downto 0)
    );
  end component;

  
  begin
  -- free-running seed counter
  seed_proc: process(clk)
  begin
    if rising_edge(clk) then
      seed_counter <= std_logic_vector(unsigned(seed_counter) + 1);
    end if;
  end process;

  ----------------------------------------------------------------
  -- 1) Generate a one-cycle move_enable pulse every MOVE_INTERVAL pixels
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

  -- Instantiate LFSR component
  u_lfsr: lfsr
    port map(
      clk        => clk,
      reset      => reset,
		enable    => move_enable,
      load_seed => load_lfsr,
      seed_in   => seed_counter,
      random_out=> lfsr_random
    );
  ----------------------------------------------------------------
  -- 2) Pipe movement, now gated by move_enable
  process(clk, reset)
  
  variable rand_ypos : integer;
  
    begin
    if reset = '1' then
      load_lfsr <= '0';
      for i in 3 downto 0 loop
        pipe_x_internal(i) <= std_logic_vector(to_unsigned(SCREEN_WIDTH + i*PIPE_SPACING,10));
        pipe_y_internal(i) <= std_logic_vector(to_unsigned(200,10));
      end loop;
    elsif rising_edge(clk) then
      if move_enable = '1' then
        for i in 3 downto 0 loop
          if to_integer(unsigned(pipe_x_internal(i))) > 0 then
            pipe_x_internal(i) <= std_logic_vector(unsigned(pipe_x_internal(i)) - 1);
          else
            -- wrap X
            pipe_x_internal(i) <= std_logic_vector(to_unsigned(SCREEN_WIDTH + PIPE_SPACING,10));
            -- reload LFSR seed for this pipe
            load_lfsr <= '1';
            -- random vertical position for gap
            rand_ypos := to_integer(unsigned(lfsr_random)) mod (480 - to_integer(unsigned(pipe_gap)));
            pipe_y_internal(i) <= std_logic_vector(to_unsigned(rand_ypos,10));
          end if;
        end loop;
        load_lfsr <= '0';
      end if;
    end if;
  end process;

  -- export positions
  pipe_x_array <= pipe_x_internal;
  pipe_y_array <= pipe_y_internal;

  -- rendering logic
  render_pipes: process(pix_row, pix_col, pipe_x_internal, pipe_y_internal, pipe_gap)
    variable hit_pipe : std_logic := '0';
    variable x_raw    : integer;
    variable y_top    : integer;
    variable y_bot    : integer;
    variable row      : integer;
    variable col      : integer;
  begin
    hit_pipe := '0';
    row := to_integer(unsigned(pix_row));
    col := to_integer(unsigned(pix_col));

    for i in 3 downto 0 loop
      x_raw := to_integer(unsigned(pipe_x_internal(i)));
      y_top := to_integer(unsigned(pipe_y_internal(i)));
      y_bot := y_top + to_integer(unsigned(pipe_gap));

      if (x_raw >= 0) and (x_raw < SCREEN_WIDTH) then
        if (col >= x_raw and col < x_raw + PIPE_WIDTH) and
           (row < y_top or row > y_bot) then
          hit_pipe := '1';
        end if;
      end if;
    end loop;

    green_out <= hit_pipe;
  end process;

end architecture rtl;
