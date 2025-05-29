library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

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
  -- Constants for sprite size
  constant SPRITE_WIDTH : integer := 32;
  constant SPRITE_HEIGHT : integer := 32;

  -- Signals for sprite positioning and motion
  signal ball_y_pos        : std_logic_vector(9 downto 0);
  signal ball_x_pos        : std_logic_vector(10 downto 0);
  signal ball_y_motion     : std_logic_vector(9 downto 0);
  signal previous_left_status : std_logic := '1';
  signal sprite_on         : std_logic;
  signal sprite_position_on : std_logic;

  -- Signals for sprite ROM
  signal rom_address       : std_logic_vector(9 downto 0);
  signal rom_data         : std_logic_vector(11 downto 0);
  signal sprite_x         : std_logic_vector(9 downto 0);
  signal sprite_y         : std_logic_vector(9 downto 0);
  signal temp_red         : std_logic_vector(3 downto 0);
  signal temp_green       : std_logic_vector(3 downto 0);
  signal temp_blue        : std_logic_vector(3 downto 0);

  -- Component declaration for the sprite ROM
  component main_char_rom is
    port (
      address : in  std_logic_vector(9 downto 0);
      clock   : in  std_logic;
      q       : out std_logic_vector(11 downto 0)
    );
  end component;

begin
  ball_x_pos <= conv_std_logic_vector(100, 11);

  -- Calculate sprite coordinates relative to current pixel
  sprite_x <= pixel_column - ball_x_pos(9 downto 0);
  sprite_y <= pixel_row - ball_y_pos;

  -- Calculate ROM address (32x32 sprite = 1024 pixels)
  rom_address <= sprite_y(4 downto 0) & sprite_x(4 downto 0);

  -- Determine if current pixel is within sprite bounds
  sprite_position_on <= '1' when (sprite_x < SPRITE_WIDTH and sprite_x >= 0) and 
                                (sprite_y < SPRITE_HEIGHT and sprite_y >= 0) else '0';

  -- Map 12-bit ROM data directly to RGB (4 bits per color)
  process(rom_data, sprite_position_on)
  begin
    if sprite_position_on = '1' then
      -- Split 12-bit data into RGB components (4 bits each)
      temp_red <= rom_data(11 downto 8);    -- Most significant 4 bits
      temp_green <= rom_data(7 downto 4);   -- Middle 4 bits
      temp_blue <= rom_data(3 downto 0);    -- Least significant 4 bits
    else
      -- Background color (white)
      temp_red <= "1111"; temp_green <= "1111"; temp_blue <= "1111";
    end if;
  end process;

  -- Check if all RGB components are non-zero
  sprite_on <= '1' when (sprite_position_on = '1' and not (temp_red = "0000" and temp_blue = "0000" and temp_blue = "0000")) else '0';

  -- Output sprite_on signal
  ball_on <= sprite_on;

  -- Output RGB values
  red <= temp_red;
  green <= temp_green;
  blue <= temp_blue;

  -- Instantiate the sprite ROM
  sprite_rom : main_char_rom
  port map (
    address => rom_address,
    clock => clk,
    q => rom_data
  );

  -- Latch bird position when ball is on
  process(clk)
  begin
    if rising_edge(clk) then
      if sprite_on = '1' then
        bird_row <= pixel_row;
        bird_col <= pixel_column;
      end if;
    end if;
  end process;

  -- Vertical motion and bouncing
  Free_Fall : process(vert_sync)
  begin
    if rising_edge(vert_sync) then
      -- Bounce off bottom
      if ('0' & ball_y_pos >= conv_std_logic_vector(479, 10) - SPRITE_HEIGHT) then
        ball_y_motion <= conv_std_logic_vector(0, 10); -- freeze at the bottom
      else
        ball_y_motion <= conv_std_logic_vector(1, 10);
      end if;

      -- Jump on click
      if (previous_left_status = '0' and current_left_btn_status = '1' and ball_y_pos > SPRITE_HEIGHT) then
        if (ball_y_pos < (SPRITE_HEIGHT + 50)) then
          -- freeze at the ceiling
          ball_y_motion <= conv_std_logic_vector(0, 10);
        else
          -- move upward by 50 pixels
          ball_y_motion <= -conv_std_logic_vector(50, 10);
        end if;
      end if;

      -- Update position
      ball_y_pos <= ball_y_pos + ball_y_motion;
      previous_left_status <= current_left_btn_status;
    end if;
  end process Free_Fall;

end architecture behavior;
