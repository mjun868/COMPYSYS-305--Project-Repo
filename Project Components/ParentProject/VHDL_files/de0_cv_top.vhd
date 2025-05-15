-- File: de0_cv_top.vhd (with integrated FSM and text overlay)
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
    HEX0     : out std_logic_vector(6 downto 0);
    HEX1     : out std_logic_vector(6 downto 0);
    HEX2     : out std_logic_vector(6 downto 0);
    HEX3     : out std_logic_vector(6 downto 0);
    HEX4     : out std_logic_vector(6 downto 0);
    HEX5     : out std_logic_vector(6 downto 0)
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is
  -- Final VGA overlay signals
  signal final_r, final_g, final_b : std_logic;
  -- Mouse cursor pixel signal
  signal mouse_pixel              : std_logic;
  -- Font multiplexer signals
  signal sel_font_row, sel_font_col : std_logic_vector(2 downto 0);
  -- Clock & reset
  signal clk25      : std_logic := '0';
  signal reset_i    : std_logic;

  -- Game states
  type game_state_t is (S_TITLE, S_GS, S_TRAIN, S_PLAY);
  signal game_state : game_state_t := S_TITLE;

  -- Text scales
  constant S        : integer := 4;
  constant S_PUSH   : integer := 2;

  -- Character dimensions
  constant CHAR_W   : integer := S * 8;
  constant CHAR_H   : integer := S * 8;
  constant PUSH_CHAR_W : integer := S_PUSH * 8;
  constant PUSH_CHAR_H : integer := S_PUSH * 8;

  -- Title text constants
  constant NUM_CHARS      : integer := 13;  -- "Death By Pipe"
  constant MSG_WIDTH      : integer := NUM_CHARS * CHAR_W;
  constant H_OFF          : integer := (640 - MSG_WIDTH) / 2;
  constant V_OFF          : integer := (480 - CHAR_H) / 2;

  -- Push prompt constants
  constant NUM_CHARS_PUSH : integer := 22;  -- "Push Button 1 to start"
  constant PUSH_MSG_WIDTH : integer := NUM_CHARS_PUSH * PUSH_CHAR_W;
  constant PUSH_H_OFF     : integer := (640 - PUSH_MSG_WIDTH) / 2;
  constant PUSH_V_OFF     : integer := V_OFF + CHAR_H + 20;

  -- Placeholder text arrays (fill with real 6-bit ROM codes)
  type char_array is array(0 to NUM_CHARS-1) of std_logic_vector(5 downto 0);
  constant TEXT_DEATH_BY_PIPE : char_array := (
    "000100", "000101", "000001", "010100", "001000", "100000",
    "000010", "011001", "100000", "010000", "001001", "010000", "000101"
  );

  type char_array_push is array(0 to NUM_CHARS_PUSH-1) of std_logic_vector(5 downto 0);
  constant TEXT_PUSH1_START : char_array_push := (
    "010000", -- P
    "010101", -- U
    "010011", -- S
    "001000", -- H
    "100000", -- space
    "000010", -- B
    "010101", -- U
    "010100", -- T
    "010100", -- T
    "001111", -- O
    "001110", -- N
    "100000", -- space
    "110001", -- 1
    "100000", -- space
    "010100", -- T
    "001111", -- O
    "100000", -- space
    "010011", -- S
    "010100", -- T
    "000001", -- A
    "010010", -- R
    "010100"  -- T
  );


  -- TODO: define TEXT_GS_LINE1, TEXT_GS_LINE2, TEXT_GS_LINE3
  -- TODO: define TEXT_TRAIN_WELCOME, TEXT_PLAY_LETS























  
  -- VGA and video signals
  signal pix_row, pix_col      : std_logic_vector(9 downto 0);
  signal video_on              : std_logic;
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic;
  signal vsync_sig             : std_logic;

  -- Mouse
  signal mouse_row, mouse_col  : std_logic_vector(9 downto 0);
  signal current_left_btn, right_btn : std_logic;

  -- Ball color
  signal color_r, color_g, color_b : std_logic;

  -- Background wrap
  signal wrapped_r, wrapped_g, wrapped_b : std_logic;

  -- Text overlay signals
  signal in_title, in_push     : std_logic;
  signal char_index_title      : integer range 0 to NUM_CHARS-1;
  signal char_index_push       : integer range 0 to NUM_CHARS_PUSH-1;
  signal font_row_title, font_col_title : std_logic_vector(2 downto 0);
  signal font_row_push, font_col_push   : std_logic_vector(2 downto 0);
  signal char_address          : std_logic_vector(5 downto 0);
  signal rom_output            : std_logic;

  -- Debounce & switches
  signal pb1_sync_0, pb1_sync_1 : std_logic := '0';
  signal btn1_stable, btn1     : std_logic;
  signal sw0_sync_0, sw0_sync_1, sw0_stable : std_logic;

  -- Seven-segment display
  signal display_mode          : std_logic_vector(2 downto 0);

