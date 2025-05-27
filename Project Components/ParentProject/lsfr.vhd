library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lfsr is
  port(
    clk        : in  std_logic;
    reset      : in  std_logic;
    enable     : in  std_logic;                           -- normal shift-enable
    load_seed  : in  std_logic;                           -- when '1', load seed_in
    seed_in    : in  std_logic_vector(9 downto 0);        -- new seed value
    random_out : out std_logic_vector(9 downto 0)         -- current LFSR state
  );
end entity;

architecture rtl of lfsr is
  signal lfsr_reg : std_logic_vector(9 downto 0) := "1010101010";  -- default nonzero seed
begin
  process(clk, reset)
  begin
    if reset = '1' then
      -- on reset, load a known nonzero pattern
      lfsr_reg <= "1010101010";
    elsif rising_edge(clk) then
      if load_seed = '1' then
        -- reload from external seed
        lfsr_reg <= seed_in;
      elsif enable = '1' then
        -- normal LFSR shift (x^10 + x^7 + 1)
        lfsr_reg <= lfsr_reg(8 downto 0) & (lfsr_reg(9) xor lfsr_reg(6));
      end if;
    end if;
  end process;

  random_out <= lfsr_reg;
end architecture;