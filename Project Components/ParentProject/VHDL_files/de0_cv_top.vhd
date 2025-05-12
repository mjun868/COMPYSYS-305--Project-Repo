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
  signal right_btn                  : std_logic;
  signal current_left_btn, previous_left_btn: std_logic;
  -- 5) Single-bit colour from bouncy_ball
  signal color_r, color_g, color_b  : std_logic;

  -- Internal VSYNC signal
  signal vsync_sig                  : std_logic;

  -- Background wrapping signals
  signal wrapped_r, wrapped_g, wrapped_b    : std_logic;

  -- Character signals
  signal char_address : std_logic_vector(5 downto 0);
  signal font_row     : std_logic_vector(2 downto 0);
  signal font_col     : std_logic_vector(2 downto 0);
  signal rom_output   : std_logic;

  -- Pipeline register for char pixel bit
  signal char_pixel_reg : std_logic := '0';

  -- Region indicator
  signal in_char_region : std_logic := '0';

  -- Mouse overlay
  signal mouse_pixel : std_logic;

  -- Constant index for 'A' (ASCII 65 – base 32 = 33)
  constant A_ADDR : std_logic_vector(5 downto 0) := "100001";
  
  -- Debounce signals
  signal pb1_sync_0 : std_logic := '0';
  signal pb1_sync_1 : std_logic := '0';

  -- NEW SIGNAL DECLARATIONS
  signal btn1_stable : std_logic;
  signal btn1        : std_logic;
  signal sw0_sync_0  : std_logic;
  signal sw0_sync_1  : std_logic;
  signal sw0_stable  : std_logic;
  signal bg_mode     : std_logic;
  signal bg_r_const  : std_logic;
  signal bg_g_const  : std_logic;
  signal bg_b_const  : std_logic;
  signal final_r     : std_logic;
  signal final_g     : std_logic;
  signal final_b     : std_logic;

  constant S : integer := 8; --scale factor 

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
  bg_mode    <= sw0_stable xor btn1;

  -- ─── Background colour constants ───
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
      left_button         => current_left_btn,
      right_button        => right_btn,
      mouse_cursor_row    => mouse_row,
      mouse_cursor_column => mouse_col
    );

  -- Bouncing-ball display
  u_ball : entity work.bouncy_ball
    port map(
      pb1          => btn1,
      pb2          => PB2,
      clk          => clk25,
      vert_sync    => vsync_sig,
      current_left_btn_status => current_left_btn,
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
    
  -- Char ROM instantiation
  u_char_rom: entity work.char_rom
    port map (
      character_address => char_address,
      font_row          => font_row,
      font_col          => font_col,
      clock             => clk25,
      rom_mux_output    => rom_output
    );




  in_char_region <= '1'
    when (to_integer(unsigned(pix_row)) < S*8
       and to_integer(unsigned(pix_col)) < S*8)
    else '0';

  -- map each group of S pixels back down to 0–7
  font_row <= std_logic_vector(
                to_unsigned(to_integer(unsigned(pix_row)) / S, 3)
              ) when in_char_region = '1' else "000";

  font_col <= std_logic_vector(
                to_unsigned(to_integer(unsigned(pix_col)) / S, 3)
              ) when in_char_region = '1' else "000";

  -- Always select 'A'
  char_address   <= A_ADDR;

  -- Pipeline the ROM output
  process(clk25)
  begin
    if rising_edge(clk25) then
      char_pixel_reg <= rom_output;
    end if;
  end process;

  -- Mouse overlay
  mouse_pixel <= '1' when (pix_row = mouse_row and pix_col = mouse_col) else '0';

  -- Overlay priority: mouse > character > background/ball
  final_r <= mouse_pixel or char_pixel_reg or wrapped_r;
  final_g <= mouse_pixel or char_pixel_reg or wrapped_g;
  final_b <= mouse_pixel or char_pixel_reg or wrapped_b;

  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);

end architecture rtl;
