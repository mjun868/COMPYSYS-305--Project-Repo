library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ClockDivider_1Hz is
end entity TB_ClockDivider_1Hz;

architecture test of TB_ClockDivider_1Hz is

    -- Signals to connect to the Unit Under Test (UUT)
    signal Clk      : std_logic := '0';
    signal Reset    : std_logic := '0';
    signal OneHzEn  : std_logic;

    -- Component declaration with a generic parameter
    component ClockDivider_1Hz is
        generic (
            DIVISOR : integer
        );
        Port (
            Clk      : in  std_logic;
            Reset    : in  std_logic;
            OneHzEn  : out std_logic
        );
    end component;

begin

    -- Instantiate the UUT and override DIVISOR for fast simulation
    uut: ClockDivider_1Hz
        generic map (
            DIVISOR => 10  -- Use a small value for simulation (produces a pulse every 10 clock cycles)
        )
        port map (
            Clk      => Clk,
            Reset    => Reset,
            OneHzEn  => OneHzEn
        );

    -- Clock generation: 50 MHz (20 ns period)
    clk_process: process
    begin
        while true loop
            Clk <= '0';
            wait for 10 ns;
            Clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset for 30 ns
        Reset <= '1';
        wait for 30 ns;
        Reset <= '0';

        -- Run simulation long enough to view several pulses
        wait for 500 ns;

        -- End simulation
        wait;
    end process;

end architecture test;




