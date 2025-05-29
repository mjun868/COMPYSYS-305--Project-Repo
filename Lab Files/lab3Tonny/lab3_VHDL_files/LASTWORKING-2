library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab3_top is
    Port (
        CLOCK_50     : in  std_logic;
        KEY0         : in  std_logic;
        KEY1         : in  std_logic;
        SW           : in  std_logic_vector(9 downto 0);
        HEX0         : out std_logic_vector(6 downto 0);
        HEX1         : out std_logic_vector(6 downto 0);
        HEX2         : out std_logic_vector(6 downto 0);
        LEDR0        : out std_logic
    );
end entity;

architecture Behavioral of lab3_top is

    -- No internal signals needed unless buffering/processing
begin

    U1: entity work.Programmable_Timer
        port map (
            Clk          => CLOCK_50,
            Reset        => KEY1,
            Start        => KEY0,
            Data_In      => SW,
            Time_Out     => LEDR0,
            Minute_7Seg  => HEX2,
            SecTens_7Seg => HEX1,
            SecOnes_7Seg => HEX0
        );

end architecture;

