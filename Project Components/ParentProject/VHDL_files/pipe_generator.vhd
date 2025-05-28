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
    PIPE_WIDTH    : integer := 40  
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

  -- Throttle counter & enable pulse
  signal move_counter : integer range 0 to MOVE_INTERVAL := 0;
  signal move_enable  : std_logic := '0';

  -- Internal storage of pipe positions
  signal pipe_x_internal : pipe_array_type;
  signal pipe_y_internal : pipe_array_type;

  -- LFSR interface
  signal lfsr_random  : std_logic_vector(9 downto 0);
  signal load_seed    : std_logic := '0';
  signal seed_counter : std_logic_vector(9 downto 0) := (others => '0');

begin

  ----------------------------------------------------------------
  -- Free-running seed counter
  seed_proc : process(clk)
  begin
    if rising_edge(clk) then
      seed_counter <= std_logic_vector(unsigned(seed_counter) + 1);
    end if;
  end process;

  ----------------------------------------------------------------
  -- Instantiate LFSR
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
  -- 1) Generate a one-cycle move_enable pulse every MOVE_INTERVAL ticks
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
  -- 2) Pipe movement logic, including LFSR random Y assignment
  process(clk, reset)
    variable rand_y : integer;
  begin
    if reset = '1' then
      for i in NUM_PIPES-1 downto 0 loop
        pipe_x_internal(i) <= std_logic_vector(
          to_unsigned(640 + START_OFFSET + i*PIPE_SPACING, 10)
        );
        pipe_y_internal(i) <= std_logic_vector(to_unsigned(200, 10));
      end loop;
      load_seed <= '0';

    elsif rising_edge(clk) then
      load_seed <= '0';  -- default low unless wrapping pipe

      if move_enable = '1' then
        for i in NUM_PIPES-1 downto 0 loop
          if to_integer(unsigned(pipe_x_internal(i))) > 0 then
            pipe_x_internal(i) <= std_logic_vector(unsigned(pipe_x_internal(i)) - 1);
          else
            -- Wrap around
            pipe_x_internal(i) <= std_logic_vector(to_unsigned(640 + START_OFFSET, 10));

            -- Load new random seed and assign randomized Y position
            load_seed <= '1';
            rand_y := to_integer(unsigned(lfsr_random)) mod (480 - to_integer(unsigned(pipe_gap)));
            pipe_y_internal(i) <= std_logic_vector(to_unsigned(rand_y, 10));
          end if;
        end loop;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
  -- 3) Expose internal positions
  pipe_x_array <= pipe_x_internal;
  pipe_y_array <= pipe_y_internal;

  ----------------------------------------------------------------
  -- 4) Pipe rendering logic
  process(pix_row, pix_col, pipe_x_internal, pipe_y_internal, pipe_gap)
    variable hit_pipe : std_logic := '0';
  begin
    hit_pipe := '0';
    for i in NUM_PIPES-1 downto 0 loop
      if (to_integer(unsigned(pix_col)) >= to_integer(unsigned(pipe_x_internal(i))) and
          to_integer(unsigned(pix_col)) <  to_integer(unsigned(pipe_x_internal(i))) + PIPE_WIDTH) and
         ((to_integer(unsigned(pix_row)) <  to_integer(unsigned(pipe_y_internal(i)))) or
          (to_integer(unsigned(pix_row)) >  to_integer(unsigned(pipe_y_internal(i))) + 
                                            to_integer(unsigned(pipe_gap)))) then
        hit_pipe := '1';
      end if;
    end loop;
    green_out <= hit_pipe;
  end process;

end architecture;
