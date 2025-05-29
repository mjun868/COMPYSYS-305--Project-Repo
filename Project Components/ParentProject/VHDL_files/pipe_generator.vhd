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
	 game_on    : in  std_logic;
    pipe_x_array  : out pipe_array_type;
    pipe_y_array  : out pipe_array_type;
    number_of_pipe : out std_logic_vector(5 downto 0);
    green_out     : out std_logic
  );
end entity;

architecture rtl of pipe_generator is
signal initializing : std_logic := '1';
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

  signal number_of_passed_pipe : std_logic_vector(5 downto 0) := (others => '0');
  
  -- Difficulty levels
  constant DIFFICULTY_1 : integer := 6;   -- First difficulty increase
  constant DIFFICULTY_2 : integer := 12;  -- Second difficulty increase
  constant GAME_OVER    : integer := 18;  -- Game over threshold
  
  -- Movement speed based on difficulty
  signal current_move_interval : integer := MOVE_INTERVAL;
 
   -- total pixels between successive spawns
  constant SPAWN_INTERVAL : integer := PIPE_SPACING + PIPE_WIDTH;

  -- count move‐ticks until we spawn the next pipe
  signal spawn_counter   : integer range 0 to SPAWN_INTERVAL-1 := 0;
  -- which slot to reuse on the next spawn
  signal next_pipe_idx   : integer range 0 to NUM_PIPES-1    := 0;
  
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
      current_move_interval <= MOVE_INTERVAL;
    elsif rising_edge(clk) then
      -- Adjust speed based on number of passed pipes
      if to_integer(unsigned(number_of_passed_pipe)) >= DIFFICULTY_2 then
        current_move_interval <= MOVE_INTERVAL / 2;  -- Double speed
      elsif to_integer(unsigned(number_of_passed_pipe)) >= DIFFICULTY_1 then
        current_move_interval <= MOVE_INTERVAL * 2 / 3;  -- 1.5x speed
      else
        current_move_interval <= MOVE_INTERVAL;  -- Normal speed
      end if;

      if move_counter = current_move_interval then
        move_counter <= 0;
        move_enable  <= '1';
      else
        move_counter <= move_counter + 1;
        move_enable  <= '0';
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
process(clk, reset, game_on, move_enable)
    variable rand_y      : integer;
    constant SPAWN_DIST  : integer := PIPE_SPACING + PIPE_WIDTH;
  begin
    -- on global reset OR whenever game stops, re-init everything
    if reset = '1' or game_on = '0' then
      spawn_counter <= 0;
      next_pipe_idx <= 0;
      number_of_passed_pipe <= (others => '0');

      -- stagger all pipes well off the right edge
      for i in pipe_x_internal'range loop
        pipe_x_internal(i) <= std_logic_vector(
          to_unsigned(
            SCREEN_WIDTH + START_OFFSET + i * SPAWN_DIST,
            pipe_x_internal(i)'length
          )
        );
        -- fresh random gap
        rand_y := MIN_Y + (to_integer(unsigned(seed_counter))
                  mod (MAX_Y - MIN_Y + 1));
        pipe_y_internal(i) <= std_logic_vector(
          to_unsigned(rand_y, pipe_y_internal(i)'length)
        );
      end loop;

    -- only when the game is running and your move_enable ticks…
    elsif rising_edge(clk) and move_enable = '1' then

      -- 1) shift every pipe left
      for i in pipe_x_internal'range loop
        pipe_x_internal(i) <= std_logic_vector(
          signed(pipe_x_internal(i)) - 1
        );
      end loop;

      -- 2) on every SPAWN_DIST-th tick, respawn one pipe at the far right
      if spawn_counter = SPAWN_DIST-1 then
        spawn_counter <= 0;
        number_of_passed_pipe <= std_logic_vector(unsigned(number_of_passed_pipe) + 1);
        -- put pipe[next_pipe_idx] at SCREEN_WIDTH + START_OFFSET
        pipe_x_internal(next_pipe_idx) <= std_logic_vector(
          to_unsigned(
            SCREEN_WIDTH + START_OFFSET,
            pipe_x_internal(next_pipe_idx)'length
          )
        );

        -- new random gap for that pipe
        rand_y := MIN_Y + (to_integer(unsigned(lfsr_random))
                  mod (MAX_Y - MIN_Y + 1));
        pipe_y_internal(next_pipe_idx) <= std_logic_vector(
          to_unsigned(rand_y, pipe_y_internal(next_pipe_idx)'length)
        );

        -- round-robin to the next slot
        next_pipe_idx <= (next_pipe_idx + 1) mod NUM_PIPES;

      else
        spawn_counter <= spawn_counter + 1;
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

  number_of_pipe <= number_of_passed_pipe;

end architecture;