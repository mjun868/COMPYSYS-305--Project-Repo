library IEEE;
use IEEE.std_logic_1164.all;


entity game_mode_selection_DIP is
	port(   
		clk : in std_logic;
		DIP_switch : in std_logic;
		Game_mode_signal : out std_logic
	);
end entity game_mode_selection_DIP;

architecture behaviour of game_mode_selection_DIP is
	signal game_mode : std_logic;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			game_mode <= DIP_switch;  -- assign directly
		end if;
	end process;
	Game_mode_signal <= game_mode;
end architecture behaviour;
