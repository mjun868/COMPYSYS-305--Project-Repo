library IEEE;
use IEEE.std_logic_1164.all;


entity in_game_pushed_buttons is
	port( 
		clk: in std_logic;
		start_button : in std_logic;
		pause_or_resume_button : in std_logic;
		start_signal : out std_logic;
		pause_or_resume_signal : out std_logic);
end entity in_game_pushed_buttons;

architecture behaviour of in_game_pushed_buttons is
	constant STABLE_COUNT : integer := 1000000; -- to keep debouncing time 20ms
	signal start_counter,pause_counter : integer := 0;
	signal start_sync0,start_sync1,pause_sync0,pause_sync1 : std_logic := '0'; -- two stages to avoid metastability
	signal stable_start,stable_pause_or_resume : std_logic :='1';
begin
	process(clk)
	begin
		if rising_edge(clk) then
			--  use two flip flop to store input aynchronous signal to avoid metastability issue
			start_sync0 <= start_button;
			start_sync1 <= start_sync0;
			pause_sync0 <= pause_or_resume_button;
			pause_sync1 <= pause_sync0;
			
			--process start button debouncing logic
			if start_sync1 = stable_start then
				start_counter <= 0;
			else 
				start_counter <= start_counter + 1;
				if start_counter >= STABLE_COUNT then
					stable_start <= start_sync1;
					start_counter <= 0;
				end if;
			end if;

			--process pause and resume debouncing logic
			if pause_sync1 = stable_pause_or_resume then
				pause_counter <= 0;
			else
				pause_counter <= pause_counter + 1;
				if pause_counter >= STABLE_COUNT then
					stable_pause_or_resume <= pause_sync1;
					pause_counter <= 0;
				end if;
			end if;
		end if;
	end process;
	--push buttons are active low
	start_signal <= not stable_start;
	pause_or_resume_signal <= not stable_pause_or_resume;
end architecture behaviour;
