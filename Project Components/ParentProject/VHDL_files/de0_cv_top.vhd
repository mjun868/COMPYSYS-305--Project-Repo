library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ascii_codes.all;  -- ascii_map: character → std_logic_vector(6 downto 0)
use work.pipe_types.all;   -- pipe_array_type

entity de0_cv_top is
  port (
    -- Clock & Reset
    CLOCK_50  : in  std_logic;
    reset_n   : in  std_logic;
    -- PS/2 Mouse Interface
    PS2_CLK   : inout std_logic;
    PS2_DAT   : inout std_logic;
    -- Buttons & Switch
    PB0       : in  std_logic; -- This is the reset button. 
    PB1       : in  std_logic;
    PB2       : in  std_logic;
    SW0       : in  std_logic;
    -- VGA Output
    VGA_R     : out std_logic_vector(3 downto 0);
    VGA_G     : out std_logic_vector(3 downto 0);
    VGA_B     : out std_logic_vector(3 downto 0);
    VGA_HS    : out std_logic;
    VGA_VS    : out std_logic;
    -- LED and Seven-Segment
    LEDR0     : out std_logic;
    HEX0      : out std_logic_vector(6 downto 0);
    HEX1      : out std_logic_vector(6 downto 0);
    HEX2      : out std_logic_vector(6 downto 0);
    HEX3      : out std_logic_vector(6 downto 0);
    HEX4      : out std_logic_vector(6 downto 0);
    HEX5      : out std_logic_vector(6 downto 0)
  );
end entity de0_cv_top;

architecture rtl of de0_cv_top is
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
      red                     : out std_logic_vector(3 downto 0);
      green                   : out std_logic_vector(3 downto 0);
      blue                    : out std_logic_vector(3 downto 0);
      ball_on                 : out std_logic;
      bird_row   : out std_logic_vector(9 downto 0);
      bird_col   : out std_logic_vector(9 downto 0)
    );
  end component;

  component VGA_SYNC
    port(
      clock_25Mhz    : in  std_logic;
      red            : in  std_logic_vector(3 downto 0);
      green          : in  std_logic_vector(3 downto 0);
      blue           : in  std_logic_vector(3 downto 0);
      red_out        : out std_logic_vector(3 downto 0);
      green_out      : out std_logic_vector(3 downto 0);
      blue_out       : out std_logic_vector(3 downto 0);
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

 component pipe_generator is
  generic(
    NUM_PIPES     : integer := 4;
    PIPE_SPACING  : integer := 150;
    MOVE_INTERVAL : integer := 500_000;
    START_OFFSET  : integer := 10;
    PIPE_WIDTH    : integer := 40
  );
  port(
    clk           : in  std_logic;
    reset         : in  std_logic;
    pix_row       : in  std_logic_vector(9 downto 0);
    pix_col       : in  std_logic_vector(9 downto 0);
    pipe_gap      : in  std_logic_vector(9 downto 0);
    pipe_x_array  : out pipe_array_type;
    pipe_y_array  : out pipe_array_type;
    green_out     : out std_logic
  );
end component;

  -- Signals
  signal clk25, reset_i               : std_logic := '0';
  signal pb1_sync_0, pb1_sync_1       : std_logic := '1';
  signal btn1_stable, btn1            : std_logic;
  signal btn1_prev, btn1_rising       : std_logic := '0';
  signal sw0_sync_0, sw0_sync_1       : std_logic := '0';
  signal sw0_stable                   : std_logic;
  type game_state_t is (S_TITLE, S_GS, S_TRAIN, S_PLAY, S_DEATH);
  signal game_state                   : game_state_t := S_TITLE;
  signal show_pipes                   : std_logic;

  signal pix_row, pix_col             : std_logic_vector(9 downto 0);
  signal video_on, vsync_sig          : std_logic;
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic_vector(3 downto 0);

  signal mouse_row, mouse_col : std_logic_vector(9 downto 0);

  signal current_left_btn, right_btn  : std_logic;
  signal color_r, color_g, color_b    : std_logic_vector(3 downto 0);

  signal wrapped_r : std_logic := '0';
  signal wrapped_g : std_logic := '1';
  signal wrapped_b : std_logic := '1';
  signal final_r, final_g, final_b    : std_logic_vector(3 downto 0);

  signal in_title, in_push            : std_logic;
  signal in_select1, in_select2, in_select3 : std_logic;

  signal char_index_title             : integer range 0 to 31 := 0;
  signal char_index_select1, char_index_select2, char_index_select3 : integer range 0 to 31 := 0;

  signal font_row_title, font_col_title : std_logic_vector(2 downto 0);
  signal font_row_select1, font_col_select1 : std_logic_vector(2 downto 0);
  signal font_row_select2, font_col_select2 : std_logic_vector(2 downto 0);
  signal font_row_select3, font_col_select3 : std_logic_vector(2 downto 0);
  signal font_row, font_col           : std_logic_vector(2 downto 0);

  -- for the "PUSH BUTTON 1 TO START" half-scale overlay
  signal char_index_push  : integer range 0 to 31 := 0;
  signal font_row_push    : std_logic_vector(2 downto 0);
  signal font_col_push    : std_logic_vector(2 downto 0);
  signal ascii_code_push  : std_logic_vector(6 downto 0);

  signal in_sw0_high, in_sw0_low                        : std_logic;
  signal char_index_sw0_high, char_index_sw0_low      : integer range 0 to 31 := 0;
  signal font_row_sw0_high, font_col_sw0_high         : std_logic_vector(2 downto 0);
  signal font_row_sw0_low,  font_col_sw0_low          : std_logic_vector(2 downto 0);
  signal ascii_code_sw0_high, ascii_code_sw0_low      : std_logic_vector(6 downto 0);

  signal ascii_code_title             : std_logic_vector(6 downto 0);
  signal ascii_code_select1, ascii_code_select2, ascii_code_select3 : std_logic_vector(6 downto 0);
  signal ascii_code_final             : std_logic_vector(6 downto 0);
  signal char_address                 : std_logic_vector(5 downto 0);

  signal rom_output                   : std_logic;
  signal display_mode                 : std_logic_vector(2 downto 0);

  signal pipe_x_array, pipe_y_array   : pipe_array_type;
  signal pipe_gap : std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(100,10));
  signal pipe_gap_int : integer;
  signal pipe_green                   : std_logic;

  signal ball_on_sig : std_logic;


  signal collision : std_logic := '0';
  signal collision_detect : std_logic;
  signal bird_row             : std_logic_vector(9 downto 0);
  signal bird_col             : std_logic_vector(9 downto 0);
   


  signal in_death1           : std_logic;
