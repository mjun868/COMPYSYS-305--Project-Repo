library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_to_SevenSeg is
   port ( 
      BCD_digit    : in  std_logic_vector(3 downto 0);
      SevenSeg_out : out std_logic_vector(6 downto 0)
   );
end BCD_to_SevenSeg;

architecture Behavioral of BCD_to_SevenSeg is
begin
   process(BCD_digit)
   begin
      case BCD_digit is
         when "0000" => SevenSeg_out <= "1000000"; -- 0
         when "0001" => SevenSeg_out <= "1111001"; -- 1
         when "0010" => SevenSeg_out <= "0100100"; -- 2
         when "0011" => SevenSeg_out <= "0110000"; -- 3
         when "0100" => SevenSeg_out <= "0011001"; -- 4
         when "0101" => SevenSeg_out <= "0010010"; -- 5
         when "0110" => SevenSeg_out <= "0000010"; -- 6
         when "0111" => SevenSeg_out <= "1111000"; -- 7
         when "1000" => SevenSeg_out <= "0000000"; -- 8
         when "1001" => SevenSeg_out <= "0010000"; -- 9
         when others => SevenSeg_out <= "1111111"; -- display off or error
      end case;
   end process;
end Behavioral;



