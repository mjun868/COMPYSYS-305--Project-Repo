-- Import library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_bcd_counter is
end entity test_bcd_counter;

architecture testbench of test_bcd_counter is
    signal t_clk, t_reset, t_enable, t_direction : std_logic := '0';
    signal t_Q_out : unsigned(3 downto 0);
    
    component BCD_Counter is
        port (Clk, Reset, Enable, Direction : in std_logic;
            Q_Out : out unsigned(3 downto 0)
        );
    end component;
begin
    but: BCD_Counter
        port map (
            Clk       => t_clk,
            Reset     => t_reset,
            Enable    => t_enable,
            Direction => t_direction,
            Q_Out     => t_Q_out
        );

    -- Clock Generation
    clk_gen: process
    begin
        while true loop
            t_clk <= '0';
            wait for 5 ns;
            t_clk <= '1';
            wait for 5 ns;
        end loop;
    end process clk_gen;

    -- Test Sequence
    stim_proc: process
    begin
        -- Apply Reset
        t_reset <= '1';
        wait for 10 ns;
        t_reset <= '0';
        
        -- Enable counter, count up
        t_enable <= '1';
        t_direction <= '1';
        wait for 50 ns;
        
        -- Change direction (count down)
        t_direction <= '0';
        wait for 80 ns;
	t_reset <= '1';
	wait for 20 ns;
	t_reset <= '0';
	wait for 80 ns;
        
        -- Disable counter
        t_enable <= '0';
        wait for 50 ns;
        
        -- Turn on and count up again
        t_enable <= '1';
        t_direction <= '1';
        wait for 50 ns;
        
        -- End simulation
        wait;
    end process stim_proc;
end architecture testbench;