signal font_row_d1, font_col_d1 : std_logic_vector(2 downto 0);
signal ascii_d1            : std_logic_vector(6 downto 0);

signal in_death2           : std_logic;
signal font_row_d2, font_col_d2 : std_logic_vector(2 downto 0);
signal ascii_d2            : std_logic_vector(6 downto 0);
  

  -- Constants
  constant S      : integer := 4;
  constant CHAR_W : integer := S*8;
  constant CHAR_H : integer := S*8;


  constant TITLE_STR : string(1 to 13) := "DEATH BY PIPE";
  constant PUSH_STR  : string(1 to 22) := "PUSH BUTTON 1 TO START";

  -- width of the title string in pixels
  constant S1_MSG_WIDTH  : integer := TITLE_STR'length * CHAR_W;
  constant S1_PUSH_WIDTH : integer := PUSH_STR'length * (CHAR_W/2);

  constant SELECT_STR1 : string(1 to 11) := "SELECT MODE";
  constant OPT1_STR    : string(1 to 22) := "SW0 HIGH FOR PLAY MODE";
  constant OPT2_STR    : string(1 to 22) := "SW0 LOW FOR TRAIN MODE";

  constant S1_H_OFF      : integer := (640 - TITLE_STR'length*CHAR_W)/2;
  constant S1_V_OFF      : integer := (480 - CHAR_H)/2;

  constant S1_PUSH_H_OFF : integer := (640 - PUSH_STR'length*(CHAR_W/2))/2;
  constant S1_PUSH_V_OFF : integer := S1_V_OFF + CHAR_H + 20;

  constant S2_H_OFF      : integer := (640 - SELECT_STR1'length*CHAR_W)/2;
  constant S2_V_OFF      : integer := S1_V_OFF;

  constant OPT1_H_OFF    : integer := (640 - OPT1_STR'length*(CHAR_W/2))/2;
  constant OPT2_H_OFF    : integer := (640 - OPT2_STR'length*(CHAR_W/2))/2;

  constant OPT1_V_OFF : integer := S2_V_OFF + CHAR_H + 10;
  constant OPT2_V_OFF : integer := OPT1_V_OFF + (CHAR_H/2) + 10;

  constant PIPE_WIDTH : integer := 50;
  constant GAP_HEIGHT : integer := 100;
  constant NUM_PIPES : integer := 4;

  constant DEATH_STR     : string(1 to 9)  := "YOU DIED!";
  constant DEATH2_STR    : string(1 to 29) := "PRESS BUTTON 0 TO PLAY AGAIN.";
  
-- pixel widths
constant DEATH_W       : integer := DEATH_STR'length * CHAR_W;
constant DEATH2_W      : integer := DEATH2_STR'length * (CHAR_W/2);

-- offsets for centering
constant DEATH_H_OFF   : integer := (640 - DEATH_W)/2;
constant DEATH_V_OFF   : integer := (480 -  CHAR_H)/2;

constant DEATH2_H_OFF  : integer := (640 - DEATH2_W)/2;
constant DEATH2_V_OFF  : integer := DEATH_V_OFF + CHAR_H + 20;

signal char_index_d1       : integer range 0 to DEATH_STR'length-1;
signal char_index_d2       : integer range 0 to DEATH2_STR'length-1;


begin
  -- Clock div & reset
  clk_div: process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then clk25 <= not clk25; end if;
  end process;
  -- asynchronous reset when either reset_n or PB0 is asserted low
  reset_i <= (not reset_n) or (not PB0);

  -- PB1 debounce & edge
  sync_pb1: process(clk25, reset_i) begin
    if reset_i='1' then pb1_sync_0<='1'; pb1_sync_1<='1';
    elsif rising_edge(clk25) then pb1_sync_0<=PB1; pb1_sync_1<=pb1_sync_0; end if;
  end process;
  btn1_stable<=pb1_sync_1; btn1<=not btn1_stable;
  edge_pb1: process(clk25, reset_i) begin
    if reset_i='1' then btn1_prev<='0'; elsif rising_edge(clk25) then btn1_prev<=btn1; end if;
  end process;
  btn1_rising<='1' when (btn1='1' and btn1_prev='0') else '0';

  -- SW0 debounce
  sync_sw0: process(clk25, reset_i) begin
    if reset_i='1' then sw0_sync_0<='0'; sw0_sync_1<='0';
    elsif rising_edge(clk25) then sw0_sync_0<=SW0; sw0_sync_1<=sw0_sync_0; end if;
  end process;
  sw0_stable<=sw0_sync_1; LEDR0<=sw0_stable;

  -- FSM
 fsm: process(clk25, reset_i) begin
  if reset_i = '1' then
    game_state <= S_TITLE;
  elsif rising_edge(clk25) then
    case game_state is
      when S_TITLE =>
        if btn1_rising = '1' then
          game_state <= S_GS;
        end if;

      when S_GS =>
        if btn1_rising = '1' then
          if sw0_stable = '1' then
            game_state <= S_PLAY;
          else
            game_state <= S_TRAIN;
          end if;
        end if;

      when S_PLAY | S_TRAIN =>
        if collision = '1' then
          game_state <= S_DEATH;
        end if;

      when others =>
        null;
    end case;
  end if;
end process;

  show_pipes<= '1' when (game_state=S_PLAY or game_state=S_TRAIN) else '0';

  -- Seven segment mapping
  sevenseg: process(game_state, sw0_stable) begin
    case game_state is
      when S_TITLE =>
        display_mode <= "011";
      when S_GS =>
        if sw0_stable = '1' then
    display_mode <= "010";
  else
    display_mode <= "110";
  end if;
      when S_PLAY =>
        display_mode <= "010";
      when S_TRAIN =>
        display_mode <= "110";
      when others =>
        display_mode <= "000";
    end case;
  end process;

 -- Instantiate all peripherals
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

  u_ball: bouncy_ball port map(
    pb1                     => btn1,
    pb2                     => PB2,
    clk                     => clk25,
    vert_sync               => vsync_sig,
    current_left_btn_status => current_left_btn,
    pixel_row               => pix_row,
    pixel_column            => pix_col,
    red                     => color_r,
    green                   => color_g,
    blue                    => color_b,
    ball_on                 => ball_on_sig,
    bird_row  => bird_row,
    bird_col  => bird_col
  );

  u_vga_sync: VGA_SYNC port map(
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

  u_seven_seg: SevenSegDisplay port map(
    clk          => clk25,
    display_mode => display_mode,
    digit_one    => HEX0,
    digit_two    => HEX1,
    digit_three  => HEX2,
    digit_four   => HEX3,
    digit_five   => HEX4,
    digit_six    => HEX5
  );

u_pipe: pipe_generator
  generic map (
    START_OFFSET => 10,
    PIPE_WIDTH   => 40
  )
  port map (
    clk           => clk25,
    reset         => reset_i,
    pix_row       => pix_row,
    pix_col       => pix_col,
    pipe_gap      => pipe_gap,
    pipe_x_array  => pipe_x_array,
    pipe_y_array  => pipe_y_array,
    green_out     => pipe_green
  );

    pipe_gap_int <= to_integer(unsigned(pipe_gap));

  ----------------------------------------------------------------
  -- TITLE overlay region
  in_title <= '1' when
     video_on='1' and game_state=S_TITLE and
     to_integer(unsigned(pix_row)) >= S1_V_OFF and
     to_integer(unsigned(pix_row)) <  S1_V_OFF+CHAR_H and
     to_integer(unsigned(pix_col)) >= S1_H_OFF and
     to_integer(unsigned(pix_col)) <  S1_H_OFF+S1_MSG_WIDTH
  else '0';

  char_index_title <= (to_integer(unsigned(pix_col)) - S1_H_OFF) / CHAR_W;

  font_col_title <= std_logic_vector(to_unsigned(
    ((to_integer(unsigned(pix_col)) - S1_H_OFF) mod CHAR_W) / S, 3))
    when in_title = '1' else (others=>'0');

  font_row_title <= std_logic_vector(to_unsigned(
    (to_integer(unsigned(pix_row)) - S1_V_OFF) / S, 3))
    when in_title = '1' else (others=>'0');

  ascii_code_title <= ascii_map(
    TITLE_STR(char_index_title + TITLE_STR'low)
  ) when in_title = '1' else (others=>'0');

  ----------------------------------------------------------------
  -- PUSH overlay (half-scale)
  in_push <= '1' when
    video_on='1' and game_state=S_TITLE and
    to_integer(unsigned(pix_row)) >= S1_PUSH_V_OFF and
    to_integer(unsigned(pix_row)) <  S1_PUSH_V_OFF+(CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= S1_PUSH_H_OFF and
    to_integer(unsigned(pix_col)) <  S1_PUSH_H_OFF+S1_PUSH_WIDTH
  else '0';

  char_index_push <= (to_integer(unsigned(pix_col)) - S1_PUSH_H_OFF) / (CHAR_W/2);

  font_col_push <= std_logic_vector(to_unsigned(
    ((to_integer(unsigned(pix_col)) - S1_PUSH_H_OFF) mod (CHAR_W/2)) / (S/2), 3))
    when in_push='1' else (others=>'0');

  font_row_push <= std_logic_vector(to_unsigned(
    (to_integer(unsigned(pix_row)) - S1_PUSH_V_OFF) / (S/2), 3))
    when in_push='1' else (others=>'0');

  ascii_code_push <= ascii_map(
    PUSH_STR(char_index_push + PUSH_STR'low)
  ) when in_push = '1' else (others=>'0');

  ----------------------------------------------------------------
  -- SELECT header + options overlay
  in_select1 <= '1' when
    video_on='1' and game_state=S_GS and
    to_integer(unsigned(pix_row)) >= S2_V_OFF and
    to_integer(unsigned(pix_row)) <  S2_V_OFF+CHAR_H and
    to_integer(unsigned(pix_col)) >= S2_H_OFF and
    to_integer(unsigned(pix_col)) <  (S2_H_OFF + SELECT_STR1'length * CHAR_W)
  else '0';

  char_index_select1 <= (to_integer(unsigned(pix_col)) - S2_H_OFF) / CHAR_W;

  font_col_select1 <= std_logic_vector(to_unsigned(
    ((to_integer(unsigned(pix_col)) - S2_H_OFF) mod CHAR_W) / S, 3))
    when in_select1='1' else (others=>'0');

  font_row_select1 <= std_logic_vector(to_unsigned(
    (to_integer(unsigned(pix_row)) - S2_V_OFF) / S, 3))
    when in_select1='1' else (others=>'0');

  ascii_code_select1 <= ascii_map(
    SELECT_STR1(char_index_select1 + SELECT_STR1'low)
  ) when in_select1='1' else (others=>'0');

  -- PLAY MODE
  in_select2 <= '1' when
    video_on='1' and game_state=S_GS and
    to_integer(unsigned(pix_row)) >= OPT1_V_OFF and
    to_integer(unsigned(pix_row)) <  OPT1_V_OFF+(CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= OPT1_H_OFF and
    to_integer(unsigned(pix_col)) <  (OPT1_H_OFF + OPT1_STR'length*(CHAR_W/2))
  else '0';

  char_index_select2 <= (to_integer(unsigned(pix_col)) - OPT1_H_OFF) / (CHAR_W/2);

  font_col_select2 <= std_logic_vector(to_unsigned(
    ((to_integer(unsigned(pix_col)) - OPT1_H_OFF) mod (CHAR_W/2)) / (S/2), 3))
    when in_select2='1' else (others=>'0');

  font_row_select2 <= std_logic_vector(to_unsigned(
    (to_integer(unsigned(pix_row)) - OPT1_V_OFF) / (S/2), 3))
    when in_select2='1' else (others=>'0');

  ascii_code_select2 <= ascii_map(
    OPT1_STR(char_index_select2 + OPT1_STR'low)
  ) when in_select2='1' else (others=>'0');

  -- TRAIN MODE
  in_select3 <= '1' when
    video_on='1' and game_state=S_GS and
    to_integer(unsigned(pix_row)) >= OPT2_V_OFF and
    to_integer(unsigned(pix_row)) <  OPT2_V_OFF+(CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= OPT2_H_OFF and
    to_integer(unsigned(pix_col)) <  (OPT2_H_OFF + OPT2_STR'length*(CHAR_W/2))
  else '0';

  char_index_select3 <= (to_integer(unsigned(pix_col)) - OPT2_H_OFF) / (CHAR_W/2);

  font_col_select3 <= std_logic_vector(to_unsigned(
    ((to_integer(unsigned(pix_col)) - OPT2_H_OFF) mod (CHAR_W/2)) / (S/2), 3))
    when in_select3='1' else (others=>'0');

  font_row_select3 <= std_logic_vector(to_unsigned(
    (to_integer(unsigned(pix_row)) - OPT2_V_OFF) / (S/2), 3))
    when in_select3='1' else (others=>'0');

  ascii_code_select3 <= ascii_map(
    OPT2_STR(char_index_select3 + OPT2_STR'low)
  ) when in_select3='1' else (others=>'0');


  -- SW0-HIGH (PLAY hint)
in_sw0_high <= '1' when
  video_on = '1' and game_state = S_GS and sw0_stable = '1' and
  to_integer(unsigned(pix_row))  >= OPT1_V_OFF    and
  to_integer(unsigned(pix_row))  <  OPT1_V_OFF + (CHAR_H/2) and
  to_integer(unsigned(pix_col))  >= OPT1_H_OFF    and
  to_integer(unsigned(pix_col))  <  OPT1_H_OFF + OPT1_STR'length*(CHAR_W/2)
else '0';

char_index_sw0_high <= (to_integer(unsigned(pix_col)) - OPT1_H_OFF) / (CHAR_W/2);

font_col_sw0_high <= std_logic_vector(to_unsigned(
  ((to_integer(unsigned(pix_col)) - OPT1_H_OFF) mod (CHAR_W/2)) / (S/2), 3))
  when in_sw0_high = '1' else (others => '0');

font_row_sw0_high <= std_logic_vector(to_unsigned(
  (to_integer(unsigned(pix_row)) - OPT1_V_OFF) / (S/2), 3))
  when in_sw0_high = '1' else (others => '0');

ascii_code_sw0_high <= ascii_map(
  OPT1_STR(char_index_sw0_high + OPT1_STR'low)
) when in_sw0_high = '1' else (others => '0');

-- SW0-LOW (TRAIN hint)
in_sw0_low <= '1' when
  video_on = '1' and game_state = S_GS and sw0_stable = '0' and
  to_integer(unsigned(pix_row))  >= OPT2_V_OFF    and
  to_integer(unsigned(pix_row))  <  OPT2_V_OFF + (CHAR_H/2) and
  to_integer(unsigned(pix_col))  >= OPT2_H_OFF    and
  to_integer(unsigned(pix_col))  <  OPT2_H_OFF + OPT2_STR'length*(CHAR_W/2)
else '0';

char_index_sw0_low <= (to_integer(unsigned(pix_col)) - OPT2_H_OFF) / (CHAR_W/2);

font_col_sw0_low <= std_logic_vector(to_unsigned(
  ((to_integer(unsigned(pix_col)) - OPT2_H_OFF) mod (CHAR_W/2)) / (S/2), 3))
  when in_sw0_low = '1' else (others => '0');

font_row_sw0_low <= std_logic_vector(to_unsigned(
  (to_integer(unsigned(pix_row)) - OPT2_V_OFF) / (S/2), 3))
  when in_sw0_low = '1' else (others => '0');

ascii_code_sw0_low <= ascii_map(
  OPT2_STR(char_index_sw0_low + OPT2_STR'low)
) when in_sw0_low = '1' else (others => '0');

-- DEATH screen line 1
in_death1 <= '1' when
  video_on='1' and game_state=S_DEATH and
  to_integer(unsigned(pix_row)) >= DEATH_V_OFF and
  to_integer(unsigned(pix_row)) <  DEATH_V_OFF+CHAR_H and
  to_integer(unsigned(pix_col)) >= DEATH_H_OFF and
  to_integer(unsigned(pix_col)) <  DEATH_H_OFF+DEATH_W
else '0';

char_index_d1 <= (to_integer(unsigned(pix_col)) - DEATH_H_OFF) / CHAR_W;
font_col_d1 <= std_logic_vector(to_unsigned(
  ((to_integer(unsigned(pix_col)) - DEATH_H_OFF) mod CHAR_W) / S,3))
  when in_death1='1' else (others=>'0');
font_row_d1 <= std_logic_vector(to_unsigned(
  (to_integer(unsigned(pix_row)) - DEATH_V_OFF) / S,3))
  when in_death1='1' else (others=>'0');
ascii_d1 <= ascii_map(DEATH_STR(char_index_d1 + DEATH_STR'low))
  when in_death1='1' else (others=>'0');

-- DEATH screen line 2 (half-scale)
in_death2 <= '1' when
  video_on='1' and game_state=S_DEATH and
  to_integer(unsigned(pix_row)) >= DEATH2_V_OFF and
  to_integer(unsigned(pix_row)) <  DEATH2_V_OFF+(CHAR_H/2) and
  to_integer(unsigned(pix_col)) >= DEATH2_H_OFF and
  to_integer(unsigned(pix_col)) <  DEATH2_H_OFF+DEATH2_W
else '0';

char_index_d2 <= (to_integer(unsigned(pix_col)) - DEATH2_H_OFF) / (CHAR_W/2);
font_col_d2 <= std_logic_vector(to_unsigned(
  ((to_integer(unsigned(pix_col)) - DEATH2_H_OFF) mod (CHAR_W/2)) / (S/2),3))
  when in_death2='1' else (others=>'0');
font_row_d2 <= std_logic_vector(to_unsigned(
  (to_integer(unsigned(pix_row)) - DEATH2_V_OFF) / (S/2),3))
  when in_death2='1' else (others=>'0');
ascii_d2 <= ascii_map(DEATH2_STR(char_index_d2 + DEATH2_STR'low))
  when in_death2='1' else (others=>'0');

  ----------------------------------------------------------------
font_row <= 
        font_row_d1    when in_death1='1' else
        font_row_d2    when in_death2='1' else
        font_row_title    when in_title    = '1' else
        font_row_push     when in_push     = '1' else
        font_row_select1  when in_select1  = '1' else
        font_row_select2  when in_select2  = '1' else
        font_row_select3  when in_select3  = '1' else
        font_row_sw0_high when in_sw0_high = '1' else
        font_row_sw0_low  when in_sw0_low  = '1' else
        (others => '0');

  font_col <= 
        font_col_d1    when in_death1='1' else
        font_col_d2    when in_death2='1' else
        font_col_title    when in_title    = '1' else
        font_col_push     when in_push     = '1' else
        font_col_select1  when in_select1  = '1' else
        font_col_select2  when in_select2  = '1' else
        font_col_select3  when in_select3  = '1' else
        font_col_sw0_high when in_sw0_high = '1' else
        font_col_sw0_low  when in_sw0_low  = '1' else
        (others => '0');

  ascii_code_final <= 
        ascii_d1       when in_death1='1' else
        ascii_d2       when in_death2='1' else
        ascii_code_title    when in_title    = '1' else
        ascii_code_push     when in_push     = '1' else
        ascii_code_select1  when in_select1  = '1' else
        ascii_code_select2  when in_select2  = '1' else
        ascii_code_select3  when in_select3  = '1' else
        ascii_code_sw0_high when in_sw0_high = '1' else
        ascii_code_sw0_low  when in_sw0_low  = '1' else
        (others => '0');

  char_address <= ascii_code_final(5 downto 0);

  ----------------------------------------------------------------
  -- Char-ROM → overlay → final RGB
  u_char_rom: char_rom port map(
    character_address => char_address,
    font_row          => font_row,
    font_col          => font_col,
    clock             => clk25,
    rom_mux_output    => rom_output
  );


 
-- combinational detection every pixel
collision_detect_proc : process(bird_row, bird_col, pipe_x_array, pipe_y_array, pipe_gap_int, ball_on_sig)
  variable bird_r_int  : integer;
  variable bird_c_int  : integer;
  variable px_int      : integer;
  variable py_int      : integer;
begin
  -- only check for pipes once the bird is actually being drawn
  if ball_on_sig = '1' then
    collision_detect <= '0';

    bird_r_int := to_integer(unsigned(bird_row));
    bird_c_int := to_integer(unsigned(bird_col));

    for i in 0 to NUM_PIPES-1 loop
      px_int := to_integer(unsigned(pipe_x_array(i)));
      py_int := to_integer(unsigned(pipe_y_array(i)));

      if (bird_c_int >= px_int and bird_c_int < px_int + PIPE_WIDTH) then
        if (bird_r_int < py_int) or (bird_r_int > py_int + pipe_gap_int) then
          collision_detect <= '1';
        end if;
      end if;
    end loop;

  else
    collision_detect <= '0';
  end if;
end process;


  -- register it so it stays high once set
 collision_reg : process(clk25, reset_i)
begin
  if reset_i = '1' then
    collision <= '0';
  elsif rising_edge(clk25) then
    if game_state /= S_PLAY and game_state /= S_TRAIN then
      collision <= '0';            -- clear whenever you're not playing
    elsif collision = '1' then
      collision <= '1';            -- once set in play/train, it stays
    else
      collision <= collision_detect;
    end if;
  end if;
end process;

 -- final_r: pink for SW0 hints, yellow for title/select/death text, otherwise ball or pipes or wrapped
final_r <=
     "1111" when (rom_output = '1' and (in_sw0_high = '1' or in_sw0_low = '1')) else
     "1111" when (rom_output = '1' and (
                        in_title   = '1' or in_push    = '1' or
                        in_select1 = '1' or in_select2 = '1' or
                        in_select3 = '1' or in_death1  = '1' or
                        in_death2  = '1'
                     )) else
     color_r when (ball_on_sig = '1' and (game_state = S_PLAY or game_state = S_TRAIN)) else
     "0000"  when (pipe_green = '1' and show_pipes = '1') else
     (others => wrapped_r);

-- final_g: pink for SW0 hints, yellow for title/select/death text, otherwise ball or pipes or wrapped
final_g <=
     "0000" when (rom_output = '1' and (in_sw0_high = '1' or in_sw0_low = '1')) else
     "1111" when (rom_output = '1' and (
                        in_title   = '1' or in_push    = '1' or
                        in_select1 = '1' or in_select2 = '1' or
                        in_select3 = '1' or in_death1  = '1' or
                        in_death2  = '1'
                     )) else
     color_g when (ball_on_sig = '1' and (game_state = S_PLAY or game_state = S_TRAIN)) else
     "1111"  when (pipe_green = '1' and show_pipes = '1') else
     (others => wrapped_g);

-- final_b: pink for SW0 hints, yellow for title/select/death text, otherwise ball or pipes or wrapped
final_b <=
     "1111" when (rom_output = '1' and (in_sw0_high = '1' or in_sw0_low = '1')) else
     "0000" when (rom_output = '1' and (
                        in_title   = '1' or in_push    = '1' or
                        in_select1 = '1' or in_select2 = '1' or
                        in_select3 = '1' or in_death1  = '1' or
                        in_death2  = '1'
                     )) else
     color_b when (ball_on_sig = '1' and (game_state = S_PLAY or game_state = S_TRAIN)) else
     "0000"  when (pipe_green = '1' and show_pipes = '1') else
     (others => wrapped_b);
  -- Drive VGA pins
  VGA_VS <= vsync_sig;
  VGA_R  <= vga_r_sig;
  VGA_G  <= vga_g_sig;
  VGA_B  <= vga_b_sig;

end architecture rtl;
