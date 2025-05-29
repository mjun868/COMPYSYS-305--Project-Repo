library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Counter is
    Port (
        Clk       : in  std_logic;
        Reset     : in  std_logic;   -- synchronous reset
        Enable    : in  std_logic;   -- counter active when '1'
        Direction : in  std_logic;   -- '1' = up, '0' = down
        Q_Out     : out std_logic_vector(3 downto 0)
    );
end BCD_Counter;

architecture Behavioral of BCD_Counter is
    -- Use an unsigned signal to represent a 4-bit counter.
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            -- Synchronous reset
            if Reset = '1' then
                if Direction = '1' then
                    count <= to_unsigned(0, 4);  -- reset to 0 (up counter)
                else
                    count <= to_unsigned(9, 4);  -- reset to 9 (down counter)
                end if;
            -- Update only when enabled
            elsif Enable = '1' then
                if Direction = '1' then  -- Up counter
                    if count = to_unsigned(9, 4) then
                        count <= to_unsigned(0, 4);
                    else
                        count <= count + 1;
                    end if;
                else  -- Down counter
                    if count = to_unsigned(0, 4) then
                        count <= to_unsigned(9, 4);
                    else
                        count <= count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Drive the output as a 4-bit std_logic_vector.
    Q_Out <= std_logic_vector(count);
end Behavioral;
