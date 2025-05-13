library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alphanumeric_to_SevenSeg is
    port (
        BCD_digit     : in  std_logic_vector(5 downto 0); -- supports 0?9 (000000 to 001001) and A?Z (001010 to 100011)
        SevenSeg_out  : out std_logic_vector(6 downto 0)  -- a-g, active-low segment logic
    );
end entity;

architecture arc1 of Alphanumeric_to_SevenSeg is
begin
    SevenSeg_out <= 
        -- Digits 0?9
        "1000000" when BCD_digit = "000000" else -- 0
        "1111001" when BCD_digit = "000001" else -- 1
        "0100100" when BCD_digit = "000010" else -- 2
        "0110000" when BCD_digit = "000011" else -- 3
        "0011001" when BCD_digit = "000100" else -- 4
        "0010010" when BCD_digit = "000101" else -- 5
        "0000010" when BCD_digit = "000110" else -- 6
        "1111000" when BCD_digit = "000111" else -- 7
        "0000000" when BCD_digit = "001000" else -- 8
        "0010000" when BCD_digit = "001001" else -- 9

        -- Letters A?Z (best approximations)
        "0001000" when BCD_digit = "001010" else -- A
        "0000011" when BCD_digit = "001011" else -- b
        "1000110" when BCD_digit = "001100" else -- C
        "0100001" when BCD_digit = "001101" else -- d
        "0000110" when BCD_digit = "001110" else -- E
        "0001110" when BCD_digit = "001111" else -- F
        "0010000" when BCD_digit = "010000" else -- G (? 9)
        "0001011" when BCD_digit = "010001" else -- H
        "1111001" when BCD_digit = "010010" else -- I (? 1)
        "1110001" when BCD_digit = "010011" else -- J
        "0001011" when BCD_digit = "010100" else -- K (? H)
        "1000111" when BCD_digit = "010101" else -- L
        "1010100" when BCD_digit = "010110" else -- M (poor approximation)
        "0101011" when BCD_digit = "010111" else -- N (? H)
        "1000000" when BCD_digit = "011000" else -- O (? 0)
        "0001100" when BCD_digit = "011001" else -- P
        "0011000" when BCD_digit = "011010" else -- Q
        "0001100" when BCD_digit = "011011" else -- R
        "0010010" when BCD_digit = "011100" else -- S
        "0000111" when BCD_digit = "011101" else -- T
        "1000001" when BCD_digit = "011110" else -- U
        "1100001" when BCD_digit = "011111" else -- V
        "1010001" when BCD_digit = "100000" else -- W
        "0101011" when BCD_digit = "100001" else -- X
        "0011001" when BCD_digit = "100010" else -- Y
        "0100100" when BCD_digit = "100011" else -- Z

        "1111111"; -- default: all segments off
end architecture;
