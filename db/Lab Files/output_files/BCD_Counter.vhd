-- Import library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_Counter is
    port (Clk, Reset, Enable, Direction : in std_logic;
        Q_Out : out unsigned(3 downto 0)
    );
end entity BCD_Counter;

architecture behavioral of BCD_Counter is
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(Clk)
    begin
	-- Rising edge detection (only updates on rising edge
        if rising_edge(Clk) then
		-- Synchronous reset
            if Reset = '1' then
                if Direction = '1' then
			count <= "0000";
		else
			count <= "1001";
		end if;
            elsif Enable = '1' then
		-- Checks if direction is 1 (up counter)
                if Direction = '1' then
			-- if it reaches the max of 9
                    if count = "1001" then  
			-- Reset to 0
                        count <= "0000";
                    else
			-- Increment up by 1
                        count <= count + 1;
                    end if;
                else
			-- resets down counter to 9 (when direction is 0)
                    if count = "0000" then
                        count <= "1001";
                    else
			-- Increment down by 1
                        count <= count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Assigns final counter value to Q_Out
    Q_Out <= count;
end architecture behavioral;


