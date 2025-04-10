library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Programmable_Timer is
end entity;

architecture test of TB_Programmable_Timer is
    -- Signals
    signal Clk         : std_logic := '0';
    signal Reset       : std_logic := '0';
    signal Start       : std_logic := '0';
    signal Data_In     : std_logic_vector(9 downto 0) := (others => '0');
    signal Time_Out    : std_logic;
    signal Minute_7Seg : std_logic_vector(6 downto 0);
    signal SecTens_7Seg: std_logic_vector(6 downto 0);
    signal SecOnes_7Seg: std_logic_vector(6 downto 0);

    -- Component declaration
    component Programmable_Timer
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
    end component;

begin

    -- DUT instantiation
    DUT: Programmable_Timer
        port map (
            Clk         => Clk,
            Reset       => Reset,
            Start       => Start,
            Data_In     => Data_In,
            Time_Out    => Time_Out,
            Minute_7Seg => Minute_7Seg,
            SecTens_7Seg=> SecTens_7Seg,
            SecOnes_7Seg=> SecOnes_7Seg
        );

    -- Clock: 20ns period = 50 MHz
    Clk_Process: process
    begin
        while true loop
            Clk <= '0'; wait for 10 ns;
            Clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Stimulus
    Stimulus: process
    begin
        -- Reset
        Reset <= '1';
        wait for 40 ns;
        Reset <= '0';

        -- Set target time: 0 minutes, 0 tens, 3 ones (i.e., 3 seconds)
        Data_In <= "0000000011";  -- 3s
        wait for 20 ns;

        -- Start timer
        Start <= '1';
        wait for 20 ns;
        Start <= '0';

        -- Run for simulated "5 seconds"
        wait for 300 ns;

        wait;
    end process;

end architecture;

