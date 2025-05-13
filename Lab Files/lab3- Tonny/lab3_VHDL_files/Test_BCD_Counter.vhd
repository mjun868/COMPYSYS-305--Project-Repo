library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_bcd_counter is
end entity test_bcd_counter;

architecture tb of test_bcd_counter is
    -- Signals to connect to the BCD_Counter component
    signal Clk       : std_logic := '0';
    signal Reset     : std_logic := '0';
    signal Enable    : std_logic := '0';
    signal Direction : std_logic := '1';  -- default count up
    signal Q_Out     : std_logic_vector(3 downto 0);
    
    -- Component declaration
    component BCD_Counter is
        port (
            Clk       : in  std_logic;
            Reset     : in  std_logic;
            Enable    : in  std_logic;
            Direction : in  std_logic;
            Q_Out     : out std_logic_vector(3 downto 0)
        );
    end component;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: BCD_Counter port map (
        Clk       => Clk,
        Reset     => Reset,
        Enable    => Enable,
        Direction => Direction,
        Q_Out     => Q_Out
    );

    -- Clock generation: 10 ns clock period (toggle every 5 ns)
    clk_process: process
    begin
        while true loop
            Clk <= '0';
            wait for 5 ns;
            Clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_process: process
    begin
        -- Initial reset
        Reset <= '1';
        wait for 10 ns;
        Reset <= '0';

        -- Count up from 0 to 9
        Enable <= '1';
        Direction <= '1'; -- Count up
        wait for 100 ns;

        -- Switch to count down
        Reset <= '1';  -- reset to 9
        wait for 10 ns;
        Reset <= '0';

        Direction <= '0'; -- Count down
        wait for 100 ns;

        -- Disable counting
        Enable <= '0';
        wait for 50 ns;

        -- End simulation
        wait;
    end process;

end architecture tb;