begin
  -- Clock divide
  clk_div : process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;
    end if;
  end process;
  reset_i <= not reset_n;

  -- FSM process
  fsm_proc : process(clk25, reset_i) begin
    if reset_i = '1' then
      game_state <= S_TITLE;
    elsif rising_edge(clk25) then
      case game_state is
        when S_TITLE =>
          if btn1 = '1' then
            game_state <= S_GS;
          end if;
        when S_GS =>
          if btn1 = '1' then
            if sw0_stable = '0' then
              game_state <= S_TRAIN;
            else
              game_state <= S_PLAY;
            end if;
          end if;
        when S_TRAIN =>
          -- remain until reset
        when S_PLAY =>
          -- remain until reset
      end case;
    end if;
  end process;

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

  -- Display mode for seven-segment
  display_mode <= "000" when game_state = S_TITLE else
                  "001" when game_state = S_GS    else
                  "010" when game_state = S_TRAIN else
                  "011" when game_state = S_PLAY  else
                  "000";

  -- PS/2 mouse instantiation
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

  -- Bouncy ball instantiation
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

  -- Background wrap: always cyan when no ball
  wrap_bg : process(color_r, color_g, color_b)
  begin
    if game_state = S_PLAY or game_state = S_TRAIN then
      wrapped_r <= color_r;
      wrapped_g <= color_g;
      wrapped_b <= color_b;
    else
      wrapped_r <= '0'; -- cyan
      wrapped_g <= '1';
      wrapped_b <= '1';
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

  -- Seven segment display
  u_seven_seg : entity work.SevenSegDisplay
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

  -- Multiplex font position based on title or push region
  sel_font_row <= font_row_title when in_title = '1' else font_row_push;
  sel_font_col <= font_col_title when in_title = '1' else font_col_push;

  -- Character ROM instantiation
  u_char_rom : entity work.char_rom
    port map(
      character_address => char_address,
      font_row          => sel_font_row,
      font_col          => sel_font_col,
      clock             => clk25,
      rom_mux_output    => rom_output
    );

  -- Text region detection and indexing
  in_title <= '1' when video_on='1' and game_state = S_TITLE and
                     to_integer(unsigned(pix_row)) >= V_OFF and
                     to_integer(unsigned(pix_row)) < V_OFF + CHAR_H and
                     to_integer(unsigned(pix_col)) >= H_OFF and
                     to_integer(unsigned(pix_col)) < H_OFF + MSG_WIDTH
               else '0';

  char_index_title <= (to_integer(unsigned(pix_col)) - H_OFF) / CHAR_W;
  font_col_title <= std_logic_vector(to_unsigned(((to_integer(unsigned(pix_col)) - H_OFF) mod CHAR_W) / S,3)) when in_title='1' else "000";
  font_row_title <= std_logic_vector(to_unsigned((to_integer(unsigned(pix_row)) - V_OFF) / S,3)) when in_title='1' else "000";

  in_push <= '1' when video_on='1' and game_state = S_TITLE and
                    to_integer(unsigned(pix_row)) >= PUSH_V_OFF and
                    to_integer(unsigned(pix_row)) < PUSH_V_OFF + PUSH_CHAR_H and
                    to_integer(unsigned(pix_col)) >= PUSH_H_OFF and
                    to_integer(unsigned(pix_col)) < PUSH_H_OFF + PUSH_MSG_WIDTH
              else '0';

  char_index_push <= (to_integer(unsigned(pix_col)) - PUSH_H_OFF) / PUSH_CHAR_W;
  font_col_push <= std_logic_vector(to_unsigned(((to_integer(unsigned(pix_col)) - PUSH_H_OFF) mod PUSH_CHAR_W) / S_PUSH,3)) when in_push='1' else "000";
  font_row_push <= std_logic_vector(to_unsigned((to_integer(unsigned(pix_row)) - PUSH_V_OFF) / S_PUSH,3)) when in_push='1' else "000";

  -- Select character address based on region
  char_address <= TEXT_DEATH_BY_PIPE(char_index_title) when in_title='1' else
                  TEXT_PUSH1_START(char_index_push) when in_push='1' else
                  (others => '0');

  -- Mouse overlay (cursor)
  mouse_pixel <= '1' when
       video_on = '1' and
       to_integer(unsigned(pix_row)) >= to_integer(unsigned(mouse_row)) - 5 and
       to_integer(unsigned(pix_row)) <= to_integer(unsigned(mouse_row)) + 5 and
       to_integer(unsigned(pix_col)) >= to_integer(unsigned(mouse_col)) - 5 and
       to_integer(unsigned(pix_col)) <= to_integer(unsigned(mouse_col)) + 5
    else '0';

  -- Final overlay: text (white) and cursor
  final_r <= '1' when mouse_pixel='1' else
             '1' when (in_title='1' or in_push='1') and rom_output='1' else wrapped_r;
  final_g <= '1' when mouse_pixel='1' else
             '1' when (in_title='1' or in_push='1') and rom_output='1' else wrapped_g;
  final_b <= '1' when mouse_pixel='1' else
             '1' when (in_title='1' or in_push='1') and rom_output='1' else wrapped_b;

  -- Drive VGA outputs
  VGA_VS <= vsync_sig;
  VGA_R  <= (others => vga_r_sig);
  VGA_G  <= (others => vga_g_sig);
  VGA_B  <= (others => vga_b_sig);

end architecture rtl;
