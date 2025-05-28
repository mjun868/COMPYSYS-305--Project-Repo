library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;   -- for simple vector arithmetic

entity de0_cv_top is
  port (
    CLOCK_50 : in  std_logic;                    -- 50 MHz onboard clock
    reset_n  : in  std_logic;                    -- KEY0 (active low)
    PS2_CLK  : inout std_logic;                  -- PS/2 clock
    PS2_DAT  : inout std_logic;                  -- PS/2 data
    PB1      : in  std_logic;                    -- KEY1 (active low)
    PB2      : in  std_logic;                    -- KEY2 (active low)
    SW0      : in  std_logic;                    -- DIP switch 0 (baseline bg select)

    VGA_R    : out std_logic_vector(3 downto 0); -- VGA Red[3:0]
    VGA_G    : out std_logic_vector(3 downto 0); -- VGA Green[3:0]
    VGA_B    : out std_logic_vector(3 downto 0); -- VGA Blue[3:0]
    VGA_HS   : out std_logic;                    -- VGA H-sync
    VGA_VS   : out std_logic;                    -- VGA V-sync
    LEDR0    : out std_logic                     -- debug LED for SW0
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is

  -- 1) Clock divider: 50 MHz → 25 MHz
  signal clk25        : std_logic := '0';

  -- 2) Active-high reset
  signal reset_i      : std_logic;
  
  -- 3) VGA_SYNC interface
  signal pix_row, pix_col           : std_logic_vector(9 downto 0);
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic;

  -- 4) PS/2 mouse outputs
  signal mouse_row, mouse_col       : std_logic_vector(9 downto 0);
  signal left_btn, right_btn        : std_logic;

  -- 5) Single-bit colour from bouncy_ball
  signal color_r, color_g, color_b  : std_logic;

  -- Internal VSYNC signal
  signal vsync_sig                  : std_logic;

  -- Mouse overlay
  signal mouse_pixel                : std_logic;
  signal final_r, final_g, final_b  : std_logic;

  -- ─── Button synchronizer / debounce signals ───
  signal pb1_sync_0, pb1_sync_1      : std_logic := '1';
  signal btn1_stable                 : std_logic;
  signal btn1                        : std_logic;

  -- ─── SW0 synchronizer ───
  signal sw0_sync_0, sw0_sync_1      : std_logic := '0';
  signal sw0_stable                  : std_logic;

  -- ─── Background-toggle state ───
  signal bg_mode                     : std_logic;

  -- ─── Wrapped colour signals ───
  signal bg_r_const, bg_g_const, bg_b_const : std_logic;
  signal wrapped_r, wrapped_g, wrapped_b    : std_logic;

begin

  -- Clock-divide 50 MHz → 25 MHz
  clk_div : process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;
    end if;
  end process;

  -- Invert the active-low reset
  reset_i <= not reset_n;

  -- ─── 2-stage sync for PB1 ───
  sync_btn : process(clk25, reset_i) begin
    if reset_i = '1' then
      pb1_sync_0 <= '1';
      pb1_sync_1 <= '1';
    elsif rising_edge(clk25) then
      pb1_sync_0 <= PB1;
      pb1_sync_1 <= pb1_sync_0;
    end if;
  end process;
  btn1_stable <= pb1_sync_1;
  btn1        <= not btn1_stable;  -- pressed → '1'

  -- ─── 2-stage sync for SW0 ───
  sw0_sync : process(clk25, reset_i) begin
    if reset_i = '1' then
      sw0_sync_0 <= '0';
      sw0_sync_1 <= '0';
    elsif rising_edge(clk25) then
      sw0_sync_0 <= SW0;
      sw0_sync_1 <= sw0_sync_0;
    end if;
  end process;
  sw0_stable <= sw0_sync_1;
  LEDR0      <= sw0_stable;  -- debug LED

  -- ─── Final bg_mode = SW0_baseline XOR btn1 (push-and-hold) ───
  bg_mode <= sw0_stable xor btn1;

  -- ─── Background colour constants ───
  -- bg_mode='1' → pink  (1,0,1)
  -- bg_mode='0' → light-blue (0,1,1)
  bg_r_const <= '1' when bg_mode = '1' else '0';
  bg_g_const <= '0' when bg_mode = '1' else '1';
  bg_b_const <= '1';

  -- PS/2 mouse controller
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

  -- Bouncing-ball display
  u_ball : entity work.bouncy_ball
    port map(
      pb1          => btn1,
      pb2          => PB2,  -- direct PB2 or similarly debounced
      clk          => clk25,
      vert_sync    => vsync_sig,
		left_mouse_click => left_btn,
      pixel_row    => pix_row,
      pixel_column => pix_col,
      red          => color_r,
      green        => color_g,
      blue         => color_b
    );

  -- Wrap default blue pixels to chosen colour
  wrap_bg : process(color_r, color_g, color_b,
                    bg_r_const, bg_g_const, bg_b_const)
  begin
    if (color_r='0' and color_g='0' and color_b='1') then
      wrapped_r <= bg_r_const;
      wrapped_g <= bg_g_const;
      wrapped_b <= bg_b_const;
    else
      wrapped_r <= color_r;
      wrapped_g <= color_g;
      wrapped_b <= color_b;
    end if;
  end process;

  -- Mouse overlay
  mouse_pixel <= '1' when (pix_row=mouse_row and pix_col=mouse_col)
                 else '0';
  final_r <= '1' when mouse_pixel='1' else wrapped_r;
  final_g <= '1' when mouse_pixel='1' else wrapped_g;
  final_b <= '1' when mouse_pixel='1' else wrapped_b;

  -- VGA sync + output
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

  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);

end architecture rtl;
