library IEEE;                               
use IEEE.std_logic_1164.all;                
use IEEE.numeric_std.all;                  
use work.ascii_codes.all;  -- ascii_map: character → std_logic_vector(6 downto 0)
                                              --   provides mapping from ASCII char to font code
use work.pipe_types.all;   -- pipe_array_type
                                              --   defines array type for pipe positions

----------------------------------------------------------------
-- Entity declaration
----------------------------------------------------------------
entity de0_cv_top is
  port (
    -- Clock & Reset
    CLOCK_50  : in  std_logic;               -- 50 MHz onboard clock
    reset_n   : in  std_logic;               -- active-low pushbutton reset

    -- PS/2 Mouse Interface
    PS2_CLK   : inout std_logic;             -- PS/2 clock line (mouse)
    PS2_DAT   : inout std_logic;             -- PS/2 data line (mouse)

    -- Buttons & Switch
    PB0       : in std_logic;                -- universal reset ("exit")
    PB1       : in  std_logic;               -- "enter" / start pushbutton
    PB2       : in  std_logic;               -- retry on death pushbutton
    SW0       : in  std_logic;               -- mode select switch

    -- VGA Output
    VGA_R     : out std_logic_vector(3 downto 0); -- 4-bit red channel
    VGA_G     : out std_logic_vector(3 downto 0); -- 4-bit green channel
    VGA_B     : out std_logic_vector(3 downto 0); -- 4-bit blue channel
    VGA_HS    : out std_logic;               -- horizontal sync
    VGA_VS    : out std_logic;               -- vertical sync

    -- LED and Seven-Segment
    LEDR0     : out std_logic;               -- LED reflecting SW0 state
    HEX0      : out std_logic_vector(6 downto 0); -- Hex displays for score/timer
    HEX1      : out std_logic_vector(6 downto 0);
    HEX2      : out std_logic_vector(6 downto 0);
    HEX3      : out std_logic_vector(6 downto 0);
    HEX4      : out std_logic_vector(6 downto 0);
    HEX5      : out std_logic_vector(6 downto 0)
  );
end entity de0_cv_top;

