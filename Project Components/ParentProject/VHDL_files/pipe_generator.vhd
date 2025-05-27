library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.pipe_types.all;


entity pipe_generator is
  generic (
    NUM_PIPES    : integer := 4;   -- Matches array range 3 downto 0
    PIPE_SPACING : integer := 150
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

  -- Internal signals
  signal pipe_x_internal : pipe_array_type;
  signal pipe_y_internal : pipe_array_type;

begin

  -- Pipe movement process
  process(clk, reset)
  begin
    if reset = '1' then
      for i in 3 downto 0 loop
        pipe_x_internal(i) <= std_logic_vector(to_unsigned(640 + i * PIPE_SPACING, 10));
        pipe_y_internal(i) <= std_logic_vector(to_unsigned(100 + (i * 20), 10));  -- Temp varied Y
      end loop;
    elsif rising_edge(clk) then
      for i in 3 downto 0 loop
        if to_integer(unsigned(pipe_x_internal(i))) > 0 then
          pipe_x_internal(i) <= std_logic_vector(unsigned(pipe_x_internal(i)) - 1);
        else
          pipe_x_internal(i) <= std_logic_vector(to_unsigned(640, 10));
          -- Optional: later add LFSR-based randomness for pipe_y_internal(i)
        end if;
      end loop;
    end if;
  end process;

  -- Output pipe positions (for collision detection)
  pipe_x_array <= pipe_x_internal;
  pipe_y_array <= pipe_y_internal;

  -- Pipe rendering logic: detect whether current pixel is within any pipe body
  process(pix_row, pix_col, pipe_x_internal, pipe_y_internal, pipe_gap)
    variable hit_pipe : std_logic := '0';
  begin
    hit_pipe := '0';

    for i in 3 downto 0 loop
      if (to_integer(unsigned(pix_col)) >= to_integer(unsigned(pipe_x_internal(i))) and
          to_integer(unsigned(pix_col)) <  to_integer(unsigned(pipe_x_internal(i))) + 40) and
         ((to_integer(unsigned(pix_row)) <  to_integer(unsigned(pipe_y_internal(i)))) or
          (to_integer(unsigned(pix_row)) >  to_integer(unsigned(pipe_y_internal(i))) + to_integer(unsigned(pipe_gap)))) then
        hit_pipe := '1';
      end if;
    end loop;

    green_out <= hit_pipe;
  end process;

end architecture;
