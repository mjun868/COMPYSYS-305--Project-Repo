library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.bird_bitmap.all;

entity de0_cv_top is
  port (
    CLOCK_50 : in  std_logic;
    reset_n  : in  std_logic;
    PS2_CLK  : inout std_logic;
    PS2_DAT  : inout std_logic;
    PB1      : in  std_logic;
    PB2      : in  std_logic;

    VGA_R    : out std_logic_vector(3 downto 0);
    VGA_G    : out std_logic_vector(3 downto 0);
    VGA_B    : out std_logic_vector(3 downto 0);
    VGA_HS   : out std_logic;
    VGA_VS   : out std_logic
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is

  signal clk25         : std_logic := '0';
  signal reset_i       : std_logic;
  signal pix_row, pix_col         : std_logic_vector(9 downto 0);
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic;

  signal mouse_row, mouse_col     : std_logic_vector(9 downto 0);
  signal left_btn, right_btn      : std_logic;

  signal color_r, color_g, color_b : std_logic_vector(3 downto 0);
  signal vsync_sig                : std_logic;
  signal mouse_pixel              : std_logic;
  signal final_r, final_g, final_b : std_logic_vector(3 downto 0);

begin

  -- Divide 50 MHz to 25 MHz
  clk_div : process(CLOCK_50)
  begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;
    end if;
  end process;

  reset_i <= not reset_n;

  -- Mouse controller
  u_mouse : entity work.MOUSE
    port map (
      clock_25Mhz         => clk25,
      reset               => reset_i,
      mouse_data          => PS2_DAT,
      mouse_clk           => PS2_CLK,
      left_button         => left_btn,
      right_button        => right_btn,
      mouse_cursor_row    => mouse_row,
      mouse_cursor_column => mouse_col
    );

  -- === Replacing bouncing ball with falling bird ===
  u_bird : entity work.falling_bird
    port map (
      clk           => clk25,
      vert_sync     => vsync_sig,
      pixel_row     => pix_row,
      pixel_column  => pix_col,
      red           => color_r,
      green         => color_g,
      blue          => color_b
    );

  -- Mouse overlay detection
  mouse_pixel <= '1'
    when (pix_row = mouse_row and pix_col = mouse_col)
    else '0';

  -- Mux between bird and mouse cursor
  final_r <= "1111" when mouse_pixel = '1' else color_r;
  final_g <= "1111" when mouse_pixel = '1' else color_g;
  final_b <= "0000" when mouse_pixel = '1' else color_b;

  -- VGA SYNC controller
  u_vga_sync : entity work.VGA_SYNC
    port map(
      clock_25Mhz     => clk25,
      red             => final_r(0),
      green           => final_g(0),
      blue            => final_b(0),
      red_out         => vga_r_sig,
      green_out       => vga_g_sig,
      blue_out        => vga_b_sig,
      horiz_sync_out  => VGA_HS,
      vert_sync_out   => vsync_sig,
      pixel_row       => pix_row,
      pixel_column    => pix_col
    );

  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);

end architecture rtl;
