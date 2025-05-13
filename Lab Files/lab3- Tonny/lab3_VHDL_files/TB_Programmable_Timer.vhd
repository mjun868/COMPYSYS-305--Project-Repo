library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Programmable_Timer is
    Port (
        Clk         : in  std_logic;
        Reset       : in  std_logic;
        Start       : in  std_logic;
        Data_In     : in  std_logic_vector(9 downto 0);
        Time_Out    : out std_logic;
        Minute_7Seg : out std_logic_vector(6 downto 0);
        SecTens_7Seg: out std_logic_vector(6 downto 0);
        SecOnes_7Seg: out std_logic_vector(6 downto 0)
    );
end entity Programmable_Timer;

architecture Behavioral of Programmable_Timer is

    -- Internal signals
    signal OneHzEn   : std_logic;
    signal running   : std_logic := '0';
    signal stop_count: std_logic := '0';

    -- Target input values (clamped)
    signal tgt_min, tgt_sec10, tgt_sec1 : std_logic_vector(3 downto 0);
    signal min_q, sec10_q, sec1_q       : std_logic_vector(3 downto 0);

    -- Enable signals
    signal en_sec1, en_sec10, en_min : std_logic;

    -- Component Declarations
    component ClockDivider_1Hz is
        generic (
            DIVISOR : integer
        );
        Port (
            Clk     : in  std_logic;
            Reset   : in  std_logic;
            OneHzEn : out std_logic
        );
    end component;

    component BCD_Counter is
        Port (
            Clk       : in  std_logic;
            Reset     : in  std_logic;
            Enable    : in  std_logic;
            Direction : in  std_logic;
            Q_Out     : out std_logic_vector(3 downto 0)
        );
    end component;

    component BCD_Counter_Limit5 is
        Port (
            Clk       : in  std_logic;
            Reset     : in  std_logic;
            Enable    : in  std_logic;
            Direction : in  std_logic;
            Q_Out     : out std_logic_vector(3 downto 0)
        );
    end component;

    component BCD_to_SevenSeg is
        Port (
        BCD_digit     : in  std_logic_vector(5 downto 0); -- supports 0?9 (000000 to 001001) and A?Z (001010 to 100011)
        SevenSeg_out  : out std_logic_vector(6 downto 0)  -- a-g, active-low segment logic
        );
    end component;

begin

    -- Instantiate Clock Divider with a simulation-friendly divisor
    Divider_inst: ClockDivider_1Hz
        generic map (
            DIVISOR => 10  -- Set to 10 for simulation (adjust as needed)
        )
        port map (
            Clk     => Clk,
            Reset   => Reset,
            OneHzEn => OneHzEn
        );

    --------------------------------------------------------------------
    -- Handle Start signal and clamp Data_In
    --------------------------------------------------------------------
    process (Clk)
    begin
        if rising_edge(Clk) then
            if Reset = '1' then
                tgt_min    <= (others => '0');
                tgt_sec10  <= (others => '0');
                tgt_sec1   <= (others => '0');
                running    <= '0';
                stop_count <= '0';
            elsif Start = '1' then
                -- Minutes (2-bit, clamped to 3)
                if unsigned(Data_In(9 downto 8)) > 3 then
                    tgt_min <= "0011";
                else
                    tgt_min <= "00" & Data_In(9 downto 8);
                end if;

                -- Tens of seconds (4-bit, clamped to 5)
                if unsigned(Data_In(7 downto 4)) > 5 then
                    tgt_sec10 <= "0101";
                else
                    tgt_sec10 <= Data_In(7 downto 4);
                end if;

                -- Ones of seconds (4-bit, clamped to 9)
                if unsigned(Data_In(3 downto 0)) > 9 then
                    tgt_sec1 <= "1001";
                else
                    tgt_sec1 <= Data_In(3 downto 0);
                end if;

                running    <= '1';
                stop_count <= '0';
            elsif (min_q = tgt_min and sec10_q = tgt_sec10 and sec1_q = tgt_sec1) then
                running    <= '0';
                stop_count <= '1';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Enable logic for counters (ripple carry)
    --------------------------------------------------------------------
    en_sec1  <= OneHzEn and running;
    en_sec10 <= OneHzEn and running when sec1_q = "1001" else '0';
    en_min   <= OneHzEn and running when (sec1_q = "1001" and sec10_q = "0101") else '0';

    --------------------------------------------------------------------
    -- Instantiate Counters
    --------------------------------------------------------------------
    Sec1_Counter: BCD_Counter
        port map (
            Clk       => Clk,
            Reset     => Reset,
            Enable    => en_sec1,
            Direction => '1',
            Q_Out     => sec1_q
        );

    Sec10_Counter: BCD_Counter_Limit5
        port map (
            Clk       => Clk,
            Reset     => Reset,
            Enable    => en_sec10,
            Direction => '1',
            Q_Out     => sec10_q
        );

    Min_Counter: BCD_Counter
        port map (
            Clk       => Clk,
            Reset     => Reset,
            Enable    => en_min,
            Direction => '1',
            Q_Out     => min_q
        );

    --------------------------------------------------------------------
    -- Connect to Seven Segment Display
    --------------------------------------------------------------------
    MinuteDisplay: BCD_to_SevenSeg
        port map (
            BCD_digit    => min_q,
            SevenSeg_out => Minute_7Seg
        );

    SecTensDisplay: BCD_to_SevenSeg
        port map (
            BCD_digit    => sec10_q,
            SevenSeg_out => SecTens_7Seg
        );

    SecOnesDisplay: BCD_to_SevenSeg
        port map (
            BCD_digit    => sec1_q,
            SevenSeg_out => SecOnes_7Seg
        );

    -- Output timeout pulse when target is reached
    Time_Out <= stop_count;

end architecture Behavioral;




