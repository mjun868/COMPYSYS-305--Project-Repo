LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY bouncy_ball IS
	PORT
		( pb1, pb2, clk, vert_sync	: IN std_logic;
		  current_left_btn_status : IN std_logic;
        pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END bouncy_ball;

architecture behavior of bouncy_ball is

SIGNAL ball_on					: std_logic;
SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0);
SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0);
SIGNAL ball_y_motion			: std_logic_vector(9 DOWNTO 0);
SIGNAL previous_left_status : std_logic := '1';
BEGIN           

size <= CONV_STD_LOGIC_VECTOR(8,10);
-- ball_x_pos and ball_y_pos show the (x,y) for the centre of ball
ball_x_pos <= CONV_STD_LOGIC_VECTOR(100,11);

ball_on <= '1' when ( ('0' & ball_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column <= '0' & ball_x_pos + size) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & ball_y_pos <= pixel_row + size) and ('0' & pixel_row <= ball_y_pos + size) )  else	-- y_pos - size <= pixel_row <= y_pos + size
			'0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  pb1;
Green <= (not pb2) and (not ball_on);
Blue <=  not ball_on;


Free_Fall : process(vert_sync)
begin
	if (rising_edge(vert_sync)) then
		-- Bounce off top or bottom of the screen
		if ( ('0' & ball_y_pos >= CONV_STD_LOGIC_VECTOR(479,10) - size) ) then
			ball_y_motion <= CONV_STD_LOGIC_VECTOR(0,10); --freeze at the bottom
		else
			ball_y_motion <= CONV_STD_LOGIC_VECTOR(1,10);
		end if;
		--mouse click detection,
		if (previous_left_status = '0'and current_left_btn_status = '1' and ball_y_pos > size) then
			
			
			--not jump out of the celing
			if (ball_y_pos<(size+50)) then
			--freeze at the ceiling
				ball_y_motion <= CONV_STD_LOGIC_VECTOR(0,10);
			else
			--move upward by 50 pixels
				ball_y_motion <=  -CONV_STD_LOGIC_VECTOR(50,10);
			end if;
			
		end if;
		-- Compute next ball Y position
		ball_y_pos <= ball_y_pos + ball_y_motion;
		--update prevous_left_btn_status
		previous_left_status <= current_left_btn_status;
	end if;
end process Free_Fall;


END behavior;