----------------------------------------------------------------
-- Architecture: rtl
----------------------------------------------------------------
architecture rtl of de0_cv_top is

  ----------------------------------------------------------------
  -- Component declarations
  ----------------------------------------------------------------

  component MOUSE                         -- PS/2 mouse controller
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

  component bouncy_ball                   -- the main "bird+pipes" game logic
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
  end component;

  component VGA_SYNC                     -- VGA timing & video-on generation
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

  component SevenSegDisplay              -- drives 6-digit seven-segment display
    port(
      clk          : in  std_logic;
      display_mode : in  std_logic_vector(2 downto 0);
      score_in     : in  integer range 0 to 999; 
      digit_one    : out std_logic_vector(6 downto 0);
      digit_two    : out std_logic_vector(6 downto 0);
      digit_three  : out std_logic_vector(6 downto 0);
      digit_four   : out std_logic_vector(6 downto 0);
      digit_five   : out std_logic_vector(6 downto 0);
      digit_six    : out std_logic_vector(6 downto 0)
      
    );
  end component;

  component char_rom                     -- font ROM for text overlays
    port(
      character_address : in  std_logic_vector(5 downto 0);
      font_row          : in  std_logic_vector(2 downto 0);
      font_col          : in  std_logic_vector(2 downto 0);
      clock             : in  std_logic;
      rom_mux_output    : out std_logic
    );
  end component;

  component pipe_generator               -- generates moving pipe gaps
    generic(
      NUM_PIPES     : integer := 3;
      PIPE_SPACING  : integer := 150;
      MOVE_INTERVAL : integer := 500_000;
      START_OFFSET  : integer := 10;
      PIPE_WIDTH    : integer := 40;
      PIPE_GAP      : integer := 100
    );
    port(
      clk           : in  std_logic;
      reset         : in  std_logic;
		game_on       : in  std_logic;
      pix_row       : in  std_logic_vector(9 downto 0);
      pix_col       : in  std_logic_vector(9 downto 0);
      pipe_x_array  : out pipe_array_type;
      pipe_y_array  : out pipe_array_type;
      number_of_pipe : out std_logic_vector(5 downto 0);
      green_out     : out std_logic
    );
  end component;

  ----------------------------------------------------------------
  -- Signal declarations
  ----------------------------------------------------------------
  signal clk25, reset_i               : std_logic := '0';      -- 25 MHz clock & reset
  signal pb1_sync_0, pb1_sync_1       : std_logic := '1';      -- PB1 debounce
  signal btn1_stable, btn1            : std_logic;              -- stable + inverted PB1
  signal btn1_prev, btn1_rising       : std_logic := '0';      -- PB1 edge detect

  signal pb0_sync_0, pb0_sync_1       : std_logic := '1';      -- PB0 debounce
  signal pb0_stable                   : std_logic;              -- stable PB0
  signal pb0_prev, pb0_rising         : std_logic := '0';      -- PB0 edge detect

  signal pb2_sync_0, pb2_sync_1       : std_logic := '1';      -- PB2 debounce
  signal pb2_stable                   : std_logic;              -- stable PB2
  signal pb2_prev, pb2_rising         : std_logic := '0';      -- PB2 edge detect

  signal sw0_sync_0, sw0_sync_1       : std_logic := '0';      -- SW0 debounce
  signal sw0_stable                   : std_logic;              -- stable SW0

  type game_state_t is (                   -- FSM states
    S_TITLE, S_GS, S_TRAIN, S_PLAY, S_DEATH
  );
  signal game_state                   : game_state_t := S_TITLE;
  signal show_pipes                   : std_logic;              -- gate for pipe drawing

  signal pix_row, pix_col             : std_logic_vector(9 downto 0); -- VGA pixel coords
  signal video_on, vsync_sig          : std_logic;              -- VGA video on & vsync
  signal vga_r_sig, vga_g_sig, vga_b_sig : std_logic_vector(3 downto 0); -- VGA outputs

  signal mouse_row, mouse_col         : std_logic_vector(9 downto 0); -- PS/2 cursor

  signal current_left_btn, right_btn  : std_logic;              -- mouse buttons

  signal color_r, color_g, color_b    : std_logic_vector(3 downto 0); -- bird color

  signal wrapped_r : std_logic := '0';    -- background wrap colors
  signal wrapped_g : std_logic := '1';
  signal wrapped_b : std_logic := '1';

  -- Training mode background color state
  signal train_bg_white : std_logic := '1';  -- '1' for white, '0' for black background

  signal final_r, final_g, final_b    : std_logic_vector(3 downto 0); -- final RGB

  ----------------------------------------------------------------
  -- Text-overlay region signals
  ----------------------------------------------------------------
  signal in_title, in_push            : std_logic;              -- when drawing title or "push" text
  signal in_select1, in_select2, in_select3 : std_logic;        -- when drawing "select mode" & options

  signal char_index_title             : integer range 0 to 31 := 0; -- which character cell in title
  signal char_index_select1, char_index_select2, char_index_select3 : integer range 0 to 31 := 0;

  signal font_row  : std_logic_vector(2 downto 0);
  signal font_col  : std_logic_vector(2 downto 0);
  signal font_row_title, font_col_title       : std_logic_vector(2 downto 0); -- pixel row/col within char
  signal font_row_select1, font_col_select1   : std_logic_vector(2 downto 0);
  signal font_row_select2, font_col_select2   : std_logic_vector(2 downto 0);
  signal font_row_select3, font_col_select3   : std_logic_vector(2 downto 0);
  

  signal in_death1, in_death2               : std_logic;
  signal char_index_d1, char_index_d2       : integer range 0 to 31 := 0;
  signal font_row_d1, font_col_d1           : std_logic_vector(2 downto 0);
  signal font_row_d2, font_col_d2           : std_logic_vector(2 downto 0);
  signal ascii_d1, ascii_d2                 : std_logic_vector(6 downto 0);

  -- "PUSH BUTTON 1 TO START" half-scale overlay
  signal char_index_push               : integer range 0 to 31 := 0;
  signal font_row_push, font_col_push  : std_logic_vector(2 downto 0);
  signal ascii_code_push               : std_logic_vector(6 downto 0);

  -- SW0-hint overlays (highlight current option)
  signal in_sw0_high, in_sw0_low                        : std_logic;
  signal char_index_sw0_high, char_index_sw0_low       : integer range 0 to 31 := 0;
  signal font_row_sw0_high, font_col_sw0_high          : std_logic_vector(2 downto 0);
  signal font_row_sw0_low,  font_col_sw0_low           : std_logic_vector(2 downto 0);
  signal ascii_code_sw0_high, ascii_code_sw0_low       : std_logic_vector(6 downto 0);
  

  -- Muxed ASCII code and font-address signals
  signal ascii_code_title             : std_logic_vector(6 downto 0);
  signal ascii_code_select1, ascii_code_select2, ascii_code_select3 : std_logic_vector(6 downto 0);
  signal ascii_code_final             : std_logic_vector(6 downto 0);
  signal char_address                 : std_logic_vector(5 downto 0); -- index into char_rom

  signal rom_output                   : std_logic;              -- font bit out

  signal display_mode                 : std_logic_vector(2 downto 0); -- controls seven-segment

  signal in_score            : std_logic;          -- are we in the 3-digit score region?
  signal char_index_score    : integer range 0 to 2 := 0;
  signal font_row_score      : std_logic_vector(2 downto 0);
  signal font_col_score      : std_logic_vector(2 downto 0);

  -- holds the three ASCII codes for hundreds, tens, units
  signal ascii_score_h, ascii_score_t, ascii_score_u : std_logic_vector(6 downto 0);
  signal ascii_code_score    : std_logic_vector(6 downto 0);


  ----------------------------------------------------------------
  -- Pipe geometry signals
  ----------------------------------------------------------------
  signal pipe_x_array, pipe_y_array   : pipe_array_type;        -- arrays of pipe positions
  signal pipe_gap : std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(100,10));
  signal pipe_gap_int : integer;                          -- integer gap height
  signal pipe_green                   : std_logic;              -- pipe pixel flag
  

  ----------------------------------------------------------------
  -- Collision & bird outputs
  ----------------------------------------------------------------
  signal ball_on_sig                  : std_logic;              -- bird drawn?
  signal collision                    : std_logic;     -- latched collision flag
  signal collision_detect             : std_logic;              -- combinational detect
  signal bird_row, bird_col           : std_logic_vector(9 downto 0); -- bird position

    ----------------------------------------------------------------
  -- Signals to hold your true “pass‐through” score and per‐pipe flags

  constant PIPE_WIDTH    : integer := 50;
  constant GAP_HEIGHT    : integer := 100;
  constant NUM_PIPES     : integer := 3;
  signal prev_pipe_x : pipe_array_type := (others => (others => '0'));
  ----------------------------------------------------------------
  signal pass_score     : integer range 0 to 999 := 0;
  signal passed_pipe    : std_logic_vector(NUM_PIPES-1 downto 0) := (others=>'0');
  signal prev_bird_col  : integer range 0 to 1023 := 0;

  ----------------------------------------------------------------
  -- Constants for text sizing & positioning
  ----------------------------------------------------------------
  constant S      : integer := 4;                     -- text scale factor
  constant CHAR_W : integer := S*8;                   -- character width in pixels
  constant CHAR_H : integer := S*8;                   -- character height

  constant TITLE_STR : string(1 to 13) := "DEATH BY PIPE";
  constant PUSH_STR  : string(1 to 22) := "PUSH BUTTON 1 TO START";

  -- pixel widths of title and push messages
  constant S1_MSG_WIDTH  : integer := TITLE_STR'length * CHAR_W;
  constant S1_PUSH_WIDTH : integer := PUSH_STR'length * (CHAR_W/2);

  constant SELECT_STR1 : string(1 to 11) := "SELECT MODE";
  constant OPT1_STR    : string(1 to 22) := "SW0 HIGH FOR PLAY MODE";
  constant OPT2_STR    : string(1 to 22) := "SW0 LOW FOR TRAIN MODE";

  -- centers & offsets for each overlay
  constant S1_H_OFF      : integer := (640 - S1_MSG_WIDTH)/2;
  constant S1_V_OFF      : integer := (480 - CHAR_H)/2;

  constant S1_PUSH_H_OFF : integer := (640 - S1_PUSH_WIDTH)/2;
  constant S1_PUSH_V_OFF : integer := S1_V_OFF + CHAR_H + 20;

  constant S2_H_OFF      : integer := (640 - SELECT_STR1'length*CHAR_W)/2;
  constant S2_V_OFF      : integer := S1_V_OFF;

  constant OPT1_H_OFF    : integer := (640 - OPT1_STR'length*(CHAR_W/2))/2;
  constant OPT1_V_OFF    : integer := S2_V_OFF + CHAR_H + 10;

  constant OPT2_H_OFF    : integer := (640 - OPT2_STR'length*(CHAR_W/2))/2;
  constant OPT2_V_OFF    : integer := OPT1_V_OFF + (CHAR_H/2) + 10;


  -- Death screen text
  constant DEATH_STR    : string(1 to  9) := "YOU DIED!";
  constant DEATH2_STR   : string(1 to 18) := "PRESS PB2 TO RETRY";

  constant DEATH_MSG1_W : integer := DEATH_STR'length * CHAR_W;
  constant DEATH_MSG2_W : integer := DEATH2_STR'length * (CHAR_W/2);

  constant DEATH_H_OFF  : integer := (640 - DEATH_MSG1_W)/2;
  constant DEATH_V_OFF  : integer := (480 - CHAR_H)/2;
  constant DEATH2_H_OFF : integer := (640 - DEATH_MSG2_W)/2;
  constant DEATH2_V_OFF : integer := DEATH_V_OFF + CHAR_H + 20;

  -- Delay before pipes start moving
  constant PLAY_DELAY_CYCLES : integer := 125_000_000;  -- ~5s @25 MHz
  signal play_delay_counter  : integer range 0 to PLAY_DELAY_CYCLES := 0;
  signal pipes_go            : std_logic := '0';      -- true once delay expires

  signal number_of_pipe       : std_logic_vector(5 downto 0); -- Corrected declaration

   constant SCORE_H_OFF : integer := 10;            -- 10px from left
  constant SCORE_V_OFF : integer := 10;            -- 10px from top

begin
  ----------------------------------------------------------------
  -- Clock div & reset
  ----------------------------------------------------------------
  clk_div: process(CLOCK_50) begin
    if rising_edge(CLOCK_50) then
      clk25 <= not clk25;            -- divide 50 MHz to ~25 MHz
    end if;
  end process;
  reset_i <= not reset_n or not pb0_stable;           -- active-high reset internally

  ----------------------------------------------------------------
  -- PB1 ("enter") debounce & rising-edge detection
  ----------------------------------------------------------------
  sync_pb1: process(clk25, reset_i) begin
    if reset_i = '1' then
      pb1_sync_0 <= '1';             -- reset shift-register
      pb1_sync_1 <= '1';
    elsif rising_edge(clk25) then
      pb1_sync_0 <= PB1;             -- sample raw PB1
      pb1_sync_1 <= pb1_sync_0;      -- two-stage synchronizer
    end if;
  end process;

  btn1_stable <= pb1_sync_1;         -- debounced PB1
  btn1        <= not btn1_stable;    -- invert if active-low

  edge_pb1: process(clk25, reset_i) begin
    if reset_i = '1' then
      btn1_prev <= '0';
    elsif rising_edge(clk25) then
      btn1_prev <= btn1;             -- register previous stable state
    end if;
  end process;

  btn1_rising <= '1' when (btn1 = '1' and btn1_prev = '0') else '0';  
                                     -- detect rising edge

  ----------------------------------------------------------------
  -- PB0 (universal exit) debounce & rising-edge detection
  ----------------------------------------------------------------
  sync_pb0: process(clk25, reset_n) begin
  if reset_n = '0' then
    pb0_sync_0 <= '1';
    pb0_sync_1 <= '1';
  elsif rising_edge(clk25) then
    pb0_sync_0 <= PB0;  
    pb0_sync_1 <= pb0_sync_0;  
  end if;
end process;

  pb0_stable <= pb0_sync_1;          -- debounced PB0

  edge_pb0: process(clk25, reset_i) begin
    if reset_i = '1' then
      pb0_prev <= '0';
    elsif rising_edge(clk25) then
      pb0_prev <= pb0_stable;        -- latch previous
    end if;
  end process;

  pb0_rising <= '1' when (pb0_stable = '1' and pb0_prev = '0') else '0';
                                     -- detect rising edge

  ----------------------------------------------------------------
  -- PB2 ("retry on death") debounce & rising-edge detection
  ----------------------------------------------------------------
  sync_pb2: process(clk25, reset_i) begin
    if reset_i = '1' then
      pb2_sync_0 <= '1';
      pb2_sync_1 <= '1';
    elsif rising_edge(clk25) then
      pb2_sync_0 <= PB2;             -- sample raw PB2
      pb2_sync_1 <= pb2_sync_0;      -- synchronize
    end if;
  end process;

  pb2_stable <= pb2_sync_1;          -- debounced PB2

  edge_pb2: process(clk25, reset_i) begin
    if reset_i = '1' then
      pb2_prev <= '0';
    elsif rising_edge(clk25) then
      pb2_prev <= pb2_stable;        -- latch previous
    end if;
  end process;

  pb2_rising <= '1' when (pb2_stable = '1' and pb2_prev = '0') else '0';
                                     -- detect rising edge

  ----------------------------------------------------------------
  -- SW0 debounce & LED indicator
  ----------------------------------------------------------------
  sync_sw0: process(clk25, reset_i) begin
    if reset_i = '1' then
      sw0_sync_0 <= '0';
      sw0_sync_1 <= '0';
    elsif rising_edge(clk25) then
      sw0_sync_0 <= SW0;             -- sample switch
      sw0_sync_1 <= sw0_sync_0;      -- synchronize
    end if;
  end process;

  sw0_stable <= sw0_sync_1;          -- debounced SW0
  LEDR0      <= sw0_stable;          -- mirror on LED

  ----------------------------------------------------------------
  -- Main FSM: Title → Game-Select → Play/Train → Death
  ----------------------------------------------------------------
  fsm: process(clk25, reset_i) begin
    if reset_i = '1' then
      game_state <= S_TITLE;         -- initial state
    elsif rising_edge(clk25) then
      if pb0_rising = '1' then       -- universal reset
        game_state <= S_TITLE;
      else
        case game_state is
          when S_TITLE =>
            if btn1_rising = '1' then
              game_state <= S_GS;    -- go to select screen
            end if;

          when S_GS =>
            if btn1_rising = '1' then
              if sw0_stable = '1' then
                game_state <= S_PLAY;  -- choose Play
              else
                game_state <= S_TRAIN; -- choose Train
              end if;
            end if;

          when S_PLAY | S_TRAIN =>
            if collision = '1' then
              game_state <= S_DEATH;  -- on collision → death
            elsif pass_score >= 18 then -- Game over condition using integer cast
              game_state <= S_TITLE;  -- return to title after 18 pipes
            end if;

          when S_DEATH =>
            if pb2_rising = '1' then
              game_state <= S_GS;    -- retry → select
            end if;
          when others =>
            null;
        end case;
      end if;
    end if;
  end process fsm;

  ----------------------------------------------------------------
  -- PLAY delay & pipe-start gating
  ----------------------------------------------------------------
  process(clk25, reset_i) begin
    if reset_i = '1' then
      play_delay_counter <= 0;
      pipes_go           <= '0';
    elsif rising_edge(clk25) then
      if game_state = S_PLAY or game_state = S_TRAIN then
        if play_delay_counter < PLAY_DELAY_CYCLES then
          play_delay_counter <= play_delay_counter + 1;
          pipes_go           <= '0';
        else
          pipes_go           <= '1';  -- start moving pipes
        end if;
      else
        play_delay_counter <= 0;
        pipes_go           <= '0';
      end if;
    end if;
  end process;

  ----------------------------------------------------------------
  -- Pipe visibility control
  ----------------------------------------------------------------
  show_pipes <= '1' when (game_state = S_PLAY or game_state = S_TRAIN)
                else '0';

  ----------------------------------------------------------------
  -- Seven-segment display mapping by mode
  ----------------------------------------------------------------
  sevenseg: process(game_state, sw0_stable) begin
    case game_state is
      when S_TITLE =>
        display_mode <= "011";  -- show title count

      when S_GS =>
        if sw0_stable = '1' then
          display_mode <= "010"; -- hint for Play
        else
          display_mode <= "110"; -- hint for Train
        end if;

      when S_PLAY =>
        display_mode <= "010";   -- show score/play

      when S_TRAIN =>
        display_mode <= "110";   -- show training count

      when others =>
        display_mode <= "000";   -- blank
    end case;
  end process;

   ----------------------------------------------------------------
  -- B) Synchronous process that watches each pipe & the bird
  ----------------------------------------------------------------
score_detect : process(clk25, reset_i)
  variable bird_r_int : integer;
  variable pipe_x_int : integer;
  variable pipe_y_int : integer;
begin
  if reset_i = '1' then
    pass_score  <= 0;
    passed_pipe <= (others => '0');
    prev_pipe_x <= (others => (others => '0'));

  elsif rising_edge(clk25) then

    -- reset score & flags whenever we're not actively playing
    if game_state /= S_PLAY then
      pass_score  <= 0;
      passed_pipe <= (others => '0');
      prev_pipe_x <= (others => (others => '0'));

    else
      -- only count when in PLAY
      bird_r_int := to_integer(unsigned(bird_row));

      for i in 0 to NUM_PIPES-1 loop
        pipe_x_int := to_integer(unsigned(pipe_x_array(i)));
        pipe_y_int := to_integer(unsigned(pipe_y_array(i)));

        -- trailing edge swept past bird?
        if passed_pipe(i) = '0' and
           to_integer(unsigned(prev_pipe_x(i))) + PIPE_WIDTH >= to_integer(unsigned(bird_col)) and
           pipe_x_int + PIPE_WIDTH < to_integer(unsigned(bird_col)) then

          -- inside gap?
          if bird_r_int >= pipe_y_int and
             bird_r_int <= pipe_y_int + pipe_gap_int then
            pass_score <= pass_score + 1;
          end if;
          passed_pipe(i) <= '1';
        end if;

        -- clear flag when this pipe wraps around
        if pipe_x_int > to_integer(unsigned(prev_pipe_x(i))) then
          passed_pipe(i) <= '0';
        end if;

        -- remember for next cycle
        prev_pipe_x(i) <= std_logic_vector(
                            to_unsigned(pipe_x_int, prev_pipe_x(i)'length)
                          );
      end loop;
    end if;

  end if;
end process score_detect;


  ----------------------------------------------------------------
  -- Mouse interface
  ----------------------------------------------------------------
  u_mouse: MOUSE
    port map(
      clock_25Mhz         => clk25,          -- 25 MHz clock
      reset               => reset_i,        -- global reset
      mouse_data          => PS2_DAT,        -- PS/2 data line
      mouse_clk           => PS2_CLK,        -- PS/2 clock line
      left_button         => current_left_btn,  -- left click
      right_button        => right_btn,         -- right click
      mouse_cursor_row    => mouse_row,      -- cursor Y
      mouse_cursor_column => mouse_col       -- cursor X
    );

  ----------------------------------------------------------------
  -- Bouncy-ball (player) logic
  ----------------------------------------------------------------
  u_ball: bouncy_ball
    port map(
      pb1                     => btn1,          -- jump/reset button
      pb2                     => PB2,           -- forwarded raw PB2
      clk                     => clk25,         -- 25 MHz
      vert_sync               => vsync_sig,     -- Vsync from VGA
      current_left_btn_status => current_left_btn,  -- mouse click
      pixel_row               => pix_row,       -- pixel Y
      pixel_column            => pix_col,       -- pixel X
      red                     => color_r,       -- ball color
      green                   => color_g,
      blue                    => color_b,
      ball_on                 => ball_on_sig,   -- is ball pixel?
      bird_row                => bird_row,      -- tracked sprite row
      bird_col                => bird_col       -- tracked sprite col
    );

  ----------------------------------------------------------------
  -- VGA synchronizer & video-on
  ----------------------------------------------------------------
  u_vga_sync: VGA_SYNC
    port map(
      clock_25Mhz    => clk25,
      red            => final_r,       -- final R
      green          => final_g,       -- final G
      blue           => final_b,       -- final B
      red_out        => vga_r_sig,     -- to DAC
      green_out      => vga_g_sig,
      blue_out       => vga_b_sig,
      horiz_sync_out => VGA_HS,        -- Hsync
      vert_sync_out  => vsync_sig,     -- Vsync
      pixel_row      => pix_row,       -- current scan Y
      pixel_column   => pix_col,       -- current scan X
      video_on_out   => video_on       -- active video region
    );

  ----------------------------------------------------------------
  -- Seven-segment display
  ----------------------------------------------------------------
  u_seven_seg: SevenSegDisplay
    port map(
      clk          => clk25,
      display_mode => display_mode,   -- selected above
      score_in     => pass_score,    
      digit_one    => HEX0,
      digit_two    => HEX1,
      digit_three  => HEX2,
      digit_four   => HEX3,
      digit_five   => HEX4,
      digit_six    => HEX5
    );

  ----------------------------------------------------------------
  -- Pipe generator
  ----------------------------------------------------------------
  u_pipe: pipe_generator
    generic map (
      START_OFFSET => 10,             -- initial off-screen offset
      PIPE_WIDTH   => 40,
      PIPE_SPACING => 185,
      PIPE_GAP     => 100
    )
    port map (
      clk          => clk25,
      reset        => reset_i,
		game_on      => pipes_go,
      pix_row      => pix_row,
      pix_col      => pix_col,
      pipe_x_array => pipe_x_array,   -- X positions
      pipe_y_array => pipe_y_array,   -- gap Y positions
      number_of_pipe => number_of_pipe, -- Connect the number of passed pipes
      green_out    => pipe_green      -- pipe pixel flag
    );

  pipe_gap_int <= to_integer(unsigned(pipe_gap));  
                                     -- convert std_logic_vector to int
                                     
----------------------------------------------------------------
--  Convert your 6-bit pipe count into three ASCII digits
----------------------------------------------------------------
  score_proc: process(pass_score)
    variable h, t, u : integer;
  begin
    h := pass_score / 100;
    t := (pass_score / 10) mod 10;
    u := pass_score mod 10;
    ascii_score_h <= ascii_map(character'val(character'pos('0') + h));
    ascii_score_t <= ascii_map(character'val(character'pos('0') + t));
    ascii_score_u <= ascii_map(character'val(character'pos('0') + u));
  end process;

  ----------------------------------------------------------------
  -- TITLE overlay region
  ----------------------------------------------------------------
  in_title <= '1' when
     video_on = '1' and game_state = S_TITLE and
     to_integer(unsigned(pix_row)) >= S1_V_OFF and
     to_integer(unsigned(pix_row)) <  S1_V_OFF + CHAR_H and
     to_integer(unsigned(pix_col)) >= S1_H_OFF and
     to_integer(unsigned(pix_col)) <  S1_H_OFF + S1_MSG_WIDTH
  else '0';

  char_index_title <= (to_integer(unsigned(pix_col)) - S1_H_OFF) / CHAR_W;
  font_col_title   <= std_logic_vector(to_unsigned(
                       ((to_integer(unsigned(pix_col)) - S1_H_OFF) mod CHAR_W) / S, 3))
                       when in_title = '1' else (others => '0');
  font_row_title   <= std_logic_vector(to_unsigned(
                       (to_integer(unsigned(pix_row)) - S1_V_OFF) / S, 3))
                       when in_title = '1' else (others => '0');
  ascii_code_title <= ascii_map(
                       TITLE_STR(char_index_title + TITLE_STR'low)
                     ) when in_title = '1' else (others => '0');

  ----------------------------------------------------------------
  -- PUSH overlay (half-scale)
  ----------------------------------------------------------------
  in_push <= '1' when
    video_on = '1' and game_state = S_TITLE and
    to_integer(unsigned(pix_row)) >= S1_PUSH_V_OFF and
    to_integer(unsigned(pix_row)) <  S1_PUSH_V_OFF + (CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= S1_PUSH_H_OFF and
    to_integer(unsigned(pix_col)) <  S1_PUSH_H_OFF + S1_PUSH_WIDTH
  else '0';

  char_index_push <= (to_integer(unsigned(pix_col)) - S1_PUSH_H_OFF) / (CHAR_W/2);
  font_col_push   <= std_logic_vector(to_unsigned(
                       ((to_integer(unsigned(pix_col)) - S1_PUSH_H_OFF)
                         mod (CHAR_W/2)) / (S/2), 3))
                       when in_push = '1' else (others => '0');
  font_row_push   <= std_logic_vector(to_unsigned(
                       (to_integer(unsigned(pix_row)) - S1_PUSH_V_OFF) / (S/2), 3))
                       when in_push = '1' else (others => '0');
  ascii_code_push <= ascii_map(
                       PUSH_STR(char_index_push + PUSH_STR'low)
                     ) when in_push = '1' else (others => '0');

  ----------------------------------------------------------------
  -- SELECT header & options overlay
  ----------------------------------------------------------------
  in_select1 <= '1' when
    video_on = '1' and game_state = S_GS and
    to_integer(unsigned(pix_row)) >= S2_V_OFF and
    to_integer(unsigned(pix_row)) <  S2_V_OFF + CHAR_H and
    to_integer(unsigned(pix_col)) >= S2_H_OFF and
    to_integer(unsigned(pix_col)) <  (S2_H_OFF + SELECT_STR1'length * CHAR_W)
  else '0';

  char_index_select1 <= (to_integer(unsigned(pix_col)) - S2_H_OFF) / CHAR_W;
  font_col_select1   <= std_logic_vector(to_unsigned(
                         ((to_integer(unsigned(pix_col)) - S2_H_OFF) mod CHAR_W) / S, 3))
                         when in_select1 = '1' else (others => '0');
  font_row_select1   <= std_logic_vector(to_unsigned(
                         (to_integer(unsigned(pix_row)) - S2_V_OFF) / S, 3))
                         when in_select1 = '1' else (others => '0');
  ascii_code_select1 <= ascii_map(
                         SELECT_STR1(char_index_select1 + SELECT_STR1'low)
                       ) when in_select1 = '1' else (others => '0');

  -- PLAY MODE option
  in_select2 <= '1' when
    video_on = '1' and game_state = S_GS and
    to_integer(unsigned(pix_row)) >= OPT1_V_OFF and
    to_integer(unsigned(pix_row)) <  OPT1_V_OFF + (CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= OPT1_H_OFF and
    to_integer(unsigned(pix_col)) <  (OPT1_H_OFF + OPT1_STR'length * (CHAR_W/2))
  else '0';
  char_index_select2 <= (to_integer(unsigned(pix_col)) - OPT1_H_OFF) / (CHAR_W/2);
  font_col_select2   <= std_logic_vector(to_unsigned(
                         ((to_integer(unsigned(pix_col)) - OPT1_H_OFF)
                           mod (CHAR_W/2)) / (S/2), 3))
                         when in_select2 = '1' else (others => '0');
  font_row_select2   <= std_logic_vector(to_unsigned(
                         (to_integer(unsigned(pix_row)) - OPT1_V_OFF) / (S/2), 3))
                         when in_select2 = '1' else (others => '0');
  ascii_code_select2 <= ascii_map(
                         OPT1_STR(char_index_select2 + OPT1_STR'low)
                       ) when in_select2 = '1' else (others => '0');

  -- TRAIN MODE option
  in_select3 <= '1' when
    video_on = '1' and game_state = S_GS and
    to_integer(unsigned(pix_row)) >= OPT2_V_OFF and
    to_integer(unsigned(pix_row)) <  OPT2_V_OFF + (CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= OPT2_H_OFF and
    to_integer(unsigned(pix_col)) <  (OPT2_H_OFF + OPT2_STR'length * (CHAR_W/2))
  else '0';
  char_index_select3 <= (to_integer(unsigned(pix_col)) - OPT2_H_OFF) / (CHAR_W/2);
  font_col_select3   <= std_logic_vector(to_unsigned(
                         ((to_integer(unsigned(pix_col)) - OPT2_H_OFF)
                           mod (CHAR_W/2)) / (S/2), 3))
                         when in_select3 = '1' else (others => '0');
  font_row_select3   <= std_logic_vector(to_unsigned(
                         (to_integer(unsigned(pix_row)) - OPT2_V_OFF) / (S/2), 3))
                         when in_select3 = '1' else (others => '0');
  ascii_code_select3 <= ascii_map(
                         OPT2_STR(char_index_select3 + OPT2_STR'low)
                       ) when in_select3 = '1' else (others => '0');

  ----------------------------------------------------------------
  -- SW0-HIGH / LOW hints color overlays
  ----------------------------------------------------------------
  in_sw0_high <= '1' when
    video_on = '1' and game_state = S_GS and sw0_stable = '1' and
    to_integer(unsigned(pix_row)) >= OPT1_V_OFF and
    to_integer(unsigned(pix_row)) <  OPT1_V_OFF + (CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= OPT1_H_OFF and
    to_integer(unsigned(pix_col)) <  OPT1_H_OFF + OPT1_STR'length * (CHAR_W/2)
  else '0';
  char_index_sw0_high <= (to_integer(unsigned(pix_col)) - OPT1_H_OFF) / (CHAR_W/2);
  font_col_sw0_high   <= std_logic_vector(to_unsigned(
                         ((to_integer(unsigned(pix_col)) - OPT1_H_OFF)
                           mod (CHAR_W/2)) / (S/2), 3))
                         when in_sw0_high = '1' else (others => '0');
  font_row_sw0_high   <= std_logic_vector(to_unsigned(
                         (to_integer(unsigned(pix_row)) - OPT1_V_OFF) / (S/2), 3))
                         when in_sw0_high = '1' else (others => '0');
  ascii_code_sw0_high <= ascii_map(
                         OPT1_STR(char_index_sw0_high + OPT1_STR'low)
                       ) when in_sw0_high = '1' else (others => '0');

  in_sw0_low <= '1' when
    video_on = '1' and game_state = S_GS and sw0_stable = '0' and
    to_integer(unsigned(pix_row)) >= OPT2_V_OFF and
    to_integer(unsigned(pix_row)) <  OPT2_V_OFF + (CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= OPT2_H_OFF and
    to_integer(unsigned(pix_col)) <  OPT2_H_OFF + OPT2_STR'length * (CHAR_W/2)
  else '0';
  char_index_sw0_low <= (to_integer(unsigned(pix_col)) - OPT2_H_OFF) / (CHAR_W/2);
  font_col_sw0_low   <= std_logic_vector(to_unsigned(
                         ((to_integer(unsigned(pix_col)) - OPT2_H_OFF)
                           mod (CHAR_W/2)) / (S/2), 3))
                         when in_sw0_low = '1' else (others => '0');
  font_row_sw0_low   <= std_logic_vector(to_unsigned(
                         (to_integer(unsigned(pix_row)) - OPT2_V_OFF) / (S/2), 3))
                         when in_sw0_low = '1' else (others => '0');
  ascii_code_sw0_low <= ascii_map(
                         OPT2_STR(char_index_sw0_low + OPT2_STR'low)
                       ) when in_sw0_low = '1' else (others => '0');

----------------------------------------------------------------
-- 3) Score‐overlay region 
----------------------------------------------------------------
in_score <= '1' when
     video_on = '1' and game_state = S_PLAY and
     to_integer(unsigned(pix_row)) >= SCORE_V_OFF and
     to_integer(unsigned(pix_row)) <  SCORE_V_OFF + CHAR_H and
     to_integer(unsigned(pix_col)) >= SCORE_H_OFF and
     to_integer(unsigned(pix_col)) <  SCORE_H_OFF + 3*CHAR_W
  else '0';

char_index_score <= (to_integer(unsigned(pix_col)) - SCORE_H_OFF) / CHAR_W;
font_col_score   <= std_logic_vector(to_unsigned(
                       ((to_integer(unsigned(pix_col)) - SCORE_H_OFF) mod CHAR_W) / S, 3))
                       when in_score = '1' else (others => '0');
font_row_score   <= std_logic_vector(to_unsigned(
                       (to_integer(unsigned(pix_row)) - SCORE_V_OFF) / S, 3))
                       when in_score = '1' else (others => '0');

ascii_code_score <= ascii_score_h when char_index_score = 0 else
                    ascii_score_t when char_index_score = 1 else
                    ascii_score_u when char_index_score = 2 else
                    (others => '0');


  ----------------------------------------------------------------
  -- Death-screen overlays
  ----------------------------------------------------------------
  in_death1 <= '1' when
    video_on = '1' and game_state = S_DEATH and
    to_integer(unsigned(pix_row)) >= DEATH_V_OFF and
    to_integer(unsigned(pix_row)) <  DEATH_V_OFF + CHAR_H and
    to_integer(unsigned(pix_col)) >= DEATH_H_OFF and
    to_integer(unsigned(pix_col)) <  DEATH_H_OFF + DEATH_MSG1_W
  else '0';
  char_index_d1 <= (to_integer(unsigned(pix_col)) - DEATH_H_OFF) / CHAR_W;
  font_col_d1   <= std_logic_vector(to_unsigned(
                    ((to_integer(unsigned(pix_col)) - DEATH_H_OFF) mod CHAR_W) / S, 3))
                    when in_death1 = '1' else (others => '0');
  font_row_d1   <= std_logic_vector(to_unsigned(
                    (to_integer(unsigned(pix_row)) - DEATH_V_OFF) / S, 3))
                    when in_death1 = '1' else (others => '0');
  ascii_d1      <= ascii_map(DEATH_STR(char_index_d1 + DEATH_STR'low))
                    when in_death1 = '1' else (others => '0');

  in_death2 <= '1' when
    video_on = '1' and game_state = S_DEATH and
    to_integer(unsigned(pix_row)) >= DEATH2_V_OFF and
    to_integer(unsigned(pix_row)) <  DEATH2_V_OFF + (CHAR_H/2) and
    to_integer(unsigned(pix_col)) >= DEATH2_H_OFF and
    to_integer(unsigned(pix_col)) <  DEATH2_H_OFF + DEATH_MSG2_W
  else '0';
  char_index_d2 <= (to_integer(unsigned(pix_col)) - DEATH2_H_OFF) / (CHAR_W/2);
  font_col_d2   <= std_logic_vector(to_unsigned(
                    ((to_integer(unsigned(pix_col)) - DEATH2_H_OFF)
                      mod (CHAR_W/2)) / (S/2), 3))
                    when in_death2 = '1' else (others => '0');
  font_row_d2   <= std_logic_vector(to_unsigned(
                    (to_integer(unsigned(pix_row)) - DEATH2_V_OFF) / (S/2), 3))
                    when in_death2 = '1' else (others => '0');
  ascii_d2      <= ascii_map(DEATH2_STR(char_index_d2 + DEATH2_STR'low))
                    when in_death2 = '1' else (others => '0');

  ----------------------------------------------------------------
  -- Font MUX: choose which overlay's row/col/ascii to feed ROM
  ----------------------------------------------------------------
  font_row <=
        font_row_score    when in_score        = '1' else  
        font_row_d1       when in_death1      = '1' else
        font_row_d2       when in_death2      = '1' else
        font_row_title    when in_title       = '1' else
        font_row_push     when in_push        = '1' else
        font_row_select1  when in_select1     = '1' else
        font_row_select2  when in_select2     = '1' else
        font_row_select3  when in_select3     = '1' else
        font_row_sw0_high when in_sw0_high    = '1' else
        font_row_sw0_low  when in_sw0_low     = '1' else
        (others => '0');

  font_col <=
        font_col_score    when in_score        = '1' else  
        font_col_d1       when in_death1      = '1' else
        font_col_d2       when in_death2      = '1' else
        font_col_title    when in_title       = '1' else
        font_col_push     when in_push        = '1' else
        font_col_select1  when in_select1     = '1' else
        font_col_select2  when in_select2     = '1' else
        font_col_select3  when in_select3     = '1' else
        font_col_sw0_high when in_sw0_high    = '1' else
        font_col_sw0_low  when in_sw0_low     = '1' else
        (others => '0');

  ascii_code_final <=
        ascii_code_score  when in_score        = '1' else 
        ascii_d1          when in_death1      = '1' else
        ascii_d2          when in_death2      = '1' else
        ascii_code_title  when in_title       = '1' else
        ascii_code_push   when in_push        = '1' else
        ascii_code_select1 when in_select1    = '1' else
        ascii_code_select2 when in_select2    = '1' else
        ascii_code_select3 when in_select3    = '1' else
        ascii_code_sw0_high when in_sw0_high  = '1' else
        ascii_code_sw0_low  when in_sw0_low   = '1' else
        (others => '0');

  char_address <= ascii_code_final(5 downto 0);  -- feed ROM address

  ----------------------------------------------------------------
  -- Character ROM lookup
  ----------------------------------------------------------------
  u_char_rom: char_rom
    port map(
      character_address => char_address,
      font_row          => font_row,
      font_col          => font_col,
      clock             => clk25,
      rom_mux_output    => rom_output   -- pixel on/off for text
    );



  ----------------------------------------------------------------
  -- Per-pixel collision detection (combinational)
  ----------------------------------------------------------------
  collision_detect_proc : process(bird_row, bird_col, pipe_x_array, pipe_y_array, pipe_gap_int, ball_on_sig)
    variable bird_r_int  : integer;
    variable bird_c_int  : integer;
    variable px_int      : integer;
    variable py_int      : integer;
  begin
    -- Only check once the bird is visible and pipes are moving
    if ball_on_sig = '1' and pipes_go = '1' then
      collision_detect <= '0';  -- clear each cycle before checking

      bird_r_int := to_integer(unsigned(bird_row));
      bird_c_int := to_integer(unsigned(bird_col));

      for i in 0 to NUM_PIPES-1 loop
        px_int := to_integer(unsigned(pipe_x_array(i)));
        py_int := to_integer(unsigned(pipe_y_array(i)));

        -- If bird's X overlaps a pipe
        if bird_c_int >= px_int and bird_c_int < px_int + PIPE_WIDTH then
          -- If bird's Y is outside the pipe gap → collision
          if bird_r_int < py_int or bird_r_int > py_int + pipe_gap_int then
            collision_detect <= '1';
          end if;
        end if;
      end loop;

    else
      collision_detect <= '0';
    end if;
  end process collision_detect_proc;

  ----------------------------------------------------------------
  -- Collision register: latches a collision until reset or restart
  ----------------------------------------------------------------
  collision_reg : process(clk25, reset_i)
  begin
    if reset_i = '1' then
      collision <= '0';
      train_bg_white <= '1';  -- Reset to white background
    elsif rising_edge(clk25) then
      if game_state = S_TITLE then
        collision <= '0';      -- clear on title screen
        train_bg_white <= '1'; -- Reset to white background
      elsif game_state = S_TRAIN then
        if collision_detect = '1' then
          train_bg_white <= not train_bg_white;  -- Toggle background color
          collision <= '0';  -- Don't trigger death screen
        end if;
      elsif game_state /= S_PLAY and game_state /= S_TRAIN then
        collision <= '0';      -- clear off-play/training
      elsif collision = '1' then
        collision <= '1';      -- hold once set
      else
        collision <= collision_detect;  -- else update from detector
      end if;
    end if;
  end process collision_reg;
 ----------------------------------------------------------------
  -- Final RGB mux: choose between text, ball, pipes, background
  ----------------------------------------------------------------
  final_r <=
       "1111" when (rom_output = '1' and in_score = '1')          else  -- yellow score digits
       "1111" when (rom_output = '1' and (in_sw0_high = '1' or in_sw0_low = '1')) else  -- pink hints
       "1111" when (rom_output = '1' and 
                    ( in_title = '1' or in_push  = '1' or 
                      in_select1 = '1' or in_select2 = '1' or in_select3 = '1' or
                      in_death1  = '1' or in_death2  = '1' )) else                      -- yellow text + death
       color_r when (ball_on_sig = '1' and (game_state = S_PLAY or game_state = S_TRAIN)) else
       "0000"  when (pipe_green = '1' and pipes_go = '1') else
       "1111"  when (game_state = S_TRAIN and train_bg_white = '1') else
       "0000"  when (game_state = S_TRAIN and train_bg_white = '0') else
       (others => wrapped_r);

  final_g <=
       "1111" when (rom_output = '1' and in_score = '1')          else
       "0000" when (rom_output = '1' and (in_sw0_high = '1' or in_sw0_low = '1')) else  -- pink
       "1111" when (rom_output = '1' and 
                    ( in_title = '1' or in_push  = '1' or 
                      in_select1 = '1' or in_select2 = '1' or in_select3 = '1' or
                      in_death1  = '1' or in_death2  = '1' )) else                      -- yellow + death
       color_g when (ball_on_sig = '1' and (game_state = S_PLAY or game_state = S_TRAIN)) else
       "1111"  when (pipe_green = '1' and pipes_go = '1') else
       "1111"  when (game_state = S_TRAIN and train_bg_white = '1') else
       "0000"  when (game_state = S_TRAIN and train_bg_white = '0') else
       (others => wrapped_g);

  final_b <=
       "0000" when (rom_output = '1' and in_score = '1')          else
       "1111" when (rom_output = '1' and (in_sw0_high = '1' or in_sw0_low = '1')) else  -- pink
       "0000" when (rom_output = '1' and 
                    ( in_title = '1' or in_push  = '1' or 
                      in_select1 = '1' or in_select2 = '1' or in_select3 = '1' or
                      in_death1  = '1' or in_death2  = '1' )) else                      -- yellow + death
       color_b when (ball_on_sig = '1' and (game_state = S_PLAY or game_state = S_TRAIN)) else
       "0000"  when (pipe_green = '1' and pipes_go = '1') else
       "1111"  when (game_state = S_TRAIN and train_bg_white = '1') else
       "0000"  when (game_state = S_TRAIN and train_bg_white = '0') else
       (others => wrapped_b);

  ----------------------------------------------------------------
  -- Drive physical VGA pins
  ----------------------------------------------------------------
  VGA_VS <= vsync_sig;   -- vertical sync
  VGA_R  <= vga_r_sig;   -- red DAC
  VGA_G  <= vga_g_sig;   -- green DAC
  VGA_B  <= vga_b_sig;   -- blue DAC

end architecture rtl;