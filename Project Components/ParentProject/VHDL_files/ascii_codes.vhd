library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package ascii_codes is

  -- 7-bit code for every character you care about
  subtype code7_t is std_logic_vector(6 downto 0);

  -- Map from character to its ASCII code (7 bits)
  type ascii_map_t is array (character) of code7_t;

  constant ascii_map : ascii_map_t := (
    -- space, punctuation
    ' ' => "0100000",  -- 0x20
    '!' => "0100001",  -- 0x21
    '#' => "0100011",  -- 0x23
    -- digits
    '0' => "0110000",
    '1' => "0110001",
    '2' => "0110010",
    '3' => "0110011",
    '4' => "0110100",
    '5' => "0110101",
    '6' => "0110110",
    '7' => "0110111",
    '8' => "0111000",
    '9' => "0111001",
    -- uppercase letters
    'A' => "1000001",
    'B' => "1000010",
    'C' => "1000011",
    'D' => "1000100",
    'E' => "1000101",
    'F' => "1000110",
    'G' => "1000111",
    'H' => "1001000",
    'I' => "1001001",
    'J' => "1001010",
    'K' => "1001011",
    'L' => "1001100",
    'M' => "1001101",
    'N' => "1001110",
    'O' => "1001111",
    'P' => "1010000",
    'Q' => "1010001",
    'R' => "1010010",
    'S' => "1010011",
    'T' => "1010100",
    'U' => "1010101",
    'V' => "1010110",
    'W' => "1010111",
    'X' => "1011000",
    'Y' => "1011001",
    'Z' => "1011010",
    -- default for any other character
    others => (others => '0')
  );

end package ascii_codes;
