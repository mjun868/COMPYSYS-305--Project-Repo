library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Counter_Limit5 is
    Port (
        Clk       : in  std_logic;
        Reset     : in  std_logic;
        Enable    : in  std_logic;
        Direction : in  std_logic;  -- '1' for up, '0' for down (optional)
        Q_Out     : out std_logic_vector(3 downto 0)
    );
end entity BCD_Counter_Limit5;

architecture Behavioral of BCD_Counter_Limit5 is
    signal count : unsigned(3 downto 0) := (others => '0');
begin

    process (Clk, Reset)
    begin
        if Reset = '1' then
            count <= (others => '0');

        elsif rising_edge(Clk) then
            if Enable = '1' then
                if Direction = '1' then  -- Count up
                    if count = 5 then
                        count <= (others => '0');
                    else
                        count <= count + 1;
                    end if;
                else  -- Count down
                    if count = 0 then
                        count <= "0101";  -- roll back to 5
                    else
                        count <= count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    Q_Out <= std_logic_vector(count);

end architecture Behavioral;

