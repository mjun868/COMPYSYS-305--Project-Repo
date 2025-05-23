library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- needed for integer to std_logic_vector conversion

entity BCD_Counter is
    port (
        Clk       : in  std_logic;
        Reset     : in  std_logic;
        Enable    : in  std_logic;
        Direction : in  std_logic;
        Q_Out     : out std_logic_vector(3 downto 0)
    );
end entity BCD_Counter;

architecture Behavioral of BCD_Counter is
    signal count : integer range 0 to 9 := 0;
begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            if Reset = '1' then
                if Direction = '1' then
                    count <= 0;
                else
                    count <= 9;
                end if;

            elsif Enable = '1' then
                if Direction = '1' then  -- count up
                    if count = 9 then
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;
                else  -- count down
                    if count = 0 then
                        count <= 9;
                    else
                        count <= count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Output conversion
    Q_Out <= std_logic_vector(to_unsigned(count, 4));
end architecture Behavioral;

