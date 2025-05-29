-- Programmable_Timer: Revised Top-Level Design
----------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Programmable_Timer is
   Port ( 
      Clk         : in std_logic;           -- 50 MHz board clock
      GlobalReset : in std_logic;           -- active high synchronous reset
      Start       : in std_logic;           -- push-button to start timer
      Data_In     : in std_logic_vector(9 downto 0); -- preset input (10 switches)
      Time_Out    : out std_logic;          -- goes high when timer times out
      SevenSeg_Min     : out std_logic_vector(6 downto 0);
      SevenSeg_SecTens : out std_logic_vector(6 downto 0);
      SevenSeg_SecOnes : out std_logic_vector(6 downto 0)
   );
end Programmable_Timer;

architecture Behavioral of Programmable_Timer is

   -- Declaration of the Clock Divider component.
   component Clock_Divider_1Hz is
      Port ( Clk_in : in std_logic;
             Reset  : in std_logic;
             Clk_out: out std_logic );
   end component;

   -- Declaration of the provided BCD_Counter component.
   component BCD_Counter is
      Port (
         Clk       : in  std_logic;
         Reset     : in  std_logic;
         Enable    : in  std_logic;
         Direction : in  std_logic;  -- '1' for up, '0' for down
         Q_Out     : out std_logic_vector(3 downto 0)
      );
   end component;

   -- Declaration of the BCD to 7-Segment converter.
   component BCD_to_SevenSeg is
      port ( 
         BCD_digit    : in  std_logic_vector(3 downto 0);
         SevenSeg_out : out std_logic_vector(6 downto 0)
      );
   end component;

   ----------------------------------------------------------------
   -- Internal signals
   ----------------------------------------------------------------
   signal oneHz_clk      : std_logic;
   signal timer_running  : std_logic := '0';

   -- Preset (target) time registers.
   signal preset_min      : std_logic_vector(3 downto 0) := (others=>'0');
   signal preset_sec_tens : std_logic_vector(3 downto 0) := (others=>'0');
   signal preset_sec_ones : std_logic_vector(3 downto 0) := (others=>'0');

   -- Current time counters (BCD digits).
   signal curr_min       : std_logic_vector(3 downto 0);
   signal curr_sec_tens  : std_logic_vector(3 downto 0);
   signal curr_sec_ones  : std_logic_vector(3 downto 0);

   -- Control signals for cascading.
   signal enable_sec_ones    : std_logic;
   signal enable_sec_tens    : std_logic;
   signal enable_min         : std_logic;
   signal local_reset_sec_tens : std_logic;
   signal sec_tens_reset     : std_logic;

   -- Internal signal for timeout detection.
   signal reached_preset : std_logic;

   -- Synchronizer signals for Start (from 50 MHz to 1 Hz domain)
   signal start_sync_0, start_sync : std_logic;

begin
   ----------------------------------------------------------------
   -- Instantiate the 1 Hz clock divider.
   ----------------------------------------------------------------
   clk_div_inst : Clock_Divider_1Hz
      port map(
         Clk_in => Clk,
         Reset  => GlobalReset,
         Clk_out=> oneHz_clk
      );

   ----------------------------------------------------------------
   -- Synchronize Start signal into 1 Hz clock domain.
   ----------------------------------------------------------------
   sync_start: process(oneHz_clk)
   begin
      if rising_edge(oneHz_clk) then
         start_sync_0 <= Start;
         start_sync   <= start_sync_0;
      end if;
   end process;

   ----------------------------------------------------------------
   -- Timer Control Process (runs in one Hz domain)
   -- This process is the sole driver for timer_running and also loads
   -- the preset registers when a synchronized Start is detected.
   ----------------------------------------------------------------
   Timer_Control: process(oneHz_clk)
   begin
      if rising_edge(oneHz_clk) then
         if GlobalReset = '1' then
            preset_min      <= (others=>'0');
            preset_sec_tens <= (others=>'0');
            preset_sec_ones <= (others=>'0');
            timer_running   <= '0';
         elsif start_sync = '1' then
            -- Load preset registers based on Data_In.
            case Data_In(9 downto 8) is
               when "00" => preset_min <= "0000"; 
               when "01" => preset_min <= "0001"; 
               when "10" => preset_min <= "0010"; 
               when "11" => preset_min <= "0011"; 
               when others => preset_min <= "0000";
            end case;
            if unsigned(Data_In(7 downto 4)) > 5 then
               preset_sec_tens <= "0101";
            else
               preset_sec_tens <= Data_In(7 downto 4);
            end if;
            if unsigned(Data_In(3 downto 0)) > 9 then
               preset_sec_ones <= "1001";
            else
               preset_sec_ones <= Data_In(3 downto 0);
            end if;
            timer_running <= '1';
         elsif reached_preset = '1' then
            timer_running <= '0';
         end if;
      end if;
   end process;

   ----------------------------------------------------------------
   -- Generate enable/reset signals for cascade counting.
   ----------------------------------------------------------------
   enable_sec_ones <= timer_running;
   enable_sec_tens <= '1' when ((timer_running = '1') and (curr_sec_ones = "1001") and (curr_sec_tens /= "0101")) else '0';
   local_reset_sec_tens <= '1' when ((timer_running = '1') and (curr_sec_ones = "1001") and (curr_sec_tens = "0101")) else '0';
   enable_min <= '1' when ((timer_running = '1') and (curr_sec_ones = "1001") and (curr_sec_tens = "0101")) else '0';

   sec_tens_reset <= GlobalReset or local_reset_sec_tens;

   ----------------------------------------------------------------
   -- Instantiate the three BCD_Counter components.
   ----------------------------------------------------------------

   -- Seconds Ones counter: counts from 0 to 9.
   Sec_Ones: BCD_Counter
      port map(
         Clk       => oneHz_clk,
         Reset     => GlobalReset,
         Enable    => enable_sec_ones,
         Direction => '1',
         Q_Out     => curr_sec_ones
      );

   -- Seconds Tens counter: counts from 0 to 9 but resets on "0101".
   Sec_Tens: BCD_Counter
      port map(
         Clk       => oneHz_clk,
         Reset     => sec_tens_reset,
         Enable    => enable_sec_tens,
         Direction => '1',
         Q_Out     => curr_sec_tens
      );

   -- Minutes counter: counts from 0 upward.
   Min_Cnt: BCD_Counter
      port map(
         Clk       => oneHz_clk,
         Reset     => GlobalReset,
         Enable    => enable_min,
         Direction => '1',
         Q_Out     => curr_min
      );

   ----------------------------------------------------------------
   -- Timeout detection: when the current time equals the preset time.
   ----------------------------------------------------------------
   reached_preset <= '1' when ((curr_min = preset_min) and 
                                (curr_sec_tens = preset_sec_tens) and 
                                (curr_sec_ones = preset_sec_ones))
                       else '0';

   -- Time_Out follows reached_preset.
   Time_Out <= reached_preset;

   ----------------------------------------------------------------
   -- Instantiate the seven-segment converters.
   ----------------------------------------------------------------

   Min_Display: BCD_to_SevenSeg
      port map(
         BCD_digit    => curr_min,
         SevenSeg_out => SevenSeg_Min
      );

   SecTens_Display: BCD_to_SevenSeg
      port map(
         BCD_digit    => curr_sec_tens,
         SevenSeg_out => SevenSeg_SecTens
      );

   SecOnes_Display: BCD_to_SevenSeg
      port map(
         BCD_digit    => curr_sec_ones,
         SevenSeg_out => SevenSeg_SecOnes
      );

end Behavioral;

