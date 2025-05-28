library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bouncy_ball is
  port(
    pb1                     : in  std_logic;
    pb2                     : in  std_logic;
    clk                     : in  std_logic;
    vert_sync               : in  std_logic;
    current_left_btn_status : in  std_logic;
    pixel_row               : in  std_logic_vector(9 downto 0);
    pixel_column            : in  std_logic_vector(9 downto 0);
    red                     : out std_logic_vector(3 downto 0);
    green                   : out std_logic_vector(3 downto 0);
    blue                    : out std_logic_vector(3 downto 0);
    ball_on                 : out std_logic;
    bird_row                : out std_logic_vector(9 downto 0);
    bird_col                : out std_logic_vector(9 downto 0)
  );
end entity bouncy_ball;

architecture behavior of bouncy_ball is
  -- Use unsigned for arithmetic
  signal size_u         : unsigned(9 downto 0);
  signal ball_y_pos_u   : unsigned(9 downto 0);
  signal ball_x_pos_u   : unsigned(10 downto 0);
  signal ball_y_motion_s: signed(10 downto 0);
  signal previous_left_status: std_logic := '1';
  signal internal_ball_on    : std_logic;

  -- Registers for bird coordinate output
  signal row_reg       : unsigned(9 downto 0);
  signal col_reg       : unsigned(9 downto 0);
begin
  -- Initialize constants
  size_u       <= to_unsigned(8, 10);
  ball_x_pos_u <= to_unsigned(100, 11);

  -- Collision detection: compare unsigned values
  internal_ball_on <= '1' when (
       (ball_x_pos_u <= unsigned(pixel_column) + size_u)
    and (unsigned(pixel_column) <= ball_x_pos_u + size_u)
    and (ball_y_pos_u <= unsigned(pixel_row)    + size_u)
    and (unsigned(pixel_row)    <= ball_y_pos_u + size_u)
  ) else '0';

  ball_on <= internal_ball_on;

  -- Color outputs
  red   <= (others=>'1') when internal_ball_on = '1' else (others=>'0');
  green <= (others=>'0') when internal_ball_on = '1' else (others=>'1');
  blue  <= (others=>'0') when internal_ball_on = '1' else (others=>'1');

  -- Latch bird position when ball is on
  process(clk)
  begin
    if rising_edge(clk) then
      if internal_ball_on = '1' then
        row_reg <= unsigned(pixel_row);
        col_reg <= unsigned(pixel_column);
      end if;
    end if;
  end process;

  bird_row <= std_logic_vector(row_reg);
  bird_col <= std_logic_vector(col_reg);

  -- Vertical motion and bouncing
  Free_Fall: process(vert_sync)
  begin
    if rising_edge(vert_sync) then
      -- Bounce off bottom
      if ball_y_pos_u >= to_unsigned(479, 10) - size_u then
        ball_y_motion_s <= to_signed(0, 11);
      else
        ball_y_motion_s <= to_signed(1, 11);
      end if;
      -- Jump on click
      if previous_left_status = '0' and current_left_btn_status = '1' and ball_y_pos_u > size_u then
        if ball_y_pos_u < size_u + to_unsigned(50, 10) then
          ball_y_motion_s <= to_signed(0, 11);
        else
          ball_y_motion_s <= to_signed(-50, 11);
        end if;
      end if;
      -- Update position
      ball_y_pos_u <= ball_y_pos_u + unsigned(ball_y_motion_s(9 downto 0));
      previous_left_status <= current_left_btn_status;
    end if;
  end process Free_Fall;

end architecture behavior;
