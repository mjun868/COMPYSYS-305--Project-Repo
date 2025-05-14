-- File: de0_cv_top.vhd (ROM output register removed, correct A index, region shifted to include top row)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity de0_cv_top is
  port (
    CLOCK_50 : in  std_logic;
    reset_n  : in  std_logic;
    PS2_CLK  : inout std_logic;
    PS2_DAT  : inout std_logic;
    PB1      : in  std_logic;
    PB2      : in  std_logic;
    SW0      : in  std_logic;

    VGA_R    : out std_logic_vector(3 downto 0);
    VGA_G    : out std_logic_vector(3 downto 0);
    VGA_B    : out std_logic_vector(3 downto 0);
    VGA_HS   : out std_logic;
    VGA_VS   : out std_logic;
    LEDR0    : out std_logic;
    seven_seg_one : out std_logic_vector(6 downto 0);
    seven_seg_two : out std_logic_vector(6 downto 0);
    seven_seg_three : out std_logic_vector(6 downto 0);
    seven_seg_four : out std_logic_vector(6 downto 0);
    seven_seg_five : out std_logic_vector(6 downto 0);
    seven_seg_six : out std_logic_vector(6 downto 0)
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is
  -- Clock & reset
  signal clk25      : std_logic := '0';
  signal reset_i    : std_logic;

  -- VGA interface + video enable
  signal pix_row, pix_col     : std_logic_vector(9 downto 0);
  signal video_on             : std_logic;
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic;
  signal vsync_sig            : std_logic;

  -- Mouse
  signal mouse_row, mouse_col : std_logic_vector(9 downto 0);
  signal current_left_btn, right_btn : std_logic;

  -- Ball color
  signal color_r, color_g, color_b : std_logic;

  -- Background wrap
  signal wrapped_r, wrapped_g, wrapped_b : std_logic;

  -- Character ROM
  constant A_ADDR : std_logic_vector(5 downto 0) := "000001";  -- correct index 33 for 'A'
  constant S      : integer := 8;
  constant Y_OFF  : integer := 48;    -- <<<<<<<<<<<<<<<<<<<< shift up 1px

  signal char_address   : std_logic_vector(5 downto 0) := A_ADDR;
  signal font_row       : std_logic_vector(2 downto 0);
  signal font_col       : std_logic_vector(2 downto 0);
  signal rom_output      : std_logic;
  signal in_char_region  : std_logic;

  -- Mouse overlay
  signal mouse_pixel     : std_logic;

  -- Final RGB
  signal final_r, final_g, final_b : std_logic;

  -- Debounce & BG state
  signal pb1_sync_0, pb1_sync_1       : std_logic := '0';
  signal btn1_stable, btn1           : std_logic;
  signal sw0_sync_0, sw0_sync_1, sw0_stable : std_logic;
  signal bg_mode, bg_r_const, bg_g_const, bg_b_const : std_logic;
  
  -- 7 seg text choice
  signal display_mode : std_logic_vector(2 downto 0);
  
begin
  -- Clock divide
  clk_div : process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;
    end if;
  end process;
  reset_i <= not reset_n;

  -- Debounce PB1
  sync_btn : process(clk25, reset_i) begin
    if reset_i = '1' then
      pb1_sync_0 <= '1'; pb1_sync_1 <= '1';
    elsif rising_edge(clk25) then
      pb1_sync_0 <= PB1;
      pb1_sync_1 <= pb1_sync_0;
    end if;
  end process;
  btn1_stable <= pb1_sync_1;
  btn1        <= not btn1_stable;

  -- Debounce SW0
  sw0_sync : process(clk25, reset_i) begin
    if reset_i = '1' then
      sw0_sync_0 <= '0'; sw0_sync_1 <= '0';
    elsif rising_edge(clk25) then
      sw0_sync_0 <= SW0;
      sw0_sync_1 <= sw0_sync_0;
    end if;
  end process;
  sw0_stable <= sw0_sync_1;
  LEDR0      <= sw0_stable;
  
  display_mode <= "010" when sw0_stable = '1' else "001";

  -- Background color
  bg_mode    <= sw0_stable xor btn1;
  bg_r_const <= '1' when bg_mode='1' else '0';
  bg_g_const <= '0' when bg_mode='1' else '1';
  bg_b_const <= '1';

  -- PS/2 mouse
  u_mouse : entity work.MOUSE
    port map(
      clock_25Mhz         => clk25,
      reset               => reset_i,
      mouse_data          => PS2_DAT,
      mouse_clk           => PS2_CLK,
      left_button         => current_left_btn,
      right_button        => right_btn,
      mouse_cursor_row    => mouse_row,
      mouse_cursor_column => mouse_col
    );

  -- Bouncy ball
  u_ball : entity work.bouncy_ball
    port map(
      pb1                     => btn1,
      pb2                     => PB2,
      clk                     => clk25,
      vert_sync               => vsync_sig,
      current_left_btn_status => current_left_btn,
      pixel_row               => pix_row,
      pixel_column            => pix_col,
      red                     => color_r,
      green                   => color_g,
      blue                    => color_b
    );

  -- Wrap background
  wrap_bg : process(color_r, color_g, color_b,
                    bg_r_const, bg_g_const, bg_b_const) begin
    if color_r='0' and color_g='0' and color_b='1' then
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
      clock_25Mhz      => clk25,
      red              => final_r,
      green            => final_g,
      blue             => final_b,
      red_out          => vga_r_sig,
      green_out        => vga_g_sig,
      blue_out         => vga_b_sig,
      horiz_sync_out   => VGA_HS,
      vert_sync_out    => vsync_sig,
      pixel_row        => pix_row,
      pixel_column     => pix_col,
      video_on_out     => video_on
    );
  -- seven segment display
  u_seven_seg : entity work.SevenSegDisplay
    port map(
        clk         => clk25,       
        --PB1         =>  btn1,
        --PB2         =>  PB2,
        --SW0         =>  sw0_stable,
		  display_mode => display_mode,
        digit_one   =>  seven_seg_one,
        digit_two   =>  seven_seg_two,
        digit_three =>  seven_seg_three,
        digit_four  =>  seven_seg_four,
        digit_five  =>  seven_seg_five,
        digit_six  =>  seven_seg_six
    );
  -- Char ROM
  u_char_rom : entity work.char_rom
    port map(
      character_address => char_address,
      font_row          => font_row,
      font_col          => font_col,
      clock             => clk25,
      rom_mux_output    => rom_output
    );

  -- Region test: start at Y_OFF to include the very first glyph row
  in_char_region <= '1'
    when video_on = '1' and
         to_integer(unsigned(pix_row)) >= Y_OFF and
         to_integer(unsigned(pix_row)) < Y_OFF + S*8 and
         to_integer(unsigned(pix_col)) < S*8
    else '0';

  -- Compute font row/col with correct vertical origin
  font_row <= std_logic_vector(
                to_unsigned(
                  (to_integer(unsigned(pix_row)) - Y_OFF) / S,
                  3
                )
              ) when in_char_region = '1' else "000";

  font_col <= std_logic_vector(
                to_unsigned(
                  to_integer(unsigned(pix_col)) / S,
                  3
                )
              ) when in_char_region = '1' else "000";

  -- Mouse overlay
  mouse_pixel <= '1' when pix_row = mouse_row and pix_col = mouse_col else '0';
  
  seven_seg_one <=

  -- Final overlay using rom_output directly
  final_r <= '1' when mouse_pixel = '1' else
             '1' when in_char_region = '1' and rom_output = '1' else wrapped_r;
  final_g <= '1' when mouse_pixel = '1' else
             '1' when in_char_region = '1' and rom_output = '1' else wrapped_g;
  final_b <= '1' when mouse_pixel = '1' else
             '1' when in_char_region = '1' and rom_output = '1' else wrapped_b;

  -- Drive VGA outputs
  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);
end architecture rtl;
