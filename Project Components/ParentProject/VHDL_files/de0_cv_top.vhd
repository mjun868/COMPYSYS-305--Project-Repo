
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ascii_codes.all;  -- ascii_map: character → std_logic_vector(6 downto 0)

entity de0_cv_top is
  port (
    CLOCK_50 : in  std_logic;
    reset_n  : in  std_logic;
    PS2_CLK  : inout  std_logic;
    PS2_DAT  : inout  std_logic;
    PB1      : in  std_logic;
    PB2      : in  std_logic;
    SW0      : in  std_logic;

    VGA_R    : out std_logic_vector(3 downto 0);
    VGA_G    : out std_logic_vector(3 downto 0);
    VGA_B    : out std_logic_vector(3 downto 0);
    VGA_HS   : out std_logic;
    VGA_VS   : out std_logic;
    LEDR0    : out std_logic;
    HEX0     : out std_logic_vector(6 downto 0);
    HEX1     : out std_logic_vector(6 downto 0);
    HEX2     : out std_logic_vector(6 downto 0);
    HEX3     : out std_logic_vector(6 downto 0);
    HEX4     : out std_logic_vector(6 downto 0);
    HEX5     : out std_logic_vector(6 downto 0)
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is

  ----------------------------------------------------------------
  -- Component declarations
  component MOUSE
    port(
      clock_25Mhz         : in  std_logic;
      reset               : in  std_logic;
      mouse_data          : inout std_logic;
      mouse_clk           : inout std_logic;
      left_button         : out std_logic;
      right_button        : out std_logic;
      mouse_cursor_row    : out std_logic_vector(9 downto 0);
      mouse_cursor_column : out std_logic_vector(9 downto 0)
    );
  end component;

  component bouncy_ball
    port(
      pb1                     : in  std_logic;
      pb2                     : in  std_logic;
      clk                     : in  std_logic;
      vert_sync               : in  std_logic;
      current_left_btn_status : in  std_logic;
      pixel_row               : in  std_logic_vector(9 downto 0);
      pixel_column            : in  std_logic_vector(9 downto 0);
      red                     : out std_logic;
      green                   : out std_logic;
      blue                    : out std_logic
    );
  end component;

  component VGA_SYNC
    port(
      clock_25Mhz    : in  std_logic;
      red            : in  std_logic;
      green          : in  std_logic;
      blue           : in  std_logic;
      red_out        : out std_logic;
      green_out      : out std_logic;
      blue_out       : out std_logic;
      horiz_sync_out : out std_logic;
      vert_sync_out  : out std_logic;
      pixel_row      : out std_logic_vector(9 downto 0);
      pixel_column   : out std_logic_vector(9 downto 0);
      video_on_out   : out std_logic
    );
  end component;

  component SevenSegDisplay
    port(
      clk          : in  std_logic;
      display_mode : in  std_logic_vector(2 downto 0);
      digit_one    : out std_logic_vector(6 downto 0);
      digit_two    : out std_logic_vector(6 downto 0);
      digit_three  : out std_logic_vector(6 downto 0);
      digit_four   : out std_logic_vector(6 downto 0);
      digit_five   : out std_logic_vector(6 downto 0);
      digit_six    : out std_logic_vector(6 downto 0)
    );
  end component;

  component char_rom
    port(
      character_address : in  std_logic_vector(5 downto 0);
      font_row          : in  std_logic_vector(2 downto 0);
      font_col          : in  std_logic_vector(2 downto 0);
      clock             : in  std_logic;
      rom_mux_output    : out std_logic
    );
  end component;
  ----------------------------------------------------------------

  -- Clock & reset
  signal clk25, reset_i                 : std_logic := '0';

  -- FSM
  type game_state_t is (S_TITLE, S_GS, S_TRAIN, S_PLAY);
  signal game_state                     : game_state_t := S_TITLE;

  -- VGA timing
  signal pix_row, pix_col               : std_logic_vector(9 downto 0);
  signal video_on, vsync_sig            : std_logic;
  signal vga_r_sig, vga_g_sig, vga_b_sig: std_logic;

  -- Mouse
  signal mouse_row, mouse_col           : std_logic_vector(9 downto 0);
  signal current_left_btn, right_btn    : std_logic;

  -- Ball
  signal color_r, color_g, color_b      : std_logic;

  -- Background always cyan
  signal wrapped_r : std_logic := '0';
  signal wrapped_g : std_logic := '1';
  signal wrapped_b : std_logic := '1';

  signal final_r, final_g, final_b      : std_logic;

  -- Text overlay
  signal in_title, in_push              : std_logic;
  signal char_index_title               : integer range 0 to 31 := 0;
  signal char_index_push                : integer range 0 to 31 := 0;

  -- Font row/col for each region
  signal font_row_title, font_col_title : std_logic_vector(2 downto 0);
  signal font_row_push,  font_col_push  : std_logic_vector(2 downto 0);
  signal font_row,       font_col       : std_logic_vector(2 downto 0);

  signal rom_output                     : std_logic;

  -- ASCII→font
  signal ascii_code_title               : std_logic_vector(6 downto 0);
  signal ascii_code_push                : std_logic_vector(6 downto 0);
  signal ascii_code_final               : std_logic_vector(6 downto 0);
  signal char_address                   : std_logic_vector(5 downto 0);

  -- Debounce
  signal pb1_sync_0, pb1_sync_1         : std_logic := '1';
  signal btn1_stable, btn1              : std_logic;
  signal sw0_sync_0, sw0_sync_1         : std_logic := '0';
  signal sw0_stable                     : std_logic;

  -- Seven‐segment
  signal display_mode                   : std_logic_vector(2 downto 0);

  -- Title‐screen text layout
  constant S        : integer := 4;
  constant CHAR_W   : integer := S * 8;
  constant CHAR_H   : integer := S * 8;

  constant TITLE_STR      : string(1 to 13) := "DEATH BY PIPE";
  constant S1_NUM_CHARS   : integer := TITLE_STR'length;
  constant S1_MSG_WIDTH   : integer := S1_NUM_CHARS * CHAR_W;
  constant S1_H_OFF       : integer := (640 - S1_MSG_WIDTH) / 2;
  constant S1_V_OFF       : integer := (480 - CHAR_H) / 2;

  constant PUSH_STR       : string(1 to 22) := "PUSH BUTTON 1 TO START";
  constant S1_PUSH_CHARS  : integer := PUSH_STR'length;
  constant S1_PUSH_WIDTH  : integer := S1_PUSH_CHARS * (CHAR_W/2);
  constant S1_PUSH_H_OFF  : integer := (640 - S1_PUSH_WIDTH) / 2;
  constant S1_PUSH_V_OFF  : integer := S1_V_OFF + CHAR_H + 20;

begin
  ----------------------------------------------------------------
  -- Clock divide
  clk_div: process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;
    end if;
  end process;
  reset_i <= not reset_n;

  ----------------------------------------------------------------
  -- FSM: advance on PB1
  fsm_proc: process(clk25, reset_i) begin
    if reset_i='1' then
      game_state <= S_TITLE;
    elsif rising_edge(clk25) then
      case game_state is
        when S_TITLE =>
          if btn1='1' then game_state <= S_GS; end if;
        when S_GS =>
          if btn1='1' then game_state <= S_TRAIN; end if;
        when S_TRAIN =>
          if btn1='1' then game_state <= S_PLAY; end if;
        when S_PLAY =>
          null;
      end case;
    end if;
  end process;

  -- Debounce PB1
  sync_pb1: process(clk25, reset_i) begin
    if reset_i='1' then
      pb1_sync_0 <= '1'; 
      pb1_sync_1 <= '1';
    elsif rising_edge(clk25) then
      pb1_sync_0 <= PB1;
      pb1_sync_1 <= pb1_sync_0;
    end if;
  end process;
  btn1_stable <= pb1_sync_1;
  btn1        <= not btn1_stable;

  -- Debounce SW0
  sync_sw0: process(clk25, reset_i) begin
    if reset_i='1' then
      sw0_sync_0 <= '0'; 
      sw0_sync_1 <= '0';
    elsif rising_edge(clk25) then
      sw0_sync_0 <= SW0;
      sw0_sync_1 <= sw0_sync_0;
    end if;
  end process;
  sw0_stable <= sw0_sync_1;
  LEDR0      <= sw0_stable;

  -- Seven‐seg = binary state
  display_mode <= std_logic_vector(to_unsigned(game_state'pos(game_state), 3));

  ----------------------------------------------------------------
  -- Peripherals
  u_mouse: MOUSE
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

  u_ball: bouncy_ball
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

  u_vga_sync: VGA_SYNC
    port map(
      clock_25Mhz    => clk25,
      red            => final_r,
      green          => final_g,
      blue           => final_b,
      red_out        => vga_r_sig,
      green_out      => vga_g_sig,
      blue_out       => vga_b_sig,
      horiz_sync_out => VGA_HS,
      vert_sync_out  => vsync_sig,
      pixel_row      => pix_row,
      pixel_column   => pix_col,
      video_on_out   => video_on
    );

  u_seven_seg: SevenSegDisplay
    port map(
      clk          => clk25,
      display_mode => display_mode,
      digit_one    => HEX0,
      digit_two    => HEX1,
      digit_three  => HEX2,
      digit_four   => HEX3,
      digit_five   => HEX4,
      digit_six    => HEX5
    );

  ----------------------------------------------------------------
  -- TITLE region
  in_title <= '1' when
     video_on='1' and game_state=S_TITLE and
     to_integer(unsigned(pix_row)) >= S1_V_OFF and
     to_integer(unsigned(pix_row)) <  S1_V_OFF + CHAR_H and
     to_integer(unsigned(pix_col)) >= S1_H_OFF and
     to_integer(unsigned(pix_col)) <  S1_H_OFF + S1_MSG_WIDTH
    else '0';

  char_index_title <= (to_integer(unsigned(pix_col)) - S1_H_OFF) / CHAR_W;

  -- font coords for title
  font_col_title <= std_logic_vector(to_unsigned(
                    ((to_integer(unsigned(pix_col)) - S1_H_OFF) mod CHAR_W) / S,3))
                  when in_title='1' else (others=>'0');
  font_row_title <= std_logic_vector(to_unsigned(
                    (to_integer(unsigned(pix_row)) - S1_V_OFF) / S,3))
                  when in_title='1' else (others=>'0');

  -- ASCII→6-bit for title
  ascii_code_title <= ascii_map(
                        TITLE_STR(char_index_title + TITLE_STR'low)
                      ) when in_title='1'
                   else (others=>'0');

  ----------------------------------------------------------------
  -- PUSH region (half scale)
  in_push <= '1' when
     video_on='1' and game_state=S_TITLE and
     to_integer(unsigned(pix_row)) >= S1_PUSH_V_OFF and
     to_integer(unsigned(pix_row)) <  S1_PUSH_V_OFF + (CHAR_H/2) and
     to_integer(unsigned(pix_col)) >= S1_PUSH_H_OFF and
     to_integer(unsigned(pix_col)) <  S1_PUSH_H_OFF + S1_PUSH_WIDTH
    else '0';

  char_index_push <= (to_integer(unsigned(pix_col)) - S1_PUSH_H_OFF) / (CHAR_W/2);

  font_col_push <= std_logic_vector(to_unsigned(
                    ((to_integer(unsigned(pix_col)) - S1_PUSH_H_OFF) mod (CHAR_W/2)) / (S/2),3))
                  when in_push='1' else (others=>'0');
  font_row_push <= std_logic_vector(to_unsigned(
                    (to_integer(unsigned(pix_row)) - S1_PUSH_V_OFF) / (S/2),3))
                  when in_push='1' else (others=>'0');

  ascii_code_push <= ascii_map(
                       PUSH_STR(char_index_push + PUSH_STR'low)
                     ) when in_push='1'
                  else (others=>'0');

  ----------------------------------------------------------------
  -- Final mux into single font row/col and ascii_code
  font_row       <= font_row_title when in_title='1' else
                    font_row_push  when in_push = '1' else
                    (others=>'0');
  font_col       <= font_col_title when in_title='1' else
                    font_col_push  when in_push = '1' else
                    (others=>'0');

  ascii_code_final <= ascii_code_title when in_title='1' else
                      ascii_code_push  when in_push  = '1' else
                      (others=>'0');

  char_address <= ascii_code_final(5 downto 0);

  ----------------------------------------------------------------
  -- CHAR ROM → overlay
  u_char_rom: char_rom
    port map(
      character_address => char_address,
      font_row          => font_row,
      font_col          => font_col,
      clock             => clk25,
      rom_mux_output    => rom_output
    );

  -- white text over cyan
  final_r <= '1' when rom_output='1' and (in_title='1' or in_push='1') else wrapped_r;
  final_g <= '1' when rom_output='1' and (in_title='1' or in_push='1') else wrapped_g;
  final_b <= '1' when rom_output='1' and (in_title='1' or in_push='1') else wrapped_b;

  -- drive VGA pins
  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);

end architecture rtl;
