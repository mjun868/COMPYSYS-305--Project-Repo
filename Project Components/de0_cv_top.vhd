library IEEE; --hello
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;   -- for simple vector arithmetic

entity de0_cv_top is
  port (
    CLOCK_50 : in  std_logic;                    -- 50 MHz onboard clock
    reset_n  : in  std_logic;                    -- KEY0 (active low)
    PS2_CLK  : inout std_logic;                  -- PS/2 clock
    PS2_DAT  : inout std_logic;                  -- PS/2 data
    PB1      : in  std_logic;                    -- KEY1
    PB2      : in  std_logic;                    -- KEY2

    VGA_R    : out std_logic_vector(3 downto 0); -- VGA Red[3:0]
    VGA_G    : out std_logic_vector(3 downto 0); -- VGA Green[3:0]
    VGA_B    : out std_logic_vector(3 downto 0); -- VGA Blue[3:0]
    VGA_HS   : out std_logic;                    -- VGA H-sync
    VGA_VS   : out std_logic                     -- VGA V-sync
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is

  -- 1) Clock divider: 50 MHz → 25 MHz
  signal clk25        : std_logic := '0';

  -- 2) Active-high reset
  signal reset_i      : std_logic;

  -- 3) VGA_SYNC interface
  signal pix_row, pix_col         : std_logic_vector(9 downto 0);
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic;

  -- 4) PS/2 mouse outputs
  signal mouse_row, mouse_col     : std_logic_vector(9 downto 0);
  signal left_btn, right_btn      : std_logic;

  -- 5) Single-bit colour from bouncy_ball
  signal color_r, color_g, color_b : std_logic;

  -- Internal VSYNC signal for sharing between modules
  signal vsync_sig                : std_logic;

  -- <<<<<< ADDED: Signals for mouse overlay >>>>>>
  signal mouse_pixel              : std_logic;  -- Indicates when current pixel == mouse position
  signal final_r, final_g, final_b : std_logic; -- Final colour signals after overlay

begin

  -- Clock‑divide 50 MHz → 25 MHz 
  clk_div : process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;
    end if;
  end process;

  -- Invert the active-low reset 
  reset_i <= not reset_n;

  -- Instantiate PS/2 mouse controller 
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

  -- Instantiate bouncing-ball display 
  u_ball : entity work.bouncy_ball
    port map(
      pb1          => PB1,
      pb2          => PB2,
      clk          => clk25,
      vert_sync    => vsync_sig,
      pixel_row    => pix_row,
      pixel_column => pix_col,
      red          => color_r,
      green        => color_g,
      blue         => color_b
    );

  -- <<<<<< ADDED: Mouse overlay logic >>>>>>
  mouse_pixel <= '1'
    when (pix_row = mouse_row and pix_col = mouse_col)
    else '0';

  -- <<<<<< ADDED: Mux between ball/background and mouse cursor >>>>>>
  final_r <= '1' when mouse_pixel = '1' else color_r;
  final_g <= '1' when mouse_pixel = '1' else color_g;
  final_b <= '1' when mouse_pixel = '1' else color_b;

  -- Instantiate VGA sync + blanking + pixel coords
  -- <<<<<< CHANGED: now feeding final_{r,g,b} instead of raw color_{r,g,b} >>>>>>
  u_vga_sync : entity work.VGA_SYNC
    port map(
      clock_25Mhz     => clk25,
      red             => final_r,
      green           => final_g,
      blue            => final_b,
      red_out         => vga_r_sig,
      green_out       => vga_g_sig,
      blue_out        => vga_b_sig,
      horiz_sync_out  => VGA_HS,
      vert_sync_out   => vsync_sig,
      pixel_row       => pix_row,
      pixel_column    => pix_col
    );

  -- Drive the top-level VSYNC port from internal signal and expand to 4 bits 
  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);

end architecture rtl;