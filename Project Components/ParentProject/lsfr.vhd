-- File: lfsr10.vhd
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lfsr is
  port(
    clk        : in  std_logic;
    reset      : in  std_logic;
    enable     : in  std_logic;
    random_out : out std_logic_vector(9 downto 0)
  );
end entity;

architecture rtl of lfsr is
  signal lfsr_reg : std_logic_vector(9 downto 0) := "1010101010";  -- non-zero seed
begin
  process(clk, reset)
  begin
    if reset = '1' then
      lfsr_reg <= "1010101010";
    elsif rising_edge(clk) then
      if enable = '1' then
        -- taps at bit 9 and 6 for polynomial x^10 + x^7 + 1
        lfsr_reg <= lfsr_reg(8 downto 0) & (lfsr_reg(9) xor lfsr_reg(6));
      end if;
    end if;
  end process;

  random_out <= lfsr_reg;
end architecture;