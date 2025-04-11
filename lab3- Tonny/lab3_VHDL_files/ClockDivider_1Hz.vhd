library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider_1Hz is
    Port (
        Clk      : in  std_logic;       -- 50 MHz input clock
        Reset    : in  std_logic;       -- Asynchronous reset
        OneHzEn  : out std_logic        -- 1 Hz enable pulse (1 clock cycle wide)
    );
end entity ClockDivider_1Hz;

architecture Behavioral of ClockDivider_1Hz is
    constant CLK_FREQ   : integer := 50000000; -- 50 MHz
    constant COUNT_MAX  : integer := CLK_FREQ - 1;

    signal counter : unsigned(25 downto 0) := (others => '0');
    signal pulse   : std_logic := '0';
begin

    process(Clk, Reset)
    begin
        if Reset = '1' then
            counter <= (others => '0');
            pulse   <= '0';
        elsif rising_edge(Clk) then
            if counter = COUNT_MAX then
                counter <= (others => '0');
                pulse   <= '1';
            else
                counter <= counter + 1;
                pulse   <= '0';
            end if;
        end if;
    end process;

    OneHzEn <= pulse;

end architecture Behavioral;

