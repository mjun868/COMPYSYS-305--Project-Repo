library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Divider_1Hz is
   Port ( Clk_in : in std_logic;
          Reset  : in std_logic;
          Clk_out: out std_logic );
end Clock_Divider_1Hz;

architecture Behavioral of Clock_Divider_1Hz is
begin
   -- For synthesis stub, simply tie Clk_out to Clk_in (or any toggle logic).
   Clk_out <= Clk_in;
end Behavioral;
