-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"

-- DATE "05/11/2025 13:20:03"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	de0_cv_top IS
    PORT (
	CLOCK_50 : IN std_logic;
	reset_n : IN std_logic;
	PS2_CLK : INOUT std_logic;
	PS2_DAT : INOUT std_logic;
	PB1 : IN std_logic;
	PB2 : IN std_logic;
	VGA_R : OUT std_logic_vector(3 DOWNTO 0);
	VGA_G : OUT std_logic_vector(3 DOWNTO 0);
	VGA_B : OUT std_logic_vector(3 DOWNTO 0);
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic
	);
END de0_cv_top;

-- Design Ports Information
-- PB1	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PB2	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[0]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_R[1]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_R[2]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_R[3]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_G[0]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_G[1]	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_G[2]	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_G[3]	=>  Location: PIN_J8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_B[0]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_B[1]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_B[2]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_B[3]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_HS	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VGA_VS	=>  Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PS2_CLK	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PS2_DAT	=>  Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- reset_n	=>  Location: PIN_P22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF de0_cv_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_PB1 : std_logic;
SIGNAL ww_PB2 : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL \PB1~input_o\ : std_logic;
SIGNAL \PB2~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \clk25~0_combout\ : std_logic;
SIGNAL \clk25~q\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \u_mouse|inhibit_wait_count[0]~0_combout\ : std_logic;
SIGNAL \u_mouse|inhibit_wait_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|Add0~41_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~42\ : std_logic;
SIGNAL \u_mouse|Add0~37_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~38\ : std_logic;
SIGNAL \u_mouse|Add0~33_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~34\ : std_logic;
SIGNAL \u_mouse|Add0~29_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~30\ : std_logic;
SIGNAL \u_mouse|Add0~25_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~26\ : std_logic;
SIGNAL \u_mouse|Add0~21_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~22\ : std_logic;
SIGNAL \u_mouse|Add0~17_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~18\ : std_logic;
SIGNAL \u_mouse|Add0~13_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~14\ : std_logic;
SIGNAL \u_mouse|Add0~9_sumout\ : std_logic;
SIGNAL \u_mouse|Add0~10\ : std_logic;
SIGNAL \u_mouse|Add0~5_sumout\ : std_logic;
SIGNAL \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|Add0~6\ : std_logic;
SIGNAL \u_mouse|Add0~1_sumout\ : std_logic;
SIGNAL \u_mouse|Selector0~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.INHIBIT_TRANS~q\ : std_logic;
SIGNAL \u_mouse|Selector1~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.LOAD_COMMAND~q\ : std_logic;
SIGNAL \u_mouse|mouse_state.LOAD_COMMAND2~q\ : std_logic;
SIGNAL \u_mouse|WideOr4~combout\ : std_logic;
SIGNAL \PS2_CLK~input_o\ : std_logic;
SIGNAL \u_mouse|filter[0]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|filter[1]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|filter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|filter[2]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|filter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|filter[3]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|filter[6]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|filter[7]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|Equal1~0_combout\ : std_logic;
SIGNAL \u_mouse|Equal2~0_combout\ : std_logic;
SIGNAL \u_mouse|MOUSE_CLK_FILTER~0_combout\ : std_logic;
SIGNAL \u_mouse|MOUSE_CLK_FILTER~feeder_combout\ : std_logic;
SIGNAL \u_mouse|MOUSE_CLK_FILTER~q\ : std_logic;
SIGNAL \u_mouse|SHIFTOUT[9]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~2_combout\ : std_logic;
SIGNAL \u_mouse|send_char~0_combout\ : std_logic;
SIGNAL \u_mouse|send_char~q\ : std_logic;
SIGNAL \u_mouse|output_ready~0_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~3_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~0_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~1_combout\ : std_logic;
SIGNAL \u_mouse|LessThan0~0_combout\ : std_logic;
SIGNAL \u_mouse|output_ready~q\ : std_logic;
SIGNAL \u_mouse|Selector3~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ : std_logic;
SIGNAL \PS2_DAT~input_o\ : std_logic;
SIGNAL \u_mouse|INCNT~0_combout\ : std_logic;
SIGNAL \u_mouse|READ_CHAR~0_combout\ : std_logic;
SIGNAL \u_mouse|READ_CHAR~q\ : std_logic;
SIGNAL \u_mouse|PACKET_COUNT[1]~2_combout\ : std_logic;
SIGNAL \u_mouse|INCNT~2_combout\ : std_logic;
SIGNAL \u_mouse|INCNT~3_combout\ : std_logic;
SIGNAL \u_mouse|INCNT~1_combout\ : std_logic;
SIGNAL \u_mouse|INCNT[2]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|LessThan1~0_combout\ : std_logic;
SIGNAL \u_mouse|iready_set~0_combout\ : std_logic;
SIGNAL \u_mouse|iready_set~q\ : std_logic;
SIGNAL \u_mouse|Selector4~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.WAIT_CMD_ACK~q\ : std_logic;
SIGNAL \u_mouse|mouse_state.INPUT_PACKETS~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.INPUT_PACKETS~q\ : std_logic;
SIGNAL \u_mouse|Selector6~0_combout\ : std_logic;
SIGNAL \u_mouse|send_data~q\ : std_logic;
SIGNAL \u_mouse|MOUSE_DATA_BUF~0_combout\ : std_logic;
SIGNAL \u_mouse|SHIFTOUT[8]~3_combout\ : std_logic;
SIGNAL \u_mouse|SHIFTOUT[4]~2_combout\ : std_logic;
SIGNAL \u_mouse|SHIFTOUT[3]~1_combout\ : std_logic;
SIGNAL \u_mouse|SHIFTOUT[2]~0_combout\ : std_logic;
SIGNAL \u_mouse|MOUSE_DATA_BUF~q\ : std_logic;
SIGNAL \u_vga_sync|Add1~21_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~29_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~6\ : std_logic;
SIGNAL \u_vga_sync|Add0~9_sumout\ : std_logic;
SIGNAL \u_vga_sync|h_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Add0~10\ : std_logic;
SIGNAL \u_vga_sync|Add0~1_sumout\ : std_logic;
SIGNAL \u_vga_sync|h_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Equal0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|Equal0~1_combout\ : std_logic;
SIGNAL \u_vga_sync|Add0~30\ : std_logic;
SIGNAL \u_vga_sync|Add0~33_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~34\ : std_logic;
SIGNAL \u_vga_sync|Add0~37_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~38\ : std_logic;
SIGNAL \u_vga_sync|Add0~17_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~18\ : std_logic;
SIGNAL \u_vga_sync|Add0~21_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~22\ : std_logic;
SIGNAL \u_vga_sync|Add0~25_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~26\ : std_logic;
SIGNAL \u_vga_sync|Add0~13_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~14\ : std_logic;
SIGNAL \u_vga_sync|Add0~5_sumout\ : std_logic;
SIGNAL \u_vga_sync|LessThan1~0_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~4_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~34\ : std_logic;
SIGNAL \u_vga_sync|Add1~37_sumout\ : std_logic;
SIGNAL \u_vga_sync|Equal1~0_combout\ : std_logic;
SIGNAL \u_vga_sync|v_count[4]~0_combout\ : std_logic;
SIGNAL \u_vga_sync|v_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Add1~38\ : std_logic;
SIGNAL \u_vga_sync|Add1~9_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add1~10\ : std_logic;
SIGNAL \u_vga_sync|Add1~5_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[6]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|v_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Add1~6\ : std_logic;
SIGNAL \u_vga_sync|Add1~13_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[7]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|v_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Add1~14\ : std_logic;
SIGNAL \u_vga_sync|Add1~17_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|process_0~5_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~18\ : std_logic;
SIGNAL \u_vga_sync|Add1~1_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[9]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~6_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~7_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~22\ : std_logic;
SIGNAL \u_vga_sync|Add1~25_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add1~26\ : std_logic;
SIGNAL \u_vga_sync|Add1~29_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add1~30\ : std_logic;
SIGNAL \u_vga_sync|Add1~33_sumout\ : std_logic;
SIGNAL \u_vga_sync|process_0~2_combout\ : std_logic;
SIGNAL \u_vga_sync|LessThan7~1_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~3_combout\ : std_logic;
SIGNAL \u_vga_sync|vert_sync~q\ : std_logic;
SIGNAL \u_vga_sync|vert_sync_out~q\ : std_logic;
SIGNAL \u_bird|bird_y_pos[1]~0_combout\ : std_logic;
SIGNAL \u_bird|Add3~1_sumout\ : std_logic;
SIGNAL \u_bird|Add3~2\ : std_logic;
SIGNAL \u_bird|Add3~101_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[3]~1_combout\ : std_logic;
SIGNAL \u_bird|Add3~102\ : std_logic;
SIGNAL \u_bird|Add3~97_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~98\ : std_logic;
SIGNAL \u_bird|Add3~117_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~118\ : std_logic;
SIGNAL \u_bird|Add3~105_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[6]~2_combout\ : std_logic;
SIGNAL \u_bird|Add3~106\ : std_logic;
SIGNAL \u_bird|Add3~113_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[7]~3_combout\ : std_logic;
SIGNAL \u_bird|Add3~114\ : std_logic;
SIGNAL \u_bird|Add3~110\ : std_logic;
SIGNAL \u_bird|Add3~29_sumout\ : std_logic;
SIGNAL \u_bird|Add3~30\ : std_logic;
SIGNAL \u_bird|Add3~25_sumout\ : std_logic;
SIGNAL \u_bird|Add3~26\ : std_logic;
SIGNAL \u_bird|Add3~21_sumout\ : std_logic;
SIGNAL \u_bird|Add3~22\ : std_logic;
SIGNAL \u_bird|Add3~17_sumout\ : std_logic;
SIGNAL \u_bird|Add3~18\ : std_logic;
SIGNAL \u_bird|Add3~53_sumout\ : std_logic;
SIGNAL \u_bird|Add3~54\ : std_logic;
SIGNAL \u_bird|Add3~49_sumout\ : std_logic;
SIGNAL \u_bird|Add3~50\ : std_logic;
SIGNAL \u_bird|Add3~45_sumout\ : std_logic;
SIGNAL \u_bird|Add3~46\ : std_logic;
SIGNAL \u_bird|Add3~41_sumout\ : std_logic;
SIGNAL \u_bird|Add3~42\ : std_logic;
SIGNAL \u_bird|Add3~37_sumout\ : std_logic;
SIGNAL \u_bird|Add3~38\ : std_logic;
SIGNAL \u_bird|Add3~33_sumout\ : std_logic;
SIGNAL \u_bird|Add3~34\ : std_logic;
SIGNAL \u_bird|Add3~13_sumout\ : std_logic;
SIGNAL \u_bird|Add3~14\ : std_logic;
SIGNAL \u_bird|Add3~93_sumout\ : std_logic;
SIGNAL \u_bird|Add3~94\ : std_logic;
SIGNAL \u_bird|Add3~89_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[21]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~90\ : std_logic;
SIGNAL \u_bird|Add3~85_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[22]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~86\ : std_logic;
SIGNAL \u_bird|Add3~81_sumout\ : std_logic;
SIGNAL \u_bird|Add3~82\ : std_logic;
SIGNAL \u_bird|Add3~77_sumout\ : std_logic;
SIGNAL \u_bird|Add3~78\ : std_logic;
SIGNAL \u_bird|Add3~9_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[25]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~10\ : std_logic;
SIGNAL \u_bird|Add3~73_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[26]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~74\ : std_logic;
SIGNAL \u_bird|Add3~69_sumout\ : std_logic;
SIGNAL \u_bird|Add3~70\ : std_logic;
SIGNAL \u_bird|Add3~65_sumout\ : std_logic;
SIGNAL \u_bird|Add3~66\ : std_logic;
SIGNAL \u_bird|Add3~61_sumout\ : std_logic;
SIGNAL \u_bird|Add3~62\ : std_logic;
SIGNAL \u_bird|Add3~57_sumout\ : std_logic;
SIGNAL \u_bird|Add3~58\ : std_logic;
SIGNAL \u_bird|Add3~5_sumout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|bird_y_pos[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan4~5_combout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[30]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|bird_y_pos[29]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan4~2_combout\ : std_logic;
SIGNAL \u_bird|LessThan4~3_combout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[15]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan4~1_combout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[10]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|bird_y_pos[9]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|bird_y_pos[12]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan4~0_combout\ : std_logic;
SIGNAL \u_bird|LessThan4~4_combout\ : std_logic;
SIGNAL \u_bird|LessThan4~6_combout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add3~109_sumout\ : std_logic;
SIGNAL \u_bird|Add0~106\ : std_logic;
SIGNAL \u_bird|Add0~102\ : std_logic;
SIGNAL \u_bird|Add0~98\ : std_logic;
SIGNAL \u_bird|Add0~114\ : std_logic;
SIGNAL \u_bird|Add0~110\ : std_logic;
SIGNAL \u_bird|Add0~29_sumout\ : std_logic;
SIGNAL \u_vga_sync|LessThan7~0_combout\ : std_logic;
SIGNAL \u_bird|LessThan3~3_combout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[20]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add0~30\ : std_logic;
SIGNAL \u_bird|Add0~34\ : std_logic;
SIGNAL \u_bird|Add0~38\ : std_logic;
SIGNAL \u_bird|Add0~42\ : std_logic;
SIGNAL \u_bird|Add0~46\ : std_logic;
SIGNAL \u_bird|Add0~66\ : std_logic;
SIGNAL \u_bird|Add0~70\ : std_logic;
SIGNAL \u_bird|Add0~74\ : std_logic;
SIGNAL \u_bird|Add0~78\ : std_logic;
SIGNAL \u_bird|Add0~50\ : std_logic;
SIGNAL \u_bird|Add0~10\ : std_logic;
SIGNAL \u_bird|Add0~14\ : std_logic;
SIGNAL \u_bird|Add0~18\ : std_logic;
SIGNAL \u_bird|Add0~22\ : std_logic;
SIGNAL \u_bird|Add0~54\ : std_logic;
SIGNAL \u_bird|Add0~82\ : std_logic;
SIGNAL \u_bird|Add0~86\ : std_logic;
SIGNAL \u_bird|Add0~58\ : std_logic;
SIGNAL \u_bird|Add0~26\ : std_logic;
SIGNAL \u_bird|Add0~62\ : std_logic;
SIGNAL \u_bird|Add0~90\ : std_logic;
SIGNAL \u_bird|Add0~94\ : std_logic;
SIGNAL \u_bird|Add0~6\ : std_logic;
SIGNAL \u_bird|Add0~1_sumout\ : std_logic;
SIGNAL \u_bird|Add0~113_sumout\ : std_logic;
SIGNAL \u_bird|Add0~109_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~9_combout\ : std_logic;
SIGNAL \u_bird|Add0~101_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~5_combout\ : std_logic;
SIGNAL \u_vga_sync|pixel_row[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan3~8_combout\ : std_logic;
SIGNAL \u_bird|Add0~97_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~4_combout\ : std_logic;
SIGNAL \u_bird|Add0~105_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~6_combout\ : std_logic;
SIGNAL \u_vga_sync|pixel_row[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan3~7_combout\ : std_logic;
SIGNAL \u_bird|LessThan3~10_combout\ : std_logic;
SIGNAL \u_bird|LessThan2~2_combout\ : std_logic;
SIGNAL \u_bird|bird_y_pos[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|LessThan2~3_combout\ : std_logic;
SIGNAL \u_vga_sync|LessThan6~0_combout\ : std_logic;
SIGNAL \u_bird|process_0~0_combout\ : std_logic;
SIGNAL \u_bird|process_0~1_combout\ : std_logic;
SIGNAL \u_bird|LessThan2~4_combout\ : std_logic;
SIGNAL \u_bird|LessThan2~5_combout\ : std_logic;
SIGNAL \u_bird|LessThan2~0_combout\ : std_logic;
SIGNAL \u_bird|LessThan2~1_combout\ : std_logic;
SIGNAL \u_bird|process_0~2_combout\ : std_logic;
SIGNAL \u_bird|Add0~81_sumout\ : std_logic;
SIGNAL \u_bird|Add0~85_sumout\ : std_logic;
SIGNAL \u_bird|Add0~89_sumout\ : std_logic;
SIGNAL \u_bird|Add0~5_sumout\ : std_logic;
SIGNAL \u_bird|Add0~93_sumout\ : std_logic;
SIGNAL \u_bird|Add0~57_sumout\ : std_logic;
SIGNAL \u_bird|Add0~49_sumout\ : std_logic;
SIGNAL \u_bird|Add0~69_sumout\ : std_logic;
SIGNAL \u_bird|Add0~65_sumout\ : std_logic;
SIGNAL \u_bird|Add0~73_sumout\ : std_logic;
SIGNAL \u_bird|Add0~77_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~1_combout\ : std_logic;
SIGNAL \u_bird|Add0~53_sumout\ : std_logic;
SIGNAL \u_bird|Add0~61_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~2_combout\ : std_logic;
SIGNAL \u_bird|process_0~4_combout\ : std_logic;
SIGNAL \u_vga_sync|pixel_row[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add0~13_sumout\ : std_logic;
SIGNAL \u_bird|Add0~9_sumout\ : std_logic;
SIGNAL \u_bird|Add0~17_sumout\ : std_logic;
SIGNAL \u_bird|Add0~33_sumout\ : std_logic;
SIGNAL \u_bird|Add0~41_sumout\ : std_logic;
SIGNAL \u_bird|Add0~37_sumout\ : std_logic;
SIGNAL \u_bird|Add0~45_sumout\ : std_logic;
SIGNAL \u_bird|Add0~21_sumout\ : std_logic;
SIGNAL \u_bird|Add0~25_sumout\ : std_logic;
SIGNAL \u_bird|LessThan3~11_combout\ : std_logic;
SIGNAL \u_bird|LessThan3~0_combout\ : std_logic;
SIGNAL \u_bird|process_0~3_combout\ : std_logic;
SIGNAL \u_bird|bird_on~q\ : std_logic;
SIGNAL \u_vga_sync|video_on_h~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|video_on_h~q\ : std_logic;
SIGNAL \u_vga_sync|video_on_v~q\ : std_logic;
SIGNAL \u_vga_sync|video_on~combout\ : std_logic;
SIGNAL \u_bird|Mux20~0_combout\ : std_logic;
SIGNAL \u_vga_sync|pixel_row[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Add1~10\ : std_logic;
SIGNAL \u_bird|Add1~11\ : std_logic;
SIGNAL \u_bird|Add1~6\ : std_logic;
SIGNAL \u_bird|Add1~7\ : std_logic;
SIGNAL \u_bird|Add1~14\ : std_logic;
SIGNAL \u_bird|Add1~15\ : std_logic;
SIGNAL \u_bird|Add1~18\ : std_logic;
SIGNAL \u_bird|Add1~19\ : std_logic;
SIGNAL \u_bird|Add1~1_sumout\ : std_logic;
SIGNAL \u_bird|Add1~5_sumout\ : std_logic;
SIGNAL \u_bird|Mux24~3_combout\ : std_logic;
SIGNAL \u_bird|Add1~13_sumout\ : std_logic;
SIGNAL \u_bird|Add1~9_sumout\ : std_logic;
SIGNAL \u_vga_sync|pixel_column[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|Mux24~23_combout\ : std_logic;
SIGNAL \u_bird|Mux24~22_combout\ : std_logic;
SIGNAL \u_bird|Mux24~24_combout\ : std_logic;
SIGNAL \u_bird|Add1~17_sumout\ : std_logic;
SIGNAL \u_bird|Mux24~20_combout\ : std_logic;
SIGNAL \u_bird|Mux24~19_combout\ : std_logic;
SIGNAL \u_bird|Mux24~21_combout\ : std_logic;
SIGNAL \u_bird|Mux24~1_combout\ : std_logic;
SIGNAL \u_bird|Mux20~1_combout\ : std_logic;
SIGNAL \u_bird|Mux24~0_combout\ : std_logic;
SIGNAL \u_bird|Mux24~2_combout\ : std_logic;
SIGNAL \u_bird|Mux24~15_combout\ : std_logic;
SIGNAL \u_vga_sync|pixel_column[9]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|SHIFTIN[7]~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[7]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|new_cursor_column[7]~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_COUNT[1]~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_COUNT~1_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_COUNT[0]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[7]~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[0]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|cursor_column~7_combout\ : std_logic;
SIGNAL \u_mouse|cursor_column[1]~0_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row[8]~0_combout\ : std_logic;
SIGNAL \u_mouse|Add5~5_sumout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \u_mouse|Equal4~0_combout\ : std_logic;
SIGNAL \u_mouse|new_cursor_row[9]~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[1]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|cursor_column~8_combout\ : std_logic;
SIGNAL \u_mouse|Add5~6\ : std_logic;
SIGNAL \u_mouse|Add5~33_sumout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[5]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|cursor_column~6_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[3]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR2[2]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|Add5~34\ : std_logic;
SIGNAL \u_mouse|Add5~29_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_column~9_combout\ : std_logic;
SIGNAL \u_mouse|Add5~30\ : std_logic;
SIGNAL \u_mouse|Add5~25_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_column~4_combout\ : std_logic;
SIGNAL \u_mouse|Add5~26\ : std_logic;
SIGNAL \u_mouse|Add5~21_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_column~5_combout\ : std_logic;
SIGNAL \u_mouse|Add5~22\ : std_logic;
SIGNAL \u_mouse|Add5~17_sumout\ : std_logic;
SIGNAL \u_mouse|Add5~18\ : std_logic;
SIGNAL \u_mouse|Add5~13_sumout\ : std_logic;
SIGNAL \u_mouse|RECV_UART~0_combout\ : std_logic;
SIGNAL \u_mouse|RECV_UART~1_combout\ : std_logic;
SIGNAL \u_mouse|RECV_UART~2_combout\ : std_logic;
SIGNAL \u_mouse|Equal3~0_combout\ : std_logic;
SIGNAL \u_mouse|cursor_column~1_combout\ : std_logic;
SIGNAL \u_mouse|Add5~14\ : std_logic;
SIGNAL \u_mouse|Add5~37_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_column~2_combout\ : std_logic;
SIGNAL \u_mouse|Add5~38\ : std_logic;
SIGNAL \u_mouse|Add5~9_sumout\ : std_logic;
SIGNAL \u_mouse|LessThan9~0_combout\ : std_logic;
SIGNAL \u_mouse|cursor_column~3_combout\ : std_logic;
SIGNAL \u_mouse|Add5~10\ : std_logic;
SIGNAL \u_mouse|Add5~1_sumout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[7]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[7]~0_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[6]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[5]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|Add4~29_sumout\ : std_logic;
SIGNAL \u_mouse|LessThan5~1_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[3]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[2]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[1]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|PACKET_CHAR3[0]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|Add4~2\ : std_logic;
SIGNAL \u_mouse|Add4~3\ : std_logic;
SIGNAL \u_mouse|Add4~17_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_row~8_combout\ : std_logic;
SIGNAL \u_mouse|Add4~18\ : std_logic;
SIGNAL \u_mouse|Add4~19\ : std_logic;
SIGNAL \u_mouse|Add4~13_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_row~9_combout\ : std_logic;
SIGNAL \u_mouse|Add4~14\ : std_logic;
SIGNAL \u_mouse|Add4~15\ : std_logic;
SIGNAL \u_mouse|Add4~9_sumout\ : std_logic;
SIGNAL \u_mouse|Add4~11\ : std_logic;
SIGNAL \u_mouse|Add4~5_sumout\ : std_logic;
SIGNAL \u_mouse|LessThan5~0_combout\ : std_logic;
SIGNAL \u_mouse|LessThan5~2_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~7_combout\ : std_logic;
SIGNAL \u_mouse|Add4~1_sumout\ : std_logic;
SIGNAL \u_mouse|RECV_UART~3_combout\ : std_logic;
SIGNAL \u_mouse|RECV_UART~4_combout\ : std_logic;
SIGNAL \u_mouse|RECV_UART~5_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~10_combout\ : std_logic;
SIGNAL \u_mouse|Add4~10\ : std_logic;
SIGNAL \u_mouse|Add4~7\ : std_logic;
SIGNAL \u_mouse|Add4~39\ : std_logic;
SIGNAL \u_mouse|Add4~35\ : std_logic;
SIGNAL \u_mouse|Add4~31\ : std_logic;
SIGNAL \u_mouse|Add4~21_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_row~11_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~12_combout\ : std_logic;
SIGNAL \u_mouse|Add4~6\ : std_logic;
SIGNAL \u_mouse|Add4~37_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_row~13_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~14_combout\ : std_logic;
SIGNAL \u_mouse|Add4~38\ : std_logic;
SIGNAL \u_mouse|Add4~33_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_row~1_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~2_combout\ : std_logic;
SIGNAL \u_mouse|Add4~34\ : std_logic;
SIGNAL \u_mouse|Add4~30\ : std_logic;
SIGNAL \u_mouse|Add4~22\ : std_logic;
SIGNAL \u_mouse|Add4~23\ : std_logic;
SIGNAL \u_mouse|Add4~25_sumout\ : std_logic;
SIGNAL \u_mouse|cursor_row~3_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~4_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~5_combout\ : std_logic;
SIGNAL \u_mouse|cursor_row~6_combout\ : std_logic;
SIGNAL \mouse_pixel~3_combout\ : std_logic;
SIGNAL \u_vga_sync|pixel_column[8]~DUPLICATE_q\ : std_logic;
SIGNAL \mouse_pixel~0_combout\ : std_logic;
SIGNAL \mouse_pixel~5_combout\ : std_logic;
SIGNAL \mouse_pixel~4_combout\ : std_logic;
SIGNAL \mouse_pixel~1_combout\ : std_logic;
SIGNAL \mouse_pixel~2_combout\ : std_logic;
SIGNAL \mouse_pixel~6_combout\ : std_logic;
SIGNAL \u_vga_sync|red_out~0_combout\ : std_logic;
SIGNAL \u_vga_sync|red_out~q\ : std_logic;
SIGNAL \u_bird|Mux19~0_combout\ : std_logic;
SIGNAL \u_bird|Mux37~0_combout\ : std_logic;
SIGNAL \u_bird|Mux36~0_combout\ : std_logic;
SIGNAL \u_bird|Mux24~6_combout\ : std_logic;
SIGNAL \u_bird|Mux24~12_combout\ : std_logic;
SIGNAL \u_bird|Mux24~13_combout\ : std_logic;
SIGNAL \u_bird|Mux24~14_combout\ : std_logic;
SIGNAL \u_bird|Mux24~4_combout\ : std_logic;
SIGNAL \u_bird|Mux24~5_combout\ : std_logic;
SIGNAL \u_bird|Mux41~0_combout\ : std_logic;
SIGNAL \u_vga_sync|green_out~0_combout\ : std_logic;
SIGNAL \u_vga_sync|green_out~q\ : std_logic;
SIGNAL \u_bird|Mux47~0_combout\ : std_logic;
SIGNAL \u_bird|Mux24~11_combout\ : std_logic;
SIGNAL \u_bird|Mux24~7_combout\ : std_logic;
SIGNAL \u_bird|Mux16~0_combout\ : std_logic;
SIGNAL \u_bird|Mux5~0_combout\ : std_logic;
SIGNAL \u_bird|Mux24~8_combout\ : std_logic;
SIGNAL \u_bird|Mux24~9_combout\ : std_logic;
SIGNAL \u_bird|Mux24~10_combout\ : std_logic;
SIGNAL \u_bird|Mux53~0_combout\ : std_logic;
SIGNAL \u_vga_sync|blue_out~0_combout\ : std_logic;
SIGNAL \mouse_pixel~7_combout\ : std_logic;
SIGNAL \u_vga_sync|blue_out~1_combout\ : std_logic;
SIGNAL \u_vga_sync|blue_out~q\ : std_logic;
SIGNAL \u_vga_sync|process_0~1_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~8_combout\ : std_logic;
SIGNAL \u_vga_sync|horiz_sync~q\ : std_logic;
SIGNAL \u_vga_sync|horiz_sync_out~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|horiz_sync_out~q\ : std_logic;
SIGNAL \u_mouse|cursor_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga_sync|v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|bird_y_pos\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_vga_sync|h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_mouse|new_cursor_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_mouse|new_cursor_row\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga_sync|pixel_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_mouse|inhibit_wait_count\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_bird|bird_r\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_bird|bird_b\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|cursor_row\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga_sync|pixel_row\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_mouse|filter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_bird|bird_g\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|PACKET_COUNT\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_mouse|INCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|SHIFTOUT\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_mouse|OUTCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|PACKET_CHAR2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|PACKET_CHAR3\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|SHIFTIN\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_cursor_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_new_cursor_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_new_cursor_row\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~105_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~113_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add0~109_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add3~105_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add3~113_sumout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Add3~101_sumout\ : std_logic;
SIGNAL \ALT_INV_mouse_pixel~1_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_bird_on~q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_video_on_h~q\ : std_logic;
SIGNAL \ALT_INV_mouse_pixel~2_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_row\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_cursor_row\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_mouse_pixel~3_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_video_on~combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_video_on_v~q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_r\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_mouse_pixel~0_combout\ : std_logic;
SIGNAL \ALT_INV_mouse_pixel~4_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos\ : std_logic_vector(31 DOWNTO 1);
SIGNAL \u_bird|ALT_INV_bird_g\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_blue_out~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux20~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~3_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~7_combout\ : std_logic;
SIGNAL \ALT_INV_mouse_pixel~5_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~2_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux19~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~2_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~4_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~5_combout\ : std_logic;
SIGNAL \ALT_INV_mouse_pixel~6_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~9_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~10_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux20~0_combout\ : std_logic;
SIGNAL \ALT_INV_mouse_pixel~7_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_b\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \u_vga_sync|ALT_INV_horiz_sync~q\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan4~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~3_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~8_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~6_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~0_combout\ : std_logic;
SIGNAL \ALT_INV_clk25~q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_LessThan6~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan2~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan2~4_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_RECV_UART~3_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_RECV_UART~4_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_RECV_UART~5_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_cursor_row~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan4~2_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan4~3_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan2~3_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_RECV_UART~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan4~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan4~4_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_PACKET_COUNT\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_INCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_bird|ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_LessThan9~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan2~5_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_READ_CHAR~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_RECV_UART~1_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_RECV_UART~2_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_process_0~2_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan2~2_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_filter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_MOUSE_CLK_FILTER~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~7_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_new_cursor_column[7]~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_cursor_row~3_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~5_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_Equal4~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux47~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~10_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~4_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_LessThan5~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_cursor_row~11_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~4_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~6_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_LessThan7~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux36~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~5_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~8_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux16~0_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~9_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~2_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_cursor_row~5_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_LessThan5~2_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan4~5_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux37~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_LessThan5~1_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~11_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_cursor_row~13_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~6_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_inhibit_wait_count\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_OUTCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_PACKET_CHAR3\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_PACKET_CHAR2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_SHIFTIN\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_output_ready~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_send_data~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_INCNT~1_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_SHIFTOUT\ : std_logic_vector(9 DOWNTO 3);
SIGNAL \u_mouse|ALT_INV_iready_set~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_PACKET_COUNT~1_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_send_char~q\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~22_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~14_combout\ : std_logic;
SIGNAL \ALT_INV_reset_n~input_o\ : std_logic;
SIGNAL \u_bird|ALT_INV_LessThan3~11_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_process_0~4_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~24_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~23_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\ : std_logic;
SIGNAL \ALT_INV_PS2_CLK~input_o\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~21_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~20_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~19_combout\ : std_logic;
SIGNAL \ALT_INV_PS2_DAT~input_o\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~13_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_Mux24~12_combout\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[29]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[21]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[20]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_inhibit_wait_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_row[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_row[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_column[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_column[9]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_row[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_h_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_v_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[26]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_v_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[30]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_v_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[25]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[22]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[10]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_pixel_row[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[15]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_v_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[12]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_filter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_h_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[9]~DUPLICATE_q\ : std_logic;
SIGNAL \u_bird|ALT_INV_bird_y_pos[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_filter[1]~DUPLICATE_q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_reset_n <= reset_n;
ww_PB1 <= PB1;
ww_PB2 <= PB2;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\u_mouse|ALT_INV_cursor_column\(9) <= NOT \u_mouse|cursor_column\(9);
\u_mouse|ALT_INV_cursor_column\(7) <= NOT \u_mouse|cursor_column\(7);
\u_mouse|ALT_INV_cursor_column\(3) <= NOT \u_mouse|cursor_column\(3);
\u_mouse|ALT_INV_cursor_column\(4) <= NOT \u_mouse|cursor_column\(4);
\u_mouse|ALT_INV_cursor_column\(5) <= NOT \u_mouse|cursor_column\(5);
\u_mouse|ALT_INV_cursor_column\(0) <= NOT \u_mouse|cursor_column\(0);
\u_mouse|ALT_INV_cursor_column\(2) <= NOT \u_mouse|cursor_column\(2);
\u_mouse|ALT_INV_cursor_column\(1) <= NOT \u_mouse|cursor_column\(1);
\u_bird|ALT_INV_Add1~13_sumout\ <= NOT \u_bird|Add1~13_sumout\;
\u_bird|ALT_INV_Add1~17_sumout\ <= NOT \u_bird|Add1~17_sumout\;
\u_bird|ALT_INV_Add0~9_sumout\ <= NOT \u_bird|Add0~9_sumout\;
\u_bird|ALT_INV_Add0~73_sumout\ <= NOT \u_bird|Add0~73_sumout\;
\u_bird|ALT_INV_Add0~61_sumout\ <= NOT \u_bird|Add0~61_sumout\;
\u_bird|ALT_INV_Add0~69_sumout\ <= NOT \u_bird|Add0~69_sumout\;
\u_vga_sync|ALT_INV_v_count\(6) <= NOT \u_vga_sync|v_count\(6);
\u_bird|ALT_INV_Add1~5_sumout\ <= NOT \u_bird|Add1~5_sumout\;
\u_bird|ALT_INV_Add0~13_sumout\ <= NOT \u_bird|Add0~13_sumout\;
\u_bird|ALT_INV_Add0~37_sumout\ <= NOT \u_bird|Add0~37_sumout\;
\u_bird|ALT_INV_Add0~5_sumout\ <= NOT \u_bird|Add0~5_sumout\;
\u_vga_sync|ALT_INV_v_count\(8) <= NOT \u_vga_sync|v_count\(8);
\u_bird|ALT_INV_Add0~49_sumout\ <= NOT \u_bird|Add0~49_sumout\;
\u_bird|ALT_INV_Add0~77_sumout\ <= NOT \u_bird|Add0~77_sumout\;
\u_vga_sync|ALT_INV_h_count\(7) <= NOT \u_vga_sync|h_count\(7);
\u_bird|ALT_INV_Add0~45_sumout\ <= NOT \u_bird|Add0~45_sumout\;
\u_vga_sync|ALT_INV_v_count\(5) <= NOT \u_vga_sync|v_count\(5);
\u_vga_sync|ALT_INV_v_count\(9) <= NOT \u_vga_sync|v_count\(9);
\u_bird|ALT_INV_Add0~21_sumout\ <= NOT \u_bird|Add0~21_sumout\;
\u_vga_sync|ALT_INV_h_count\(9) <= NOT \u_vga_sync|h_count\(9);
\u_bird|ALT_INV_Add0~41_sumout\ <= NOT \u_bird|Add0~41_sumout\;
\u_bird|ALT_INV_Add0~33_sumout\ <= NOT \u_bird|Add0~33_sumout\;
\u_bird|ALT_INV_Add0~57_sumout\ <= NOT \u_bird|Add0~57_sumout\;
\u_bird|ALT_INV_Add0~65_sumout\ <= NOT \u_bird|Add0~65_sumout\;
\u_bird|ALT_INV_Add0~25_sumout\ <= NOT \u_bird|Add0~25_sumout\;
\u_bird|ALT_INV_Add0~81_sumout\ <= NOT \u_bird|Add0~81_sumout\;
\u_bird|ALT_INV_Add0~1_sumout\ <= NOT \u_bird|Add0~1_sumout\;
\u_bird|ALT_INV_Add0~17_sumout\ <= NOT \u_bird|Add0~17_sumout\;
\u_bird|ALT_INV_Add1~9_sumout\ <= NOT \u_bird|Add1~9_sumout\;
\u_bird|ALT_INV_Add0~53_sumout\ <= NOT \u_bird|Add0~53_sumout\;
\u_bird|ALT_INV_Add0~29_sumout\ <= NOT \u_bird|Add0~29_sumout\;
\u_vga_sync|ALT_INV_h_count\(8) <= NOT \u_vga_sync|h_count\(8);
\u_vga_sync|ALT_INV_v_count\(7) <= NOT \u_vga_sync|v_count\(7);
\u_bird|ALT_INV_Add1~1_sumout\ <= NOT \u_bird|Add1~1_sumout\;
\u_vga_sync|ALT_INV_v_count\(3) <= NOT \u_vga_sync|v_count\(3);
\u_mouse|ALT_INV_new_cursor_column\(5) <= NOT \u_mouse|new_cursor_column\(5);
\u_mouse|ALT_INV_new_cursor_column\(2) <= NOT \u_mouse|new_cursor_column\(2);
\u_bird|ALT_INV_Add0~101_sumout\ <= NOT \u_bird|Add0~101_sumout\;
\u_bird|ALT_INV_Add0~97_sumout\ <= NOT \u_bird|Add0~97_sumout\;
\u_vga_sync|ALT_INV_v_count\(2) <= NOT \u_vga_sync|v_count\(2);
\u_vga_sync|ALT_INV_v_count\(4) <= NOT \u_vga_sync|v_count\(4);
\u_mouse|ALT_INV_new_cursor_column\(3) <= NOT \u_mouse|new_cursor_column\(3);
\u_mouse|ALT_INV_new_cursor_row\(9) <= NOT \u_mouse|new_cursor_row\(9);
\u_vga_sync|ALT_INV_h_count\(1) <= NOT \u_vga_sync|h_count\(1);
\u_mouse|ALT_INV_new_cursor_row\(0) <= NOT \u_mouse|new_cursor_row\(0);
\u_mouse|ALT_INV_new_cursor_column\(9) <= NOT \u_mouse|new_cursor_column\(9);
\u_mouse|ALT_INV_new_cursor_row\(4) <= NOT \u_mouse|new_cursor_row\(4);
\u_mouse|ALT_INV_new_cursor_row\(8) <= NOT \u_mouse|new_cursor_row\(8);
\u_mouse|ALT_INV_new_cursor_row\(5) <= NOT \u_mouse|new_cursor_row\(5);
\u_vga_sync|ALT_INV_v_count\(0) <= NOT \u_vga_sync|v_count\(0);
\u_bird|ALT_INV_Add0~93_sumout\ <= NOT \u_bird|Add0~93_sumout\;
\u_bird|ALT_INV_Add0~89_sumout\ <= NOT \u_bird|Add0~89_sumout\;
\u_mouse|ALT_INV_new_cursor_row\(6) <= NOT \u_mouse|new_cursor_row\(6);
\u_vga_sync|ALT_INV_v_count\(1) <= NOT \u_vga_sync|v_count\(1);
\u_mouse|ALT_INV_new_cursor_column\(7) <= NOT \u_mouse|new_cursor_column\(7);
\u_vga_sync|ALT_INV_h_count\(6) <= NOT \u_vga_sync|h_count\(6);
\u_mouse|ALT_INV_new_cursor_column\(1) <= NOT \u_mouse|new_cursor_column\(1);
\u_mouse|ALT_INV_new_cursor_column\(4) <= NOT \u_mouse|new_cursor_column\(4);
\u_vga_sync|ALT_INV_h_count\(4) <= NOT \u_vga_sync|h_count\(4);
\u_bird|ALT_INV_Add0~105_sumout\ <= NOT \u_bird|Add0~105_sumout\;
\u_bird|ALT_INV_Add0~85_sumout\ <= NOT \u_bird|Add0~85_sumout\;
\u_mouse|ALT_INV_new_cursor_column\(0) <= NOT \u_mouse|new_cursor_column\(0);
\u_mouse|ALT_INV_new_cursor_column\(6) <= NOT \u_mouse|new_cursor_column\(6);
\u_bird|ALT_INV_Add0~113_sumout\ <= NOT \u_bird|Add0~113_sumout\;
\u_vga_sync|ALT_INV_h_count\(5) <= NOT \u_vga_sync|h_count\(5);
\u_vga_sync|ALT_INV_h_count\(2) <= NOT \u_vga_sync|h_count\(2);
\u_vga_sync|ALT_INV_h_count\(0) <= NOT \u_vga_sync|h_count\(0);
\u_mouse|ALT_INV_new_cursor_row\(3) <= NOT \u_mouse|new_cursor_row\(3);
\u_mouse|ALT_INV_new_cursor_column\(8) <= NOT \u_mouse|new_cursor_column\(8);
\u_mouse|ALT_INV_new_cursor_row\(2) <= NOT \u_mouse|new_cursor_row\(2);
\u_vga_sync|ALT_INV_Add1~1_sumout\ <= NOT \u_vga_sync|Add1~1_sumout\;
\u_vga_sync|ALT_INV_Add1~5_sumout\ <= NOT \u_vga_sync|Add1~5_sumout\;
\u_bird|ALT_INV_Add0~109_sumout\ <= NOT \u_bird|Add0~109_sumout\;
\u_mouse|ALT_INV_new_cursor_row\(1) <= NOT \u_mouse|new_cursor_row\(1);
\u_mouse|ALT_INV_new_cursor_row\(7) <= NOT \u_mouse|new_cursor_row\(7);
\u_vga_sync|ALT_INV_h_count\(3) <= NOT \u_vga_sync|h_count\(3);
\u_vga_sync|ALT_INV_Add1~13_sumout\ <= NOT \u_vga_sync|Add1~13_sumout\;
\u_bird|ALT_INV_Add3~105_sumout\ <= NOT \u_bird|Add3~105_sumout\;
\u_bird|ALT_INV_Add3~113_sumout\ <= NOT \u_bird|Add3~113_sumout\;
\u_bird|ALT_INV_Add3~101_sumout\ <= NOT \u_bird|Add3~101_sumout\;
\ALT_INV_mouse_pixel~1_combout\ <= NOT \mouse_pixel~1_combout\;
\u_vga_sync|ALT_INV_pixel_column\(2) <= NOT \u_vga_sync|pixel_column\(2);
\u_bird|ALT_INV_bird_on~q\ <= NOT \u_bird|bird_on~q\;
\u_vga_sync|ALT_INV_pixel_column\(5) <= NOT \u_vga_sync|pixel_column\(5);
\u_vga_sync|ALT_INV_video_on_h~q\ <= NOT \u_vga_sync|video_on_h~q\;
\u_vga_sync|ALT_INV_pixel_column\(7) <= NOT \u_vga_sync|pixel_column\(7);
\u_vga_sync|ALT_INV_pixel_column\(0) <= NOT \u_vga_sync|pixel_column\(0);
\u_vga_sync|ALT_INV_pixel_column\(1) <= NOT \u_vga_sync|pixel_column\(1);
\ALT_INV_mouse_pixel~2_combout\ <= NOT \mouse_pixel~2_combout\;
\u_vga_sync|ALT_INV_pixel_row\(6) <= NOT \u_vga_sync|pixel_row\(6);
\u_vga_sync|ALT_INV_pixel_column\(9) <= NOT \u_vga_sync|pixel_column\(9);
\u_mouse|ALT_INV_cursor_row\(6) <= NOT \u_mouse|cursor_row\(6);
\u_mouse|ALT_INV_cursor_row\(7) <= NOT \u_mouse|cursor_row\(7);
\u_vga_sync|ALT_INV_pixel_row\(7) <= NOT \u_vga_sync|pixel_row\(7);
\u_mouse|ALT_INV_cursor_row\(8) <= NOT \u_mouse|cursor_row\(8);
\u_vga_sync|ALT_INV_pixel_row\(8) <= NOT \u_vga_sync|pixel_row\(8);
\ALT_INV_mouse_pixel~3_combout\ <= NOT \mouse_pixel~3_combout\;
\u_vga_sync|ALT_INV_video_on~combout\ <= NOT \u_vga_sync|video_on~combout\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\u_vga_sync|ALT_INV_video_on_v~q\ <= NOT \u_vga_sync|video_on_v~q\;
\u_mouse|ALT_INV_cursor_column\(6) <= NOT \u_mouse|cursor_column\(6);
\u_bird|ALT_INV_bird_r\(0) <= NOT \u_bird|bird_r\(0);
\u_vga_sync|ALT_INV_pixel_column\(6) <= NOT \u_vga_sync|pixel_column\(6);
\u_mouse|ALT_INV_cursor_column\(8) <= NOT \u_mouse|cursor_column\(8);
\u_vga_sync|ALT_INV_pixel_column\(8) <= NOT \u_vga_sync|pixel_column\(8);
\ALT_INV_mouse_pixel~0_combout\ <= NOT \mouse_pixel~0_combout\;
\u_vga_sync|ALT_INV_pixel_column\(3) <= NOT \u_vga_sync|pixel_column\(3);
\u_vga_sync|ALT_INV_pixel_column\(4) <= NOT \u_vga_sync|pixel_column\(4);
\ALT_INV_mouse_pixel~4_combout\ <= NOT \mouse_pixel~4_combout\;
\u_mouse|ALT_INV_cursor_row\(3) <= NOT \u_mouse|cursor_row\(3);
\u_bird|ALT_INV_bird_y_pos\(15) <= NOT \u_bird|bird_y_pos\(15);
\u_bird|ALT_INV_bird_y_pos\(14) <= NOT \u_bird|bird_y_pos\(14);
\u_bird|ALT_INV_bird_g\(0) <= NOT \u_bird|bird_g\(0);
\u_bird|ALT_INV_Mux5~0_combout\ <= NOT \u_bird|Mux5~0_combout\;
\u_mouse|ALT_INV_cursor_row\(1) <= NOT \u_mouse|cursor_row\(1);
\u_vga_sync|ALT_INV_blue_out~0_combout\ <= NOT \u_vga_sync|blue_out~0_combout\;
\u_bird|ALT_INV_Mux20~1_combout\ <= NOT \u_bird|Mux20~1_combout\;
\u_bird|ALT_INV_Mux24~3_combout\ <= NOT \u_bird|Mux24~3_combout\;
\u_bird|ALT_INV_bird_y_pos\(1) <= NOT \u_bird|bird_y_pos\(1);
\u_bird|ALT_INV_LessThan3~7_combout\ <= NOT \u_bird|LessThan3~7_combout\;
\u_mouse|ALT_INV_cursor_row\(2) <= NOT \u_mouse|cursor_row\(2);
\u_vga_sync|ALT_INV_pixel_row\(3) <= NOT \u_vga_sync|pixel_row\(3);
\u_mouse|ALT_INV_cursor_row\(5) <= NOT \u_mouse|cursor_row\(5);
\ALT_INV_mouse_pixel~5_combout\ <= NOT \mouse_pixel~5_combout\;
\u_bird|ALT_INV_Mux24~2_combout\ <= NOT \u_bird|Mux24~2_combout\;
\u_bird|ALT_INV_Mux19~0_combout\ <= NOT \u_bird|Mux19~0_combout\;
\u_bird|ALT_INV_LessThan3~1_combout\ <= NOT \u_bird|LessThan3~1_combout\;
\u_bird|ALT_INV_LessThan3~2_combout\ <= NOT \u_bird|LessThan3~2_combout\;
\u_bird|ALT_INV_LessThan3~4_combout\ <= NOT \u_bird|LessThan3~4_combout\;
\u_bird|ALT_INV_LessThan3~5_combout\ <= NOT \u_bird|LessThan3~5_combout\;
\ALT_INV_mouse_pixel~6_combout\ <= NOT \mouse_pixel~6_combout\;
\u_bird|ALT_INV_LessThan3~9_combout\ <= NOT \u_bird|LessThan3~9_combout\;
\u_bird|ALT_INV_LessThan3~10_combout\ <= NOT \u_bird|LessThan3~10_combout\;
\u_bird|ALT_INV_bird_y_pos\(19) <= NOT \u_bird|bird_y_pos\(19);
\u_bird|ALT_INV_Mux20~0_combout\ <= NOT \u_bird|Mux20~0_combout\;
\u_bird|ALT_INV_bird_y_pos\(11) <= NOT \u_bird|bird_y_pos\(11);
\u_bird|ALT_INV_bird_y_pos\(10) <= NOT \u_bird|bird_y_pos\(10);
\u_bird|ALT_INV_bird_y_pos\(12) <= NOT \u_bird|bird_y_pos\(12);
\u_bird|ALT_INV_bird_y_pos\(9) <= NOT \u_bird|bird_y_pos\(9);
\ALT_INV_mouse_pixel~7_combout\ <= NOT \mouse_pixel~7_combout\;
\u_bird|ALT_INV_bird_b\(0) <= NOT \u_bird|bird_b\(0);
\u_vga_sync|ALT_INV_horiz_sync~q\ <= NOT \u_vga_sync|horiz_sync~q\;
\u_bird|ALT_INV_LessThan3~0_combout\ <= NOT \u_bird|LessThan3~0_combout\;
\u_vga_sync|ALT_INV_pixel_row\(4) <= NOT \u_vga_sync|pixel_row\(4);
\u_bird|ALT_INV_LessThan4~0_combout\ <= NOT \u_bird|LessThan4~0_combout\;
\u_vga_sync|ALT_INV_pixel_row\(5) <= NOT \u_vga_sync|pixel_row\(5);
\u_bird|ALT_INV_bird_y_pos\(25) <= NOT \u_bird|bird_y_pos\(25);
\u_bird|ALT_INV_LessThan3~3_combout\ <= NOT \u_bird|LessThan3~3_combout\;
\u_vga_sync|ALT_INV_pixel_row\(2) <= NOT \u_vga_sync|pixel_row\(2);
\u_mouse|ALT_INV_cursor_row\(4) <= NOT \u_mouse|cursor_row\(4);
\u_bird|ALT_INV_LessThan3~8_combout\ <= NOT \u_bird|LessThan3~8_combout\;
\u_bird|ALT_INV_LessThan3~6_combout\ <= NOT \u_bird|LessThan3~6_combout\;
\u_bird|ALT_INV_bird_y_pos\(18) <= NOT \u_bird|bird_y_pos\(18);
\u_bird|ALT_INV_Mux24~1_combout\ <= NOT \u_bird|Mux24~1_combout\;
\u_bird|ALT_INV_Mux24~0_combout\ <= NOT \u_bird|Mux24~0_combout\;
\u_bird|ALT_INV_bird_y_pos\(17) <= NOT \u_bird|bird_y_pos\(17);
\u_mouse|ALT_INV_cursor_row\(0) <= NOT \u_mouse|cursor_row\(0);
\ALT_INV_clk25~q\ <= NOT \clk25~q\;
\u_vga_sync|ALT_INV_LessThan6~0_combout\ <= NOT \u_vga_sync|LessThan6~0_combout\;
\u_bird|ALT_INV_bird_y_pos\(2) <= NOT \u_bird|bird_y_pos\(2);
\u_vga_sync|ALT_INV_pixel_row\(0) <= NOT \u_vga_sync|pixel_row\(0);
\u_bird|ALT_INV_bird_y_pos\(31) <= NOT \u_bird|bird_y_pos\(31);
\u_bird|ALT_INV_bird_y_pos\(16) <= NOT \u_bird|bird_y_pos\(16);
\u_vga_sync|ALT_INV_pixel_row\(1) <= NOT \u_vga_sync|pixel_row\(1);
\u_bird|ALT_INV_bird_y_pos\(20) <= NOT \u_bird|bird_y_pos\(20);
\u_bird|ALT_INV_bird_y_pos\(28) <= NOT \u_bird|bird_y_pos\(28);
\u_bird|ALT_INV_LessThan2~1_combout\ <= NOT \u_bird|LessThan2~1_combout\;
\u_bird|ALT_INV_process_0~0_combout\ <= NOT \u_bird|process_0~0_combout\;
\u_bird|ALT_INV_LessThan2~4_combout\ <= NOT \u_bird|LessThan2~4_combout\;
\u_mouse|ALT_INV_RECV_UART~3_combout\ <= NOT \u_mouse|RECV_UART~3_combout\;
\u_mouse|ALT_INV_RECV_UART~4_combout\ <= NOT \u_mouse|RECV_UART~4_combout\;
\u_mouse|ALT_INV_RECV_UART~5_combout\ <= NOT \u_mouse|RECV_UART~5_combout\;
\u_mouse|ALT_INV_cursor_row~1_combout\ <= NOT \u_mouse|cursor_row~1_combout\;
\u_bird|ALT_INV_LessThan4~2_combout\ <= NOT \u_bird|LessThan4~2_combout\;
\u_bird|ALT_INV_bird_y_pos\(27) <= NOT \u_bird|bird_y_pos\(27);
\u_bird|ALT_INV_bird_y_pos\(26) <= NOT \u_bird|bird_y_pos\(26);
\u_bird|ALT_INV_LessThan4~3_combout\ <= NOT \u_bird|LessThan4~3_combout\;
\u_bird|ALT_INV_bird_y_pos\(23) <= NOT \u_bird|bird_y_pos\(23);
\u_bird|ALT_INV_LessThan2~3_combout\ <= NOT \u_bird|LessThan2~3_combout\;
\u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\ <= NOT \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\;
\u_bird|ALT_INV_bird_y_pos\(24) <= NOT \u_bird|bird_y_pos\(24);
\u_mouse|ALT_INV_RECV_UART~0_combout\ <= NOT \u_mouse|RECV_UART~0_combout\;
\u_bird|ALT_INV_LessThan4~1_combout\ <= NOT \u_bird|LessThan4~1_combout\;
\u_bird|ALT_INV_LessThan4~4_combout\ <= NOT \u_bird|LessThan4~4_combout\;
\u_bird|ALT_INV_bird_y_pos\(7) <= NOT \u_bird|bird_y_pos\(7);
\u_bird|ALT_INV_bird_y_pos\(21) <= NOT \u_bird|bird_y_pos\(21);
\u_bird|ALT_INV_bird_y_pos\(8) <= NOT \u_bird|bird_y_pos\(8);
\u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\ <= NOT \u_mouse|MOUSE_CLK_FILTER~q\;
\u_mouse|ALT_INV_PACKET_COUNT\(1) <= NOT \u_mouse|PACKET_COUNT\(1);
\u_mouse|ALT_INV_INCNT\(3) <= NOT \u_mouse|INCNT\(3);
\u_bird|ALT_INV_LessThan2~0_combout\ <= NOT \u_bird|LessThan2~0_combout\;
\u_mouse|ALT_INV_INCNT\(2) <= NOT \u_mouse|INCNT\(2);
\u_mouse|ALT_INV_INCNT\(1) <= NOT \u_mouse|INCNT\(1);
\u_mouse|ALT_INV_LessThan9~0_combout\ <= NOT \u_mouse|LessThan9~0_combout\;
\u_bird|ALT_INV_bird_y_pos\(13) <= NOT \u_bird|bird_y_pos\(13);
\u_bird|ALT_INV_bird_y_pos\(3) <= NOT \u_bird|bird_y_pos\(3);
\u_bird|ALT_INV_LessThan2~5_combout\ <= NOT \u_bird|LessThan2~5_combout\;
\u_mouse|ALT_INV_READ_CHAR~q\ <= NOT \u_mouse|READ_CHAR~q\;
\u_bird|ALT_INV_bird_y_pos\(30) <= NOT \u_bird|bird_y_pos\(30);
\u_bird|ALT_INV_bird_y_pos\(29) <= NOT \u_bird|bird_y_pos\(29);
\u_mouse|ALT_INV_LessThan1~0_combout\ <= NOT \u_mouse|LessThan1~0_combout\;
\u_mouse|ALT_INV_RECV_UART~1_combout\ <= NOT \u_mouse|RECV_UART~1_combout\;
\u_mouse|ALT_INV_RECV_UART~2_combout\ <= NOT \u_mouse|RECV_UART~2_combout\;
\u_mouse|ALT_INV_Equal3~0_combout\ <= NOT \u_mouse|Equal3~0_combout\;
\u_bird|ALT_INV_process_0~2_combout\ <= NOT \u_bird|process_0~2_combout\;
\u_bird|ALT_INV_LessThan2~2_combout\ <= NOT \u_bird|LessThan2~2_combout\;
\u_bird|ALT_INV_bird_y_pos\(22) <= NOT \u_bird|bird_y_pos\(22);
\u_bird|ALT_INV_bird_y_pos\(4) <= NOT \u_bird|bird_y_pos\(4);
\u_mouse|ALT_INV_PACKET_COUNT\(0) <= NOT \u_mouse|PACKET_COUNT\(0);
\u_mouse|ALT_INV_INCNT\(0) <= NOT \u_mouse|INCNT\(0);
\u_bird|ALT_INV_bird_y_pos\(5) <= NOT \u_bird|bird_y_pos\(5);
\u_bird|ALT_INV_process_0~1_combout\ <= NOT \u_bird|process_0~1_combout\;
\u_bird|ALT_INV_bird_y_pos\(6) <= NOT \u_bird|bird_y_pos\(6);
\u_mouse|ALT_INV_filter\(5) <= NOT \u_mouse|filter\(5);
\u_mouse|ALT_INV_filter\(7) <= NOT \u_mouse|filter\(7);
\u_mouse|ALT_INV_MOUSE_CLK_FILTER~0_combout\ <= NOT \u_mouse|MOUSE_CLK_FILTER~0_combout\;
\u_mouse|ALT_INV_filter\(2) <= NOT \u_mouse|filter\(2);
\u_bird|ALT_INV_Mux24~7_combout\ <= NOT \u_bird|Mux24~7_combout\;
\u_mouse|ALT_INV_new_cursor_column[7]~0_combout\ <= NOT \u_mouse|new_cursor_column[7]~0_combout\;
\u_mouse|ALT_INV_filter\(4) <= NOT \u_mouse|filter\(4);
\u_mouse|ALT_INV_cursor_row~3_combout\ <= NOT \u_mouse|cursor_row~3_combout\;
\u_mouse|ALT_INV_filter\(6) <= NOT \u_mouse|filter\(6);
\u_bird|ALT_INV_Mux24~5_combout\ <= NOT \u_bird|Mux24~5_combout\;
\u_mouse|ALT_INV_Equal4~0_combout\ <= NOT \u_mouse|Equal4~0_combout\;
\u_bird|ALT_INV_Mux47~0_combout\ <= NOT \u_bird|Mux47~0_combout\;
\u_bird|ALT_INV_Mux24~10_combout\ <= NOT \u_bird|Mux24~10_combout\;
\u_mouse|ALT_INV_filter\(1) <= NOT \u_mouse|filter\(1);
\u_mouse|ALT_INV_filter\(3) <= NOT \u_mouse|filter\(3);
\u_vga_sync|ALT_INV_LessThan1~0_combout\ <= NOT \u_vga_sync|LessThan1~0_combout\;
\u_mouse|ALT_INV_Equal2~0_combout\ <= NOT \u_mouse|Equal2~0_combout\;
\u_mouse|ALT_INV_Equal1~0_combout\ <= NOT \u_mouse|Equal1~0_combout\;
\u_vga_sync|ALT_INV_process_0~4_combout\ <= NOT \u_vga_sync|process_0~4_combout\;
\u_vga_sync|ALT_INV_Equal1~0_combout\ <= NOT \u_vga_sync|Equal1~0_combout\;
\u_mouse|ALT_INV_filter\(0) <= NOT \u_mouse|filter\(0);
\u_mouse|ALT_INV_LessThan5~0_combout\ <= NOT \u_mouse|LessThan5~0_combout\;
\u_mouse|ALT_INV_cursor_row~11_combout\ <= NOT \u_mouse|cursor_row~11_combout\;
\u_vga_sync|ALT_INV_process_0~1_combout\ <= NOT \u_vga_sync|process_0~1_combout\;
\u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\ <= NOT \u_mouse|mouse_state.LOAD_COMMAND~q\;
\u_bird|ALT_INV_Mux24~4_combout\ <= NOT \u_bird|Mux24~4_combout\;
\u_bird|ALT_INV_Mux24~6_combout\ <= NOT \u_bird|Mux24~6_combout\;
\u_vga_sync|ALT_INV_LessThan7~1_combout\ <= NOT \u_vga_sync|LessThan7~1_combout\;
\u_bird|ALT_INV_Mux36~0_combout\ <= NOT \u_bird|Mux36~0_combout\;
\u_vga_sync|ALT_INV_Equal0~0_combout\ <= NOT \u_vga_sync|Equal0~0_combout\;
\u_vga_sync|ALT_INV_process_0~5_combout\ <= NOT \u_vga_sync|process_0~5_combout\;
\u_bird|ALT_INV_Mux24~8_combout\ <= NOT \u_bird|Mux24~8_combout\;
\u_bird|ALT_INV_Mux16~0_combout\ <= NOT \u_bird|Mux16~0_combout\;
\u_bird|ALT_INV_Mux24~9_combout\ <= NOT \u_bird|Mux24~9_combout\;
\u_vga_sync|ALT_INV_process_0~2_combout\ <= NOT \u_vga_sync|process_0~2_combout\;
\u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\ <= NOT \u_mouse|mouse_state.INHIBIT_TRANS~q\;
\u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\ <= NOT \u_mouse|mouse_state.LOAD_COMMAND2~q\;
\u_mouse|ALT_INV_cursor_row~5_combout\ <= NOT \u_mouse|cursor_row~5_combout\;
\u_mouse|ALT_INV_LessThan5~2_combout\ <= NOT \u_mouse|LessThan5~2_combout\;
\u_bird|ALT_INV_LessThan4~5_combout\ <= NOT \u_bird|LessThan4~5_combout\;
\u_bird|ALT_INV_Mux37~0_combout\ <= NOT \u_bird|Mux37~0_combout\;
\u_mouse|ALT_INV_LessThan5~1_combout\ <= NOT \u_mouse|LessThan5~1_combout\;
\u_bird|ALT_INV_Mux24~11_combout\ <= NOT \u_bird|Mux24~11_combout\;
\u_mouse|ALT_INV_cursor_row~13_combout\ <= NOT \u_mouse|cursor_row~13_combout\;
\u_vga_sync|ALT_INV_process_0~0_combout\ <= NOT \u_vga_sync|process_0~0_combout\;
\u_vga_sync|ALT_INV_process_0~6_combout\ <= NOT \u_vga_sync|process_0~6_combout\;
\u_mouse|ALT_INV_inhibit_wait_count\(10) <= NOT \u_mouse|inhibit_wait_count\(10);
\u_mouse|ALT_INV_OUTCNT\(2) <= NOT \u_mouse|OUTCNT\(2);
\u_mouse|ALT_INV_PACKET_CHAR3\(4) <= NOT \u_mouse|PACKET_CHAR3\(4);
\u_mouse|ALT_INV_PACKET_CHAR2\(5) <= NOT \u_mouse|PACKET_CHAR2\(5);
\u_mouse|ALT_INV_PACKET_CHAR3\(1) <= NOT \u_mouse|PACKET_CHAR3\(1);
\u_mouse|ALT_INV_PACKET_CHAR3\(5) <= NOT \u_mouse|PACKET_CHAR3\(5);
\u_mouse|ALT_INV_PACKET_CHAR2\(0) <= NOT \u_mouse|PACKET_CHAR2\(0);
\u_mouse|ALT_INV_PACKET_CHAR3\(7) <= NOT \u_mouse|PACKET_CHAR3\(7);
\u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\ <= NOT \u_mouse|mouse_state.INPUT_PACKETS~q\;
\u_mouse|ALT_INV_SHIFTIN\(7) <= NOT \u_mouse|SHIFTIN\(7);
\u_mouse|ALT_INV_PACKET_CHAR2\(7) <= NOT \u_mouse|PACKET_CHAR2\(7);
\u_mouse|ALT_INV_SHIFTIN\(6) <= NOT \u_mouse|SHIFTIN\(6);
\u_mouse|ALT_INV_SHIFTIN\(5) <= NOT \u_mouse|SHIFTIN\(5);
\u_mouse|ALT_INV_SHIFTIN\(2) <= NOT \u_mouse|SHIFTIN\(2);
\u_mouse|ALT_INV_SHIFTIN\(1) <= NOT \u_mouse|SHIFTIN\(1);
\u_mouse|ALT_INV_output_ready~q\ <= NOT \u_mouse|output_ready~q\;
\u_mouse|ALT_INV_OUTCNT\(3) <= NOT \u_mouse|OUTCNT\(3);
\u_mouse|ALT_INV_inhibit_wait_count\(11) <= NOT \u_mouse|inhibit_wait_count\(11);
\u_mouse|ALT_INV_send_data~q\ <= NOT \u_mouse|send_data~q\;
\u_mouse|ALT_INV_PACKET_CHAR2\(3) <= NOT \u_mouse|PACKET_CHAR2\(3);
\u_mouse|ALT_INV_PACKET_CHAR3\(3) <= NOT \u_mouse|PACKET_CHAR3\(3);
\u_mouse|ALT_INV_PACKET_CHAR3\(6) <= NOT \u_mouse|PACKET_CHAR3\(6);
\u_mouse|ALT_INV_OUTCNT\(0) <= NOT \u_mouse|OUTCNT\(0);
\u_mouse|ALT_INV_INCNT~1_combout\ <= NOT \u_mouse|INCNT~1_combout\;
\u_mouse|ALT_INV_PACKET_CHAR2\(6) <= NOT \u_mouse|PACKET_CHAR2\(6);
\u_mouse|ALT_INV_PACKET_CHAR2\(1) <= NOT \u_mouse|PACKET_CHAR2\(1);
\u_mouse|ALT_INV_SHIFTIN\(0) <= NOT \u_mouse|SHIFTIN\(0);
\u_mouse|ALT_INV_SHIFTIN\(3) <= NOT \u_mouse|SHIFTIN\(3);
\u_mouse|ALT_INV_SHIFTOUT\(3) <= NOT \u_mouse|SHIFTOUT\(3);
\u_mouse|ALT_INV_iready_set~q\ <= NOT \u_mouse|iready_set~q\;
\u_mouse|ALT_INV_OUTCNT\(1) <= NOT \u_mouse|OUTCNT\(1);
\u_mouse|ALT_INV_PACKET_CHAR2\(4) <= NOT \u_mouse|PACKET_CHAR2\(4);
\u_mouse|ALT_INV_PACKET_CHAR2\(2) <= NOT \u_mouse|PACKET_CHAR2\(2);
\u_mouse|ALT_INV_PACKET_CHAR3\(0) <= NOT \u_mouse|PACKET_CHAR3\(0);
\u_mouse|ALT_INV_PACKET_COUNT~1_combout\ <= NOT \u_mouse|PACKET_COUNT~1_combout\;
\u_mouse|ALT_INV_send_char~q\ <= NOT \u_mouse|send_char~q\;
\u_mouse|ALT_INV_PACKET_CHAR3\(2) <= NOT \u_mouse|PACKET_CHAR3\(2);
\u_bird|ALT_INV_Mux24~22_combout\ <= NOT \u_bird|Mux24~22_combout\;
\u_bird|ALT_INV_Mux24~14_combout\ <= NOT \u_bird|Mux24~14_combout\;
\ALT_INV_reset_n~input_o\ <= NOT \reset_n~input_o\;
\u_bird|ALT_INV_LessThan3~11_combout\ <= NOT \u_bird|LessThan3~11_combout\;
\u_mouse|ALT_INV_SHIFTOUT\(5) <= NOT \u_mouse|SHIFTOUT\(5);
\u_bird|ALT_INV_process_0~4_combout\ <= NOT \u_bird|process_0~4_combout\;
\u_bird|ALT_INV_Mux24~24_combout\ <= NOT \u_bird|Mux24~24_combout\;
\u_mouse|ALT_INV_inhibit_wait_count\(4) <= NOT \u_mouse|inhibit_wait_count\(4);
\u_mouse|ALT_INV_inhibit_wait_count\(6) <= NOT \u_mouse|inhibit_wait_count\(6);
\u_mouse|ALT_INV_inhibit_wait_count\(3) <= NOT \u_mouse|inhibit_wait_count\(3);
\u_bird|ALT_INV_Mux24~23_combout\ <= NOT \u_bird|Mux24~23_combout\;
\u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\ <= NOT \u_mouse|mouse_state.WAIT_CMD_ACK~q\;
\u_mouse|ALT_INV_inhibit_wait_count\(0) <= NOT \u_mouse|inhibit_wait_count\(0);
\ALT_INV_PS2_CLK~input_o\ <= NOT \PS2_CLK~input_o\;
\u_mouse|ALT_INV_inhibit_wait_count\(8) <= NOT \u_mouse|inhibit_wait_count\(8);
\u_bird|ALT_INV_Mux24~21_combout\ <= NOT \u_bird|Mux24~21_combout\;
\u_bird|ALT_INV_Mux24~20_combout\ <= NOT \u_bird|Mux24~20_combout\;
\u_mouse|ALT_INV_inhibit_wait_count\(7) <= NOT \u_mouse|inhibit_wait_count\(7);
\u_mouse|ALT_INV_inhibit_wait_count\(9) <= NOT \u_mouse|inhibit_wait_count\(9);
\u_bird|ALT_INV_Mux24~19_combout\ <= NOT \u_bird|Mux24~19_combout\;
\ALT_INV_PS2_DAT~input_o\ <= NOT \PS2_DAT~input_o\;
\u_bird|ALT_INV_Mux24~13_combout\ <= NOT \u_bird|Mux24~13_combout\;
\u_mouse|ALT_INV_SHIFTOUT\(4) <= NOT \u_mouse|SHIFTOUT\(4);
\u_mouse|ALT_INV_inhibit_wait_count\(5) <= NOT \u_mouse|inhibit_wait_count\(5);
\u_mouse|ALT_INV_inhibit_wait_count\(2) <= NOT \u_mouse|inhibit_wait_count\(2);
\u_bird|ALT_INV_Mux24~12_combout\ <= NOT \u_bird|Mux24~12_combout\;
\u_mouse|ALT_INV_inhibit_wait_count\(1) <= NOT \u_mouse|inhibit_wait_count\(1);
\u_mouse|ALT_INV_SHIFTOUT\(9) <= NOT \u_mouse|SHIFTOUT\(9);
\u_bird|ALT_INV_bird_y_pos[29]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[29]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[21]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[21]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[20]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[20]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[6]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[6]~DUPLICATE_q\;
\u_mouse|ALT_INV_inhibit_wait_count[0]~DUPLICATE_q\ <= NOT \u_mouse|inhibit_wait_count[0]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_row[5]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_row[5]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[2]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_row[8]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_row[8]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_column[8]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_column[8]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_column[9]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_column[9]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_row[0]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_row[0]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_h_count[4]~DUPLICATE_q\ <= NOT \u_vga_sync|h_count[4]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_v_count[6]~DUPLICATE_q\ <= NOT \u_vga_sync|v_count[6]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[26]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[26]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[4]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[4]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[8]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[8]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_v_count[4]~DUPLICATE_q\ <= NOT \u_vga_sync|v_count[4]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[30]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[30]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_v_count[8]~DUPLICATE_q\ <= NOT \u_vga_sync|v_count[8]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[25]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[25]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[22]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[22]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[10]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[10]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_column[3]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_pixel_row[6]~DUPLICATE_q\ <= NOT \u_vga_sync|pixel_row[6]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[15]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[15]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[5]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[5]~DUPLICATE_q\;
\u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\ <= NOT \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_v_count[7]~DUPLICATE_q\ <= NOT \u_vga_sync|v_count[7]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[12]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[12]~DUPLICATE_q\;
\u_mouse|ALT_INV_filter[2]~DUPLICATE_q\ <= NOT \u_mouse|filter[2]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_h_count[9]~DUPLICATE_q\ <= NOT \u_vga_sync|h_count[9]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[9]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[9]~DUPLICATE_q\;
\u_bird|ALT_INV_bird_y_pos[3]~DUPLICATE_q\ <= NOT \u_bird|bird_y_pos[3]~DUPLICATE_q\;
\u_mouse|ALT_INV_filter[1]~DUPLICATE_q\ <= NOT \u_mouse|filter[1]~DUPLICATE_q\;

-- Location: IOOBUF_X18_Y45_N53
\VGA_R[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|red_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X16_Y45_N42
\VGA_R[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|red_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X16_Y45_N59
\VGA_R[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|red_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X16_Y45_N76
\VGA_R[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|red_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X22_Y45_N36
\VGA_G[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|green_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X22_Y45_N53
\VGA_G[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|green_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X20_Y45_N2
\VGA_G[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|green_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X20_Y45_N19
\VGA_G[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|green_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X14_Y45_N36
\VGA_B[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|blue_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X14_Y45_N53
\VGA_B[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|blue_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X12_Y45_N2
\VGA_B[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|blue_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X12_Y45_N19
\VGA_B[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|blue_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOOBUF_X20_Y45_N36
\VGA_HS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|horiz_sync_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X20_Y45_N53
\VGA_VS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_vga_sync|vert_sync_out~q\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: IOOBUF_X0_Y20_N5
\PS2_CLK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_mouse|mouse_state.INHIBIT_TRANS~q\,
	oe => \u_mouse|WideOr4~combout\,
	devoe => ww_devoe,
	o => PS2_CLK);

-- Location: IOOBUF_X0_Y21_N5
\PS2_DAT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_mouse|MOUSE_DATA_BUF~q\,
	oe => \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\,
	devoe => ww_devoe,
	o => PS2_DAT);

-- Location: IOIBUF_X22_Y0_N1
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: LABCELL_X16_Y19_N39
\clk25~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clk25~0_combout\ = ( !\clk25~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_clk25~q\,
	combout => \clk25~0_combout\);

-- Location: FF_X16_Y19_N38
clk25 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	asdata => \clk25~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk25~q\);

-- Location: IOIBUF_X54_Y16_N55
\reset_n~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: FF_X16_Y19_N35
\u_mouse|inhibit_wait_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|inhibit_wait_count[0]~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(0));

-- Location: LABCELL_X16_Y19_N57
\u_mouse|inhibit_wait_count[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|inhibit_wait_count[0]~0_combout\ = !\u_mouse|inhibit_wait_count\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_inhibit_wait_count\(0),
	combout => \u_mouse|inhibit_wait_count[0]~0_combout\);

-- Location: FF_X16_Y19_N34
\u_mouse|inhibit_wait_count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|inhibit_wait_count[0]~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count[0]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y19_N0
\u_mouse|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~41_sumout\ = SUM(( \u_mouse|inhibit_wait_count[0]~DUPLICATE_q\ ) + ( \u_mouse|inhibit_wait_count\(1) ) + ( !VCC ))
-- \u_mouse|Add0~42\ = CARRY(( \u_mouse|inhibit_wait_count[0]~DUPLICATE_q\ ) + ( \u_mouse|inhibit_wait_count\(1) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_inhibit_wait_count[0]~DUPLICATE_q\,
	datac => \u_mouse|ALT_INV_inhibit_wait_count\(1),
	cin => GND,
	sumout => \u_mouse|Add0~41_sumout\,
	cout => \u_mouse|Add0~42\);

-- Location: FF_X16_Y19_N2
\u_mouse|inhibit_wait_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~41_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(1));

-- Location: LABCELL_X16_Y19_N3
\u_mouse|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~37_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(2) ) + ( GND ) + ( \u_mouse|Add0~42\ ))
-- \u_mouse|Add0~38\ = CARRY(( \u_mouse|inhibit_wait_count\(2) ) + ( GND ) + ( \u_mouse|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_inhibit_wait_count\(2),
	cin => \u_mouse|Add0~42\,
	sumout => \u_mouse|Add0~37_sumout\,
	cout => \u_mouse|Add0~38\);

-- Location: FF_X16_Y19_N5
\u_mouse|inhibit_wait_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~37_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(2));

-- Location: LABCELL_X16_Y19_N6
\u_mouse|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~33_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(3) ) + ( GND ) + ( \u_mouse|Add0~38\ ))
-- \u_mouse|Add0~34\ = CARRY(( \u_mouse|inhibit_wait_count\(3) ) + ( GND ) + ( \u_mouse|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_inhibit_wait_count\(3),
	cin => \u_mouse|Add0~38\,
	sumout => \u_mouse|Add0~33_sumout\,
	cout => \u_mouse|Add0~34\);

-- Location: FF_X16_Y19_N8
\u_mouse|inhibit_wait_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~33_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(3));

-- Location: LABCELL_X16_Y19_N9
\u_mouse|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~29_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(4) ) + ( GND ) + ( \u_mouse|Add0~34\ ))
-- \u_mouse|Add0~30\ = CARRY(( \u_mouse|inhibit_wait_count\(4) ) + ( GND ) + ( \u_mouse|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_inhibit_wait_count\(4),
	cin => \u_mouse|Add0~34\,
	sumout => \u_mouse|Add0~29_sumout\,
	cout => \u_mouse|Add0~30\);

-- Location: FF_X16_Y19_N11
\u_mouse|inhibit_wait_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~29_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(4));

-- Location: LABCELL_X16_Y19_N12
\u_mouse|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~25_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(5) ) + ( GND ) + ( \u_mouse|Add0~30\ ))
-- \u_mouse|Add0~26\ = CARRY(( \u_mouse|inhibit_wait_count\(5) ) + ( GND ) + ( \u_mouse|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_inhibit_wait_count\(5),
	cin => \u_mouse|Add0~30\,
	sumout => \u_mouse|Add0~25_sumout\,
	cout => \u_mouse|Add0~26\);

-- Location: FF_X16_Y19_N14
\u_mouse|inhibit_wait_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~25_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(5));

-- Location: LABCELL_X16_Y19_N15
\u_mouse|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~21_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(6) ) + ( GND ) + ( \u_mouse|Add0~26\ ))
-- \u_mouse|Add0~22\ = CARRY(( \u_mouse|inhibit_wait_count\(6) ) + ( GND ) + ( \u_mouse|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_inhibit_wait_count\(6),
	cin => \u_mouse|Add0~26\,
	sumout => \u_mouse|Add0~21_sumout\,
	cout => \u_mouse|Add0~22\);

-- Location: FF_X16_Y19_N16
\u_mouse|inhibit_wait_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~21_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(6));

-- Location: LABCELL_X16_Y19_N18
\u_mouse|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~17_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(7) ) + ( GND ) + ( \u_mouse|Add0~22\ ))
-- \u_mouse|Add0~18\ = CARRY(( \u_mouse|inhibit_wait_count\(7) ) + ( GND ) + ( \u_mouse|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_inhibit_wait_count\(7),
	cin => \u_mouse|Add0~22\,
	sumout => \u_mouse|Add0~17_sumout\,
	cout => \u_mouse|Add0~18\);

-- Location: FF_X16_Y19_N19
\u_mouse|inhibit_wait_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~17_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(7));

-- Location: LABCELL_X16_Y19_N21
\u_mouse|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~13_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(8) ) + ( GND ) + ( \u_mouse|Add0~18\ ))
-- \u_mouse|Add0~14\ = CARRY(( \u_mouse|inhibit_wait_count\(8) ) + ( GND ) + ( \u_mouse|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_inhibit_wait_count\(8),
	cin => \u_mouse|Add0~18\,
	sumout => \u_mouse|Add0~13_sumout\,
	cout => \u_mouse|Add0~14\);

-- Location: FF_X16_Y19_N23
\u_mouse|inhibit_wait_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~13_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(8));

-- Location: LABCELL_X16_Y19_N24
\u_mouse|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~9_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(9) ) + ( GND ) + ( \u_mouse|Add0~14\ ))
-- \u_mouse|Add0~10\ = CARRY(( \u_mouse|inhibit_wait_count\(9) ) + ( GND ) + ( \u_mouse|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_inhibit_wait_count\(9),
	cin => \u_mouse|Add0~14\,
	sumout => \u_mouse|Add0~9_sumout\,
	cout => \u_mouse|Add0~10\);

-- Location: FF_X16_Y19_N25
\u_mouse|inhibit_wait_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~9_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(9));

-- Location: LABCELL_X16_Y19_N27
\u_mouse|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~5_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(10) ) + ( GND ) + ( \u_mouse|Add0~10\ ))
-- \u_mouse|Add0~6\ = CARRY(( \u_mouse|inhibit_wait_count\(10) ) + ( GND ) + ( \u_mouse|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_inhibit_wait_count\(10),
	cin => \u_mouse|Add0~10\,
	sumout => \u_mouse|Add0~5_sumout\,
	cout => \u_mouse|Add0~6\);

-- Location: FF_X16_Y19_N29
\u_mouse|inhibit_wait_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~5_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(10));

-- Location: FF_X16_Y19_N31
\u_mouse|inhibit_wait_count[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~1_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y19_N30
\u_mouse|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~1_sumout\ = SUM(( \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\ ) + ( GND ) + ( \u_mouse|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\,
	cin => \u_mouse|Add0~6\,
	sumout => \u_mouse|Add0~1_sumout\);

-- Location: FF_X16_Y19_N32
\u_mouse|inhibit_wait_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Add0~1_sumout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|inhibit_wait_count\(11));

-- Location: LABCELL_X16_Y19_N54
\u_mouse|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector0~0_combout\ = ( \u_mouse|inhibit_wait_count\(11) & ( (\u_mouse|inhibit_wait_count\(10)) # (\u_mouse|mouse_state.INHIBIT_TRANS~q\) ) ) # ( !\u_mouse|inhibit_wait_count\(11) & ( \u_mouse|mouse_state.INHIBIT_TRANS~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	datad => \u_mouse|ALT_INV_inhibit_wait_count\(10),
	dataf => \u_mouse|ALT_INV_inhibit_wait_count\(11),
	combout => \u_mouse|Selector0~0_combout\);

-- Location: FF_X17_Y19_N32
\u_mouse|mouse_state.INHIBIT_TRANS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|Selector0~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|mouse_state.INHIBIT_TRANS~q\);

-- Location: LABCELL_X16_Y19_N48
\u_mouse|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector1~0_combout\ = ( \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\ & ( (\u_mouse|inhibit_wait_count\(10) & !\u_mouse|mouse_state.INHIBIT_TRANS~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_inhibit_wait_count\(10),
	datab => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	dataf => \u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\,
	combout => \u_mouse|Selector1~0_combout\);

-- Location: FF_X16_Y19_N49
\u_mouse|mouse_state.LOAD_COMMAND\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|Selector1~0_combout\,
	clrn => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|mouse_state.LOAD_COMMAND~q\);

-- Location: FF_X16_Y19_N52
\u_mouse|mouse_state.LOAD_COMMAND2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|mouse_state.LOAD_COMMAND~q\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|mouse_state.LOAD_COMMAND2~q\);

-- Location: LABCELL_X14_Y19_N45
\u_mouse|WideOr4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|WideOr4~combout\ = ( \u_mouse|mouse_state.INHIBIT_TRANS~q\ & ( (\u_mouse|mouse_state.LOAD_COMMAND~q\) # (\u_mouse|mouse_state.LOAD_COMMAND2~q\) ) ) # ( !\u_mouse|mouse_state.INHIBIT_TRANS~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\,
	datac => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	combout => \u_mouse|WideOr4~combout\);

-- Location: IOIBUF_X0_Y20_N4
\PS2_CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => PS2_CLK,
	o => \PS2_CLK~input_o\);

-- Location: MLABCELL_X13_Y19_N21
\u_mouse|filter[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|filter[0]~feeder_combout\ = ( \PS2_CLK~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_PS2_CLK~input_o\,
	combout => \u_mouse|filter[0]~feeder_combout\);

-- Location: FF_X13_Y19_N23
\u_mouse|filter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(0));

-- Location: MLABCELL_X13_Y19_N36
\u_mouse|filter[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|filter[1]~feeder_combout\ = \u_mouse|filter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_filter\(0),
	combout => \u_mouse|filter[1]~feeder_combout\);

-- Location: FF_X13_Y19_N37
\u_mouse|filter[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter[1]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y19_N3
\u_mouse|filter[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|filter[2]~feeder_combout\ = \u_mouse|filter[1]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_filter[1]~DUPLICATE_q\,
	combout => \u_mouse|filter[2]~feeder_combout\);

-- Location: FF_X13_Y19_N4
\u_mouse|filter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter[2]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y19_N42
\u_mouse|filter[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|filter[3]~feeder_combout\ = \u_mouse|filter[2]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_filter[2]~DUPLICATE_q\,
	combout => \u_mouse|filter[3]~feeder_combout\);

-- Location: FF_X13_Y19_N44
\u_mouse|filter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(3));

-- Location: FF_X14_Y19_N49
\u_mouse|filter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(4));

-- Location: FF_X14_Y19_N13
\u_mouse|filter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(5));

-- Location: MLABCELL_X13_Y19_N0
\u_mouse|filter[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|filter[6]~feeder_combout\ = \u_mouse|filter\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_filter\(5),
	combout => \u_mouse|filter[6]~feeder_combout\);

-- Location: FF_X13_Y19_N1
\u_mouse|filter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(6));

-- Location: MLABCELL_X13_Y19_N30
\u_mouse|filter[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|filter[7]~feeder_combout\ = \u_mouse|filter\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_filter\(6),
	combout => \u_mouse|filter[7]~feeder_combout\);

-- Location: FF_X13_Y19_N32
\u_mouse|filter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(7));

-- Location: FF_X13_Y19_N5
\u_mouse|filter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(2));

-- Location: MLABCELL_X13_Y19_N51
\u_mouse|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Equal1~0_combout\ = ( \u_mouse|filter\(4) & ( (\u_mouse|filter\(2) & (\u_mouse|filter\(3) & (\u_mouse|filter[1]~DUPLICATE_q\ & \u_mouse|filter\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_filter\(2),
	datab => \u_mouse|ALT_INV_filter\(3),
	datac => \u_mouse|ALT_INV_filter[1]~DUPLICATE_q\,
	datad => \u_mouse|ALT_INV_filter\(0),
	dataf => \u_mouse|ALT_INV_filter\(4),
	combout => \u_mouse|Equal1~0_combout\);

-- Location: FF_X13_Y19_N38
\u_mouse|filter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|filter[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(1));

-- Location: MLABCELL_X13_Y19_N6
\u_mouse|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Equal2~0_combout\ = ( !\u_mouse|filter\(4) & ( (!\u_mouse|filter\(2) & (!\u_mouse|filter\(3) & (!\u_mouse|filter\(0) & !\u_mouse|filter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_filter\(2),
	datab => \u_mouse|ALT_INV_filter\(3),
	datac => \u_mouse|ALT_INV_filter\(0),
	datad => \u_mouse|ALT_INV_filter\(1),
	dataf => \u_mouse|ALT_INV_filter\(4),
	combout => \u_mouse|Equal2~0_combout\);

-- Location: MLABCELL_X13_Y19_N54
\u_mouse|MOUSE_CLK_FILTER~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|MOUSE_CLK_FILTER~0_combout\ = ( \u_mouse|filter\(5) & ( \u_mouse|Equal2~0_combout\ & ( ((\u_mouse|filter\(7) & (\u_mouse|Equal1~0_combout\ & \u_mouse|filter\(6)))) # (\u_mouse|MOUSE_CLK_FILTER~q\) ) ) ) # ( !\u_mouse|filter\(5) & ( 
-- \u_mouse|Equal2~0_combout\ & ( (\u_mouse|MOUSE_CLK_FILTER~q\ & ((\u_mouse|filter\(6)) # (\u_mouse|filter\(7)))) ) ) ) # ( \u_mouse|filter\(5) & ( !\u_mouse|Equal2~0_combout\ & ( ((\u_mouse|filter\(7) & (\u_mouse|Equal1~0_combout\ & \u_mouse|filter\(6)))) 
-- # (\u_mouse|MOUSE_CLK_FILTER~q\) ) ) ) # ( !\u_mouse|filter\(5) & ( !\u_mouse|Equal2~0_combout\ & ( \u_mouse|MOUSE_CLK_FILTER~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101011100010001010101010101010101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	datab => \u_mouse|ALT_INV_filter\(7),
	datac => \u_mouse|ALT_INV_Equal1~0_combout\,
	datad => \u_mouse|ALT_INV_filter\(6),
	datae => \u_mouse|ALT_INV_filter\(5),
	dataf => \u_mouse|ALT_INV_Equal2~0_combout\,
	combout => \u_mouse|MOUSE_CLK_FILTER~0_combout\);

-- Location: MLABCELL_X13_Y19_N33
\u_mouse|MOUSE_CLK_FILTER~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|MOUSE_CLK_FILTER~feeder_combout\ = ( \u_mouse|MOUSE_CLK_FILTER~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~0_combout\,
	combout => \u_mouse|MOUSE_CLK_FILTER~feeder_combout\);

-- Location: FF_X13_Y19_N35
\u_mouse|MOUSE_CLK_FILTER\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_mouse|MOUSE_CLK_FILTER~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|MOUSE_CLK_FILTER~q\);

-- Location: MLABCELL_X13_Y19_N27
\u_mouse|SHIFTOUT[9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[9]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \u_mouse|SHIFTOUT[9]~feeder_combout\);

-- Location: LABCELL_X14_Y21_N51
\u_mouse|OUTCNT~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~2_combout\ = ( \u_mouse|OUTCNT\(0) & ( \u_mouse|OUTCNT\(2) & ( (!\u_mouse|OUTCNT\(1) & !\u_mouse|OUTCNT\(3)) ) ) ) # ( !\u_mouse|OUTCNT\(0) & ( \u_mouse|OUTCNT\(2) & ( (\u_mouse|OUTCNT\(1) & !\u_mouse|OUTCNT\(3)) ) ) ) # ( 
-- \u_mouse|OUTCNT\(0) & ( !\u_mouse|OUTCNT\(2) & ( !\u_mouse|OUTCNT\(1) ) ) ) # ( !\u_mouse|OUTCNT\(0) & ( !\u_mouse|OUTCNT\(2) & ( (\u_mouse|OUTCNT\(1) & !\u_mouse|OUTCNT\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000101010101010101001010101000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(1),
	datad => \u_mouse|ALT_INV_OUTCNT\(3),
	datae => \u_mouse|ALT_INV_OUTCNT\(0),
	dataf => \u_mouse|ALT_INV_OUTCNT\(2),
	combout => \u_mouse|OUTCNT~2_combout\);

-- Location: LABCELL_X14_Y21_N18
\u_mouse|send_char~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|send_char~0_combout\ = ( \u_mouse|OUTCNT\(3) & ( \u_mouse|send_char~q\ ) ) # ( !\u_mouse|OUTCNT\(3) & ( \u_mouse|send_char~q\ ) ) # ( \u_mouse|OUTCNT\(3) & ( !\u_mouse|send_char~q\ & ( (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & 
-- ((\u_mouse|OUTCNT\(2)) # (\u_mouse|OUTCNT\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datac => \u_mouse|ALT_INV_OUTCNT\(1),
	datad => \u_mouse|ALT_INV_OUTCNT\(2),
	datae => \u_mouse|ALT_INV_OUTCNT\(3),
	dataf => \u_mouse|ALT_INV_send_char~q\,
	combout => \u_mouse|send_char~0_combout\);

-- Location: FF_X14_Y21_N47
\u_mouse|send_char\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|send_char~0_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|send_char~q\);

-- Location: LABCELL_X14_Y21_N36
\u_mouse|output_ready~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|output_ready~0_combout\ = ( !\u_mouse|send_char~q\ & ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	dataf => \u_mouse|ALT_INV_send_char~q\,
	combout => \u_mouse|output_ready~0_combout\);

-- Location: FF_X14_Y21_N35
\u_mouse|OUTCNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|OUTCNT~2_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|output_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|OUTCNT\(1));

-- Location: LABCELL_X14_Y21_N54
\u_mouse|OUTCNT~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~3_combout\ = ( !\u_mouse|OUTCNT\(3) & ( \u_mouse|OUTCNT\(2) & ( !\u_mouse|OUTCNT\(0) ) ) ) # ( \u_mouse|OUTCNT\(3) & ( !\u_mouse|OUTCNT\(2) & ( (!\u_mouse|OUTCNT\(0) & !\u_mouse|OUTCNT\(1)) ) ) ) # ( !\u_mouse|OUTCNT\(3) & ( 
-- !\u_mouse|OUTCNT\(2) & ( !\u_mouse|OUTCNT\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101000001010000010101010101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(0),
	datac => \u_mouse|ALT_INV_OUTCNT\(1),
	datae => \u_mouse|ALT_INV_OUTCNT\(3),
	dataf => \u_mouse|ALT_INV_OUTCNT\(2),
	combout => \u_mouse|OUTCNT~3_combout\);

-- Location: FF_X14_Y21_N53
\u_mouse|OUTCNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|OUTCNT~3_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|output_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|OUTCNT\(0));

-- Location: LABCELL_X14_Y21_N39
\u_mouse|OUTCNT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~0_combout\ = ( \u_mouse|OUTCNT\(3) & ( (!\u_mouse|OUTCNT\(1) & !\u_mouse|OUTCNT\(2)) ) ) # ( !\u_mouse|OUTCNT\(3) & ( (\u_mouse|OUTCNT\(0) & (\u_mouse|OUTCNT\(1) & \u_mouse|OUTCNT\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000111000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(0),
	datab => \u_mouse|ALT_INV_OUTCNT\(1),
	datac => \u_mouse|ALT_INV_OUTCNT\(2),
	dataf => \u_mouse|ALT_INV_OUTCNT\(3),
	combout => \u_mouse|OUTCNT~0_combout\);

-- Location: FF_X14_Y21_N50
\u_mouse|OUTCNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|OUTCNT~0_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|output_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|OUTCNT\(3));

-- Location: LABCELL_X14_Y21_N24
\u_mouse|OUTCNT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~1_combout\ = ( \u_mouse|OUTCNT\(1) & ( (!\u_mouse|OUTCNT\(3) & (!\u_mouse|OUTCNT\(2) $ (!\u_mouse|OUTCNT\(0)))) ) ) # ( !\u_mouse|OUTCNT\(1) & ( (!\u_mouse|OUTCNT\(3) & \u_mouse|OUTCNT\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000101000001010000010100000101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(3),
	datab => \u_mouse|ALT_INV_OUTCNT\(2),
	datac => \u_mouse|ALT_INV_OUTCNT\(0),
	dataf => \u_mouse|ALT_INV_OUTCNT\(1),
	combout => \u_mouse|OUTCNT~1_combout\);

-- Location: FF_X14_Y21_N59
\u_mouse|OUTCNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|OUTCNT~1_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|output_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|OUTCNT\(2));

-- Location: LABCELL_X14_Y21_N30
\u_mouse|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan0~0_combout\ = ( \u_mouse|OUTCNT\(3) & ( \u_mouse|OUTCNT\(1) ) ) # ( \u_mouse|OUTCNT\(3) & ( !\u_mouse|OUTCNT\(1) & ( \u_mouse|OUTCNT\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(2),
	datae => \u_mouse|ALT_INV_OUTCNT\(3),
	dataf => \u_mouse|ALT_INV_OUTCNT\(1),
	combout => \u_mouse|LessThan0~0_combout\);

-- Location: FF_X14_Y21_N32
\u_mouse|output_ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|LessThan0~0_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	ena => \u_mouse|output_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|output_ready~q\);

-- Location: LABCELL_X14_Y21_N12
\u_mouse|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector3~0_combout\ = ( \u_mouse|output_ready~q\ & ( \u_mouse|mouse_state.LOAD_COMMAND2~q\ ) ) # ( !\u_mouse|output_ready~q\ & ( (\u_mouse|mouse_state.LOAD_COMMAND2~q\) # (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010111110101111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datac => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\,
	dataf => \u_mouse|ALT_INV_output_ready~q\,
	combout => \u_mouse|Selector3~0_combout\);

-- Location: FF_X13_Y21_N47
\u_mouse|mouse_state.WAIT_OUTPUT_READY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|Selector3~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\);

-- Location: IOIBUF_X0_Y21_N4
\PS2_DAT~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => PS2_DAT,
	o => \PS2_DAT~input_o\);

-- Location: LABCELL_X14_Y19_N57
\u_mouse|INCNT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~0_combout\ = ( \u_mouse|INCNT\(1) & ( \u_mouse|INCNT\(2) & ( (!\u_mouse|INCNT\(3) & \u_mouse|INCNT\(0)) ) ) ) # ( !\u_mouse|INCNT\(1) & ( !\u_mouse|INCNT\(2) & ( (\u_mouse|INCNT\(3) & !\u_mouse|INCNT\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000000000000000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_INCNT\(3),
	datad => \u_mouse|ALT_INV_INCNT\(0),
	datae => \u_mouse|ALT_INV_INCNT\(1),
	dataf => \u_mouse|ALT_INV_INCNT\(2),
	combout => \u_mouse|INCNT~0_combout\);

-- Location: MLABCELL_X13_Y21_N33
\u_mouse|READ_CHAR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|READ_CHAR~0_combout\ = ( \u_mouse|READ_CHAR~q\ & ( (!\u_mouse|LessThan1~0_combout\) # (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) ) # ( !\u_mouse|READ_CHAR~q\ & ( (!\PS2_DAT~input_o\ & !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000011110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PS2_DAT~input_o\,
	datac => \u_mouse|ALT_INV_LessThan1~0_combout\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	dataf => \u_mouse|ALT_INV_READ_CHAR~q\,
	combout => \u_mouse|READ_CHAR~0_combout\);

-- Location: FF_X13_Y21_N14
\u_mouse|READ_CHAR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|READ_CHAR~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|READ_CHAR~q\);

-- Location: LABCELL_X14_Y19_N21
\u_mouse|PACKET_COUNT[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_COUNT[1]~2_combout\ = ( !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( \u_mouse|READ_CHAR~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_READ_CHAR~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|PACKET_COUNT[1]~2_combout\);

-- Location: FF_X14_Y19_N56
\u_mouse|INCNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|INCNT~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|PACKET_COUNT[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(3));

-- Location: LABCELL_X14_Y19_N42
\u_mouse|INCNT~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~2_combout\ = ( \u_mouse|INCNT\(0) & ( (!\u_mouse|INCNT\(1) & !\u_mouse|INCNT\(3)) ) ) # ( !\u_mouse|INCNT\(0) & ( (\u_mouse|INCNT\(1) & !\u_mouse|INCNT\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_INCNT\(1),
	datac => \u_mouse|ALT_INV_INCNT\(3),
	dataf => \u_mouse|ALT_INV_INCNT\(0),
	combout => \u_mouse|INCNT~2_combout\);

-- Location: FF_X14_Y19_N8
\u_mouse|INCNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|INCNT~2_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|PACKET_COUNT[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(1));

-- Location: LABCELL_X14_Y19_N6
\u_mouse|INCNT~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~3_combout\ = ( !\u_mouse|INCNT\(1) & ( \u_mouse|INCNT\(3) & ( (!\u_mouse|INCNT\(0) & !\u_mouse|INCNT\(2)) ) ) ) # ( \u_mouse|INCNT\(1) & ( !\u_mouse|INCNT\(3) & ( !\u_mouse|INCNT\(0) ) ) ) # ( !\u_mouse|INCNT\(1) & ( !\u_mouse|INCNT\(3) & ( 
-- !\u_mouse|INCNT\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_INCNT\(0),
	datad => \u_mouse|ALT_INV_INCNT\(2),
	datae => \u_mouse|ALT_INV_INCNT\(1),
	dataf => \u_mouse|ALT_INV_INCNT\(3),
	combout => \u_mouse|INCNT~3_combout\);

-- Location: FF_X14_Y19_N35
\u_mouse|INCNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|INCNT~3_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|PACKET_COUNT[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(0));

-- Location: LABCELL_X14_Y19_N24
\u_mouse|INCNT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~1_combout\ = ( \u_mouse|INCNT\(1) & ( !\u_mouse|INCNT\(3) & ( !\u_mouse|INCNT\(2) $ (!\u_mouse|INCNT\(0)) ) ) ) # ( !\u_mouse|INCNT\(1) & ( !\u_mouse|INCNT\(3) & ( \u_mouse|INCNT\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001111000011110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_INCNT\(2),
	datac => \u_mouse|ALT_INV_INCNT\(0),
	datae => \u_mouse|ALT_INV_INCNT\(1),
	dataf => \u_mouse|ALT_INV_INCNT\(3),
	combout => \u_mouse|INCNT~1_combout\);

-- Location: LABCELL_X14_Y19_N39
\u_mouse|INCNT[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT[2]~feeder_combout\ = \u_mouse|INCNT~1_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_INCNT~1_combout\,
	combout => \u_mouse|INCNT[2]~feeder_combout\);

-- Location: FF_X14_Y19_N41
\u_mouse|INCNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|INCNT[2]~feeder_combout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|PACKET_COUNT[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(2));

-- Location: LABCELL_X14_Y19_N15
\u_mouse|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan1~0_combout\ = ( \u_mouse|INCNT\(3) & ( \u_mouse|INCNT\(1) ) ) # ( \u_mouse|INCNT\(3) & ( !\u_mouse|INCNT\(1) & ( (\u_mouse|INCNT\(0)) # (\u_mouse|INCNT\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_INCNT\(2),
	datad => \u_mouse|ALT_INV_INCNT\(0),
	datae => \u_mouse|ALT_INV_INCNT\(3),
	dataf => \u_mouse|ALT_INV_INCNT\(1),
	combout => \u_mouse|LessThan1~0_combout\);

-- Location: LABCELL_X14_Y19_N30
\u_mouse|iready_set~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|iready_set~0_combout\ = ( \u_mouse|READ_CHAR~q\ & ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( \u_mouse|iready_set~q\ ) ) ) # ( !\u_mouse|READ_CHAR~q\ & ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( \u_mouse|iready_set~q\ ) ) ) # ( 
-- \u_mouse|READ_CHAR~q\ & ( !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( (!\reset_n~input_o\ & ((\u_mouse|iready_set~q\))) # (\reset_n~input_o\ & (\u_mouse|LessThan1~0_combout\)) ) ) ) # ( !\u_mouse|READ_CHAR~q\ & ( 
-- !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( (\u_mouse|iready_set~q\ & ((!\reset_n~input_o\) # (\PS2_DAT~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110101000000111111001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PS2_DAT~input_o\,
	datab => \u_mouse|ALT_INV_LessThan1~0_combout\,
	datac => \ALT_INV_reset_n~input_o\,
	datad => \u_mouse|ALT_INV_iready_set~q\,
	datae => \u_mouse|ALT_INV_READ_CHAR~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|iready_set~0_combout\);

-- Location: FF_X14_Y19_N44
\u_mouse|iready_set\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|iready_set~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|iready_set~q\);

-- Location: LABCELL_X14_Y19_N0
\u_mouse|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector4~0_combout\ = ( \u_mouse|output_ready~q\ & ( ((!\u_mouse|iready_set~q\ & \u_mouse|mouse_state.WAIT_CMD_ACK~q\)) # (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) ) # ( !\u_mouse|output_ready~q\ & ( (!\u_mouse|iready_set~q\ & 
-- \u_mouse|mouse_state.WAIT_CMD_ACK~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110001010101110111010101010111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datab => \u_mouse|ALT_INV_iready_set~q\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\,
	dataf => \u_mouse|ALT_INV_output_ready~q\,
	combout => \u_mouse|Selector4~0_combout\);

-- Location: FF_X14_Y19_N4
\u_mouse|mouse_state.WAIT_CMD_ACK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|Selector4~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|mouse_state.WAIT_CMD_ACK~q\);

-- Location: LABCELL_X14_Y19_N3
\u_mouse|mouse_state.INPUT_PACKETS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|mouse_state.INPUT_PACKETS~0_combout\ = ( \u_mouse|iready_set~q\ & ( (\u_mouse|mouse_state.WAIT_CMD_ACK~q\) # (\u_mouse|mouse_state.INPUT_PACKETS~q\) ) ) # ( !\u_mouse|iready_set~q\ & ( \u_mouse|mouse_state.INPUT_PACKETS~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\,
	dataf => \u_mouse|ALT_INV_iready_set~q\,
	combout => \u_mouse|mouse_state.INPUT_PACKETS~0_combout\);

-- Location: FF_X14_Y19_N19
\u_mouse|mouse_state.INPUT_PACKETS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|mouse_state.INPUT_PACKETS~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|mouse_state.INPUT_PACKETS~q\);

-- Location: LABCELL_X14_Y19_N18
\u_mouse|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector6~0_combout\ = ( \u_mouse|mouse_state.INHIBIT_TRANS~q\ & ( (((\u_mouse|send_data~q\ & \u_mouse|mouse_state.INPUT_PACKETS~q\)) # (\u_mouse|mouse_state.LOAD_COMMAND2~q\)) # (\u_mouse|mouse_state.LOAD_COMMAND~q\) ) ) # ( 
-- !\u_mouse|mouse_state.INHIBIT_TRANS~q\ & ( ((\u_mouse|mouse_state.LOAD_COMMAND2~q\) # (\u_mouse|mouse_state.LOAD_COMMAND~q\)) # (\u_mouse|send_data~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111100111111011111110011111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_send_data~q\,
	datab => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\,
	datac => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\,
	datad => \u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	combout => \u_mouse|Selector6~0_combout\);

-- Location: FF_X14_Y19_N29
\u_mouse|send_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|Selector6~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|send_data~q\);

-- Location: LABCELL_X14_Y21_N6
\u_mouse|MOUSE_DATA_BUF~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|MOUSE_DATA_BUF~0_combout\ = ( \u_mouse|OUTCNT\(2) & ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( (!\u_mouse|OUTCNT\(3) & !\u_mouse|send_char~q\) ) ) ) # ( !\u_mouse|OUTCNT\(2) & ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( 
-- (!\u_mouse|send_char~q\ & ((!\u_mouse|OUTCNT\(3)) # (!\u_mouse|OUTCNT\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(3),
	datac => \u_mouse|ALT_INV_OUTCNT\(1),
	datad => \u_mouse|ALT_INV_send_char~q\,
	datae => \u_mouse|ALT_INV_OUTCNT\(2),
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|MOUSE_DATA_BUF~0_combout\);

-- Location: FF_X13_Y19_N28
\u_mouse|SHIFTOUT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|SHIFTOUT[9]~feeder_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(9));

-- Location: MLABCELL_X13_Y19_N24
\u_mouse|SHIFTOUT[8]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[8]~3_combout\ = ( !\u_mouse|SHIFTOUT\(9) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_mouse|ALT_INV_SHIFTOUT\(9),
	combout => \u_mouse|SHIFTOUT[8]~3_combout\);

-- Location: FF_X13_Y19_N25
\u_mouse|SHIFTOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|SHIFTOUT[8]~3_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(8));

-- Location: FF_X13_Y19_N58
\u_mouse|SHIFTOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTOUT\(8),
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(7));

-- Location: FF_X13_Y19_N56
\u_mouse|SHIFTOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTOUT\(7),
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(6));

-- Location: FF_X13_Y19_N17
\u_mouse|SHIFTOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTOUT\(6),
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(5));

-- Location: MLABCELL_X13_Y19_N12
\u_mouse|SHIFTOUT[4]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[4]~2_combout\ = ( !\u_mouse|SHIFTOUT\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_mouse|ALT_INV_SHIFTOUT\(5),
	combout => \u_mouse|SHIFTOUT[4]~2_combout\);

-- Location: FF_X13_Y19_N13
\u_mouse|SHIFTOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|SHIFTOUT[4]~2_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(4));

-- Location: MLABCELL_X13_Y19_N9
\u_mouse|SHIFTOUT[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[3]~1_combout\ = !\u_mouse|SHIFTOUT\(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_SHIFTOUT\(4),
	combout => \u_mouse|SHIFTOUT[3]~1_combout\);

-- Location: FF_X13_Y19_N11
\u_mouse|SHIFTOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|SHIFTOUT[3]~1_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(3));

-- Location: MLABCELL_X13_Y19_N48
\u_mouse|SHIFTOUT[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[2]~0_combout\ = !\u_mouse|SHIFTOUT\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_SHIFTOUT\(3),
	combout => \u_mouse|SHIFTOUT[2]~0_combout\);

-- Location: FF_X13_Y19_N49
\u_mouse|SHIFTOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|SHIFTOUT[2]~0_combout\,
	clrn => \u_mouse|ALT_INV_send_data~q\,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(2));

-- Location: FF_X13_Y19_N52
\u_mouse|SHIFTOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTOUT\(2),
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTOUT\(1));

-- Location: FF_X13_Y19_N7
\u_mouse|MOUSE_DATA_BUF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTOUT\(1),
	clrn => \u_mouse|ALT_INV_send_data~q\,
	sload => VCC,
	ena => \u_mouse|MOUSE_DATA_BUF~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|MOUSE_DATA_BUF~q\);

-- Location: LABCELL_X17_Y19_N30
\u_vga_sync|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~21_sumout\ = SUM(( \u_vga_sync|v_count\(0) ) + ( VCC ) + ( !VCC ))
-- \u_vga_sync|Add1~22\ = CARRY(( \u_vga_sync|v_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(0),
	cin => GND,
	sumout => \u_vga_sync|Add1~21_sumout\,
	cout => \u_vga_sync|Add1~22\);

-- Location: LABCELL_X16_Y18_N30
\u_vga_sync|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~29_sumout\ = SUM(( \u_vga_sync|h_count\(0) ) + ( VCC ) + ( !VCC ))
-- \u_vga_sync|Add0~30\ = CARRY(( \u_vga_sync|h_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(0),
	cin => GND,
	sumout => \u_vga_sync|Add0~29_sumout\,
	cout => \u_vga_sync|Add0~30\);

-- Location: LABCELL_X16_Y18_N51
\u_vga_sync|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~5_sumout\ = SUM(( \u_vga_sync|h_count\(7) ) + ( GND ) + ( \u_vga_sync|Add0~14\ ))
-- \u_vga_sync|Add0~6\ = CARRY(( \u_vga_sync|h_count\(7) ) + ( GND ) + ( \u_vga_sync|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(7),
	cin => \u_vga_sync|Add0~14\,
	sumout => \u_vga_sync|Add0~5_sumout\,
	cout => \u_vga_sync|Add0~6\);

-- Location: LABCELL_X16_Y18_N54
\u_vga_sync|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~9_sumout\ = SUM(( \u_vga_sync|h_count\(8) ) + ( GND ) + ( \u_vga_sync|Add0~6\ ))
-- \u_vga_sync|Add0~10\ = CARRY(( \u_vga_sync|h_count\(8) ) + ( GND ) + ( \u_vga_sync|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_h_count\(8),
	cin => \u_vga_sync|Add0~6\,
	sumout => \u_vga_sync|Add0~9_sumout\,
	cout => \u_vga_sync|Add0~10\);

-- Location: FF_X16_Y18_N14
\u_vga_sync|h_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~9_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(8));

-- Location: FF_X16_Y18_N28
\u_vga_sync|h_count[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~1_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count[9]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y18_N57
\u_vga_sync|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~1_sumout\ = SUM(( \u_vga_sync|h_count[9]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count[9]~DUPLICATE_q\,
	cin => \u_vga_sync|Add0~10\,
	sumout => \u_vga_sync|Add0~1_sumout\);

-- Location: FF_X16_Y18_N29
\u_vga_sync|h_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~1_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(9));

-- Location: FF_X16_Y18_N8
\u_vga_sync|h_count[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~21_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count[4]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y18_N24
\u_vga_sync|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Equal0~0_combout\ = ( !\u_vga_sync|h_count\(6) & ( \u_vga_sync|h_count\(3) & ( (\u_vga_sync|h_count\(9) & (\u_vga_sync|h_count\(1) & (\u_vga_sync|h_count\(0) & \u_vga_sync|h_count[4]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(9),
	datab => \u_vga_sync|ALT_INV_h_count\(1),
	datac => \u_vga_sync|ALT_INV_h_count\(0),
	datad => \u_vga_sync|ALT_INV_h_count[4]~DUPLICATE_q\,
	datae => \u_vga_sync|ALT_INV_h_count\(6),
	dataf => \u_vga_sync|ALT_INV_h_count\(3),
	combout => \u_vga_sync|Equal0~0_combout\);

-- Location: LABCELL_X16_Y18_N0
\u_vga_sync|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Equal0~1_combout\ = ( \u_vga_sync|Equal0~0_combout\ & ( (!\u_vga_sync|h_count\(7) & (\u_vga_sync|h_count\(8) & (\u_vga_sync|h_count\(2) & !\u_vga_sync|h_count\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(7),
	datab => \u_vga_sync|ALT_INV_h_count\(8),
	datac => \u_vga_sync|ALT_INV_h_count\(2),
	datad => \u_vga_sync|ALT_INV_h_count\(5),
	dataf => \u_vga_sync|ALT_INV_Equal0~0_combout\,
	combout => \u_vga_sync|Equal0~1_combout\);

-- Location: FF_X16_Y18_N5
\u_vga_sync|h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~29_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(0));

-- Location: LABCELL_X16_Y18_N33
\u_vga_sync|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~33_sumout\ = SUM(( \u_vga_sync|h_count\(1) ) + ( GND ) + ( \u_vga_sync|Add0~30\ ))
-- \u_vga_sync|Add0~34\ = CARRY(( \u_vga_sync|h_count\(1) ) + ( GND ) + ( \u_vga_sync|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(1),
	cin => \u_vga_sync|Add0~30\,
	sumout => \u_vga_sync|Add0~33_sumout\,
	cout => \u_vga_sync|Add0~34\);

-- Location: FF_X16_Y18_N11
\u_vga_sync|h_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~33_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(1));

-- Location: LABCELL_X16_Y18_N36
\u_vga_sync|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~37_sumout\ = SUM(( \u_vga_sync|h_count\(2) ) + ( GND ) + ( \u_vga_sync|Add0~34\ ))
-- \u_vga_sync|Add0~38\ = CARRY(( \u_vga_sync|h_count\(2) ) + ( GND ) + ( \u_vga_sync|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(2),
	cin => \u_vga_sync|Add0~34\,
	sumout => \u_vga_sync|Add0~37_sumout\,
	cout => \u_vga_sync|Add0~38\);

-- Location: FF_X16_Y18_N23
\u_vga_sync|h_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~37_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(2));

-- Location: LABCELL_X16_Y18_N39
\u_vga_sync|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~17_sumout\ = SUM(( \u_vga_sync|h_count\(3) ) + ( GND ) + ( \u_vga_sync|Add0~38\ ))
-- \u_vga_sync|Add0~18\ = CARRY(( \u_vga_sync|h_count\(3) ) + ( GND ) + ( \u_vga_sync|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count\(3),
	cin => \u_vga_sync|Add0~38\,
	sumout => \u_vga_sync|Add0~17_sumout\,
	cout => \u_vga_sync|Add0~18\);

-- Location: FF_X16_Y18_N17
\u_vga_sync|h_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~17_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(3));

-- Location: LABCELL_X16_Y18_N42
\u_vga_sync|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~21_sumout\ = SUM(( \u_vga_sync|h_count\(4) ) + ( GND ) + ( \u_vga_sync|Add0~18\ ))
-- \u_vga_sync|Add0~22\ = CARRY(( \u_vga_sync|h_count\(4) ) + ( GND ) + ( \u_vga_sync|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count\(4),
	cin => \u_vga_sync|Add0~18\,
	sumout => \u_vga_sync|Add0~21_sumout\,
	cout => \u_vga_sync|Add0~22\);

-- Location: FF_X16_Y18_N7
\u_vga_sync|h_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~21_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(4));

-- Location: LABCELL_X16_Y18_N45
\u_vga_sync|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~25_sumout\ = SUM(( \u_vga_sync|h_count\(5) ) + ( GND ) + ( \u_vga_sync|Add0~22\ ))
-- \u_vga_sync|Add0~26\ = CARRY(( \u_vga_sync|h_count\(5) ) + ( GND ) + ( \u_vga_sync|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(5),
	cin => \u_vga_sync|Add0~22\,
	sumout => \u_vga_sync|Add0~25_sumout\,
	cout => \u_vga_sync|Add0~26\);

-- Location: FF_X16_Y18_N2
\u_vga_sync|h_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~25_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(5));

-- Location: LABCELL_X16_Y18_N48
\u_vga_sync|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~13_sumout\ = SUM(( \u_vga_sync|h_count\(6) ) + ( GND ) + ( \u_vga_sync|Add0~26\ ))
-- \u_vga_sync|Add0~14\ = CARRY(( \u_vga_sync|h_count\(6) ) + ( GND ) + ( \u_vga_sync|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(6),
	cin => \u_vga_sync|Add0~26\,
	sumout => \u_vga_sync|Add0~13_sumout\,
	cout => \u_vga_sync|Add0~14\);

-- Location: FF_X16_Y18_N26
\u_vga_sync|h_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~13_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(6));

-- Location: FF_X16_Y18_N20
\u_vga_sync|h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add0~5_sumout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(7));

-- Location: LABCELL_X16_Y18_N15
\u_vga_sync|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|LessThan1~0_combout\ = ( \u_vga_sync|h_count\(1) & ( (!\u_vga_sync|h_count\(2) & !\u_vga_sync|h_count\(0)) ) ) # ( !\u_vga_sync|h_count\(1) & ( !\u_vga_sync|h_count\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(2),
	datac => \u_vga_sync|ALT_INV_h_count\(0),
	dataf => \u_vga_sync|ALT_INV_h_count\(1),
	combout => \u_vga_sync|LessThan1~0_combout\);

-- Location: LABCELL_X16_Y18_N9
\u_vga_sync|process_0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~4_combout\ = ( \u_vga_sync|h_count\(4) & ( \u_vga_sync|LessThan1~0_combout\ & ( !\u_vga_sync|h_count\(6) ) ) ) # ( !\u_vga_sync|h_count\(4) & ( \u_vga_sync|LessThan1~0_combout\ & ( !\u_vga_sync|h_count\(6) ) ) ) # ( 
-- \u_vga_sync|h_count\(4) & ( !\u_vga_sync|LessThan1~0_combout\ & ( (!\u_vga_sync|h_count\(6) & ((!\u_vga_sync|h_count\(5)) # (!\u_vga_sync|h_count\(3)))) ) ) ) # ( !\u_vga_sync|h_count\(4) & ( !\u_vga_sync|LessThan1~0_combout\ & ( !\u_vga_sync|h_count\(6) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110010001100100011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(5),
	datab => \u_vga_sync|ALT_INV_h_count\(6),
	datac => \u_vga_sync|ALT_INV_h_count\(3),
	datae => \u_vga_sync|ALT_INV_h_count\(4),
	dataf => \u_vga_sync|ALT_INV_LessThan1~0_combout\,
	combout => \u_vga_sync|process_0~4_combout\);

-- Location: LABCELL_X17_Y19_N39
\u_vga_sync|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~33_sumout\ = SUM(( \u_vga_sync|v_count\(3) ) + ( GND ) + ( \u_vga_sync|Add1~30\ ))
-- \u_vga_sync|Add1~34\ = CARRY(( \u_vga_sync|v_count\(3) ) + ( GND ) + ( \u_vga_sync|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_v_count\(3),
	cin => \u_vga_sync|Add1~30\,
	sumout => \u_vga_sync|Add1~33_sumout\,
	cout => \u_vga_sync|Add1~34\);

-- Location: LABCELL_X17_Y19_N42
\u_vga_sync|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~37_sumout\ = SUM(( \u_vga_sync|v_count[4]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~34\ ))
-- \u_vga_sync|Add1~38\ = CARRY(( \u_vga_sync|v_count[4]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_v_count[4]~DUPLICATE_q\,
	cin => \u_vga_sync|Add1~34\,
	sumout => \u_vga_sync|Add1~37_sumout\,
	cout => \u_vga_sync|Add1~38\);

-- Location: LABCELL_X16_Y18_N12
\u_vga_sync|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Equal1~0_combout\ = ( \u_vga_sync|Equal0~0_combout\ & ( (!\u_vga_sync|h_count\(2) & (\u_vga_sync|h_count\(5) & (\u_vga_sync|h_count\(7) & !\u_vga_sync|h_count\(8)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(2),
	datab => \u_vga_sync|ALT_INV_h_count\(5),
	datac => \u_vga_sync|ALT_INV_h_count\(7),
	datad => \u_vga_sync|ALT_INV_h_count\(8),
	dataf => \u_vga_sync|ALT_INV_Equal0~0_combout\,
	combout => \u_vga_sync|Equal1~0_combout\);

-- Location: LABCELL_X17_Y19_N6
\u_vga_sync|v_count[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[4]~0_combout\ = ( \u_vga_sync|Equal1~0_combout\ & ( \u_vga_sync|process_0~4_combout\ ) ) # ( !\u_vga_sync|Equal1~0_combout\ & ( \u_vga_sync|process_0~4_combout\ & ( (\u_vga_sync|h_count\(8) & \u_vga_sync|process_0~6_combout\) ) ) ) # ( 
-- \u_vga_sync|Equal1~0_combout\ & ( !\u_vga_sync|process_0~4_combout\ ) ) # ( !\u_vga_sync|Equal1~0_combout\ & ( !\u_vga_sync|process_0~4_combout\ & ( (\u_vga_sync|process_0~6_combout\ & ((\u_vga_sync|h_count\(8)) # (\u_vga_sync|h_count\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001110111111111111111111100000000001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(7),
	datab => \u_vga_sync|ALT_INV_h_count\(8),
	datad => \u_vga_sync|ALT_INV_process_0~6_combout\,
	datae => \u_vga_sync|ALT_INV_Equal1~0_combout\,
	dataf => \u_vga_sync|ALT_INV_process_0~4_combout\,
	combout => \u_vga_sync|v_count[4]~0_combout\);

-- Location: FF_X17_Y19_N2
\u_vga_sync|v_count[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~37_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count[4]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y19_N45
\u_vga_sync|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~9_sumout\ = SUM(( \u_vga_sync|v_count\(5) ) + ( GND ) + ( \u_vga_sync|Add1~38\ ))
-- \u_vga_sync|Add1~10\ = CARRY(( \u_vga_sync|v_count\(5) ) + ( GND ) + ( \u_vga_sync|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_v_count\(5),
	cin => \u_vga_sync|Add1~38\,
	sumout => \u_vga_sync|Add1~9_sumout\,
	cout => \u_vga_sync|Add1~10\);

-- Location: FF_X17_Y19_N5
\u_vga_sync|v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~9_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(5));

-- Location: LABCELL_X17_Y19_N48
\u_vga_sync|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~5_sumout\ = SUM(( \u_vga_sync|v_count[6]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~10\ ))
-- \u_vga_sync|Add1~6\ = CARRY(( \u_vga_sync|v_count[6]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_v_count[6]~DUPLICATE_q\,
	cin => \u_vga_sync|Add1~10\,
	sumout => \u_vga_sync|Add1~5_sumout\,
	cout => \u_vga_sync|Add1~6\);

-- Location: LABCELL_X17_Y19_N18
\u_vga_sync|v_count[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[6]~feeder_combout\ = ( \u_vga_sync|Add1~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add1~5_sumout\,
	combout => \u_vga_sync|v_count[6]~feeder_combout\);

-- Location: FF_X17_Y19_N20
\u_vga_sync|v_count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[6]~feeder_combout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count[6]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y19_N51
\u_vga_sync|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~13_sumout\ = SUM(( \u_vga_sync|v_count[7]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~6\ ))
-- \u_vga_sync|Add1~14\ = CARRY(( \u_vga_sync|v_count[7]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count[7]~DUPLICATE_q\,
	cin => \u_vga_sync|Add1~6\,
	sumout => \u_vga_sync|Add1~13_sumout\,
	cout => \u_vga_sync|Add1~14\);

-- Location: LABCELL_X17_Y19_N21
\u_vga_sync|v_count[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[7]~feeder_combout\ = ( \u_vga_sync|Add1~13_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add1~13_sumout\,
	combout => \u_vga_sync|v_count[7]~feeder_combout\);

-- Location: FF_X17_Y19_N23
\u_vga_sync|v_count[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[7]~feeder_combout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count[7]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y19_N54
\u_vga_sync|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~17_sumout\ = SUM(( \u_vga_sync|v_count[8]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~14\ ))
-- \u_vga_sync|Add1~18\ = CARRY(( \u_vga_sync|v_count[8]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count[8]~DUPLICATE_q\,
	cin => \u_vga_sync|Add1~14\,
	sumout => \u_vga_sync|Add1~17_sumout\,
	cout => \u_vga_sync|Add1~18\);

-- Location: FF_X17_Y19_N11
\u_vga_sync|v_count[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~17_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count[8]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y19_N3
\u_vga_sync|process_0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~5_combout\ = ( !\u_vga_sync|v_count\(5) & ( !\u_vga_sync|v_count[6]~DUPLICATE_q\ & ( (!\u_vga_sync|v_count[7]~DUPLICATE_q\ & (!\u_vga_sync|v_count[8]~DUPLICATE_q\ & !\u_vga_sync|v_count[4]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_v_count[7]~DUPLICATE_q\,
	datac => \u_vga_sync|ALT_INV_v_count[8]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_v_count[4]~DUPLICATE_q\,
	datae => \u_vga_sync|ALT_INV_v_count\(5),
	dataf => \u_vga_sync|ALT_INV_v_count[6]~DUPLICATE_q\,
	combout => \u_vga_sync|process_0~5_combout\);

-- Location: LABCELL_X17_Y19_N57
\u_vga_sync|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~1_sumout\ = SUM(( \u_vga_sync|v_count\(9) ) + ( GND ) + ( \u_vga_sync|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_v_count\(9),
	cin => \u_vga_sync|Add1~18\,
	sumout => \u_vga_sync|Add1~1_sumout\);

-- Location: LABCELL_X17_Y19_N15
\u_vga_sync|v_count[9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[9]~feeder_combout\ = \u_vga_sync|Add1~1_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_Add1~1_sumout\,
	combout => \u_vga_sync|v_count[9]~feeder_combout\);

-- Location: FF_X17_Y19_N16
\u_vga_sync|v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[9]~feeder_combout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(9));

-- Location: LABCELL_X17_Y19_N12
\u_vga_sync|process_0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~6_combout\ = ( \u_vga_sync|v_count\(9) & ( (\u_vga_sync|h_count[9]~DUPLICATE_q\ & ((!\u_vga_sync|process_0~5_combout\) # ((\u_vga_sync|v_count\(3) & \u_vga_sync|v_count\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000010000111100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_v_count\(3),
	datab => \u_vga_sync|ALT_INV_v_count\(2),
	datac => \u_vga_sync|ALT_INV_h_count[9]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_process_0~5_combout\,
	dataf => \u_vga_sync|ALT_INV_v_count\(9),
	combout => \u_vga_sync|process_0~6_combout\);

-- Location: LABCELL_X16_Y18_N3
\u_vga_sync|process_0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~7_combout\ = ( \u_vga_sync|process_0~6_combout\ & ( ((\u_vga_sync|h_count\(7) & !\u_vga_sync|process_0~4_combout\)) # (\u_vga_sync|h_count\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110011011100110111001101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(7),
	datab => \u_vga_sync|ALT_INV_h_count\(8),
	datac => \u_vga_sync|ALT_INV_process_0~4_combout\,
	dataf => \u_vga_sync|ALT_INV_process_0~6_combout\,
	combout => \u_vga_sync|process_0~7_combout\);

-- Location: FF_X17_Y19_N14
\u_vga_sync|v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~21_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(0));

-- Location: LABCELL_X17_Y19_N33
\u_vga_sync|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~25_sumout\ = SUM(( \u_vga_sync|v_count\(1) ) + ( GND ) + ( \u_vga_sync|Add1~22\ ))
-- \u_vga_sync|Add1~26\ = CARRY(( \u_vga_sync|v_count\(1) ) + ( GND ) + ( \u_vga_sync|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(1),
	cin => \u_vga_sync|Add1~22\,
	sumout => \u_vga_sync|Add1~25_sumout\,
	cout => \u_vga_sync|Add1~26\);

-- Location: FF_X17_Y19_N53
\u_vga_sync|v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~25_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(1));

-- Location: LABCELL_X17_Y19_N36
\u_vga_sync|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~29_sumout\ = SUM(( \u_vga_sync|v_count\(2) ) + ( GND ) + ( \u_vga_sync|Add1~26\ ))
-- \u_vga_sync|Add1~30\ = CARRY(( \u_vga_sync|v_count\(2) ) + ( GND ) + ( \u_vga_sync|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(2),
	cin => \u_vga_sync|Add1~26\,
	sumout => \u_vga_sync|Add1~29_sumout\,
	cout => \u_vga_sync|Add1~30\);

-- Location: FF_X17_Y19_N17
\u_vga_sync|v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~29_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(2));

-- Location: FF_X17_Y19_N8
\u_vga_sync|v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~33_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(3));

-- Location: FF_X17_Y19_N1
\u_vga_sync|v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~37_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(4));

-- Location: LABCELL_X19_Y19_N51
\u_vga_sync|process_0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~2_combout\ = ( !\u_vga_sync|v_count\(9) & ( \u_vga_sync|v_count\(0) & ( (!\u_vga_sync|v_count\(1) & !\u_vga_sync|v_count\(4)) ) ) ) # ( !\u_vga_sync|v_count\(9) & ( !\u_vga_sync|v_count\(0) & ( (\u_vga_sync|v_count\(1) & 
-- !\u_vga_sync|v_count\(4)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000011000000110000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(1),
	datac => \u_vga_sync|ALT_INV_v_count\(4),
	datae => \u_vga_sync|ALT_INV_v_count\(9),
	dataf => \u_vga_sync|ALT_INV_v_count\(0),
	combout => \u_vga_sync|process_0~2_combout\);

-- Location: FF_X17_Y19_N10
\u_vga_sync|v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~17_sumout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(8));

-- Location: FF_X17_Y19_N22
\u_vga_sync|v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[7]~feeder_combout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(7));

-- Location: FF_X17_Y19_N19
\u_vga_sync|v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[6]~feeder_combout\,
	sclr => \u_vga_sync|process_0~7_combout\,
	ena => \u_vga_sync|v_count[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(6));

-- Location: MLABCELL_X18_Y19_N15
\u_vga_sync|LessThan7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|LessThan7~1_combout\ = ( \u_vga_sync|v_count\(6) & ( (\u_vga_sync|v_count\(5) & (\u_vga_sync|v_count\(8) & \u_vga_sync|v_count\(7))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_v_count\(5),
	datac => \u_vga_sync|ALT_INV_v_count\(8),
	datad => \u_vga_sync|ALT_INV_v_count\(7),
	dataf => \u_vga_sync|ALT_INV_v_count\(6),
	combout => \u_vga_sync|LessThan7~1_combout\);

-- Location: MLABCELL_X18_Y19_N12
\u_vga_sync|process_0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~3_combout\ = ( \u_vga_sync|LessThan7~1_combout\ & ( (!\u_vga_sync|v_count\(3)) # ((!\u_vga_sync|process_0~2_combout\) # (!\u_vga_sync|v_count\(2))) ) ) # ( !\u_vga_sync|LessThan7~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111001111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(3),
	datac => \u_vga_sync|ALT_INV_process_0~2_combout\,
	datad => \u_vga_sync|ALT_INV_v_count\(2),
	dataf => \u_vga_sync|ALT_INV_LessThan7~1_combout\,
	combout => \u_vga_sync|process_0~3_combout\);

-- Location: FF_X17_Y19_N38
\u_vga_sync|vert_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|process_0~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|vert_sync~q\);

-- Location: FF_X17_Y21_N59
\u_vga_sync|vert_sync_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|vert_sync~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|vert_sync_out~q\);

-- Location: LABCELL_X16_Y22_N24
\u_bird|bird_y_pos[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|bird_y_pos[1]~0_combout\ = !\u_bird|bird_y_pos\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(1),
	combout => \u_bird|bird_y_pos[1]~0_combout\);

-- Location: FF_X16_Y22_N1
\u_bird|bird_y_pos[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	asdata => \u_bird|bird_y_pos[1]~0_combout\,
	sload => VCC,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(1));

-- Location: LABCELL_X17_Y22_N0
\u_bird|Add3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~1_sumout\ = SUM(( \u_bird|bird_y_pos\(1) ) + ( \u_bird|bird_y_pos\(2) ) + ( !VCC ))
-- \u_bird|Add3~2\ = CARRY(( \u_bird|bird_y_pos\(1) ) + ( \u_bird|bird_y_pos\(2) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(2),
	datad => \u_bird|ALT_INV_bird_y_pos\(1),
	cin => GND,
	sumout => \u_bird|Add3~1_sumout\,
	cout => \u_bird|Add3~2\);

-- Location: FF_X17_Y22_N1
\u_bird|bird_y_pos[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~1_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(2));

-- Location: LABCELL_X17_Y22_N3
\u_bird|Add3~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~101_sumout\ = SUM(( !\u_bird|bird_y_pos\(3) ) + ( GND ) + ( \u_bird|Add3~2\ ))
-- \u_bird|Add3~102\ = CARRY(( !\u_bird|bird_y_pos\(3) ) + ( GND ) + ( \u_bird|Add3~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(3),
	cin => \u_bird|Add3~2\,
	sumout => \u_bird|Add3~101_sumout\,
	cout => \u_bird|Add3~102\);

-- Location: LABCELL_X16_Y22_N12
\u_bird|bird_y_pos[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|bird_y_pos[3]~1_combout\ = ( !\u_bird|Add3~101_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_bird|ALT_INV_Add3~101_sumout\,
	combout => \u_bird|bird_y_pos[3]~1_combout\);

-- Location: FF_X16_Y22_N14
\u_bird|bird_y_pos[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|bird_y_pos[3]~1_combout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(3));

-- Location: LABCELL_X17_Y22_N6
\u_bird|Add3~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~97_sumout\ = SUM(( \u_bird|bird_y_pos[4]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~102\ ))
-- \u_bird|Add3~98\ = CARRY(( \u_bird|bird_y_pos[4]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[4]~DUPLICATE_q\,
	cin => \u_bird|Add3~102\,
	sumout => \u_bird|Add3~97_sumout\,
	cout => \u_bird|Add3~98\);

-- Location: FF_X17_Y22_N7
\u_bird|bird_y_pos[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~97_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[4]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y22_N9
\u_bird|Add3~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~117_sumout\ = SUM(( \u_bird|bird_y_pos[5]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~98\ ))
-- \u_bird|Add3~118\ = CARRY(( \u_bird|bird_y_pos[5]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos[5]~DUPLICATE_q\,
	cin => \u_bird|Add3~98\,
	sumout => \u_bird|Add3~117_sumout\,
	cout => \u_bird|Add3~118\);

-- Location: FF_X17_Y22_N11
\u_bird|bird_y_pos[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~117_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[5]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y22_N12
\u_bird|Add3~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~105_sumout\ = SUM(( !\u_bird|bird_y_pos\(6) ) + ( GND ) + ( \u_bird|Add3~118\ ))
-- \u_bird|Add3~106\ = CARRY(( !\u_bird|bird_y_pos\(6) ) + ( GND ) + ( \u_bird|Add3~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(6),
	cin => \u_bird|Add3~118\,
	sumout => \u_bird|Add3~105_sumout\,
	cout => \u_bird|Add3~106\);

-- Location: LABCELL_X17_Y21_N33
\u_bird|bird_y_pos[6]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|bird_y_pos[6]~2_combout\ = ( !\u_bird|Add3~105_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_bird|ALT_INV_Add3~105_sumout\,
	combout => \u_bird|bird_y_pos[6]~2_combout\);

-- Location: FF_X17_Y21_N35
\u_bird|bird_y_pos[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|bird_y_pos[6]~2_combout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(6));

-- Location: LABCELL_X17_Y22_N15
\u_bird|Add3~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~113_sumout\ = SUM(( !\u_bird|bird_y_pos\(7) ) + ( GND ) + ( \u_bird|Add3~106\ ))
-- \u_bird|Add3~114\ = CARRY(( !\u_bird|bird_y_pos\(7) ) + ( GND ) + ( \u_bird|Add3~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(7),
	cin => \u_bird|Add3~106\,
	sumout => \u_bird|Add3~113_sumout\,
	cout => \u_bird|Add3~114\);

-- Location: LABCELL_X17_Y21_N39
\u_bird|bird_y_pos[7]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|bird_y_pos[7]~3_combout\ = ( !\u_bird|Add3~113_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_bird|ALT_INV_Add3~113_sumout\,
	combout => \u_bird|bird_y_pos[7]~3_combout\);

-- Location: FF_X17_Y21_N40
\u_bird|bird_y_pos[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|bird_y_pos[7]~3_combout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(7));

-- Location: LABCELL_X17_Y22_N18
\u_bird|Add3~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~109_sumout\ = SUM(( \u_bird|bird_y_pos[8]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~114\ ))
-- \u_bird|Add3~110\ = CARRY(( \u_bird|bird_y_pos[8]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos[8]~DUPLICATE_q\,
	cin => \u_bird|Add3~114\,
	sumout => \u_bird|Add3~109_sumout\,
	cout => \u_bird|Add3~110\);

-- Location: LABCELL_X17_Y22_N21
\u_bird|Add3~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~29_sumout\ = SUM(( \u_bird|bird_y_pos\(9) ) + ( GND ) + ( \u_bird|Add3~110\ ))
-- \u_bird|Add3~30\ = CARRY(( \u_bird|bird_y_pos\(9) ) + ( GND ) + ( \u_bird|Add3~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(9),
	cin => \u_bird|Add3~110\,
	sumout => \u_bird|Add3~29_sumout\,
	cout => \u_bird|Add3~30\);

-- Location: FF_X17_Y22_N22
\u_bird|bird_y_pos[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~29_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(9));

-- Location: LABCELL_X17_Y22_N24
\u_bird|Add3~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~25_sumout\ = SUM(( \u_bird|bird_y_pos\(10) ) + ( GND ) + ( \u_bird|Add3~30\ ))
-- \u_bird|Add3~26\ = CARRY(( \u_bird|bird_y_pos\(10) ) + ( GND ) + ( \u_bird|Add3~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(10),
	cin => \u_bird|Add3~30\,
	sumout => \u_bird|Add3~25_sumout\,
	cout => \u_bird|Add3~26\);

-- Location: FF_X17_Y22_N25
\u_bird|bird_y_pos[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~25_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(10));

-- Location: LABCELL_X17_Y22_N27
\u_bird|Add3~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~21_sumout\ = SUM(( \u_bird|bird_y_pos\(11) ) + ( GND ) + ( \u_bird|Add3~26\ ))
-- \u_bird|Add3~22\ = CARRY(( \u_bird|bird_y_pos\(11) ) + ( GND ) + ( \u_bird|Add3~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(11),
	cin => \u_bird|Add3~26\,
	sumout => \u_bird|Add3~21_sumout\,
	cout => \u_bird|Add3~22\);

-- Location: FF_X17_Y22_N29
\u_bird|bird_y_pos[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~21_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(11));

-- Location: LABCELL_X17_Y22_N30
\u_bird|Add3~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~17_sumout\ = SUM(( \u_bird|bird_y_pos\(12) ) + ( GND ) + ( \u_bird|Add3~22\ ))
-- \u_bird|Add3~18\ = CARRY(( \u_bird|bird_y_pos\(12) ) + ( GND ) + ( \u_bird|Add3~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(12),
	cin => \u_bird|Add3~22\,
	sumout => \u_bird|Add3~17_sumout\,
	cout => \u_bird|Add3~18\);

-- Location: FF_X17_Y22_N31
\u_bird|bird_y_pos[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~17_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(12));

-- Location: LABCELL_X17_Y22_N33
\u_bird|Add3~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~53_sumout\ = SUM(( \u_bird|bird_y_pos\(13) ) + ( GND ) + ( \u_bird|Add3~18\ ))
-- \u_bird|Add3~54\ = CARRY(( \u_bird|bird_y_pos\(13) ) + ( GND ) + ( \u_bird|Add3~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(13),
	cin => \u_bird|Add3~18\,
	sumout => \u_bird|Add3~53_sumout\,
	cout => \u_bird|Add3~54\);

-- Location: FF_X17_Y22_N34
\u_bird|bird_y_pos[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~53_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(13));

-- Location: LABCELL_X17_Y22_N36
\u_bird|Add3~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~49_sumout\ = SUM(( \u_bird|bird_y_pos\(14) ) + ( GND ) + ( \u_bird|Add3~54\ ))
-- \u_bird|Add3~50\ = CARRY(( \u_bird|bird_y_pos\(14) ) + ( GND ) + ( \u_bird|Add3~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(14),
	cin => \u_bird|Add3~54\,
	sumout => \u_bird|Add3~49_sumout\,
	cout => \u_bird|Add3~50\);

-- Location: FF_X17_Y22_N37
\u_bird|bird_y_pos[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~49_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(14));

-- Location: LABCELL_X17_Y22_N39
\u_bird|Add3~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~45_sumout\ = SUM(( \u_bird|bird_y_pos\(15) ) + ( GND ) + ( \u_bird|Add3~50\ ))
-- \u_bird|Add3~46\ = CARRY(( \u_bird|bird_y_pos\(15) ) + ( GND ) + ( \u_bird|Add3~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(15),
	cin => \u_bird|Add3~50\,
	sumout => \u_bird|Add3~45_sumout\,
	cout => \u_bird|Add3~46\);

-- Location: FF_X17_Y22_N40
\u_bird|bird_y_pos[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~45_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(15));

-- Location: LABCELL_X17_Y22_N42
\u_bird|Add3~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~41_sumout\ = SUM(( \u_bird|bird_y_pos\(16) ) + ( GND ) + ( \u_bird|Add3~46\ ))
-- \u_bird|Add3~42\ = CARRY(( \u_bird|bird_y_pos\(16) ) + ( GND ) + ( \u_bird|Add3~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(16),
	cin => \u_bird|Add3~46\,
	sumout => \u_bird|Add3~41_sumout\,
	cout => \u_bird|Add3~42\);

-- Location: FF_X17_Y22_N43
\u_bird|bird_y_pos[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~41_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(16));

-- Location: LABCELL_X17_Y22_N45
\u_bird|Add3~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~37_sumout\ = SUM(( \u_bird|bird_y_pos\(17) ) + ( GND ) + ( \u_bird|Add3~42\ ))
-- \u_bird|Add3~38\ = CARRY(( \u_bird|bird_y_pos\(17) ) + ( GND ) + ( \u_bird|Add3~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(17),
	cin => \u_bird|Add3~42\,
	sumout => \u_bird|Add3~37_sumout\,
	cout => \u_bird|Add3~38\);

-- Location: FF_X17_Y22_N47
\u_bird|bird_y_pos[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~37_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(17));

-- Location: LABCELL_X17_Y22_N48
\u_bird|Add3~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~33_sumout\ = SUM(( \u_bird|bird_y_pos\(18) ) + ( GND ) + ( \u_bird|Add3~38\ ))
-- \u_bird|Add3~34\ = CARRY(( \u_bird|bird_y_pos\(18) ) + ( GND ) + ( \u_bird|Add3~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(18),
	cin => \u_bird|Add3~38\,
	sumout => \u_bird|Add3~33_sumout\,
	cout => \u_bird|Add3~34\);

-- Location: FF_X17_Y22_N49
\u_bird|bird_y_pos[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~33_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(18));

-- Location: LABCELL_X17_Y22_N51
\u_bird|Add3~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~13_sumout\ = SUM(( \u_bird|bird_y_pos\(19) ) + ( GND ) + ( \u_bird|Add3~34\ ))
-- \u_bird|Add3~14\ = CARRY(( \u_bird|bird_y_pos\(19) ) + ( GND ) + ( \u_bird|Add3~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(19),
	cin => \u_bird|Add3~34\,
	sumout => \u_bird|Add3~13_sumout\,
	cout => \u_bird|Add3~14\);

-- Location: FF_X17_Y22_N52
\u_bird|bird_y_pos[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~13_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(19));

-- Location: LABCELL_X17_Y22_N54
\u_bird|Add3~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~93_sumout\ = SUM(( \u_bird|bird_y_pos\(20) ) + ( GND ) + ( \u_bird|Add3~14\ ))
-- \u_bird|Add3~94\ = CARRY(( \u_bird|bird_y_pos\(20) ) + ( GND ) + ( \u_bird|Add3~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(20),
	cin => \u_bird|Add3~14\,
	sumout => \u_bird|Add3~93_sumout\,
	cout => \u_bird|Add3~94\);

-- Location: FF_X17_Y22_N56
\u_bird|bird_y_pos[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~93_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(20));

-- Location: LABCELL_X17_Y22_N57
\u_bird|Add3~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~89_sumout\ = SUM(( \u_bird|bird_y_pos[21]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~94\ ))
-- \u_bird|Add3~90\ = CARRY(( \u_bird|bird_y_pos[21]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[21]~DUPLICATE_q\,
	cin => \u_bird|Add3~94\,
	sumout => \u_bird|Add3~89_sumout\,
	cout => \u_bird|Add3~90\);

-- Location: FF_X17_Y22_N58
\u_bird|bird_y_pos[21]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~89_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[21]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y21_N0
\u_bird|Add3~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~85_sumout\ = SUM(( \u_bird|bird_y_pos[22]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~90\ ))
-- \u_bird|Add3~86\ = CARRY(( \u_bird|bird_y_pos[22]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[22]~DUPLICATE_q\,
	cin => \u_bird|Add3~90\,
	sumout => \u_bird|Add3~85_sumout\,
	cout => \u_bird|Add3~86\);

-- Location: FF_X17_Y21_N1
\u_bird|bird_y_pos[22]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~85_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[22]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y21_N3
\u_bird|Add3~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~81_sumout\ = SUM(( \u_bird|bird_y_pos\(23) ) + ( GND ) + ( \u_bird|Add3~86\ ))
-- \u_bird|Add3~82\ = CARRY(( \u_bird|bird_y_pos\(23) ) + ( GND ) + ( \u_bird|Add3~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(23),
	cin => \u_bird|Add3~86\,
	sumout => \u_bird|Add3~81_sumout\,
	cout => \u_bird|Add3~82\);

-- Location: FF_X17_Y21_N5
\u_bird|bird_y_pos[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~81_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(23));

-- Location: LABCELL_X17_Y21_N6
\u_bird|Add3~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~77_sumout\ = SUM(( \u_bird|bird_y_pos\(24) ) + ( GND ) + ( \u_bird|Add3~82\ ))
-- \u_bird|Add3~78\ = CARRY(( \u_bird|bird_y_pos\(24) ) + ( GND ) + ( \u_bird|Add3~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(24),
	cin => \u_bird|Add3~82\,
	sumout => \u_bird|Add3~77_sumout\,
	cout => \u_bird|Add3~78\);

-- Location: FF_X17_Y21_N8
\u_bird|bird_y_pos[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~77_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(24));

-- Location: LABCELL_X17_Y21_N9
\u_bird|Add3~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~9_sumout\ = SUM(( \u_bird|bird_y_pos[25]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~78\ ))
-- \u_bird|Add3~10\ = CARRY(( \u_bird|bird_y_pos[25]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[25]~DUPLICATE_q\,
	cin => \u_bird|Add3~78\,
	sumout => \u_bird|Add3~9_sumout\,
	cout => \u_bird|Add3~10\);

-- Location: FF_X17_Y21_N11
\u_bird|bird_y_pos[25]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~9_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[25]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y21_N12
\u_bird|Add3~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~73_sumout\ = SUM(( \u_bird|bird_y_pos[26]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~10\ ))
-- \u_bird|Add3~74\ = CARRY(( \u_bird|bird_y_pos[26]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add3~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[26]~DUPLICATE_q\,
	cin => \u_bird|Add3~10\,
	sumout => \u_bird|Add3~73_sumout\,
	cout => \u_bird|Add3~74\);

-- Location: FF_X17_Y21_N13
\u_bird|bird_y_pos[26]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~73_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[26]~DUPLICATE_q\);

-- Location: LABCELL_X17_Y21_N15
\u_bird|Add3~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~69_sumout\ = SUM(( \u_bird|bird_y_pos\(27) ) + ( GND ) + ( \u_bird|Add3~74\ ))
-- \u_bird|Add3~70\ = CARRY(( \u_bird|bird_y_pos\(27) ) + ( GND ) + ( \u_bird|Add3~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(27),
	cin => \u_bird|Add3~74\,
	sumout => \u_bird|Add3~69_sumout\,
	cout => \u_bird|Add3~70\);

-- Location: FF_X17_Y21_N16
\u_bird|bird_y_pos[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~69_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(27));

-- Location: LABCELL_X17_Y21_N18
\u_bird|Add3~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~65_sumout\ = SUM(( \u_bird|bird_y_pos\(28) ) + ( GND ) + ( \u_bird|Add3~70\ ))
-- \u_bird|Add3~66\ = CARRY(( \u_bird|bird_y_pos\(28) ) + ( GND ) + ( \u_bird|Add3~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(28),
	cin => \u_bird|Add3~70\,
	sumout => \u_bird|Add3~65_sumout\,
	cout => \u_bird|Add3~66\);

-- Location: FF_X17_Y21_N19
\u_bird|bird_y_pos[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~65_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(28));

-- Location: LABCELL_X17_Y21_N21
\u_bird|Add3~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~61_sumout\ = SUM(( \u_bird|bird_y_pos\(29) ) + ( GND ) + ( \u_bird|Add3~66\ ))
-- \u_bird|Add3~62\ = CARRY(( \u_bird|bird_y_pos\(29) ) + ( GND ) + ( \u_bird|Add3~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(29),
	cin => \u_bird|Add3~66\,
	sumout => \u_bird|Add3~61_sumout\,
	cout => \u_bird|Add3~62\);

-- Location: FF_X17_Y21_N23
\u_bird|bird_y_pos[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~61_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(29));

-- Location: LABCELL_X17_Y21_N24
\u_bird|Add3~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~57_sumout\ = SUM(( \u_bird|bird_y_pos\(30) ) + ( GND ) + ( \u_bird|Add3~62\ ))
-- \u_bird|Add3~58\ = CARRY(( \u_bird|bird_y_pos\(30) ) + ( GND ) + ( \u_bird|Add3~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(30),
	cin => \u_bird|Add3~62\,
	sumout => \u_bird|Add3~57_sumout\,
	cout => \u_bird|Add3~58\);

-- Location: FF_X17_Y21_N26
\u_bird|bird_y_pos[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~57_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(30));

-- Location: LABCELL_X17_Y21_N27
\u_bird|Add3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add3~5_sumout\ = SUM(( \u_bird|bird_y_pos\(31) ) + ( GND ) + ( \u_bird|Add3~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(31),
	cin => \u_bird|Add3~58\,
	sumout => \u_bird|Add3~5_sumout\);

-- Location: FF_X17_Y21_N28
\u_bird|bird_y_pos[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~5_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(31));

-- Location: FF_X17_Y22_N8
\u_bird|bird_y_pos[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~97_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(4));

-- Location: FF_X17_Y22_N2
\u_bird|bird_y_pos[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~1_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[2]~DUPLICATE_q\);

-- Location: FF_X16_Y22_N13
\u_bird|bird_y_pos[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|bird_y_pos[3]~1_combout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[3]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y22_N27
\u_bird|LessThan4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~5_combout\ = ( \u_bird|bird_y_pos[3]~DUPLICATE_q\ & ( (!\u_bird|bird_y_pos\(4) & !\u_bird|bird_y_pos[5]~DUPLICATE_q\) ) ) # ( !\u_bird|bird_y_pos[3]~DUPLICATE_q\ & ( (!\u_bird|bird_y_pos\(4) & (!\u_bird|bird_y_pos[2]~DUPLICATE_q\ & 
-- !\u_bird|bird_y_pos[5]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(4),
	datac => \u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\,
	datad => \u_bird|ALT_INV_bird_y_pos[5]~DUPLICATE_q\,
	dataf => \u_bird|ALT_INV_bird_y_pos[3]~DUPLICATE_q\,
	combout => \u_bird|LessThan4~5_combout\);

-- Location: FF_X17_Y21_N25
\u_bird|bird_y_pos[30]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~57_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[30]~DUPLICATE_q\);

-- Location: FF_X17_Y21_N22
\u_bird|bird_y_pos[29]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~61_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[29]~DUPLICATE_q\);

-- Location: MLABCELL_X18_Y21_N21
\u_bird|LessThan4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~2_combout\ = ( !\u_bird|bird_y_pos[26]~DUPLICATE_q\ & ( !\u_bird|bird_y_pos\(27) & ( (!\u_bird|bird_y_pos[30]~DUPLICATE_q\ & (!\u_bird|bird_y_pos\(28) & !\u_bird|bird_y_pos[29]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos[30]~DUPLICATE_q\,
	datac => \u_bird|ALT_INV_bird_y_pos\(28),
	datad => \u_bird|ALT_INV_bird_y_pos[29]~DUPLICATE_q\,
	datae => \u_bird|ALT_INV_bird_y_pos[26]~DUPLICATE_q\,
	dataf => \u_bird|ALT_INV_bird_y_pos\(27),
	combout => \u_bird|LessThan4~2_combout\);

-- Location: FF_X17_Y21_N2
\u_bird|bird_y_pos[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~85_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(22));

-- Location: FF_X17_Y22_N59
\u_bird|bird_y_pos[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~89_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(21));

-- Location: LABCELL_X17_Y21_N36
\u_bird|LessThan4~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~3_combout\ = ( !\u_bird|bird_y_pos\(24) & ( (!\u_bird|bird_y_pos\(22) & (!\u_bird|bird_y_pos\(21) & (!\u_bird|bird_y_pos\(23) & !\u_bird|bird_y_pos\(20)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(22),
	datab => \u_bird|ALT_INV_bird_y_pos\(21),
	datac => \u_bird|ALT_INV_bird_y_pos\(23),
	datad => \u_bird|ALT_INV_bird_y_pos\(20),
	dataf => \u_bird|ALT_INV_bird_y_pos\(24),
	combout => \u_bird|LessThan4~3_combout\);

-- Location: FF_X17_Y22_N41
\u_bird|bird_y_pos[15]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~45_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[15]~DUPLICATE_q\);

-- Location: MLABCELL_X18_Y21_N15
\u_bird|LessThan4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~1_combout\ = ( !\u_bird|bird_y_pos\(17) & ( !\u_bird|bird_y_pos\(18) & ( (!\u_bird|bird_y_pos\(14) & (!\u_bird|bird_y_pos\(13) & (!\u_bird|bird_y_pos[15]~DUPLICATE_q\ & !\u_bird|bird_y_pos\(16)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(14),
	datab => \u_bird|ALT_INV_bird_y_pos\(13),
	datac => \u_bird|ALT_INV_bird_y_pos[15]~DUPLICATE_q\,
	datad => \u_bird|ALT_INV_bird_y_pos\(16),
	datae => \u_bird|ALT_INV_bird_y_pos\(17),
	dataf => \u_bird|ALT_INV_bird_y_pos\(18),
	combout => \u_bird|LessThan4~1_combout\);

-- Location: FF_X17_Y22_N26
\u_bird|bird_y_pos[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~25_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[10]~DUPLICATE_q\);

-- Location: FF_X17_Y22_N23
\u_bird|bird_y_pos[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~29_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[9]~DUPLICATE_q\);

-- Location: FF_X17_Y22_N32
\u_bird|bird_y_pos[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~17_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[12]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y22_N3
\u_bird|LessThan4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~0_combout\ = ( !\u_bird|bird_y_pos\(11) & ( !\u_bird|bird_y_pos[12]~DUPLICATE_q\ & ( (!\u_bird|bird_y_pos[10]~DUPLICATE_q\ & !\u_bird|bird_y_pos[9]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[10]~DUPLICATE_q\,
	datad => \u_bird|ALT_INV_bird_y_pos[9]~DUPLICATE_q\,
	datae => \u_bird|ALT_INV_bird_y_pos\(11),
	dataf => \u_bird|ALT_INV_bird_y_pos[12]~DUPLICATE_q\,
	combout => \u_bird|LessThan4~0_combout\);

-- Location: FF_X17_Y21_N10
\u_bird|bird_y_pos[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~9_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(25));

-- Location: LABCELL_X17_Y21_N42
\u_bird|LessThan4~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~4_combout\ = ( \u_bird|LessThan4~0_combout\ & ( !\u_bird|bird_y_pos\(25) & ( (\u_bird|LessThan4~2_combout\ & (\u_bird|LessThan4~3_combout\ & (\u_bird|LessThan4~1_combout\ & !\u_bird|bird_y_pos\(19)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_LessThan4~2_combout\,
	datab => \u_bird|ALT_INV_LessThan4~3_combout\,
	datac => \u_bird|ALT_INV_LessThan4~1_combout\,
	datad => \u_bird|ALT_INV_bird_y_pos\(19),
	datae => \u_bird|ALT_INV_LessThan4~0_combout\,
	dataf => \u_bird|ALT_INV_bird_y_pos\(25),
	combout => \u_bird|LessThan4~4_combout\);

-- Location: LABCELL_X17_Y21_N54
\u_bird|LessThan4~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan4~6_combout\ = ( \u_bird|bird_y_pos\(7) & ( \u_bird|LessThan4~4_combout\ ) ) # ( !\u_bird|bird_y_pos\(7) & ( \u_bird|LessThan4~4_combout\ & ( (((!\u_bird|bird_y_pos\(8)) # (\u_bird|LessThan4~5_combout\)) # (\u_bird|bird_y_pos\(31))) # 
-- (\u_bird|bird_y_pos\(6)) ) ) ) # ( \u_bird|bird_y_pos\(7) & ( !\u_bird|LessThan4~4_combout\ & ( \u_bird|bird_y_pos\(31) ) ) ) # ( !\u_bird|bird_y_pos\(7) & ( !\u_bird|LessThan4~4_combout\ & ( \u_bird|bird_y_pos\(31) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111011111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(6),
	datab => \u_bird|ALT_INV_bird_y_pos\(31),
	datac => \u_bird|ALT_INV_LessThan4~5_combout\,
	datad => \u_bird|ALT_INV_bird_y_pos\(8),
	datae => \u_bird|ALT_INV_bird_y_pos\(7),
	dataf => \u_bird|ALT_INV_LessThan4~4_combout\,
	combout => \u_bird|LessThan4~6_combout\);

-- Location: FF_X17_Y22_N19
\u_bird|bird_y_pos[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~109_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[8]~DUPLICATE_q\);

-- Location: FF_X17_Y22_N20
\u_bird|bird_y_pos[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~109_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(8));

-- Location: LABCELL_X16_Y22_N30
\u_bird|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~105_sumout\ = SUM(( \u_bird|bird_y_pos[2]~DUPLICATE_q\ ) + ( !\u_bird|bird_y_pos\(3) ) + ( !VCC ))
-- \u_bird|Add0~106\ = CARRY(( \u_bird|bird_y_pos[2]~DUPLICATE_q\ ) + ( !\u_bird|bird_y_pos\(3) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(3),
	datad => \u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\,
	cin => GND,
	sumout => \u_bird|Add0~105_sumout\,
	cout => \u_bird|Add0~106\);

-- Location: LABCELL_X16_Y22_N33
\u_bird|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~101_sumout\ = SUM(( \u_bird|bird_y_pos\(4) ) + ( VCC ) + ( \u_bird|Add0~106\ ))
-- \u_bird|Add0~102\ = CARRY(( \u_bird|bird_y_pos\(4) ) + ( VCC ) + ( \u_bird|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(4),
	cin => \u_bird|Add0~106\,
	sumout => \u_bird|Add0~101_sumout\,
	cout => \u_bird|Add0~102\);

-- Location: LABCELL_X16_Y22_N36
\u_bird|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~97_sumout\ = SUM(( \u_bird|bird_y_pos[5]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~102\ ))
-- \u_bird|Add0~98\ = CARRY(( \u_bird|bird_y_pos[5]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[5]~DUPLICATE_q\,
	cin => \u_bird|Add0~102\,
	sumout => \u_bird|Add0~97_sumout\,
	cout => \u_bird|Add0~98\);

-- Location: LABCELL_X16_Y22_N39
\u_bird|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~113_sumout\ = SUM(( !\u_bird|bird_y_pos\(6) ) + ( GND ) + ( \u_bird|Add0~98\ ))
-- \u_bird|Add0~114\ = CARRY(( !\u_bird|bird_y_pos\(6) ) + ( GND ) + ( \u_bird|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(6),
	cin => \u_bird|Add0~98\,
	sumout => \u_bird|Add0~113_sumout\,
	cout => \u_bird|Add0~114\);

-- Location: LABCELL_X16_Y22_N42
\u_bird|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~109_sumout\ = SUM(( !\u_bird|bird_y_pos\(7) ) + ( GND ) + ( \u_bird|Add0~114\ ))
-- \u_bird|Add0~110\ = CARRY(( !\u_bird|bird_y_pos\(7) ) + ( GND ) + ( \u_bird|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(7),
	cin => \u_bird|Add0~114\,
	sumout => \u_bird|Add0~109_sumout\,
	cout => \u_bird|Add0~110\);

-- Location: LABCELL_X16_Y22_N45
\u_bird|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~29_sumout\ = SUM(( \u_bird|bird_y_pos\(8) ) + ( GND ) + ( \u_bird|Add0~110\ ))
-- \u_bird|Add0~30\ = CARRY(( \u_bird|bird_y_pos\(8) ) + ( GND ) + ( \u_bird|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(8),
	cin => \u_bird|Add0~110\,
	sumout => \u_bird|Add0~29_sumout\,
	cout => \u_bird|Add0~30\);

-- Location: MLABCELL_X18_Y19_N27
\u_vga_sync|LessThan7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|LessThan7~0_combout\ = ( \u_vga_sync|v_count\(7) & ( !\u_vga_sync|v_count\(9) & ( (!\u_vga_sync|v_count\(8)) # ((!\u_vga_sync|v_count\(6)) # (!\u_vga_sync|v_count\(5))) ) ) ) # ( !\u_vga_sync|v_count\(7) & ( !\u_vga_sync|v_count\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(8),
	datac => \u_vga_sync|ALT_INV_v_count\(6),
	datad => \u_vga_sync|ALT_INV_v_count\(5),
	datae => \u_vga_sync|ALT_INV_v_count\(7),
	dataf => \u_vga_sync|ALT_INV_v_count\(9),
	combout => \u_vga_sync|LessThan7~0_combout\);

-- Location: FF_X16_Y20_N41
\u_vga_sync|pixel_row[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(8),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(8));

-- Location: LABCELL_X16_Y20_N33
\u_bird|LessThan3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~3_combout\ = ( \u_vga_sync|pixel_row\(8) & ( !\u_bird|Add0~29_sumout\ ) ) # ( !\u_vga_sync|pixel_row\(8) & ( \u_bird|Add0~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~29_sumout\,
	dataf => \u_vga_sync|ALT_INV_pixel_row\(8),
	combout => \u_bird|LessThan3~3_combout\);

-- Location: FF_X17_Y21_N14
\u_bird|bird_y_pos[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~73_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(26));

-- Location: FF_X17_Y22_N55
\u_bird|bird_y_pos[20]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~93_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[20]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y22_N48
\u_bird|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~33_sumout\ = SUM(( \u_bird|bird_y_pos[9]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~30\ ))
-- \u_bird|Add0~34\ = CARRY(( \u_bird|bird_y_pos[9]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[9]~DUPLICATE_q\,
	cin => \u_bird|Add0~30\,
	sumout => \u_bird|Add0~33_sumout\,
	cout => \u_bird|Add0~34\);

-- Location: LABCELL_X16_Y22_N51
\u_bird|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~37_sumout\ = SUM(( \u_bird|bird_y_pos[10]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~34\ ))
-- \u_bird|Add0~38\ = CARRY(( \u_bird|bird_y_pos[10]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[10]~DUPLICATE_q\,
	cin => \u_bird|Add0~34\,
	sumout => \u_bird|Add0~37_sumout\,
	cout => \u_bird|Add0~38\);

-- Location: LABCELL_X16_Y22_N54
\u_bird|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~41_sumout\ = SUM(( \u_bird|bird_y_pos\(11) ) + ( GND ) + ( \u_bird|Add0~38\ ))
-- \u_bird|Add0~42\ = CARRY(( \u_bird|bird_y_pos\(11) ) + ( GND ) + ( \u_bird|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(11),
	cin => \u_bird|Add0~38\,
	sumout => \u_bird|Add0~41_sumout\,
	cout => \u_bird|Add0~42\);

-- Location: LABCELL_X16_Y22_N57
\u_bird|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~45_sumout\ = SUM(( \u_bird|bird_y_pos[12]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~42\ ))
-- \u_bird|Add0~46\ = CARRY(( \u_bird|bird_y_pos[12]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos[12]~DUPLICATE_q\,
	cin => \u_bird|Add0~42\,
	sumout => \u_bird|Add0~45_sumout\,
	cout => \u_bird|Add0~46\);

-- Location: LABCELL_X16_Y21_N0
\u_bird|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~65_sumout\ = SUM(( \u_bird|bird_y_pos\(13) ) + ( GND ) + ( \u_bird|Add0~46\ ))
-- \u_bird|Add0~66\ = CARRY(( \u_bird|bird_y_pos\(13) ) + ( GND ) + ( \u_bird|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(13),
	cin => \u_bird|Add0~46\,
	sumout => \u_bird|Add0~65_sumout\,
	cout => \u_bird|Add0~66\);

-- Location: LABCELL_X16_Y21_N3
\u_bird|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~69_sumout\ = SUM(( \u_bird|bird_y_pos\(14) ) + ( GND ) + ( \u_bird|Add0~66\ ))
-- \u_bird|Add0~70\ = CARRY(( \u_bird|bird_y_pos\(14) ) + ( GND ) + ( \u_bird|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(14),
	cin => \u_bird|Add0~66\,
	sumout => \u_bird|Add0~69_sumout\,
	cout => \u_bird|Add0~70\);

-- Location: LABCELL_X16_Y21_N6
\u_bird|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~73_sumout\ = SUM(( \u_bird|bird_y_pos[15]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~70\ ))
-- \u_bird|Add0~74\ = CARRY(( \u_bird|bird_y_pos[15]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[15]~DUPLICATE_q\,
	cin => \u_bird|Add0~70\,
	sumout => \u_bird|Add0~73_sumout\,
	cout => \u_bird|Add0~74\);

-- Location: LABCELL_X16_Y21_N9
\u_bird|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~77_sumout\ = SUM(( \u_bird|bird_y_pos\(16) ) + ( GND ) + ( \u_bird|Add0~74\ ))
-- \u_bird|Add0~78\ = CARRY(( \u_bird|bird_y_pos\(16) ) + ( GND ) + ( \u_bird|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(16),
	cin => \u_bird|Add0~74\,
	sumout => \u_bird|Add0~77_sumout\,
	cout => \u_bird|Add0~78\);

-- Location: LABCELL_X16_Y21_N12
\u_bird|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~49_sumout\ = SUM(( \u_bird|bird_y_pos\(17) ) + ( GND ) + ( \u_bird|Add0~78\ ))
-- \u_bird|Add0~50\ = CARRY(( \u_bird|bird_y_pos\(17) ) + ( GND ) + ( \u_bird|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(17),
	cin => \u_bird|Add0~78\,
	sumout => \u_bird|Add0~49_sumout\,
	cout => \u_bird|Add0~50\);

-- Location: LABCELL_X16_Y21_N15
\u_bird|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~9_sumout\ = SUM(( \u_bird|bird_y_pos\(18) ) + ( GND ) + ( \u_bird|Add0~50\ ))
-- \u_bird|Add0~10\ = CARRY(( \u_bird|bird_y_pos\(18) ) + ( GND ) + ( \u_bird|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(18),
	cin => \u_bird|Add0~50\,
	sumout => \u_bird|Add0~9_sumout\,
	cout => \u_bird|Add0~10\);

-- Location: LABCELL_X16_Y21_N18
\u_bird|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~13_sumout\ = SUM(( \u_bird|bird_y_pos\(19) ) + ( GND ) + ( \u_bird|Add0~10\ ))
-- \u_bird|Add0~14\ = CARRY(( \u_bird|bird_y_pos\(19) ) + ( GND ) + ( \u_bird|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(19),
	cin => \u_bird|Add0~10\,
	sumout => \u_bird|Add0~13_sumout\,
	cout => \u_bird|Add0~14\);

-- Location: LABCELL_X16_Y21_N21
\u_bird|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~17_sumout\ = SUM(( \u_bird|bird_y_pos[20]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~14\ ))
-- \u_bird|Add0~18\ = CARRY(( \u_bird|bird_y_pos[20]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[20]~DUPLICATE_q\,
	cin => \u_bird|Add0~14\,
	sumout => \u_bird|Add0~17_sumout\,
	cout => \u_bird|Add0~18\);

-- Location: LABCELL_X16_Y21_N24
\u_bird|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~21_sumout\ = SUM(( \u_bird|bird_y_pos[21]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~18\ ))
-- \u_bird|Add0~22\ = CARRY(( \u_bird|bird_y_pos[21]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[21]~DUPLICATE_q\,
	cin => \u_bird|Add0~18\,
	sumout => \u_bird|Add0~21_sumout\,
	cout => \u_bird|Add0~22\);

-- Location: LABCELL_X16_Y21_N27
\u_bird|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~53_sumout\ = SUM(( \u_bird|bird_y_pos[22]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~22\ ))
-- \u_bird|Add0~54\ = CARRY(( \u_bird|bird_y_pos[22]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos[22]~DUPLICATE_q\,
	cin => \u_bird|Add0~22\,
	sumout => \u_bird|Add0~53_sumout\,
	cout => \u_bird|Add0~54\);

-- Location: LABCELL_X16_Y21_N30
\u_bird|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~81_sumout\ = SUM(( \u_bird|bird_y_pos\(23) ) + ( GND ) + ( \u_bird|Add0~54\ ))
-- \u_bird|Add0~82\ = CARRY(( \u_bird|bird_y_pos\(23) ) + ( GND ) + ( \u_bird|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(23),
	cin => \u_bird|Add0~54\,
	sumout => \u_bird|Add0~81_sumout\,
	cout => \u_bird|Add0~82\);

-- Location: LABCELL_X16_Y21_N33
\u_bird|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~85_sumout\ = SUM(( \u_bird|bird_y_pos\(24) ) + ( GND ) + ( \u_bird|Add0~82\ ))
-- \u_bird|Add0~86\ = CARRY(( \u_bird|bird_y_pos\(24) ) + ( GND ) + ( \u_bird|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_bird_y_pos\(24),
	cin => \u_bird|Add0~82\,
	sumout => \u_bird|Add0~85_sumout\,
	cout => \u_bird|Add0~86\);

-- Location: LABCELL_X16_Y21_N36
\u_bird|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~57_sumout\ = SUM(( \u_bird|bird_y_pos[25]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~86\ ))
-- \u_bird|Add0~58\ = CARRY(( \u_bird|bird_y_pos[25]~DUPLICATE_q\ ) + ( GND ) + ( \u_bird|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[25]~DUPLICATE_q\,
	cin => \u_bird|Add0~86\,
	sumout => \u_bird|Add0~57_sumout\,
	cout => \u_bird|Add0~58\);

-- Location: LABCELL_X16_Y21_N39
\u_bird|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~25_sumout\ = SUM(( \u_bird|bird_y_pos\(26) ) + ( GND ) + ( \u_bird|Add0~58\ ))
-- \u_bird|Add0~26\ = CARRY(( \u_bird|bird_y_pos\(26) ) + ( GND ) + ( \u_bird|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(26),
	cin => \u_bird|Add0~58\,
	sumout => \u_bird|Add0~25_sumout\,
	cout => \u_bird|Add0~26\);

-- Location: LABCELL_X16_Y21_N42
\u_bird|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~61_sumout\ = SUM(( \u_bird|bird_y_pos\(27) ) + ( GND ) + ( \u_bird|Add0~26\ ))
-- \u_bird|Add0~62\ = CARRY(( \u_bird|bird_y_pos\(27) ) + ( GND ) + ( \u_bird|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(27),
	cin => \u_bird|Add0~26\,
	sumout => \u_bird|Add0~61_sumout\,
	cout => \u_bird|Add0~62\);

-- Location: LABCELL_X16_Y21_N45
\u_bird|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~89_sumout\ = SUM(( \u_bird|bird_y_pos\(28) ) + ( GND ) + ( \u_bird|Add0~62\ ))
-- \u_bird|Add0~90\ = CARRY(( \u_bird|bird_y_pos\(28) ) + ( GND ) + ( \u_bird|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(28),
	cin => \u_bird|Add0~62\,
	sumout => \u_bird|Add0~89_sumout\,
	cout => \u_bird|Add0~90\);

-- Location: LABCELL_X16_Y21_N48
\u_bird|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~93_sumout\ = SUM(( \u_bird|bird_y_pos\(29) ) + ( GND ) + ( \u_bird|Add0~90\ ))
-- \u_bird|Add0~94\ = CARRY(( \u_bird|bird_y_pos\(29) ) + ( GND ) + ( \u_bird|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(29),
	cin => \u_bird|Add0~90\,
	sumout => \u_bird|Add0~93_sumout\,
	cout => \u_bird|Add0~94\);

-- Location: LABCELL_X16_Y21_N51
\u_bird|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~5_sumout\ = SUM(( \u_bird|bird_y_pos\(30) ) + ( GND ) + ( \u_bird|Add0~94\ ))
-- \u_bird|Add0~6\ = CARRY(( \u_bird|bird_y_pos\(30) ) + ( GND ) + ( \u_bird|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(30),
	cin => \u_bird|Add0~94\,
	sumout => \u_bird|Add0~5_sumout\,
	cout => \u_bird|Add0~6\);

-- Location: LABCELL_X16_Y21_N54
\u_bird|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add0~1_sumout\ = SUM(( \u_bird|bird_y_pos\(31) ) + ( GND ) + ( \u_bird|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(31),
	cin => \u_bird|Add0~6\,
	sumout => \u_bird|Add0~1_sumout\);

-- Location: FF_X16_Y20_N56
\u_vga_sync|pixel_row[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count[7]~DUPLICATE_q\,
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(7));

-- Location: FF_X16_Y20_N26
\u_vga_sync|pixel_row[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(6),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(6));

-- Location: LABCELL_X16_Y20_N21
\u_bird|LessThan3~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~9_combout\ = ( \u_vga_sync|pixel_row\(6) & ( (\u_bird|Add0~109_sumout\ & !\u_vga_sync|pixel_row\(7)) ) ) # ( !\u_vga_sync|pixel_row\(6) & ( (!\u_bird|Add0~113_sumout\ & (\u_bird|Add0~109_sumout\ & !\u_vga_sync|pixel_row\(7))) # 
-- (\u_bird|Add0~113_sumout\ & ((!\u_vga_sync|pixel_row\(7)) # (\u_bird|Add0~109_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111100000101010111110000010100001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~113_sumout\,
	datac => \u_bird|ALT_INV_Add0~109_sumout\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(7),
	dataf => \u_vga_sync|ALT_INV_pixel_row\(6),
	combout => \u_bird|LessThan3~9_combout\);

-- Location: FF_X16_Y20_N50
\u_vga_sync|pixel_row[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(4),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(4));

-- Location: LABCELL_X16_Y20_N15
\u_bird|LessThan3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~5_combout\ = ( \u_vga_sync|pixel_row\(4) & ( !\u_bird|Add0~101_sumout\ ) ) # ( !\u_vga_sync|pixel_row\(4) & ( \u_bird|Add0~101_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~101_sumout\,
	dataf => \u_vga_sync|ALT_INV_pixel_row\(4),
	combout => \u_bird|LessThan3~5_combout\);

-- Location: FF_X16_Y20_N25
\u_vga_sync|pixel_row[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(6),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row[6]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y20_N18
\u_bird|LessThan3~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~8_combout\ = ( \u_vga_sync|pixel_row[6]~DUPLICATE_q\ & ( (\u_bird|Add0~113_sumout\ & (!\u_bird|Add0~109_sumout\ $ (\u_vga_sync|pixel_row\(7)))) ) ) # ( !\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & ( (!\u_bird|Add0~113_sumout\ & 
-- (!\u_bird|Add0~109_sumout\ $ (\u_vga_sync|pixel_row\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000100010100010000010001001000100000100010100010000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~113_sumout\,
	datab => \u_bird|ALT_INV_Add0~109_sumout\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(7),
	dataf => \u_vga_sync|ALT_INV_pixel_row[6]~DUPLICATE_q\,
	combout => \u_bird|LessThan3~8_combout\);

-- Location: FF_X16_Y20_N2
\u_vga_sync|pixel_row[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(5),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(5));

-- Location: LABCELL_X16_Y20_N45
\u_bird|LessThan3~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~4_combout\ = !\u_bird|Add0~97_sumout\ $ (!\u_vga_sync|pixel_row\(5))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_Add0~97_sumout\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(5),
	combout => \u_bird|LessThan3~4_combout\);

-- Location: FF_X19_Y20_N56
\u_vga_sync|pixel_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(2),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(2));

-- Location: FF_X19_Y20_N2
\u_vga_sync|pixel_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(3),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(3));

-- Location: FF_X19_Y20_N5
\u_vga_sync|pixel_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(1),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(1));

-- Location: LABCELL_X19_Y20_N21
\u_bird|LessThan3~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~6_combout\ = ( \u_vga_sync|pixel_row\(3) & ( \u_vga_sync|pixel_row\(1) & ( (!\u_bird|bird_y_pos[2]~DUPLICATE_q\ & (\u_bird|Add0~105_sumout\ & !\u_vga_sync|pixel_row\(2))) ) ) ) # ( !\u_vga_sync|pixel_row\(3) & ( \u_vga_sync|pixel_row\(1) 
-- & ( ((!\u_bird|bird_y_pos[2]~DUPLICATE_q\ & !\u_vga_sync|pixel_row\(2))) # (\u_bird|Add0~105_sumout\) ) ) ) # ( \u_vga_sync|pixel_row\(3) & ( !\u_vga_sync|pixel_row\(1) & ( (\u_bird|Add0~105_sumout\ & ((!\u_bird|bird_y_pos[2]~DUPLICATE_q\ & 
-- ((!\u_vga_sync|pixel_row\(2)) # (\u_bird|bird_y_pos\(1)))) # (\u_bird|bird_y_pos[2]~DUPLICATE_q\ & (\u_bird|bird_y_pos\(1) & !\u_vga_sync|pixel_row\(2))))) ) ) ) # ( !\u_vga_sync|pixel_row\(3) & ( !\u_vga_sync|pixel_row\(1) & ( 
-- ((!\u_bird|bird_y_pos[2]~DUPLICATE_q\ & ((!\u_vga_sync|pixel_row\(2)) # (\u_bird|bird_y_pos\(1)))) # (\u_bird|bird_y_pos[2]~DUPLICATE_q\ & (\u_bird|bird_y_pos\(1) & !\u_vga_sync|pixel_row\(2)))) # (\u_bird|Add0~105_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111100111011001000110000001010111011001100110010001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\,
	datab => \u_bird|ALT_INV_Add0~105_sumout\,
	datac => \u_bird|ALT_INV_bird_y_pos\(1),
	datad => \u_vga_sync|ALT_INV_pixel_row\(2),
	datae => \u_vga_sync|ALT_INV_pixel_row\(3),
	dataf => \u_vga_sync|ALT_INV_pixel_row\(1),
	combout => \u_bird|LessThan3~6_combout\);

-- Location: FF_X16_Y20_N1
\u_vga_sync|pixel_row[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(5),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row[5]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y20_N12
\u_bird|LessThan3~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~7_combout\ = ( \u_vga_sync|pixel_row[5]~DUPLICATE_q\ & ( (\u_bird|Add0~101_sumout\ & (\u_bird|Add0~97_sumout\ & !\u_vga_sync|pixel_row\(4))) ) ) # ( !\u_vga_sync|pixel_row[5]~DUPLICATE_q\ & ( ((\u_bird|Add0~101_sumout\ & 
-- !\u_vga_sync|pixel_row\(4))) # (\u_bird|Add0~97_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001101110011011100110111001100010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~101_sumout\,
	datab => \u_bird|ALT_INV_Add0~97_sumout\,
	datac => \u_vga_sync|ALT_INV_pixel_row\(4),
	dataf => \u_vga_sync|ALT_INV_pixel_row[5]~DUPLICATE_q\,
	combout => \u_bird|LessThan3~7_combout\);

-- Location: LABCELL_X16_Y20_N6
\u_bird|LessThan3~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~10_combout\ = ( \u_bird|LessThan3~6_combout\ & ( \u_bird|LessThan3~7_combout\ & ( (!\u_bird|LessThan3~9_combout\ & !\u_bird|LessThan3~8_combout\) ) ) ) # ( !\u_bird|LessThan3~6_combout\ & ( \u_bird|LessThan3~7_combout\ & ( 
-- (!\u_bird|LessThan3~9_combout\ & !\u_bird|LessThan3~8_combout\) ) ) ) # ( \u_bird|LessThan3~6_combout\ & ( !\u_bird|LessThan3~7_combout\ & ( (!\u_bird|LessThan3~9_combout\ & (((!\u_bird|LessThan3~8_combout\) # (\u_bird|LessThan3~4_combout\)) # 
-- (\u_bird|LessThan3~5_combout\))) ) ) ) # ( !\u_bird|LessThan3~6_combout\ & ( !\u_bird|LessThan3~7_combout\ & ( !\u_bird|LessThan3~9_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101000101010101010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_LessThan3~9_combout\,
	datab => \u_bird|ALT_INV_LessThan3~5_combout\,
	datac => \u_bird|ALT_INV_LessThan3~8_combout\,
	datad => \u_bird|ALT_INV_LessThan3~4_combout\,
	datae => \u_bird|ALT_INV_LessThan3~6_combout\,
	dataf => \u_bird|ALT_INV_LessThan3~7_combout\,
	combout => \u_bird|LessThan3~10_combout\);

-- Location: LABCELL_X16_Y20_N30
\u_bird|LessThan2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan2~2_combout\ = ( \u_vga_sync|pixel_row\(8) & ( (\u_bird|bird_y_pos[8]~DUPLICATE_q\ & (!\u_bird|bird_y_pos\(7) $ (!\u_vga_sync|pixel_row\(7)))) ) ) # ( !\u_vga_sync|pixel_row\(8) & ( (!\u_bird|bird_y_pos[8]~DUPLICATE_q\ & 
-- (!\u_bird|bird_y_pos\(7) $ (!\u_vga_sync|pixel_row\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011000000001100001100000000000011000011000000001100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(7),
	datac => \u_bird|ALT_INV_bird_y_pos[8]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(7),
	dataf => \u_vga_sync|ALT_INV_pixel_row\(8),
	combout => \u_bird|LessThan2~2_combout\);

-- Location: FF_X17_Y21_N34
\u_bird|bird_y_pos[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|bird_y_pos[6]~2_combout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos[6]~DUPLICATE_q\);

-- Location: FF_X17_Y22_N10
\u_bird|bird_y_pos[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_vga_sync|vert_sync_out~q\,
	d => \u_bird|Add3~117_sumout\,
	ena => \u_bird|LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_y_pos\(5));

-- Location: LABCELL_X16_Y20_N42
\u_bird|LessThan2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan2~3_combout\ = ( \u_vga_sync|pixel_row[6]~DUPLICATE_q\ & ( (\u_bird|LessThan2~2_combout\ & (!\u_bird|bird_y_pos[6]~DUPLICATE_q\ & (!\u_vga_sync|pixel_row\(5) $ (\u_bird|bird_y_pos\(5))))) ) ) # ( !\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & ( 
-- (\u_bird|LessThan2~2_combout\ & (\u_bird|bird_y_pos[6]~DUPLICATE_q\ & (!\u_vga_sync|pixel_row\(5) $ (\u_bird|bird_y_pos\(5))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000001000000100000000100100000000100000010000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_row\(5),
	datab => \u_bird|ALT_INV_LessThan2~2_combout\,
	datac => \u_bird|ALT_INV_bird_y_pos[6]~DUPLICATE_q\,
	datad => \u_bird|ALT_INV_bird_y_pos\(5),
	dataf => \u_vga_sync|ALT_INV_pixel_row[6]~DUPLICATE_q\,
	combout => \u_bird|LessThan2~3_combout\);

-- Location: LABCELL_X16_Y18_N18
\u_vga_sync|LessThan6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|LessThan6~0_combout\ = ( \u_vga_sync|h_count\(8) & ( !\u_vga_sync|h_count\(9) ) ) # ( !\u_vga_sync|h_count\(8) & ( (!\u_vga_sync|h_count\(9)) # (!\u_vga_sync|h_count\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110000111111111111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count\(9),
	datad => \u_vga_sync|ALT_INV_h_count\(7),
	dataf => \u_vga_sync|ALT_INV_h_count\(8),
	combout => \u_vga_sync|LessThan6~0_combout\);

-- Location: FF_X19_Y20_N14
\u_vga_sync|pixel_column[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(2),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(2));

-- Location: FF_X16_Y20_N14
\u_vga_sync|pixel_column[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(5),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(5));

-- Location: FF_X19_Y20_N20
\u_vga_sync|pixel_column[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(3),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(3));

-- Location: FF_X19_Y20_N11
\u_vga_sync|pixel_column[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(4),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(4));

-- Location: FF_X16_Y20_N35
\u_vga_sync|pixel_column[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(6),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(6));

-- Location: FF_X16_Y20_N44
\u_vga_sync|pixel_column[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(7),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(7));

-- Location: FF_X16_Y20_N10
\u_vga_sync|pixel_column[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(8),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(8));

-- Location: FF_X17_Y20_N41
\u_vga_sync|pixel_column[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count[9]~DUPLICATE_q\,
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(9));

-- Location: LABCELL_X16_Y20_N57
\u_bird|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|process_0~0_combout\ = ( !\u_vga_sync|pixel_column\(9) & ( (\u_vga_sync|pixel_column\(6) & (!\u_vga_sync|pixel_column\(7) & !\u_vga_sync|pixel_column\(8))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(6),
	datac => \u_vga_sync|ALT_INV_pixel_column\(7),
	datad => \u_vga_sync|ALT_INV_pixel_column\(8),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(9),
	combout => \u_bird|process_0~0_combout\);

-- Location: LABCELL_X16_Y20_N36
\u_bird|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|process_0~1_combout\ = ( \u_vga_sync|pixel_column\(4) & ( \u_bird|process_0~0_combout\ & ( !\u_vga_sync|pixel_column\(5) ) ) ) # ( !\u_vga_sync|pixel_column\(4) & ( \u_bird|process_0~0_combout\ & ( (!\u_vga_sync|pixel_column\(2) & 
-- (\u_vga_sync|pixel_column\(5) & !\u_vga_sync|pixel_column\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100010000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(2),
	datab => \u_vga_sync|ALT_INV_pixel_column\(5),
	datad => \u_vga_sync|ALT_INV_pixel_column\(3),
	datae => \u_vga_sync|ALT_INV_pixel_column\(4),
	dataf => \u_bird|ALT_INV_process_0~0_combout\,
	combout => \u_bird|process_0~1_combout\);

-- Location: LABCELL_X16_Y20_N54
\u_bird|LessThan2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan2~4_combout\ = ( \u_vga_sync|pixel_row\(8) & ( (!\u_bird|bird_y_pos\(7) & (\u_bird|bird_y_pos[8]~DUPLICATE_q\ & !\u_vga_sync|pixel_row\(7))) ) ) # ( !\u_vga_sync|pixel_row\(8) & ( ((!\u_bird|bird_y_pos\(7) & !\u_vga_sync|pixel_row\(7))) # 
-- (\u_bird|bird_y_pos[8]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111100001111110011110000111100001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_y_pos\(7),
	datac => \u_bird|ALT_INV_bird_y_pos[8]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(7),
	dataf => \u_vga_sync|ALT_INV_pixel_row\(8),
	combout => \u_bird|LessThan2~4_combout\);

-- Location: LABCELL_X16_Y20_N27
\u_bird|LessThan2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan2~5_combout\ = ( !\u_bird|LessThan2~4_combout\ & ( \u_vga_sync|pixel_row[6]~DUPLICATE_q\ & ( (!\u_bird|bird_y_pos\(5)) # (((!\u_bird|LessThan2~2_combout\) # (\u_vga_sync|pixel_row\(5))) # (\u_bird|bird_y_pos\(6))) ) ) ) # ( 
-- !\u_bird|LessThan2~4_combout\ & ( !\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & ( (!\u_bird|LessThan2~2_combout\) # ((\u_bird|bird_y_pos\(6) & ((!\u_bird|bird_y_pos\(5)) # (\u_vga_sync|pixel_row\(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001011110011000000000000000011111011111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(5),
	datab => \u_bird|ALT_INV_bird_y_pos\(6),
	datac => \u_bird|ALT_INV_LessThan2~2_combout\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(5),
	datae => \u_bird|ALT_INV_LessThan2~4_combout\,
	dataf => \u_vga_sync|ALT_INV_pixel_row[6]~DUPLICATE_q\,
	combout => \u_bird|LessThan2~5_combout\);

-- Location: LABCELL_X19_Y20_N48
\u_bird|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan2~0_combout\ = ( \u_vga_sync|pixel_row\(2) & ( (\u_bird|bird_y_pos\(1) & (\u_bird|bird_y_pos[2]~DUPLICATE_q\ & !\u_vga_sync|pixel_row\(1))) ) ) # ( !\u_vga_sync|pixel_row\(2) & ( ((\u_bird|bird_y_pos\(1) & !\u_vga_sync|pixel_row\(1))) # 
-- (\u_bird|bird_y_pos[2]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111100001111010111110000111100000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(1),
	datac => \u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(1),
	dataf => \u_vga_sync|ALT_INV_pixel_row\(2),
	combout => \u_bird|LessThan2~0_combout\);

-- Location: LABCELL_X16_Y20_N51
\u_bird|LessThan2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan2~1_combout\ = ( \u_vga_sync|pixel_row\(3) & ( \u_bird|LessThan2~0_combout\ & ( (!\u_vga_sync|pixel_row\(4) & ((!\u_bird|bird_y_pos\(3)) # (\u_bird|bird_y_pos[4]~DUPLICATE_q\))) # (\u_vga_sync|pixel_row\(4) & (!\u_bird|bird_y_pos\(3) & 
-- \u_bird|bird_y_pos[4]~DUPLICATE_q\)) ) ) ) # ( !\u_vga_sync|pixel_row\(3) & ( \u_bird|LessThan2~0_combout\ & ( (!\u_vga_sync|pixel_row\(4)) # (\u_bird|bird_y_pos[4]~DUPLICATE_q\) ) ) ) # ( \u_vga_sync|pixel_row\(3) & ( !\u_bird|LessThan2~0_combout\ & ( 
-- (!\u_vga_sync|pixel_row\(4) & \u_bird|bird_y_pos[4]~DUPLICATE_q\) ) ) ) # ( !\u_vga_sync|pixel_row\(3) & ( !\u_bird|LessThan2~0_combout\ & ( (!\u_vga_sync|pixel_row\(4) & ((!\u_bird|bird_y_pos\(3)) # (\u_bird|bird_y_pos[4]~DUPLICATE_q\))) # 
-- (\u_vga_sync|pixel_row\(4) & (!\u_bird|bird_y_pos\(3) & \u_bird|bird_y_pos[4]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000011111010000000001010101010101010111111111010000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_row\(4),
	datac => \u_bird|ALT_INV_bird_y_pos\(3),
	datad => \u_bird|ALT_INV_bird_y_pos[4]~DUPLICATE_q\,
	datae => \u_vga_sync|ALT_INV_pixel_row\(3),
	dataf => \u_bird|ALT_INV_LessThan2~0_combout\,
	combout => \u_bird|LessThan2~1_combout\);

-- Location: LABCELL_X16_Y20_N3
\u_bird|process_0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|process_0~2_combout\ = ( \u_bird|LessThan2~5_combout\ & ( \u_bird|LessThan2~1_combout\ & ( (\u_bird|process_0~1_combout\ & (((\u_bird|LessThan4~4_combout\ & !\u_bird|LessThan2~3_combout\)) # (\u_bird|bird_y_pos\(31)))) ) ) ) # ( 
-- !\u_bird|LessThan2~5_combout\ & ( \u_bird|LessThan2~1_combout\ & ( (\u_bird|bird_y_pos\(31) & \u_bird|process_0~1_combout\) ) ) ) # ( \u_bird|LessThan2~5_combout\ & ( !\u_bird|LessThan2~1_combout\ & ( (\u_bird|process_0~1_combout\ & 
-- ((\u_bird|LessThan4~4_combout\) # (\u_bird|bird_y_pos\(31)))) ) ) ) # ( !\u_bird|LessThan2~5_combout\ & ( !\u_bird|LessThan2~1_combout\ & ( (\u_bird|bird_y_pos\(31) & \u_bird|process_0~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000111011100000000010101010000000001110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(31),
	datab => \u_bird|ALT_INV_LessThan4~4_combout\,
	datac => \u_bird|ALT_INV_LessThan2~3_combout\,
	datad => \u_bird|ALT_INV_process_0~1_combout\,
	datae => \u_bird|ALT_INV_LessThan2~5_combout\,
	dataf => \u_bird|ALT_INV_LessThan2~1_combout\,
	combout => \u_bird|process_0~2_combout\);

-- Location: LABCELL_X17_Y21_N48
\u_bird|LessThan3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~1_combout\ = ( !\u_bird|Add0~73_sumout\ & ( !\u_bird|Add0~77_sumout\ & ( (!\u_bird|Add0~69_sumout\ & !\u_bird|Add0~65_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_Add0~69_sumout\,
	datad => \u_bird|ALT_INV_Add0~65_sumout\,
	datae => \u_bird|ALT_INV_Add0~73_sumout\,
	dataf => \u_bird|ALT_INV_Add0~77_sumout\,
	combout => \u_bird|LessThan3~1_combout\);

-- Location: LABCELL_X17_Y20_N6
\u_bird|LessThan3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~2_combout\ = ( !\u_bird|Add0~61_sumout\ & ( (!\u_bird|Add0~57_sumout\ & (!\u_bird|Add0~49_sumout\ & (\u_bird|LessThan3~1_combout\ & !\u_bird|Add0~53_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~57_sumout\,
	datab => \u_bird|ALT_INV_Add0~49_sumout\,
	datac => \u_bird|ALT_INV_LessThan3~1_combout\,
	datad => \u_bird|ALT_INV_Add0~53_sumout\,
	dataf => \u_bird|ALT_INV_Add0~61_sumout\,
	combout => \u_bird|LessThan3~2_combout\);

-- Location: LABCELL_X17_Y20_N54
\u_bird|process_0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|process_0~4_combout\ = ( !\u_bird|Add0~93_sumout\ & ( \u_bird|LessThan3~2_combout\ & ( (!\u_bird|Add0~81_sumout\ & (!\u_bird|Add0~85_sumout\ & (!\u_bird|Add0~89_sumout\ & !\u_bird|Add0~5_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~81_sumout\,
	datab => \u_bird|ALT_INV_Add0~85_sumout\,
	datac => \u_bird|ALT_INV_Add0~89_sumout\,
	datad => \u_bird|ALT_INV_Add0~5_sumout\,
	datae => \u_bird|ALT_INV_Add0~93_sumout\,
	dataf => \u_bird|ALT_INV_LessThan3~2_combout\,
	combout => \u_bird|process_0~4_combout\);

-- Location: FF_X16_Y20_N40
\u_vga_sync|pixel_row[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(8),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row[8]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y22_N6
\u_bird|LessThan3~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~11_combout\ = ( !\u_bird|Add0~21_sumout\ & ( !\u_bird|Add0~25_sumout\ & ( (!\u_bird|Add0~33_sumout\ & (!\u_bird|Add0~41_sumout\ & (!\u_bird|Add0~37_sumout\ & !\u_bird|Add0~45_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add0~33_sumout\,
	datab => \u_bird|ALT_INV_Add0~41_sumout\,
	datac => \u_bird|ALT_INV_Add0~37_sumout\,
	datad => \u_bird|ALT_INV_Add0~45_sumout\,
	datae => \u_bird|ALT_INV_Add0~21_sumout\,
	dataf => \u_bird|ALT_INV_Add0~25_sumout\,
	combout => \u_bird|LessThan3~11_combout\);

-- Location: LABCELL_X16_Y22_N18
\u_bird|LessThan3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|LessThan3~0_combout\ = ( !\u_bird|Add0~17_sumout\ & ( \u_bird|LessThan3~11_combout\ & ( (!\u_bird|Add0~13_sumout\ & (!\u_bird|Add0~9_sumout\ & ((!\u_bird|Add0~29_sumout\) # (\u_vga_sync|pixel_row[8]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011010000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_row[8]~DUPLICATE_q\,
	datab => \u_bird|ALT_INV_Add0~29_sumout\,
	datac => \u_bird|ALT_INV_Add0~13_sumout\,
	datad => \u_bird|ALT_INV_Add0~9_sumout\,
	datae => \u_bird|ALT_INV_Add0~17_sumout\,
	dataf => \u_bird|ALT_INV_LessThan3~11_combout\,
	combout => \u_bird|LessThan3~0_combout\);

-- Location: LABCELL_X17_Y20_N36
\u_bird|process_0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|process_0~3_combout\ = ( \u_bird|process_0~4_combout\ & ( \u_bird|LessThan3~0_combout\ & ( (!\u_bird|LessThan3~3_combout\ & (!\u_bird|Add0~1_sumout\ & (!\u_bird|LessThan3~10_combout\ & \u_bird|process_0~2_combout\))) ) ) ) # ( 
-- !\u_bird|process_0~4_combout\ & ( \u_bird|LessThan3~0_combout\ & ( (!\u_bird|Add0~1_sumout\ & \u_bird|process_0~2_combout\) ) ) ) # ( \u_bird|process_0~4_combout\ & ( !\u_bird|LessThan3~0_combout\ & ( (!\u_bird|Add0~1_sumout\ & 
-- \u_bird|process_0~2_combout\) ) ) ) # ( !\u_bird|process_0~4_combout\ & ( !\u_bird|LessThan3~0_combout\ & ( (!\u_bird|Add0~1_sumout\ & \u_bird|process_0~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_LessThan3~3_combout\,
	datab => \u_bird|ALT_INV_Add0~1_sumout\,
	datac => \u_bird|ALT_INV_LessThan3~10_combout\,
	datad => \u_bird|ALT_INV_process_0~2_combout\,
	datae => \u_bird|ALT_INV_process_0~4_combout\,
	dataf => \u_bird|ALT_INV_LessThan3~0_combout\,
	combout => \u_bird|process_0~3_combout\);

-- Location: FF_X17_Y20_N59
\u_bird|bird_on\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_bird|process_0~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_on~q\);

-- Location: LABCELL_X16_Y19_N45
\u_vga_sync|video_on_h~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|video_on_h~feeder_combout\ = ( \u_vga_sync|LessThan6~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_LessThan6~0_combout\,
	combout => \u_vga_sync|video_on_h~feeder_combout\);

-- Location: FF_X16_Y19_N47
\u_vga_sync|video_on_h\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|video_on_h~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|video_on_h~q\);

-- Location: FF_X16_Y19_N55
\u_vga_sync|video_on_v\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|LessThan7~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|video_on_v~q\);

-- Location: LABCELL_X16_Y19_N36
\u_vga_sync|video_on\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|video_on~combout\ = ( \u_vga_sync|video_on_v~q\ & ( \u_vga_sync|video_on_h~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_video_on_h~q\,
	dataf => \u_vga_sync|ALT_INV_video_on_v~q\,
	combout => \u_vga_sync|video_on~combout\);

-- Location: FF_X19_Y20_N8
\u_vga_sync|pixel_column[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(1),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(1));

-- Location: FF_X19_Y20_N17
\u_vga_sync|pixel_column[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(0),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column\(0));

-- Location: LABCELL_X19_Y20_N57
\u_bird|Mux20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux20~0_combout\ = ( \u_vga_sync|pixel_column\(4) & ( \u_vga_sync|pixel_column\(0) & ( !\u_vga_sync|pixel_column\(2) ) ) ) # ( !\u_vga_sync|pixel_column\(4) & ( \u_vga_sync|pixel_column\(0) & ( !\u_vga_sync|pixel_column\(2) ) ) ) # ( 
-- \u_vga_sync|pixel_column\(4) & ( !\u_vga_sync|pixel_column\(0) & ( !\u_vga_sync|pixel_column\(2) ) ) ) # ( !\u_vga_sync|pixel_column\(4) & ( !\u_vga_sync|pixel_column\(0) & ( (!\u_vga_sync|pixel_column\(2) & \u_vga_sync|pixel_column\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(1),
	datae => \u_vga_sync|ALT_INV_pixel_column\(4),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(0),
	combout => \u_bird|Mux20~0_combout\);

-- Location: FF_X19_Y20_N29
\u_vga_sync|pixel_row[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(0),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row[0]~DUPLICATE_q\);

-- Location: LABCELL_X19_Y20_N30
\u_bird|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add1~9_sumout\ = SUM(( \u_vga_sync|pixel_row[0]~DUPLICATE_q\ ) + ( !VCC ) + ( !VCC ))
-- \u_bird|Add1~10\ = CARRY(( \u_vga_sync|pixel_row[0]~DUPLICATE_q\ ) + ( !VCC ) + ( !VCC ))
-- \u_bird|Add1~11\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_pixel_row[0]~DUPLICATE_q\,
	cin => GND,
	sharein => GND,
	sumout => \u_bird|Add1~9_sumout\,
	cout => \u_bird|Add1~10\,
	shareout => \u_bird|Add1~11\);

-- Location: LABCELL_X19_Y20_N33
\u_bird|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add1~5_sumout\ = SUM(( !\u_bird|bird_y_pos\(1) $ (\u_vga_sync|pixel_row\(1)) ) + ( \u_bird|Add1~11\ ) + ( \u_bird|Add1~10\ ))
-- \u_bird|Add1~6\ = CARRY(( !\u_bird|bird_y_pos\(1) $ (\u_vga_sync|pixel_row\(1)) ) + ( \u_bird|Add1~11\ ) + ( \u_bird|Add1~10\ ))
-- \u_bird|Add1~7\ = SHARE((!\u_bird|bird_y_pos\(1) & \u_vga_sync|pixel_row\(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos\(1),
	datad => \u_vga_sync|ALT_INV_pixel_row\(1),
	cin => \u_bird|Add1~10\,
	sharein => \u_bird|Add1~11\,
	sumout => \u_bird|Add1~5_sumout\,
	cout => \u_bird|Add1~6\,
	shareout => \u_bird|Add1~7\);

-- Location: LABCELL_X19_Y20_N36
\u_bird|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add1~13_sumout\ = SUM(( !\u_bird|bird_y_pos[2]~DUPLICATE_q\ $ (\u_vga_sync|pixel_row\(2)) ) + ( \u_bird|Add1~7\ ) + ( \u_bird|Add1~6\ ))
-- \u_bird|Add1~14\ = CARRY(( !\u_bird|bird_y_pos[2]~DUPLICATE_q\ $ (\u_vga_sync|pixel_row\(2)) ) + ( \u_bird|Add1~7\ ) + ( \u_bird|Add1~6\ ))
-- \u_bird|Add1~15\ = SHARE((!\u_bird|bird_y_pos[2]~DUPLICATE_q\ & \u_vga_sync|pixel_row\(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_bird_y_pos[2]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_pixel_row\(2),
	cin => \u_bird|Add1~6\,
	sharein => \u_bird|Add1~7\,
	sumout => \u_bird|Add1~13_sumout\,
	cout => \u_bird|Add1~14\,
	shareout => \u_bird|Add1~15\);

-- Location: LABCELL_X19_Y20_N39
\u_bird|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add1~17_sumout\ = SUM(( !\u_bird|bird_y_pos\(3) $ (!\u_vga_sync|pixel_row\(3)) ) + ( \u_bird|Add1~15\ ) + ( \u_bird|Add1~14\ ))
-- \u_bird|Add1~18\ = CARRY(( !\u_bird|bird_y_pos\(3) $ (!\u_vga_sync|pixel_row\(3)) ) + ( \u_bird|Add1~15\ ) + ( \u_bird|Add1~14\ ))
-- \u_bird|Add1~19\ = SHARE((\u_bird|bird_y_pos\(3) & \u_vga_sync|pixel_row\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000101010100000000000000000101010110101010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos\(3),
	datad => \u_vga_sync|ALT_INV_pixel_row\(3),
	cin => \u_bird|Add1~14\,
	sharein => \u_bird|Add1~15\,
	sumout => \u_bird|Add1~17_sumout\,
	cout => \u_bird|Add1~18\,
	shareout => \u_bird|Add1~19\);

-- Location: LABCELL_X19_Y20_N42
\u_bird|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Add1~1_sumout\ = SUM(( !\u_bird|bird_y_pos[4]~DUPLICATE_q\ $ (\u_vga_sync|pixel_row\(4)) ) + ( \u_bird|Add1~19\ ) + ( \u_bird|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_y_pos[4]~DUPLICATE_q\,
	datac => \u_vga_sync|ALT_INV_pixel_row\(4),
	cin => \u_bird|Add1~18\,
	sharein => \u_bird|Add1~19\,
	sumout => \u_bird|Add1~1_sumout\);

-- Location: MLABCELL_X18_Y20_N18
\u_bird|Mux24~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~3_combout\ = ( \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(3) & (\u_bird|Mux20~0_combout\ & !\u_bird|Add1~1_sumout\)) ) ) # ( !\u_bird|Add1~5_sumout\ & ( !\u_bird|Add1~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_pixel_column\(3),
	datac => \u_bird|ALT_INV_Mux20~0_combout\,
	datad => \u_bird|ALT_INV_Add1~1_sumout\,
	dataf => \u_bird|ALT_INV_Add1~5_sumout\,
	combout => \u_bird|Mux24~3_combout\);

-- Location: FF_X19_Y20_N19
\u_vga_sync|pixel_column[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(3),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column[3]~DUPLICATE_q\);

-- Location: LABCELL_X20_Y20_N21
\u_bird|Mux24~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~23_combout\ = ( \u_bird|Add1~5_sumout\ & ( \u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (\u_vga_sync|pixel_column\(4) & ((!\u_vga_sync|pixel_column\(2) & (!\u_vga_sync|pixel_column\(0))) # (\u_vga_sync|pixel_column\(2) & 
-- ((!\u_vga_sync|pixel_column\(1)))))) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( \u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (\u_vga_sync|pixel_column\(4) & ((!\u_vga_sync|pixel_column\(0) & (!\u_vga_sync|pixel_column\(2))) # (\u_vga_sync|pixel_column\(0) & 
-- ((!\u_vga_sync|pixel_column\(1)))))) ) ) ) # ( \u_bird|Add1~5_sumout\ & ( !\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (!\u_vga_sync|pixel_column\(2) & (((\u_vga_sync|pixel_column\(1)) # (\u_vga_sync|pixel_column\(0))) # (\u_vga_sync|pixel_column\(4)))) 
-- # (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & ((\u_vga_sync|pixel_column\(1)) # (\u_vga_sync|pixel_column\(0))))) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( !\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (!\u_vga_sync|pixel_column\(2) & 
-- (((\u_vga_sync|pixel_column\(1)) # (\u_vga_sync|pixel_column\(0))) # (\u_vga_sync|pixel_column\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010111011101100100011001000000011000100100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(2),
	datab => \u_vga_sync|ALT_INV_pixel_column\(4),
	datac => \u_vga_sync|ALT_INV_pixel_column\(0),
	datad => \u_vga_sync|ALT_INV_pixel_column\(1),
	datae => \u_bird|ALT_INV_Add1~5_sumout\,
	dataf => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	combout => \u_bird|Mux24~23_combout\);

-- Location: LABCELL_X20_Y20_N24
\u_bird|Mux24~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~22_combout\ = ( \u_bird|Add1~5_sumout\ & ( \u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(1) $ (((!\u_vga_sync|pixel_column\(2) & !\u_vga_sync|pixel_column\(0)))))) ) ) ) # ( 
-- !\u_bird|Add1~5_sumout\ & ( \u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(2) $ (((!\u_vga_sync|pixel_column\(0) & !\u_vga_sync|pixel_column\(1)))))) ) ) ) # ( \u_bird|Add1~5_sumout\ & ( 
-- !\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (!\u_vga_sync|pixel_column\(2) & (((\u_vga_sync|pixel_column\(4)) # (\u_vga_sync|pixel_column\(1))) # (\u_vga_sync|pixel_column\(0)))) # (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & 
-- ((\u_vga_sync|pixel_column\(1)) # (\u_vga_sync|pixel_column\(0))))) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( !\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & ( (!\u_vga_sync|pixel_column\(2) & (((\u_vga_sync|pixel_column\(4)) # (\u_vga_sync|pixel_column\(1))) # 
-- (\u_vga_sync|pixel_column\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101011111100000000011010100000000001111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(2),
	datab => \u_vga_sync|ALT_INV_pixel_column\(0),
	datac => \u_vga_sync|ALT_INV_pixel_column\(1),
	datad => \u_vga_sync|ALT_INV_pixel_column\(4),
	datae => \u_bird|ALT_INV_Add1~5_sumout\,
	dataf => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	combout => \u_bird|Mux24~22_combout\);

-- Location: LABCELL_X20_Y20_N39
\u_bird|Mux24~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~24_combout\ = ( \u_bird|Mux24~23_combout\ & ( \u_bird|Mux24~22_combout\ ) ) # ( !\u_bird|Mux24~23_combout\ & ( \u_bird|Mux24~22_combout\ & ( !\u_bird|Add1~9_sumout\ ) ) ) # ( \u_bird|Mux24~23_combout\ & ( !\u_bird|Mux24~22_combout\ & ( 
-- \u_bird|Add1~9_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111111111111000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_bird|ALT_INV_Add1~9_sumout\,
	datae => \u_bird|ALT_INV_Mux24~23_combout\,
	dataf => \u_bird|ALT_INV_Mux24~22_combout\,
	combout => \u_bird|Mux24~24_combout\);

-- Location: MLABCELL_X18_Y19_N36
\u_bird|Mux24~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~20_combout\ = ( \u_vga_sync|pixel_column\(1) & ( \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(2) & ((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\) # (\u_vga_sync|pixel_column\(4)))) ) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( 
-- \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(4)) # (\u_vga_sync|pixel_column\(0))))) # (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (\u_vga_sync|pixel_column\(4) & 
-- ((!\u_vga_sync|pixel_column\(0)) # (!\u_vga_sync|pixel_column\(2))))) ) ) ) # ( \u_vga_sync|pixel_column\(1) & ( !\u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (((!\u_vga_sync|pixel_column\(2)) # (\u_vga_sync|pixel_column\(4))))) 
-- # (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(0) & (!\u_vga_sync|pixel_column\(2) & \u_vga_sync|pixel_column\(4)))) ) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( !\u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(2) & 
-- ((!\u_vga_sync|pixel_column\(0) & ((\u_vga_sync|pixel_column\(4)))) # (\u_vga_sync|pixel_column\(0) & (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000011100000101000001110101000100000111101001010000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	datab => \u_vga_sync|ALT_INV_pixel_column\(0),
	datac => \u_vga_sync|ALT_INV_pixel_column\(2),
	datad => \u_vga_sync|ALT_INV_pixel_column\(4),
	datae => \u_vga_sync|ALT_INV_pixel_column\(1),
	dataf => \u_bird|ALT_INV_Add1~5_sumout\,
	combout => \u_bird|Mux24~20_combout\);

-- Location: MLABCELL_X18_Y19_N42
\u_bird|Mux24~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~19_combout\ = ( \u_vga_sync|pixel_column\(1) & ( \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(2) & (((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\) # (\u_vga_sync|pixel_column\(4))))) # (\u_vga_sync|pixel_column\(2) & 
-- (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(0) $ (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\)))) ) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & 
-- (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(4)) # (\u_vga_sync|pixel_column\(0))))) # (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (((\u_vga_sync|pixel_column\(4))))) ) ) ) # ( \u_vga_sync|pixel_column\(1) & ( !\u_bird|Add1~5_sumout\ & ( 
-- (!\u_vga_sync|pixel_column\(2) & (((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\) # (\u_vga_sync|pixel_column\(4))))) # (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & ((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\) # 
-- (\u_vga_sync|pixel_column\(0))))) ) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( !\u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(2) & ((!\u_vga_sync|pixel_column\(0) & ((\u_vga_sync|pixel_column\(4)))) # (\u_vga_sync|pixel_column\(0) & 
-- (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010101000101000001111101100100000101011111010000010111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(2),
	datab => \u_vga_sync|ALT_INV_pixel_column\(0),
	datac => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_pixel_column\(4),
	datae => \u_vga_sync|ALT_INV_pixel_column\(1),
	dataf => \u_bird|ALT_INV_Add1~5_sumout\,
	combout => \u_bird|Mux24~19_combout\);

-- Location: MLABCELL_X18_Y19_N57
\u_bird|Mux24~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~21_combout\ = ( \u_bird|Mux24~20_combout\ & ( \u_bird|Mux24~19_combout\ ) ) # ( !\u_bird|Mux24~20_combout\ & ( \u_bird|Mux24~19_combout\ & ( !\u_bird|Add1~9_sumout\ ) ) ) # ( \u_bird|Mux24~20_combout\ & ( !\u_bird|Mux24~19_combout\ & ( 
-- \u_bird|Add1~9_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_Add1~9_sumout\,
	datae => \u_bird|ALT_INV_Mux24~20_combout\,
	dataf => \u_bird|ALT_INV_Mux24~19_combout\,
	combout => \u_bird|Mux24~21_combout\);

-- Location: MLABCELL_X18_Y20_N54
\u_bird|Mux24~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~1_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(2) & \u_vga_sync|pixel_column\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux24~1_combout\);

-- Location: MLABCELL_X18_Y20_N27
\u_bird|Mux20~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux20~1_combout\ = (\u_bird|Mux20~0_combout\ & !\u_vga_sync|pixel_column\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_Mux20~0_combout\,
	datad => \u_vga_sync|ALT_INV_pixel_column\(3),
	combout => \u_bird|Mux20~1_combout\);

-- Location: MLABCELL_X18_Y20_N24
\u_bird|Mux24~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~0_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (\u_vga_sync|pixel_column\(4) & ((!\u_vga_sync|pixel_column\(3) & ((!\u_vga_sync|pixel_column\(0)))) # (\u_vga_sync|pixel_column\(3) & (!\u_vga_sync|pixel_column\(2) & 
-- \u_vga_sync|pixel_column\(0))))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( (\u_vga_sync|pixel_column\(3) & (!\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & \u_vga_sync|pixel_column\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000001010000001000000101000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(4),
	datad => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux24~0_combout\);

-- Location: MLABCELL_X18_Y20_N15
\u_bird|Mux24~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~2_combout\ = ( \u_bird|Mux20~1_combout\ & ( \u_bird|Mux24~0_combout\ & ( ((!\u_bird|Add1~9_sumout\) # ((\u_bird|Add1~5_sumout\ & !\u_bird|Mux24~1_combout\))) # (\u_bird|Add1~1_sumout\) ) ) ) # ( !\u_bird|Mux20~1_combout\ & ( 
-- \u_bird|Mux24~0_combout\ & ( (!\u_bird|Add1~1_sumout\ & ((!\u_bird|Add1~9_sumout\) # ((\u_bird|Add1~5_sumout\ & !\u_bird|Mux24~1_combout\)))) # (\u_bird|Add1~1_sumout\ & (\u_bird|Add1~5_sumout\)) ) ) ) # ( \u_bird|Mux20~1_combout\ & ( 
-- !\u_bird|Mux24~0_combout\ & ( (!\u_bird|Add1~5_sumout\) # ((!\u_bird|Mux24~1_combout\) # ((!\u_bird|Add1~9_sumout\) # (\u_bird|Add1~1_sumout\))) ) ) ) # ( !\u_bird|Mux20~1_combout\ & ( !\u_bird|Mux24~0_combout\ & ( (!\u_bird|Add1~5_sumout\ & 
-- (((!\u_bird|Add1~1_sumout\)))) # (\u_bird|Add1~5_sumout\ & ((!\u_bird|Mux24~1_combout\) # ((!\u_bird|Add1~9_sumout\) # (\u_bird|Add1~1_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111100101111111111110111111110101010001011111111101001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add1~5_sumout\,
	datab => \u_bird|ALT_INV_Mux24~1_combout\,
	datac => \u_bird|ALT_INV_Add1~1_sumout\,
	datad => \u_bird|ALT_INV_Add1~9_sumout\,
	datae => \u_bird|ALT_INV_Mux20~1_combout\,
	dataf => \u_bird|ALT_INV_Mux24~0_combout\,
	combout => \u_bird|Mux24~2_combout\);

-- Location: LABCELL_X17_Y20_N30
\u_bird|Mux24~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~15_combout\ = ( !\u_bird|Add1~17_sumout\ & ( (!\u_bird|Add1~13_sumout\ & (((\u_bird|Mux24~2_combout\)))) # (\u_bird|Add1~13_sumout\ & (\u_bird|Mux24~3_combout\)) ) ) # ( \u_bird|Add1~17_sumout\ & ( ((!\u_bird|Add1~1_sumout\ & 
-- ((!\u_bird|Add1~13_sumout\ & (\u_bird|Mux24~24_combout\)) # (\u_bird|Add1~13_sumout\ & ((\u_bird|Mux24~21_combout\)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001110100011101000000001100000000011101000111010011000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Mux24~3_combout\,
	datab => \u_bird|ALT_INV_Add1~13_sumout\,
	datac => \u_bird|ALT_INV_Add1~1_sumout\,
	datad => \u_bird|ALT_INV_Mux24~24_combout\,
	datae => \u_bird|ALT_INV_Add1~17_sumout\,
	dataf => \u_bird|ALT_INV_Mux24~21_combout\,
	datag => \u_bird|ALT_INV_Mux24~2_combout\,
	combout => \u_bird|Mux24~15_combout\);

-- Location: FF_X17_Y20_N31
\u_bird|bird_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_bird|Mux24~15_combout\,
	ena => \u_bird|process_0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_r\(0));

-- Location: FF_X17_Y20_N40
\u_vga_sync|pixel_column[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count[9]~DUPLICATE_q\,
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column[9]~DUPLICATE_q\);

-- Location: LABCELL_X14_Y21_N3
\u_mouse|SHIFTIN[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTIN[7]~0_combout\ = ( \u_mouse|READ_CHAR~q\ & ( !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( (\reset_n~input_o\ & !\u_mouse|LessThan1~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset_n~input_o\,
	datad => \u_mouse|ALT_INV_LessThan1~0_combout\,
	datae => \u_mouse|ALT_INV_READ_CHAR~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|SHIFTIN[7]~0_combout\);

-- Location: FF_X14_Y21_N4
\u_mouse|SHIFTIN[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \PS2_DAT~input_o\,
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(8));

-- Location: FF_X14_Y21_N14
\u_mouse|SHIFTIN[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(8),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(7));

-- Location: LABCELL_X12_Y19_N36
\u_mouse|PACKET_CHAR2[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[7]~feeder_combout\ = \u_mouse|SHIFTIN\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_SHIFTIN\(7),
	combout => \u_mouse|PACKET_CHAR2[7]~feeder_combout\);

-- Location: MLABCELL_X13_Y21_N30
\u_mouse|new_cursor_column[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|new_cursor_column[7]~0_combout\ = ( \u_mouse|PACKET_COUNT\(0) & ( !\u_mouse|PACKET_COUNT\(1) ) ) # ( !\u_mouse|PACKET_COUNT\(0) & ( \u_mouse|PACKET_COUNT\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	dataf => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	combout => \u_mouse|new_cursor_column[7]~0_combout\);

-- Location: LABCELL_X14_Y19_N51
\u_mouse|PACKET_COUNT[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_COUNT[1]~0_combout\ = ( \u_mouse|READ_CHAR~q\ & ( !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( (\u_mouse|INCNT\(3) & (((\u_mouse|INCNT\(2)) # (\u_mouse|INCNT\(1))) # (\u_mouse|INCNT\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_INCNT\(0),
	datab => \u_mouse|ALT_INV_INCNT\(1),
	datac => \u_mouse|ALT_INV_INCNT\(2),
	datad => \u_mouse|ALT_INV_INCNT\(3),
	datae => \u_mouse|ALT_INV_READ_CHAR~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|PACKET_COUNT[1]~0_combout\);

-- Location: FF_X13_Y21_N56
\u_mouse|PACKET_COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|new_cursor_column[7]~0_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|PACKET_COUNT[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_COUNT\(1));

-- Location: MLABCELL_X13_Y21_N42
\u_mouse|PACKET_COUNT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_COUNT~1_combout\ = (!\u_mouse|PACKET_COUNT\(0)) # (\u_mouse|PACKET_COUNT\(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111110101111101011111010111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datac => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	combout => \u_mouse|PACKET_COUNT~1_combout\);

-- Location: MLABCELL_X13_Y21_N48
\u_mouse|PACKET_COUNT[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_COUNT[0]~feeder_combout\ = \u_mouse|PACKET_COUNT~1_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_PACKET_COUNT~1_combout\,
	combout => \u_mouse|PACKET_COUNT[0]~feeder_combout\);

-- Location: FF_X13_Y21_N50
\u_mouse|PACKET_COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_COUNT[0]~feeder_combout\,
	clrn => \reset_n~input_o\,
	ena => \u_mouse|PACKET_COUNT[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_COUNT\(0));

-- Location: MLABCELL_X13_Y21_N3
\u_mouse|PACKET_CHAR2[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[7]~0_combout\ = ( \u_mouse|PACKET_COUNT\(1) & ( \u_mouse|LessThan1~0_combout\ & ( (\reset_n~input_o\ & (\u_mouse|READ_CHAR~q\ & (!\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & !\u_mouse|PACKET_COUNT\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset_n~input_o\,
	datab => \u_mouse|ALT_INV_READ_CHAR~q\,
	datac => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datad => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datae => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	dataf => \u_mouse|ALT_INV_LessThan1~0_combout\,
	combout => \u_mouse|PACKET_CHAR2[7]~0_combout\);

-- Location: FF_X12_Y19_N38
\u_mouse|PACKET_CHAR2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR2[7]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(7));

-- Location: FF_X14_Y21_N17
\u_mouse|SHIFTIN[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(7),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(6));

-- Location: FF_X14_Y21_N20
\u_mouse|SHIFTIN[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(6),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(5));

-- Location: FF_X14_Y21_N23
\u_mouse|SHIFTIN[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(5),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(4));

-- Location: FF_X14_Y21_N26
\u_mouse|SHIFTIN[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(4),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(3));

-- Location: FF_X14_Y21_N29
\u_mouse|SHIFTIN[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(3),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(2));

-- Location: FF_X14_Y21_N38
\u_mouse|SHIFTIN[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(2),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(1));

-- Location: FF_X14_Y21_N41
\u_mouse|SHIFTIN[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(1),
	sload => VCC,
	ena => \u_mouse|SHIFTIN[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|SHIFTIN\(0));

-- Location: MLABCELL_X13_Y22_N9
\u_mouse|PACKET_CHAR2[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[0]~feeder_combout\ = \u_mouse|SHIFTIN\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_SHIFTIN\(0),
	combout => \u_mouse|PACKET_CHAR2[0]~feeder_combout\);

-- Location: FF_X13_Y22_N11
\u_mouse|PACKET_CHAR2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR2[0]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(0));

-- Location: MLABCELL_X18_Y20_N21
\u_mouse|cursor_column~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~7_combout\ = ( \u_mouse|new_cursor_column\(0) & ( (!\u_mouse|new_cursor_column\(9)) # ((!\u_mouse|new_cursor_column\(7) & !\u_mouse|new_cursor_column\(8))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111010101010101111101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(9),
	datac => \u_mouse|ALT_INV_new_cursor_column\(7),
	datad => \u_mouse|ALT_INV_new_cursor_column\(8),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(0),
	combout => \u_mouse|cursor_column~7_combout\);

-- Location: MLABCELL_X18_Y20_N48
\u_mouse|cursor_column[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column[1]~0_combout\ = ( !\u_mouse|PACKET_COUNT\(1) & ( \u_mouse|RECV_UART~1_combout\ & ( !\u_mouse|PACKET_COUNT\(0) ) ) ) # ( \u_mouse|PACKET_COUNT\(1) & ( !\u_mouse|RECV_UART~1_combout\ & ( (!\u_mouse|cursor_column\(7) & 
-- (!\u_mouse|cursor_column\(8) & !\u_mouse|cursor_column\(9))) ) ) ) # ( !\u_mouse|PACKET_COUNT\(1) & ( !\u_mouse|RECV_UART~1_combout\ & ( (!\u_mouse|PACKET_COUNT\(0)) # ((!\u_mouse|cursor_column\(7) & (!\u_mouse|cursor_column\(8) & 
-- !\u_mouse|cursor_column\(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110000000100000001000000011111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_column\(7),
	datab => \u_mouse|ALT_INV_cursor_column\(8),
	datac => \u_mouse|ALT_INV_cursor_column\(9),
	datad => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datae => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	dataf => \u_mouse|ALT_INV_RECV_UART~1_combout\,
	combout => \u_mouse|cursor_column[1]~0_combout\);

-- Location: MLABCELL_X13_Y21_N6
\u_mouse|cursor_row[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row[8]~0_combout\ = ( \u_mouse|LessThan1~0_combout\ & ( (\reset_n~input_o\ & (\u_mouse|READ_CHAR~q\ & (!\u_mouse|PACKET_COUNT\(1) & !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset_n~input_o\,
	datab => \u_mouse|ALT_INV_READ_CHAR~q\,
	datac => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	dataf => \u_mouse|ALT_INV_LessThan1~0_combout\,
	combout => \u_mouse|cursor_row[8]~0_combout\);

-- Location: FF_X18_Y20_N23
\u_mouse|cursor_column[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~7_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(0));

-- Location: LABCELL_X12_Y20_N0
\u_mouse|Add5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~5_sumout\ = SUM(( \u_mouse|cursor_column\(0) ) + ( \u_mouse|PACKET_CHAR2\(0) ) + ( !VCC ))
-- \u_mouse|Add5~6\ = CARRY(( \u_mouse|cursor_column\(0) ) + ( \u_mouse|PACKET_CHAR2\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_PACKET_CHAR2\(0),
	datad => \u_mouse|ALT_INV_cursor_column\(0),
	cin => GND,
	sumout => \u_mouse|Add5~5_sumout\,
	cout => \u_mouse|Add5~6\);

-- Location: MLABCELL_X18_Y21_N48
\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: MLABCELL_X13_Y21_N21
\u_mouse|Equal4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Equal4~0_combout\ = ( \u_mouse|PACKET_COUNT\(0) & ( !\u_mouse|PACKET_COUNT\(1) ) ) # ( !\u_mouse|PACKET_COUNT\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	dataf => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	combout => \u_mouse|Equal4~0_combout\);

-- Location: MLABCELL_X13_Y20_N21
\u_mouse|new_cursor_row[9]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|new_cursor_row[9]~0_combout\ = ( \u_mouse|LessThan1~0_combout\ & ( !\u_mouse|new_cursor_column[7]~0_combout\ & ( (\reset_n~input_o\ & (\u_mouse|READ_CHAR~q\ & !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset_n~input_o\,
	datac => \u_mouse|ALT_INV_READ_CHAR~q\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datae => \u_mouse|ALT_INV_LessThan1~0_combout\,
	dataf => \u_mouse|ALT_INV_new_cursor_column[7]~0_combout\,
	combout => \u_mouse|new_cursor_row[9]~0_combout\);

-- Location: FF_X12_Y20_N2
\u_mouse|new_cursor_column[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~5_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(0));

-- Location: LABCELL_X12_Y19_N21
\u_mouse|PACKET_CHAR2[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[1]~feeder_combout\ = \u_mouse|SHIFTIN\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_SHIFTIN\(1),
	combout => \u_mouse|PACKET_CHAR2[1]~feeder_combout\);

-- Location: FF_X12_Y19_N22
\u_mouse|PACKET_CHAR2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR2[1]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(1));

-- Location: MLABCELL_X18_Y20_N3
\u_mouse|cursor_column~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~8_combout\ = ( \u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(1) & ( (!\u_mouse|new_cursor_column\(9)) # ((!\u_mouse|new_cursor_column\(0) & (\u_mouse|RECV_UART~0_combout\ & !\u_mouse|new_cursor_column\(8)))) ) ) ) # 
-- ( !\u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(1) & ( (!\u_mouse|new_cursor_column\(9)) # (!\u_mouse|new_cursor_column\(8)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111101010101010111010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(9),
	datab => \u_mouse|ALT_INV_new_cursor_column\(0),
	datac => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	datad => \u_mouse|ALT_INV_new_cursor_column\(8),
	datae => \u_mouse|ALT_INV_new_cursor_column\(7),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(1),
	combout => \u_mouse|cursor_column~8_combout\);

-- Location: FF_X18_Y20_N5
\u_mouse|cursor_column[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~8_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(1));

-- Location: LABCELL_X12_Y20_N3
\u_mouse|Add5~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~33_sumout\ = SUM(( \u_mouse|cursor_column\(1) ) + ( \u_mouse|PACKET_CHAR2\(1) ) + ( \u_mouse|Add5~6\ ))
-- \u_mouse|Add5~34\ = CARRY(( \u_mouse|cursor_column\(1) ) + ( \u_mouse|PACKET_CHAR2\(1) ) + ( \u_mouse|Add5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_CHAR2\(1),
	datac => \u_mouse|ALT_INV_cursor_column\(1),
	cin => \u_mouse|Add5~6\,
	sumout => \u_mouse|Add5~33_sumout\,
	cout => \u_mouse|Add5~34\);

-- Location: FF_X12_Y20_N5
\u_mouse|new_cursor_column[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~33_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(1));

-- Location: MLABCELL_X13_Y20_N3
\u_mouse|PACKET_CHAR2[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[5]~feeder_combout\ = \u_mouse|SHIFTIN\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_SHIFTIN\(5),
	combout => \u_mouse|PACKET_CHAR2[5]~feeder_combout\);

-- Location: FF_X13_Y20_N5
\u_mouse|PACKET_CHAR2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR2[5]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(5));

-- Location: MLABCELL_X18_Y20_N0
\u_mouse|cursor_column~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~6_combout\ = ( \u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(5) & ( (!\u_mouse|new_cursor_column\(9)) # ((!\u_mouse|new_cursor_column\(0) & (!\u_mouse|new_cursor_column\(8) & \u_mouse|RECV_UART~0_combout\))) ) ) ) # 
-- ( !\u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(5) & ( (!\u_mouse|new_cursor_column\(9)) # (!\u_mouse|new_cursor_column\(8)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111010111110101010101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(9),
	datab => \u_mouse|ALT_INV_new_cursor_column\(0),
	datac => \u_mouse|ALT_INV_new_cursor_column\(8),
	datad => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	datae => \u_mouse|ALT_INV_new_cursor_column\(7),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(5),
	combout => \u_mouse|cursor_column~6_combout\);

-- Location: FF_X18_Y20_N2
\u_mouse|cursor_column[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~6_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(5));

-- Location: FF_X12_Y19_N56
\u_mouse|PACKET_CHAR2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(4),
	sload => VCC,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(4));

-- Location: MLABCELL_X13_Y22_N39
\u_mouse|PACKET_CHAR2[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[3]~feeder_combout\ = \u_mouse|SHIFTIN\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_SHIFTIN\(3),
	combout => \u_mouse|PACKET_CHAR2[3]~feeder_combout\);

-- Location: FF_X13_Y22_N40
\u_mouse|PACKET_CHAR2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR2[3]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(3));

-- Location: LABCELL_X12_Y19_N51
\u_mouse|PACKET_CHAR2[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR2[2]~feeder_combout\ = \u_mouse|SHIFTIN\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_SHIFTIN\(2),
	combout => \u_mouse|PACKET_CHAR2[2]~feeder_combout\);

-- Location: FF_X12_Y19_N52
\u_mouse|PACKET_CHAR2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR2[2]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(2));

-- Location: LABCELL_X12_Y20_N6
\u_mouse|Add5~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~29_sumout\ = SUM(( \u_mouse|cursor_column\(2) ) + ( \u_mouse|PACKET_CHAR2\(2) ) + ( \u_mouse|Add5~34\ ))
-- \u_mouse|Add5~30\ = CARRY(( \u_mouse|cursor_column\(2) ) + ( \u_mouse|PACKET_CHAR2\(2) ) + ( \u_mouse|Add5~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_PACKET_CHAR2\(2),
	datad => \u_mouse|ALT_INV_cursor_column\(2),
	cin => \u_mouse|Add5~34\,
	sumout => \u_mouse|Add5~29_sumout\,
	cout => \u_mouse|Add5~30\);

-- Location: FF_X12_Y20_N8
\u_mouse|new_cursor_column[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~29_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(2));

-- Location: LABCELL_X12_Y20_N54
\u_mouse|cursor_column~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~9_combout\ = ( \u_mouse|new_cursor_column\(9) & ( \u_mouse|new_cursor_column\(2) & ( (!\u_mouse|new_cursor_column\(8) & ((!\u_mouse|new_cursor_column\(7)) # ((!\u_mouse|new_cursor_column\(0) & \u_mouse|RECV_UART~0_combout\)))) ) ) ) 
-- # ( !\u_mouse|new_cursor_column\(9) & ( \u_mouse|new_cursor_column\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111010000010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(8),
	datab => \u_mouse|ALT_INV_new_cursor_column\(0),
	datac => \u_mouse|ALT_INV_new_cursor_column\(7),
	datad => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	datae => \u_mouse|ALT_INV_new_cursor_column\(9),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(2),
	combout => \u_mouse|cursor_column~9_combout\);

-- Location: FF_X18_Y20_N53
\u_mouse|cursor_column[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|cursor_column~9_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	sload => VCC,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(2));

-- Location: LABCELL_X12_Y20_N9
\u_mouse|Add5~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~25_sumout\ = SUM(( \u_mouse|cursor_column\(3) ) + ( \u_mouse|PACKET_CHAR2\(3) ) + ( \u_mouse|Add5~30\ ))
-- \u_mouse|Add5~26\ = CARRY(( \u_mouse|cursor_column\(3) ) + ( \u_mouse|PACKET_CHAR2\(3) ) + ( \u_mouse|Add5~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_CHAR2\(3),
	datad => \u_mouse|ALT_INV_cursor_column\(3),
	cin => \u_mouse|Add5~30\,
	sumout => \u_mouse|Add5~25_sumout\,
	cout => \u_mouse|Add5~26\);

-- Location: FF_X12_Y20_N11
\u_mouse|new_cursor_column[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~25_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(3));

-- Location: MLABCELL_X18_Y20_N39
\u_mouse|cursor_column~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~4_combout\ = ( \u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(3) & ( (!\u_mouse|new_cursor_column\(9)) # ((!\u_mouse|new_cursor_column\(0) & (\u_mouse|RECV_UART~0_combout\ & !\u_mouse|new_cursor_column\(8)))) ) ) ) # 
-- ( !\u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(3) & ( (!\u_mouse|new_cursor_column\(9)) # (!\u_mouse|new_cursor_column\(8)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111101010101010111010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(9),
	datab => \u_mouse|ALT_INV_new_cursor_column\(0),
	datac => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	datad => \u_mouse|ALT_INV_new_cursor_column\(8),
	datae => \u_mouse|ALT_INV_new_cursor_column\(7),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(3),
	combout => \u_mouse|cursor_column~4_combout\);

-- Location: FF_X18_Y20_N41
\u_mouse|cursor_column[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~4_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(3));

-- Location: LABCELL_X12_Y20_N12
\u_mouse|Add5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~21_sumout\ = SUM(( \u_mouse|cursor_column\(4) ) + ( \u_mouse|PACKET_CHAR2\(4) ) + ( \u_mouse|Add5~26\ ))
-- \u_mouse|Add5~22\ = CARRY(( \u_mouse|cursor_column\(4) ) + ( \u_mouse|PACKET_CHAR2\(4) ) + ( \u_mouse|Add5~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_PACKET_CHAR2\(4),
	datad => \u_mouse|ALT_INV_cursor_column\(4),
	cin => \u_mouse|Add5~26\,
	sumout => \u_mouse|Add5~21_sumout\,
	cout => \u_mouse|Add5~22\);

-- Location: FF_X12_Y20_N14
\u_mouse|new_cursor_column[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~21_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(4));

-- Location: MLABCELL_X18_Y20_N36
\u_mouse|cursor_column~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~5_combout\ = ( \u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(4) & ( (!\u_mouse|new_cursor_column\(9)) # ((!\u_mouse|new_cursor_column\(0) & (!\u_mouse|new_cursor_column\(8) & \u_mouse|RECV_UART~0_combout\))) ) ) ) # 
-- ( !\u_mouse|new_cursor_column\(7) & ( \u_mouse|new_cursor_column\(4) & ( (!\u_mouse|new_cursor_column\(9)) # (!\u_mouse|new_cursor_column\(8)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111010111110101010101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(9),
	datab => \u_mouse|ALT_INV_new_cursor_column\(0),
	datac => \u_mouse|ALT_INV_new_cursor_column\(8),
	datad => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	datae => \u_mouse|ALT_INV_new_cursor_column\(7),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(4),
	combout => \u_mouse|cursor_column~5_combout\);

-- Location: FF_X18_Y20_N38
\u_mouse|cursor_column[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~5_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(4));

-- Location: LABCELL_X12_Y20_N15
\u_mouse|Add5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~17_sumout\ = SUM(( \u_mouse|cursor_column\(5) ) + ( \u_mouse|PACKET_CHAR2\(5) ) + ( \u_mouse|Add5~22\ ))
-- \u_mouse|Add5~18\ = CARRY(( \u_mouse|cursor_column\(5) ) + ( \u_mouse|PACKET_CHAR2\(5) ) + ( \u_mouse|Add5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_PACKET_CHAR2\(5),
	datad => \u_mouse|ALT_INV_cursor_column\(5),
	cin => \u_mouse|Add5~22\,
	sumout => \u_mouse|Add5~17_sumout\,
	cout => \u_mouse|Add5~18\);

-- Location: FF_X12_Y20_N17
\u_mouse|new_cursor_column[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~17_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(5));

-- Location: FF_X13_Y20_N46
\u_mouse|PACKET_CHAR2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(6),
	sload => VCC,
	ena => \u_mouse|PACKET_CHAR2[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR2\(6));

-- Location: LABCELL_X12_Y20_N18
\u_mouse|Add5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~13_sumout\ = SUM(( \u_mouse|PACKET_CHAR2\(6) ) + ( \u_mouse|cursor_column\(6) ) + ( \u_mouse|Add5~18\ ))
-- \u_mouse|Add5~14\ = CARRY(( \u_mouse|PACKET_CHAR2\(6) ) + ( \u_mouse|cursor_column\(6) ) + ( \u_mouse|Add5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_cursor_column\(6),
	datad => \u_mouse|ALT_INV_PACKET_CHAR2\(6),
	cin => \u_mouse|Add5~18\,
	sumout => \u_mouse|Add5~13_sumout\,
	cout => \u_mouse|Add5~14\);

-- Location: FF_X12_Y20_N20
\u_mouse|new_cursor_column[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~13_sumout\,
	asdata => VCC,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(6));

-- Location: LABCELL_X12_Y20_N30
\u_mouse|RECV_UART~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|RECV_UART~0_combout\ = ( !\u_mouse|new_cursor_column\(2) & ( !\u_mouse|new_cursor_column\(4) & ( (!\u_mouse|new_cursor_column\(1) & (!\u_mouse|new_cursor_column\(5) & (!\u_mouse|new_cursor_column\(6) & !\u_mouse|new_cursor_column\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(1),
	datab => \u_mouse|ALT_INV_new_cursor_column\(5),
	datac => \u_mouse|ALT_INV_new_cursor_column\(6),
	datad => \u_mouse|ALT_INV_new_cursor_column\(3),
	datae => \u_mouse|ALT_INV_new_cursor_column\(2),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(4),
	combout => \u_mouse|RECV_UART~0_combout\);

-- Location: LABCELL_X12_Y20_N45
\u_mouse|RECV_UART~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|RECV_UART~1_combout\ = ( \u_mouse|RECV_UART~0_combout\ & ( (!\u_mouse|new_cursor_column\(9) & ((!\u_mouse|new_cursor_column\(8) & (\u_mouse|new_cursor_column\(7))) # (\u_mouse|new_cursor_column\(8) & (!\u_mouse|new_cursor_column\(7) & 
-- !\u_mouse|new_cursor_column\(0))))) ) ) # ( !\u_mouse|RECV_UART~0_combout\ & ( (!\u_mouse|new_cursor_column\(8) & !\u_mouse|new_cursor_column\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000001100010000000000110001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(8),
	datab => \u_mouse|ALT_INV_new_cursor_column\(7),
	datac => \u_mouse|ALT_INV_new_cursor_column\(0),
	datad => \u_mouse|ALT_INV_new_cursor_column\(9),
	dataf => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	combout => \u_mouse|RECV_UART~1_combout\);

-- Location: LABCELL_X12_Y20_N51
\u_mouse|RECV_UART~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|RECV_UART~2_combout\ = ( !\u_mouse|cursor_column\(8) & ( (!\u_mouse|cursor_column\(7) & !\u_mouse|cursor_column\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_cursor_column\(7),
	datad => \u_mouse|ALT_INV_cursor_column\(9),
	dataf => \u_mouse|ALT_INV_cursor_column\(8),
	combout => \u_mouse|RECV_UART~2_combout\);

-- Location: MLABCELL_X13_Y21_N15
\u_mouse|Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Equal3~0_combout\ = ( !\u_mouse|PACKET_COUNT\(0) & ( !\u_mouse|PACKET_COUNT\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	dataf => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	combout => \u_mouse|Equal3~0_combout\);

-- Location: LABCELL_X12_Y20_N36
\u_mouse|cursor_column~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~1_combout\ = ( \u_mouse|new_cursor_column\(6) & ( ((!\u_mouse|LessThan9~0_combout\ & ((!\u_mouse|RECV_UART~2_combout\) # (\u_mouse|RECV_UART~1_combout\)))) # (\u_mouse|Equal3~0_combout\) ) ) # ( !\u_mouse|new_cursor_column\(6) & ( 
-- \u_mouse|Equal3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111110100010111111111010001011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_LessThan9~0_combout\,
	datab => \u_mouse|ALT_INV_RECV_UART~1_combout\,
	datac => \u_mouse|ALT_INV_RECV_UART~2_combout\,
	datad => \u_mouse|ALT_INV_Equal3~0_combout\,
	dataf => \u_mouse|ALT_INV_new_cursor_column\(6),
	combout => \u_mouse|cursor_column~1_combout\);

-- Location: FF_X12_Y20_N38
\u_mouse|cursor_column[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~1_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(6));

-- Location: LABCELL_X12_Y20_N21
\u_mouse|Add5~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~37_sumout\ = SUM(( \u_mouse|cursor_column\(7) ) + ( \u_mouse|PACKET_CHAR2\(7) ) + ( \u_mouse|Add5~14\ ))
-- \u_mouse|Add5~38\ = CARRY(( \u_mouse|cursor_column\(7) ) + ( \u_mouse|PACKET_CHAR2\(7) ) + ( \u_mouse|Add5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_CHAR2\(7),
	datad => \u_mouse|ALT_INV_cursor_column\(7),
	cin => \u_mouse|Add5~14\,
	sumout => \u_mouse|Add5~37_sumout\,
	cout => \u_mouse|Add5~38\);

-- Location: FF_X12_Y20_N23
\u_mouse|new_cursor_column[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~37_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(7));

-- Location: LABCELL_X12_Y20_N42
\u_mouse|cursor_column~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~2_combout\ = ( \u_mouse|new_cursor_column\(8) & ( (\u_mouse|new_cursor_column\(9)) # (\u_mouse|new_cursor_column\(7)) ) ) # ( !\u_mouse|new_cursor_column\(8) & ( \u_mouse|new_cursor_column\(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_new_cursor_column\(7),
	datac => \u_mouse|ALT_INV_new_cursor_column\(9),
	dataf => \u_mouse|ALT_INV_new_cursor_column\(8),
	combout => \u_mouse|cursor_column~2_combout\);

-- Location: FF_X18_Y20_N56
\u_mouse|cursor_column[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|cursor_column~2_combout\,
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	sload => VCC,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(7));

-- Location: LABCELL_X12_Y20_N24
\u_mouse|Add5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~9_sumout\ = SUM(( \u_mouse|cursor_column\(8) ) + ( \u_mouse|PACKET_CHAR2\(7) ) + ( \u_mouse|Add5~38\ ))
-- \u_mouse|Add5~10\ = CARRY(( \u_mouse|cursor_column\(8) ) + ( \u_mouse|PACKET_CHAR2\(7) ) + ( \u_mouse|Add5~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_PACKET_CHAR2\(7),
	datad => \u_mouse|ALT_INV_cursor_column\(8),
	cin => \u_mouse|Add5~38\,
	sumout => \u_mouse|Add5~9_sumout\,
	cout => \u_mouse|Add5~10\);

-- Location: FF_X12_Y20_N26
\u_mouse|new_cursor_column[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~9_sumout\,
	asdata => VCC,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(8));

-- Location: LABCELL_X12_Y20_N48
\u_mouse|LessThan9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan9~0_combout\ = ( \u_mouse|RECV_UART~0_combout\ & ( (\u_mouse|new_cursor_column\(9) & (((\u_mouse|new_cursor_column\(0) & \u_mouse|new_cursor_column\(7))) # (\u_mouse|new_cursor_column\(8)))) ) ) # ( !\u_mouse|RECV_UART~0_combout\ & ( 
-- (\u_mouse|new_cursor_column\(9) & ((\u_mouse|new_cursor_column\(7)) # (\u_mouse|new_cursor_column\(8)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111100000000010101110000000001010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_column\(8),
	datab => \u_mouse|ALT_INV_new_cursor_column\(0),
	datac => \u_mouse|ALT_INV_new_cursor_column\(7),
	datad => \u_mouse|ALT_INV_new_cursor_column\(9),
	dataf => \u_mouse|ALT_INV_RECV_UART~0_combout\,
	combout => \u_mouse|LessThan9~0_combout\);

-- Location: LABCELL_X12_Y20_N39
\u_mouse|cursor_column~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_column~3_combout\ = ( \u_mouse|new_cursor_column\(8) & ( ((!\u_mouse|LessThan9~0_combout\ & ((!\u_mouse|RECV_UART~2_combout\) # (\u_mouse|RECV_UART~1_combout\)))) # (\u_mouse|Equal3~0_combout\) ) ) # ( !\u_mouse|new_cursor_column\(8) & ( 
-- \u_mouse|Equal3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111110100010111111111010001011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_LessThan9~0_combout\,
	datab => \u_mouse|ALT_INV_RECV_UART~1_combout\,
	datac => \u_mouse|ALT_INV_RECV_UART~2_combout\,
	datad => \u_mouse|ALT_INV_Equal3~0_combout\,
	dataf => \u_mouse|ALT_INV_new_cursor_column\(8),
	combout => \u_mouse|cursor_column~3_combout\);

-- Location: FF_X12_Y20_N41
\u_mouse|cursor_column[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_column~3_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(8));

-- Location: LABCELL_X12_Y20_N27
\u_mouse|Add5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add5~1_sumout\ = SUM(( \u_mouse|cursor_column\(9) ) + ( \u_mouse|PACKET_CHAR2\(7) ) + ( \u_mouse|Add5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_CHAR2\(7),
	datac => \u_mouse|ALT_INV_cursor_column\(9),
	cin => \u_mouse|Add5~10\,
	sumout => \u_mouse|Add5~1_sumout\);

-- Location: FF_X12_Y20_N29
\u_mouse|new_cursor_column[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add5~1_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_column\(9));

-- Location: FF_X18_Y20_N26
\u_mouse|cursor_column[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|new_cursor_column\(9),
	sclr => \u_mouse|cursor_column[1]~0_combout\,
	sload => VCC,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_column\(9));

-- Location: LABCELL_X17_Y20_N9
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( \u_mouse|cursor_column\(9) & ( !\u_vga_sync|pixel_column[9]~DUPLICATE_q\ ) ) # ( !\u_mouse|cursor_column\(9) & ( \u_vga_sync|pixel_column[9]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_pixel_column[9]~DUPLICATE_q\,
	dataf => \u_mouse|ALT_INV_cursor_column\(9),
	combout => \Equal1~0_combout\);

-- Location: LABCELL_X12_Y19_N33
\u_mouse|PACKET_CHAR3[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[7]~feeder_combout\ = \u_mouse|SHIFTIN\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_SHIFTIN\(7),
	combout => \u_mouse|PACKET_CHAR3[7]~feeder_combout\);

-- Location: MLABCELL_X13_Y21_N24
\u_mouse|PACKET_CHAR3[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[7]~0_combout\ = ( !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( \u_mouse|LessThan1~0_combout\ & ( (!\u_mouse|Equal4~0_combout\ & (\u_mouse|READ_CHAR~q\ & \reset_n~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_Equal4~0_combout\,
	datab => \u_mouse|ALT_INV_READ_CHAR~q\,
	datac => \ALT_INV_reset_n~input_o\,
	datae => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	dataf => \u_mouse|ALT_INV_LessThan1~0_combout\,
	combout => \u_mouse|PACKET_CHAR3[7]~0_combout\);

-- Location: FF_X12_Y19_N35
\u_mouse|PACKET_CHAR3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[7]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(7));

-- Location: MLABCELL_X13_Y22_N24
\u_mouse|PACKET_CHAR3[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[6]~feeder_combout\ = \u_mouse|SHIFTIN\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_SHIFTIN\(6),
	combout => \u_mouse|PACKET_CHAR3[6]~feeder_combout\);

-- Location: FF_X13_Y22_N25
\u_mouse|PACKET_CHAR3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[6]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(6));

-- Location: LABCELL_X12_Y19_N24
\u_mouse|PACKET_CHAR3[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[5]~feeder_combout\ = \u_mouse|SHIFTIN\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_SHIFTIN\(5),
	combout => \u_mouse|PACKET_CHAR3[5]~feeder_combout\);

-- Location: FF_X12_Y19_N26
\u_mouse|PACKET_CHAR3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[5]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(5));

-- Location: FF_X12_Y19_N16
\u_mouse|PACKET_CHAR3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|SHIFTIN\(4),
	sload => VCC,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(4));

-- Location: LABCELL_X12_Y21_N21
\u_mouse|Add4~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~29_sumout\ = SUM(( !\u_mouse|PACKET_CHAR3\(7) $ (\u_mouse|cursor_row\(7)) ) + ( \u_mouse|Add4~35\ ) + ( \u_mouse|Add4~34\ ))
-- \u_mouse|Add4~30\ = CARRY(( !\u_mouse|PACKET_CHAR3\(7) $ (\u_mouse|cursor_row\(7)) ) + ( \u_mouse|Add4~35\ ) + ( \u_mouse|Add4~34\ ))
-- \u_mouse|Add4~31\ = SHARE((!\u_mouse|PACKET_CHAR3\(7) & \u_mouse|cursor_row\(7)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001010101000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_CHAR3\(7),
	datad => \u_mouse|ALT_INV_cursor_row\(7),
	cin => \u_mouse|Add4~34\,
	sharein => \u_mouse|Add4~35\,
	sumout => \u_mouse|Add4~29_sumout\,
	cout => \u_mouse|Add4~30\,
	shareout => \u_mouse|Add4~31\);

-- Location: FF_X12_Y21_N23
\u_mouse|new_cursor_row[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~29_sumout\,
	asdata => VCC,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(7));

-- Location: MLABCELL_X13_Y21_N9
\u_mouse|LessThan5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan5~1_combout\ = ( \u_mouse|new_cursor_row\(7) & ( (\u_mouse|new_cursor_row\(5) & \u_mouse|new_cursor_row\(6)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_new_cursor_row\(5),
	datad => \u_mouse|ALT_INV_new_cursor_row\(6),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(7),
	combout => \u_mouse|LessThan5~1_combout\);

-- Location: MLABCELL_X13_Y22_N33
\u_mouse|PACKET_CHAR3[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[3]~feeder_combout\ = \u_mouse|SHIFTIN\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_SHIFTIN\(3),
	combout => \u_mouse|PACKET_CHAR3[3]~feeder_combout\);

-- Location: FF_X13_Y22_N34
\u_mouse|PACKET_CHAR3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[3]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(3));

-- Location: LABCELL_X12_Y19_N9
\u_mouse|PACKET_CHAR3[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[2]~feeder_combout\ = \u_mouse|SHIFTIN\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_SHIFTIN\(2),
	combout => \u_mouse|PACKET_CHAR3[2]~feeder_combout\);

-- Location: FF_X12_Y19_N11
\u_mouse|PACKET_CHAR3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[2]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(2));

-- Location: LABCELL_X12_Y19_N3
\u_mouse|PACKET_CHAR3[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[1]~feeder_combout\ = \u_mouse|SHIFTIN\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_SHIFTIN\(1),
	combout => \u_mouse|PACKET_CHAR3[1]~feeder_combout\);

-- Location: FF_X12_Y19_N4
\u_mouse|PACKET_CHAR3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[1]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(1));

-- Location: MLABCELL_X13_Y22_N3
\u_mouse|PACKET_CHAR3[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|PACKET_CHAR3[0]~feeder_combout\ = \u_mouse|SHIFTIN\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_SHIFTIN\(0),
	combout => \u_mouse|PACKET_CHAR3[0]~feeder_combout\);

-- Location: FF_X13_Y22_N5
\u_mouse|PACKET_CHAR3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|PACKET_CHAR3[0]~feeder_combout\,
	ena => \u_mouse|PACKET_CHAR3[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|PACKET_CHAR3\(0));

-- Location: LABCELL_X12_Y21_N0
\u_mouse|Add4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~1_sumout\ = SUM(( !\u_mouse|cursor_row\(0) $ (!\u_mouse|PACKET_CHAR3\(0)) ) + ( !VCC ) + ( !VCC ))
-- \u_mouse|Add4~2\ = CARRY(( !\u_mouse|cursor_row\(0) $ (!\u_mouse|PACKET_CHAR3\(0)) ) + ( !VCC ) + ( !VCC ))
-- \u_mouse|Add4~3\ = SHARE((!\u_mouse|PACKET_CHAR3\(0)) # (\u_mouse|cursor_row\(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110111011101110100000000000000000110011001100110",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row\(0),
	datab => \u_mouse|ALT_INV_PACKET_CHAR3\(0),
	cin => GND,
	sharein => GND,
	sumout => \u_mouse|Add4~1_sumout\,
	cout => \u_mouse|Add4~2\,
	shareout => \u_mouse|Add4~3\);

-- Location: LABCELL_X12_Y21_N3
\u_mouse|Add4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~17_sumout\ = SUM(( !\u_mouse|cursor_row\(1) $ (\u_mouse|PACKET_CHAR3\(1)) ) + ( \u_mouse|Add4~3\ ) + ( \u_mouse|Add4~2\ ))
-- \u_mouse|Add4~18\ = CARRY(( !\u_mouse|cursor_row\(1) $ (\u_mouse|PACKET_CHAR3\(1)) ) + ( \u_mouse|Add4~3\ ) + ( \u_mouse|Add4~2\ ))
-- \u_mouse|Add4~19\ = SHARE((\u_mouse|cursor_row\(1) & !\u_mouse|PACKET_CHAR3\(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_cursor_row\(1),
	datad => \u_mouse|ALT_INV_PACKET_CHAR3\(1),
	cin => \u_mouse|Add4~2\,
	sharein => \u_mouse|Add4~3\,
	sumout => \u_mouse|Add4~17_sumout\,
	cout => \u_mouse|Add4~18\,
	shareout => \u_mouse|Add4~19\);

-- Location: FF_X12_Y21_N5
\u_mouse|new_cursor_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~17_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(1));

-- Location: LABCELL_X12_Y21_N33
\u_mouse|cursor_row~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~8_combout\ = ( \u_mouse|new_cursor_row\(1) & ( \u_mouse|LessThan5~2_combout\ & ( (!\u_mouse|Equal3~0_combout\ & (((\u_mouse|RECV_UART~5_combout\) # (\u_mouse|cursor_row\(8))) # (\u_mouse|cursor_row\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row\(7),
	datab => \u_mouse|ALT_INV_cursor_row\(8),
	datac => \u_mouse|ALT_INV_Equal3~0_combout\,
	datad => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datae => \u_mouse|ALT_INV_new_cursor_row\(1),
	dataf => \u_mouse|ALT_INV_LessThan5~2_combout\,
	combout => \u_mouse|cursor_row~8_combout\);

-- Location: FF_X12_Y21_N35
\u_mouse|cursor_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~8_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(1));

-- Location: LABCELL_X12_Y21_N6
\u_mouse|Add4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~13_sumout\ = SUM(( !\u_mouse|cursor_row\(2) $ (\u_mouse|PACKET_CHAR3\(2)) ) + ( \u_mouse|Add4~19\ ) + ( \u_mouse|Add4~18\ ))
-- \u_mouse|Add4~14\ = CARRY(( !\u_mouse|cursor_row\(2) $ (\u_mouse|PACKET_CHAR3\(2)) ) + ( \u_mouse|Add4~19\ ) + ( \u_mouse|Add4~18\ ))
-- \u_mouse|Add4~15\ = SHARE((\u_mouse|cursor_row\(2) & !\u_mouse|PACKET_CHAR3\(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_cursor_row\(2),
	datad => \u_mouse|ALT_INV_PACKET_CHAR3\(2),
	cin => \u_mouse|Add4~18\,
	sharein => \u_mouse|Add4~19\,
	sumout => \u_mouse|Add4~13_sumout\,
	cout => \u_mouse|Add4~14\,
	shareout => \u_mouse|Add4~15\);

-- Location: FF_X12_Y21_N8
\u_mouse|new_cursor_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~13_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(2));

-- Location: LABCELL_X12_Y21_N36
\u_mouse|cursor_row~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~9_combout\ = ( \u_mouse|LessThan5~2_combout\ & ( \u_mouse|new_cursor_row\(2) & ( (!\u_mouse|Equal3~0_combout\ & (((\u_mouse|RECV_UART~5_combout\) # (\u_mouse|cursor_row\(8))) # (\u_mouse|cursor_row\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row\(7),
	datab => \u_mouse|ALT_INV_cursor_row\(8),
	datac => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datad => \u_mouse|ALT_INV_Equal3~0_combout\,
	datae => \u_mouse|ALT_INV_LessThan5~2_combout\,
	dataf => \u_mouse|ALT_INV_new_cursor_row\(2),
	combout => \u_mouse|cursor_row~9_combout\);

-- Location: FF_X12_Y21_N38
\u_mouse|cursor_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~9_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(2));

-- Location: LABCELL_X12_Y21_N9
\u_mouse|Add4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~9_sumout\ = SUM(( !\u_mouse|cursor_row\(3) $ (\u_mouse|PACKET_CHAR3\(3)) ) + ( \u_mouse|Add4~15\ ) + ( \u_mouse|Add4~14\ ))
-- \u_mouse|Add4~10\ = CARRY(( !\u_mouse|cursor_row\(3) $ (\u_mouse|PACKET_CHAR3\(3)) ) + ( \u_mouse|Add4~15\ ) + ( \u_mouse|Add4~14\ ))
-- \u_mouse|Add4~11\ = SHARE((\u_mouse|cursor_row\(3) & !\u_mouse|PACKET_CHAR3\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010000000000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row\(3),
	datad => \u_mouse|ALT_INV_PACKET_CHAR3\(3),
	cin => \u_mouse|Add4~14\,
	sharein => \u_mouse|Add4~15\,
	sumout => \u_mouse|Add4~9_sumout\,
	cout => \u_mouse|Add4~10\,
	shareout => \u_mouse|Add4~11\);

-- Location: FF_X12_Y21_N11
\u_mouse|new_cursor_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~9_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(3));

-- Location: LABCELL_X12_Y21_N12
\u_mouse|Add4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~5_sumout\ = SUM(( !\u_mouse|PACKET_CHAR3\(4) $ (\u_mouse|cursor_row\(4)) ) + ( \u_mouse|Add4~11\ ) + ( \u_mouse|Add4~10\ ))
-- \u_mouse|Add4~6\ = CARRY(( !\u_mouse|PACKET_CHAR3\(4) $ (\u_mouse|cursor_row\(4)) ) + ( \u_mouse|Add4~11\ ) + ( \u_mouse|Add4~10\ ))
-- \u_mouse|Add4~7\ = SHARE((!\u_mouse|PACKET_CHAR3\(4) & \u_mouse|cursor_row\(4)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_PACKET_CHAR3\(4),
	datad => \u_mouse|ALT_INV_cursor_row\(4),
	cin => \u_mouse|Add4~10\,
	sharein => \u_mouse|Add4~11\,
	sumout => \u_mouse|Add4~5_sumout\,
	cout => \u_mouse|Add4~6\,
	shareout => \u_mouse|Add4~7\);

-- Location: FF_X12_Y21_N14
\u_mouse|new_cursor_row[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~5_sumout\,
	asdata => VCC,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(4));

-- Location: LABCELL_X12_Y21_N42
\u_mouse|LessThan5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan5~0_combout\ = ( !\u_mouse|new_cursor_row\(2) & ( (!\u_mouse|new_cursor_row\(0) & (!\u_mouse|new_cursor_row\(3) & (!\u_mouse|new_cursor_row\(1) & !\u_mouse|new_cursor_row\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_row\(0),
	datab => \u_mouse|ALT_INV_new_cursor_row\(3),
	datac => \u_mouse|ALT_INV_new_cursor_row\(1),
	datad => \u_mouse|ALT_INV_new_cursor_row\(4),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(2),
	combout => \u_mouse|LessThan5~0_combout\);

-- Location: MLABCELL_X13_Y21_N18
\u_mouse|LessThan5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan5~2_combout\ = ( \u_mouse|LessThan5~0_combout\ & ( !\u_mouse|new_cursor_row\(9) ) ) # ( !\u_mouse|LessThan5~0_combout\ & ( (!\u_mouse|new_cursor_row\(9) & ((!\u_mouse|new_cursor_row\(8)) # (!\u_mouse|LessThan5~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000011100000111000001110000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_row\(8),
	datab => \u_mouse|ALT_INV_LessThan5~1_combout\,
	datac => \u_mouse|ALT_INV_new_cursor_row\(9),
	dataf => \u_mouse|ALT_INV_LessThan5~0_combout\,
	combout => \u_mouse|LessThan5~2_combout\);

-- Location: LABCELL_X12_Y21_N30
\u_mouse|cursor_row~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~7_combout\ = ( \u_mouse|new_cursor_row\(0) & ( \u_mouse|LessThan5~2_combout\ & ( (!\u_mouse|Equal3~0_combout\ & (((\u_mouse|RECV_UART~5_combout\) # (\u_mouse|cursor_row\(8))) # (\u_mouse|cursor_row\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row\(7),
	datab => \u_mouse|ALT_INV_cursor_row\(8),
	datac => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datad => \u_mouse|ALT_INV_Equal3~0_combout\,
	datae => \u_mouse|ALT_INV_new_cursor_row\(0),
	dataf => \u_mouse|ALT_INV_LessThan5~2_combout\,
	combout => \u_mouse|cursor_row~7_combout\);

-- Location: FF_X12_Y21_N32
\u_mouse|cursor_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~7_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(0));

-- Location: FF_X12_Y21_N2
\u_mouse|new_cursor_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~1_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(0));

-- Location: LABCELL_X12_Y21_N45
\u_mouse|RECV_UART~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|RECV_UART~3_combout\ = ( !\u_mouse|new_cursor_row\(2) & ( (!\u_mouse|new_cursor_row\(3) & (!\u_mouse|new_cursor_row\(4) & !\u_mouse|new_cursor_row\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000110000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_new_cursor_row\(3),
	datac => \u_mouse|ALT_INV_new_cursor_row\(4),
	datad => \u_mouse|ALT_INV_new_cursor_row\(1),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(2),
	combout => \u_mouse|RECV_UART~3_combout\);

-- Location: LABCELL_X12_Y21_N57
\u_mouse|RECV_UART~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|RECV_UART~4_combout\ = ( !\u_mouse|new_cursor_row\(6) & ( (!\u_mouse|new_cursor_row\(5) & !\u_mouse|new_cursor_row\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_new_cursor_row\(5),
	datad => \u_mouse|ALT_INV_new_cursor_row\(7),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(6),
	combout => \u_mouse|RECV_UART~4_combout\);

-- Location: LABCELL_X12_Y21_N54
\u_mouse|RECV_UART~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|RECV_UART~5_combout\ = ( \u_mouse|RECV_UART~4_combout\ & ( (!\u_mouse|new_cursor_row\(9) & ((!\u_mouse|new_cursor_row\(8) & ((!\u_mouse|RECV_UART~3_combout\))) # (\u_mouse|new_cursor_row\(8) & (!\u_mouse|new_cursor_row\(0) & 
-- \u_mouse|RECV_UART~3_combout\)))) ) ) # ( !\u_mouse|RECV_UART~4_combout\ & ( (!\u_mouse|new_cursor_row\(8) & !\u_mouse|new_cursor_row\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000010000001000100001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_row\(8),
	datab => \u_mouse|ALT_INV_new_cursor_row\(9),
	datac => \u_mouse|ALT_INV_new_cursor_row\(0),
	datad => \u_mouse|ALT_INV_RECV_UART~3_combout\,
	dataf => \u_mouse|ALT_INV_RECV_UART~4_combout\,
	combout => \u_mouse|RECV_UART~5_combout\);

-- Location: LABCELL_X12_Y21_N39
\u_mouse|cursor_row~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~10_combout\ = ( \u_mouse|new_cursor_row\(3) & ( \u_mouse|LessThan5~2_combout\ & ( (!\u_mouse|Equal3~0_combout\ & (((\u_mouse|RECV_UART~5_combout\) # (\u_mouse|cursor_row\(8))) # (\u_mouse|cursor_row\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row\(7),
	datab => \u_mouse|ALT_INV_cursor_row\(8),
	datac => \u_mouse|ALT_INV_Equal3~0_combout\,
	datad => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datae => \u_mouse|ALT_INV_new_cursor_row\(3),
	dataf => \u_mouse|ALT_INV_LessThan5~2_combout\,
	combout => \u_mouse|cursor_row~10_combout\);

-- Location: FF_X12_Y21_N41
\u_mouse|cursor_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~10_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(3));

-- Location: LABCELL_X12_Y21_N15
\u_mouse|Add4~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~37_sumout\ = SUM(( !\u_mouse|PACKET_CHAR3\(5) $ (\u_mouse|cursor_row\(5)) ) + ( \u_mouse|Add4~7\ ) + ( \u_mouse|Add4~6\ ))
-- \u_mouse|Add4~38\ = CARRY(( !\u_mouse|PACKET_CHAR3\(5) $ (\u_mouse|cursor_row\(5)) ) + ( \u_mouse|Add4~7\ ) + ( \u_mouse|Add4~6\ ))
-- \u_mouse|Add4~39\ = SHARE((!\u_mouse|PACKET_CHAR3\(5) & \u_mouse|cursor_row\(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_PACKET_CHAR3\(5),
	datac => \u_mouse|ALT_INV_cursor_row\(5),
	cin => \u_mouse|Add4~6\,
	sharein => \u_mouse|Add4~7\,
	sumout => \u_mouse|Add4~37_sumout\,
	cout => \u_mouse|Add4~38\,
	shareout => \u_mouse|Add4~39\);

-- Location: LABCELL_X12_Y21_N18
\u_mouse|Add4~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~33_sumout\ = SUM(( !\u_mouse|PACKET_CHAR3\(6) $ (\u_mouse|cursor_row\(6)) ) + ( \u_mouse|Add4~39\ ) + ( \u_mouse|Add4~38\ ))
-- \u_mouse|Add4~34\ = CARRY(( !\u_mouse|PACKET_CHAR3\(6) $ (\u_mouse|cursor_row\(6)) ) + ( \u_mouse|Add4~39\ ) + ( \u_mouse|Add4~38\ ))
-- \u_mouse|Add4~35\ = SHARE((!\u_mouse|PACKET_CHAR3\(6) & \u_mouse|cursor_row\(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_PACKET_CHAR3\(6),
	datac => \u_mouse|ALT_INV_cursor_row\(6),
	cin => \u_mouse|Add4~38\,
	sharein => \u_mouse|Add4~39\,
	sumout => \u_mouse|Add4~33_sumout\,
	cout => \u_mouse|Add4~34\,
	shareout => \u_mouse|Add4~35\);

-- Location: LABCELL_X12_Y21_N24
\u_mouse|Add4~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~21_sumout\ = SUM(( !\u_mouse|PACKET_CHAR3\(7) $ (\u_mouse|cursor_row\(8)) ) + ( \u_mouse|Add4~31\ ) + ( \u_mouse|Add4~30\ ))
-- \u_mouse|Add4~22\ = CARRY(( !\u_mouse|PACKET_CHAR3\(7) $ (\u_mouse|cursor_row\(8)) ) + ( \u_mouse|Add4~31\ ) + ( \u_mouse|Add4~30\ ))
-- \u_mouse|Add4~23\ = SHARE((!\u_mouse|PACKET_CHAR3\(7) & \u_mouse|cursor_row\(8)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_CHAR3\(7),
	datac => \u_mouse|ALT_INV_cursor_row\(8),
	cin => \u_mouse|Add4~30\,
	sharein => \u_mouse|Add4~31\,
	sumout => \u_mouse|Add4~21_sumout\,
	cout => \u_mouse|Add4~22\,
	shareout => \u_mouse|Add4~23\);

-- Location: FF_X12_Y21_N26
\u_mouse|new_cursor_row[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~21_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(8));

-- Location: MLABCELL_X13_Y21_N39
\u_mouse|cursor_row~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~11_combout\ = ( \u_mouse|LessThan5~0_combout\ & ( (!\u_mouse|new_cursor_row\(9) & \u_mouse|new_cursor_row\(4)) ) ) # ( !\u_mouse|LessThan5~0_combout\ & ( (!\u_mouse|new_cursor_row\(9) & (\u_mouse|new_cursor_row\(4) & 
-- ((!\u_mouse|new_cursor_row\(8)) # (!\u_mouse|LessThan5~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001000000000001100100000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_new_cursor_row\(8),
	datab => \u_mouse|ALT_INV_new_cursor_row\(9),
	datac => \u_mouse|ALT_INV_LessThan5~1_combout\,
	datad => \u_mouse|ALT_INV_new_cursor_row\(4),
	dataf => \u_mouse|ALT_INV_LessThan5~0_combout\,
	combout => \u_mouse|cursor_row~11_combout\);

-- Location: MLABCELL_X13_Y20_N48
\u_mouse|cursor_row~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~12_combout\ = ( \u_mouse|cursor_row\(8) & ( \u_mouse|cursor_row\(7) & ( ((!\u_mouse|PACKET_COUNT\(1) & !\u_mouse|PACKET_COUNT\(0))) # (\u_mouse|cursor_row~11_combout\) ) ) ) # ( !\u_mouse|cursor_row\(8) & ( \u_mouse|cursor_row\(7) & ( 
-- ((!\u_mouse|PACKET_COUNT\(1) & !\u_mouse|PACKET_COUNT\(0))) # (\u_mouse|cursor_row~11_combout\) ) ) ) # ( \u_mouse|cursor_row\(8) & ( !\u_mouse|cursor_row\(7) & ( ((!\u_mouse|PACKET_COUNT\(1) & !\u_mouse|PACKET_COUNT\(0))) # 
-- (\u_mouse|cursor_row~11_combout\) ) ) ) # ( !\u_mouse|cursor_row\(8) & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|PACKET_COUNT\(1) & ((!\u_mouse|PACKET_COUNT\(0)) # ((\u_mouse|cursor_row~11_combout\ & \u_mouse|RECV_UART~5_combout\)))) # 
-- (\u_mouse|PACKET_COUNT\(1) & (((\u_mouse|cursor_row~11_combout\ & \u_mouse|RECV_UART~5_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001111100011111000111110001111100011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datab => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datac => \u_mouse|ALT_INV_cursor_row~11_combout\,
	datad => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datae => \u_mouse|ALT_INV_cursor_row\(8),
	dataf => \u_mouse|ALT_INV_cursor_row\(7),
	combout => \u_mouse|cursor_row~12_combout\);

-- Location: FF_X13_Y20_N50
\u_mouse|cursor_row[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~12_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(4));

-- Location: FF_X12_Y21_N17
\u_mouse|new_cursor_row[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~37_sumout\,
	asdata => VCC,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(5));

-- Location: MLABCELL_X13_Y21_N54
\u_mouse|cursor_row~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~13_combout\ = ( !\u_mouse|new_cursor_row\(5) & ( !\u_mouse|new_cursor_row\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_new_cursor_row\(9),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(5),
	combout => \u_mouse|cursor_row~13_combout\);

-- Location: MLABCELL_X13_Y20_N30
\u_mouse|cursor_row~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~14_combout\ = ( \u_mouse|cursor_row\(8) & ( \u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~13_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( !\u_mouse|cursor_row\(8) & ( \u_mouse|cursor_row\(7) & ( 
-- (!\u_mouse|cursor_row~13_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( \u_mouse|cursor_row\(8) & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~13_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & 
-- !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( !\u_mouse|cursor_row\(8) & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~13_combout\ & (((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) # (\u_mouse|RECV_UART~5_combout\))) # 
-- (\u_mouse|cursor_row~13_combout\ & (!\u_mouse|PACKET_COUNT\(0) & (!\u_mouse|PACKET_COUNT\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011101010111010101110101011101010111010101110101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_cursor_row~13_combout\,
	datab => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datac => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datad => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datae => \u_mouse|ALT_INV_cursor_row\(8),
	dataf => \u_mouse|ALT_INV_cursor_row\(7),
	combout => \u_mouse|cursor_row~14_combout\);

-- Location: FF_X13_Y20_N32
\u_mouse|cursor_row[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~14_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(5));

-- Location: FF_X12_Y21_N20
\u_mouse|new_cursor_row[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~33_sumout\,
	asdata => VCC,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(6));

-- Location: MLABCELL_X13_Y21_N12
\u_mouse|cursor_row~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~1_combout\ = (!\u_mouse|new_cursor_row\(9) & !\u_mouse|new_cursor_row\(6))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_new_cursor_row\(9),
	datac => \u_mouse|ALT_INV_new_cursor_row\(6),
	combout => \u_mouse|cursor_row~1_combout\);

-- Location: MLABCELL_X13_Y20_N12
\u_mouse|cursor_row~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~2_combout\ = ( \u_mouse|cursor_row\(8) & ( \u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~1_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( !\u_mouse|cursor_row\(8) & ( \u_mouse|cursor_row\(7) & ( 
-- (!\u_mouse|cursor_row~1_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( \u_mouse|cursor_row\(8) & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~1_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & 
-- !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( !\u_mouse|cursor_row\(8) & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|PACKET_COUNT\(0) & ((!\u_mouse|PACKET_COUNT\(1)) # ((!\u_mouse|cursor_row~1_combout\ & \u_mouse|RECV_UART~5_combout\)))) # 
-- (\u_mouse|PACKET_COUNT\(0) & (((!\u_mouse|cursor_row~1_combout\ & \u_mouse|RECV_UART~5_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100011111000111110001111100011111000111110001111100011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datab => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datac => \u_mouse|ALT_INV_cursor_row~1_combout\,
	datad => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	datae => \u_mouse|ALT_INV_cursor_row\(8),
	dataf => \u_mouse|ALT_INV_cursor_row\(7),
	combout => \u_mouse|cursor_row~2_combout\);

-- Location: FF_X13_Y20_N14
\u_mouse|cursor_row[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|cursor_row~2_combout\,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(6));

-- Location: LABCELL_X12_Y21_N27
\u_mouse|Add4~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add4~25_sumout\ = SUM(( !\u_mouse|PACKET_CHAR3\(7) ) + ( \u_mouse|Add4~23\ ) + ( \u_mouse|Add4~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_PACKET_CHAR3\(7),
	cin => \u_mouse|Add4~22\,
	sharein => \u_mouse|Add4~23\,
	sumout => \u_mouse|Add4~25_sumout\);

-- Location: FF_X12_Y21_N29
\u_mouse|new_cursor_row[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	d => \u_mouse|Add4~25_sumout\,
	asdata => \~GND~combout\,
	sload => \u_mouse|Equal4~0_combout\,
	ena => \u_mouse|new_cursor_row[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|new_cursor_row\(9));

-- Location: MLABCELL_X13_Y21_N57
\u_mouse|cursor_row~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~3_combout\ = ( !\u_mouse|new_cursor_row\(7) & ( !\u_mouse|new_cursor_row\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_new_cursor_row\(9),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(7),
	combout => \u_mouse|cursor_row~3_combout\);

-- Location: MLABCELL_X13_Y20_N54
\u_mouse|cursor_row~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~4_combout\ = ( \u_mouse|RECV_UART~5_combout\ & ( \u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~3_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( !\u_mouse|RECV_UART~5_combout\ & ( 
-- \u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~3_combout\) # ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( \u_mouse|RECV_UART~5_combout\ & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|cursor_row~3_combout\) # 
-- ((!\u_mouse|PACKET_COUNT\(0) & !\u_mouse|PACKET_COUNT\(1))) ) ) ) # ( !\u_mouse|RECV_UART~5_combout\ & ( !\u_mouse|cursor_row\(7) & ( (!\u_mouse|PACKET_COUNT\(0) & ((!\u_mouse|PACKET_COUNT\(1)) # ((\u_mouse|cursor_row\(8) & 
-- !\u_mouse|cursor_row~3_combout\)))) # (\u_mouse|PACKET_COUNT\(0) & (\u_mouse|cursor_row\(8) & ((!\u_mouse|cursor_row~3_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011001110100000111111111010000011111111101000001111111110100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datab => \u_mouse|ALT_INV_cursor_row\(8),
	datac => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datad => \u_mouse|ALT_INV_cursor_row~3_combout\,
	datae => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	dataf => \u_mouse|ALT_INV_cursor_row\(7),
	combout => \u_mouse|cursor_row~4_combout\);

-- Location: FF_X13_Y20_N53
\u_mouse|cursor_row[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|cursor_row~4_combout\,
	sload => VCC,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(7));

-- Location: MLABCELL_X13_Y21_N36
\u_mouse|cursor_row~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~5_combout\ = ( !\u_mouse|new_cursor_row\(8) & ( !\u_mouse|new_cursor_row\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_new_cursor_row\(9),
	dataf => \u_mouse|ALT_INV_new_cursor_row\(8),
	combout => \u_mouse|cursor_row~5_combout\);

-- Location: MLABCELL_X13_Y20_N6
\u_mouse|cursor_row~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|cursor_row~6_combout\ = ( \u_mouse|RECV_UART~5_combout\ & ( \u_mouse|cursor_row\(8) & ( (!\u_mouse|cursor_row~5_combout\ & ((\u_mouse|PACKET_COUNT\(1)) # (\u_mouse|PACKET_COUNT\(0)))) ) ) ) # ( !\u_mouse|RECV_UART~5_combout\ & ( 
-- \u_mouse|cursor_row\(8) & ( (!\u_mouse|cursor_row~5_combout\ & ((\u_mouse|PACKET_COUNT\(1)) # (\u_mouse|PACKET_COUNT\(0)))) ) ) ) # ( \u_mouse|RECV_UART~5_combout\ & ( !\u_mouse|cursor_row\(8) & ( (!\u_mouse|cursor_row~5_combout\ & 
-- ((\u_mouse|PACKET_COUNT\(1)) # (\u_mouse|PACKET_COUNT\(0)))) ) ) ) # ( !\u_mouse|RECV_UART~5_combout\ & ( !\u_mouse|cursor_row\(8) & ( (\u_mouse|cursor_row\(7) & (!\u_mouse|cursor_row~5_combout\ & ((\u_mouse|PACKET_COUNT\(1)) # 
-- (\u_mouse|PACKET_COUNT\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000000011101110000000001110111000000000111011100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_PACKET_COUNT\(0),
	datab => \u_mouse|ALT_INV_PACKET_COUNT\(1),
	datac => \u_mouse|ALT_INV_cursor_row\(7),
	datad => \u_mouse|ALT_INV_cursor_row~5_combout\,
	datae => \u_mouse|ALT_INV_RECV_UART~5_combout\,
	dataf => \u_mouse|ALT_INV_cursor_row\(8),
	combout => \u_mouse|cursor_row~6_combout\);

-- Location: FF_X13_Y20_N17
\u_mouse|cursor_row[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|cursor_row~6_combout\,
	sload => VCC,
	ena => \u_mouse|cursor_row[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|cursor_row\(8));

-- Location: MLABCELL_X13_Y20_N27
\mouse_pixel~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~3_combout\ = ( \u_mouse|cursor_row\(6) & ( \u_mouse|cursor_row\(7) & ( (\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & (\u_vga_sync|pixel_row\(7) & (!\u_mouse|cursor_row\(8) $ (\u_vga_sync|pixel_row[8]~DUPLICATE_q\)))) ) ) ) # ( 
-- !\u_mouse|cursor_row\(6) & ( \u_mouse|cursor_row\(7) & ( (!\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & (\u_vga_sync|pixel_row\(7) & (!\u_mouse|cursor_row\(8) $ (\u_vga_sync|pixel_row[8]~DUPLICATE_q\)))) ) ) ) # ( \u_mouse|cursor_row\(6) & ( 
-- !\u_mouse|cursor_row\(7) & ( (\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & (!\u_vga_sync|pixel_row\(7) & (!\u_mouse|cursor_row\(8) $ (\u_vga_sync|pixel_row[8]~DUPLICATE_q\)))) ) ) ) # ( !\u_mouse|cursor_row\(6) & ( !\u_mouse|cursor_row\(7) & ( 
-- (!\u_vga_sync|pixel_row[6]~DUPLICATE_q\ & (!\u_vga_sync|pixel_row\(7) & (!\u_mouse|cursor_row\(8) $ (\u_vga_sync|pixel_row[8]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_row[6]~DUPLICATE_q\,
	datab => \u_vga_sync|ALT_INV_pixel_row\(7),
	datac => \u_mouse|ALT_INV_cursor_row\(8),
	datad => \u_vga_sync|ALT_INV_pixel_row[8]~DUPLICATE_q\,
	datae => \u_mouse|ALT_INV_cursor_row\(6),
	dataf => \u_mouse|ALT_INV_cursor_row\(7),
	combout => \mouse_pixel~3_combout\);

-- Location: FF_X16_Y20_N11
\u_vga_sync|pixel_column[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|h_count\(8),
	sload => VCC,
	ena => \u_vga_sync|LessThan6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_column[8]~DUPLICATE_q\);

-- Location: LABCELL_X14_Y20_N57
\mouse_pixel~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~0_combout\ = ( \u_mouse|cursor_column\(6) & ( \u_mouse|cursor_column\(7) & ( (\u_vga_sync|pixel_column\(6) & (\u_vga_sync|pixel_column\(7) & (!\u_mouse|cursor_column\(8) $ (\u_vga_sync|pixel_column[8]~DUPLICATE_q\)))) ) ) ) # ( 
-- !\u_mouse|cursor_column\(6) & ( \u_mouse|cursor_column\(7) & ( (!\u_vga_sync|pixel_column\(6) & (\u_vga_sync|pixel_column\(7) & (!\u_mouse|cursor_column\(8) $ (\u_vga_sync|pixel_column[8]~DUPLICATE_q\)))) ) ) ) # ( \u_mouse|cursor_column\(6) & ( 
-- !\u_mouse|cursor_column\(7) & ( (\u_vga_sync|pixel_column\(6) & (!\u_vga_sync|pixel_column\(7) & (!\u_mouse|cursor_column\(8) $ (\u_vga_sync|pixel_column[8]~DUPLICATE_q\)))) ) ) ) # ( !\u_mouse|cursor_column\(6) & ( !\u_mouse|cursor_column\(7) & ( 
-- (!\u_vga_sync|pixel_column\(6) & (!\u_vga_sync|pixel_column\(7) & (!\u_mouse|cursor_column\(8) $ (\u_vga_sync|pixel_column[8]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(6),
	datab => \u_vga_sync|ALT_INV_pixel_column\(7),
	datac => \u_mouse|ALT_INV_cursor_column\(8),
	datad => \u_vga_sync|ALT_INV_pixel_column[8]~DUPLICATE_q\,
	datae => \u_mouse|ALT_INV_cursor_column\(6),
	dataf => \u_mouse|ALT_INV_cursor_column\(7),
	combout => \mouse_pixel~0_combout\);

-- Location: MLABCELL_X13_Y20_N42
\mouse_pixel~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~5_combout\ = ( \u_vga_sync|pixel_row[5]~DUPLICATE_q\ & ( \u_mouse|cursor_row\(3) & ( (\u_vga_sync|pixel_row\(3) & (\u_mouse|cursor_row\(5) & (!\u_vga_sync|pixel_row\(4) $ (\u_mouse|cursor_row\(4))))) ) ) ) # ( 
-- !\u_vga_sync|pixel_row[5]~DUPLICATE_q\ & ( \u_mouse|cursor_row\(3) & ( (\u_vga_sync|pixel_row\(3) & (!\u_mouse|cursor_row\(5) & (!\u_vga_sync|pixel_row\(4) $ (\u_mouse|cursor_row\(4))))) ) ) ) # ( \u_vga_sync|pixel_row[5]~DUPLICATE_q\ & ( 
-- !\u_mouse|cursor_row\(3) & ( (!\u_vga_sync|pixel_row\(3) & (\u_mouse|cursor_row\(5) & (!\u_vga_sync|pixel_row\(4) $ (\u_mouse|cursor_row\(4))))) ) ) ) # ( !\u_vga_sync|pixel_row[5]~DUPLICATE_q\ & ( !\u_mouse|cursor_row\(3) & ( (!\u_vga_sync|pixel_row\(3) 
-- & (!\u_mouse|cursor_row\(5) & (!\u_vga_sync|pixel_row\(4) $ (\u_mouse|cursor_row\(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000000000001000001001000001000000000000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_row\(3),
	datab => \u_vga_sync|ALT_INV_pixel_row\(4),
	datac => \u_mouse|ALT_INV_cursor_row\(4),
	datad => \u_mouse|ALT_INV_cursor_row\(5),
	datae => \u_vga_sync|ALT_INV_pixel_row[5]~DUPLICATE_q\,
	dataf => \u_mouse|ALT_INV_cursor_row\(3),
	combout => \mouse_pixel~5_combout\);

-- Location: FF_X19_Y20_N28
\u_vga_sync|pixel_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|v_count\(0),
	sload => VCC,
	ena => \u_vga_sync|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|pixel_row\(0));

-- Location: LABCELL_X12_Y21_N48
\mouse_pixel~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~4_combout\ = ( \u_vga_sync|pixel_row\(0) & ( \u_mouse|cursor_row\(1) & ( (\u_vga_sync|pixel_row\(1) & (\u_mouse|cursor_row\(0) & (!\u_vga_sync|pixel_row\(2) $ (\u_mouse|cursor_row\(2))))) ) ) ) # ( !\u_vga_sync|pixel_row\(0) & ( 
-- \u_mouse|cursor_row\(1) & ( (\u_vga_sync|pixel_row\(1) & (!\u_mouse|cursor_row\(0) & (!\u_vga_sync|pixel_row\(2) $ (\u_mouse|cursor_row\(2))))) ) ) ) # ( \u_vga_sync|pixel_row\(0) & ( !\u_mouse|cursor_row\(1) & ( (!\u_vga_sync|pixel_row\(1) & 
-- (\u_mouse|cursor_row\(0) & (!\u_vga_sync|pixel_row\(2) $ (\u_mouse|cursor_row\(2))))) ) ) ) # ( !\u_vga_sync|pixel_row\(0) & ( !\u_mouse|cursor_row\(1) & ( (!\u_vga_sync|pixel_row\(1) & (!\u_mouse|cursor_row\(0) & (!\u_vga_sync|pixel_row\(2) $ 
-- (\u_mouse|cursor_row\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000000000001000001001000001000000000000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_row\(1),
	datab => \u_vga_sync|ALT_INV_pixel_row\(2),
	datac => \u_mouse|ALT_INV_cursor_row\(2),
	datad => \u_mouse|ALT_INV_cursor_row\(0),
	datae => \u_vga_sync|ALT_INV_pixel_row\(0),
	dataf => \u_mouse|ALT_INV_cursor_row\(1),
	combout => \mouse_pixel~4_combout\);

-- Location: MLABCELL_X18_Y20_N30
\mouse_pixel~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~1_combout\ = ( \u_mouse|cursor_column\(4) & ( \u_mouse|cursor_column\(3) & ( (\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(5) $ (\u_mouse|cursor_column\(5))))) ) ) ) # ( 
-- !\u_mouse|cursor_column\(4) & ( \u_mouse|cursor_column\(3) & ( (\u_vga_sync|pixel_column\(3) & (!\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(5) $ (\u_mouse|cursor_column\(5))))) ) ) ) # ( \u_mouse|cursor_column\(4) & ( 
-- !\u_mouse|cursor_column\(3) & ( (!\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(5) $ (\u_mouse|cursor_column\(5))))) ) ) ) # ( !\u_mouse|cursor_column\(4) & ( !\u_mouse|cursor_column\(3) & ( 
-- (!\u_vga_sync|pixel_column\(3) & (!\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(5) $ (\u_mouse|cursor_column\(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000000000001000001001000001000000000000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(5),
	datac => \u_mouse|ALT_INV_cursor_column\(5),
	datad => \u_vga_sync|ALT_INV_pixel_column\(4),
	datae => \u_mouse|ALT_INV_cursor_column\(4),
	dataf => \u_mouse|ALT_INV_cursor_column\(3),
	combout => \mouse_pixel~1_combout\);

-- Location: MLABCELL_X18_Y20_N42
\mouse_pixel~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~2_combout\ = ( \u_mouse|cursor_column\(0) & ( \u_mouse|cursor_column\(2) & ( (\u_vga_sync|pixel_column\(0) & (\u_vga_sync|pixel_column\(2) & (!\u_mouse|cursor_column\(1) $ (\u_vga_sync|pixel_column\(1))))) ) ) ) # ( 
-- !\u_mouse|cursor_column\(0) & ( \u_mouse|cursor_column\(2) & ( (!\u_vga_sync|pixel_column\(0) & (\u_vga_sync|pixel_column\(2) & (!\u_mouse|cursor_column\(1) $ (\u_vga_sync|pixel_column\(1))))) ) ) ) # ( \u_mouse|cursor_column\(0) & ( 
-- !\u_mouse|cursor_column\(2) & ( (\u_vga_sync|pixel_column\(0) & (!\u_vga_sync|pixel_column\(2) & (!\u_mouse|cursor_column\(1) $ (\u_vga_sync|pixel_column\(1))))) ) ) ) # ( !\u_mouse|cursor_column\(0) & ( !\u_mouse|cursor_column\(2) & ( 
-- (!\u_vga_sync|pixel_column\(0) & (!\u_vga_sync|pixel_column\(2) & (!\u_mouse|cursor_column\(1) $ (\u_vga_sync|pixel_column\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(0),
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_mouse|ALT_INV_cursor_column\(1),
	datad => \u_vga_sync|ALT_INV_pixel_column\(1),
	datae => \u_mouse|ALT_INV_cursor_column\(0),
	dataf => \u_mouse|ALT_INV_cursor_column\(2),
	combout => \mouse_pixel~2_combout\);

-- Location: LABCELL_X14_Y20_N51
\mouse_pixel~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~6_combout\ = ( \mouse_pixel~1_combout\ & ( \mouse_pixel~2_combout\ & ( (\mouse_pixel~3_combout\ & (\mouse_pixel~0_combout\ & (\mouse_pixel~5_combout\ & \mouse_pixel~4_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_mouse_pixel~3_combout\,
	datab => \ALT_INV_mouse_pixel~0_combout\,
	datac => \ALT_INV_mouse_pixel~5_combout\,
	datad => \ALT_INV_mouse_pixel~4_combout\,
	datae => \ALT_INV_mouse_pixel~1_combout\,
	dataf => \ALT_INV_mouse_pixel~2_combout\,
	combout => \mouse_pixel~6_combout\);

-- Location: LABCELL_X14_Y20_N39
\u_vga_sync|red_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|red_out~0_combout\ = ( \Equal1~0_combout\ & ( \mouse_pixel~6_combout\ & ( (\u_vga_sync|video_on~combout\ & ((!\u_bird|bird_on~q\) # (\u_bird|bird_r\(0)))) ) ) ) # ( !\Equal1~0_combout\ & ( \mouse_pixel~6_combout\ & ( 
-- \u_vga_sync|video_on~combout\ ) ) ) # ( \Equal1~0_combout\ & ( !\mouse_pixel~6_combout\ & ( (\u_vga_sync|video_on~combout\ & ((!\u_bird|bird_on~q\) # (\u_bird|bird_r\(0)))) ) ) ) # ( !\Equal1~0_combout\ & ( !\mouse_pixel~6_combout\ & ( 
-- (\u_vga_sync|video_on~combout\ & ((!\u_bird|bird_on~q\) # (\u_bird|bird_r\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001111000010100000111100001111000011110000101000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_on~q\,
	datac => \u_vga_sync|ALT_INV_video_on~combout\,
	datad => \u_bird|ALT_INV_bird_r\(0),
	datae => \ALT_INV_Equal1~0_combout\,
	dataf => \ALT_INV_mouse_pixel~6_combout\,
	combout => \u_vga_sync|red_out~0_combout\);

-- Location: FF_X14_Y20_N41
\u_vga_sync|red_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|red_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|red_out~q\);

-- Location: MLABCELL_X18_Y20_N57
\u_bird|Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux19~0_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column\(2) & ((!\u_vga_sync|pixel_column\(3)) # (\u_vga_sync|pixel_column\(4)))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column\(3) & 
-- (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(0)) # (\u_vga_sync|pixel_column\(4))))) # (\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(4) & ((!\u_vga_sync|pixel_column\(2)) # (!\u_vga_sync|pixel_column\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110110001100000011011000110010001100100011001000110010001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(4),
	datad => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux19~0_combout\);

-- Location: LABCELL_X17_Y20_N24
\u_bird|Mux37~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux37~0_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column\(2) & (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\)) # (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ $ 
-- (!\u_vga_sync|pixel_column\(0))))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(0)) # (\u_vga_sync|pixel_column\(4))))) # 
-- (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & \u_vga_sync|pixel_column\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100010001001000010001000100110001001100010101000100110001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(4),
	datad => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux37~0_combout\);

-- Location: LABCELL_X17_Y20_N21
\u_bird|Mux36~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux36~0_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column\(2) & ((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\))) # (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( 
-- (!\u_vga_sync|pixel_column\(2) & ((!\u_vga_sync|pixel_column\(0) & (\u_vga_sync|pixel_column\(4))) # (\u_vga_sync|pixel_column\(0) & ((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\))))) # (\u_vga_sync|pixel_column\(2) & (((\u_vga_sync|pixel_column\(4) & 
-- \u_vga_sync|pixel_column[3]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110000001011010011000000101111001111000000111100111100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(0),
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(4),
	datad => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux36~0_combout\);

-- Location: LABCELL_X17_Y20_N15
\u_bird|Mux24~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~6_combout\ = ( \u_bird|Add1~5_sumout\ & ( \u_bird|Mux36~0_combout\ & ( (!\u_bird|Add1~9_sumout\ & ((\u_bird|Mux37~0_combout\))) # (\u_bird|Add1~9_sumout\ & (\u_bird|Mux19~0_combout\)) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( 
-- \u_bird|Mux36~0_combout\ & ( (!\u_bird|Add1~9_sumout\) # (\u_bird|Mux20~1_combout\) ) ) ) # ( \u_bird|Add1~5_sumout\ & ( !\u_bird|Mux36~0_combout\ & ( (!\u_bird|Add1~9_sumout\ & ((\u_bird|Mux37~0_combout\))) # (\u_bird|Add1~9_sumout\ & 
-- (\u_bird|Mux19~0_combout\)) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( !\u_bird|Mux36~0_combout\ & ( (\u_bird|Mux20~1_combout\ & \u_bird|Add1~9_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000011110011001111111111010101010000111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Mux20~1_combout\,
	datab => \u_bird|ALT_INV_Mux19~0_combout\,
	datac => \u_bird|ALT_INV_Mux37~0_combout\,
	datad => \u_bird|ALT_INV_Add1~9_sumout\,
	datae => \u_bird|ALT_INV_Add1~5_sumout\,
	dataf => \u_bird|ALT_INV_Mux36~0_combout\,
	combout => \u_bird|Mux24~6_combout\);

-- Location: LABCELL_X19_Y20_N3
\u_bird|Mux24~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~12_combout\ = ( \u_vga_sync|pixel_column\(4) & ( \u_vga_sync|pixel_column\(3) & ( (!\u_vga_sync|pixel_column\(0) & ((!\u_vga_sync|pixel_column\(2) $ (!\u_vga_sync|pixel_column\(1))))) # (\u_vga_sync|pixel_column\(0) & 
-- ((!\u_bird|Add1~5_sumout\ & (!\u_vga_sync|pixel_column\(2))) # (\u_bird|Add1~5_sumout\ & ((!\u_vga_sync|pixel_column\(1)))))) ) ) ) # ( \u_vga_sync|pixel_column\(4) & ( !\u_vga_sync|pixel_column\(3) & ( (!\u_vga_sync|pixel_column\(2)) # 
-- ((\u_bird|Add1~5_sumout\ & \u_vga_sync|pixel_column\(0))) ) ) ) # ( !\u_vga_sync|pixel_column\(4) & ( !\u_vga_sync|pixel_column\(3) & ( (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(0)) # (\u_vga_sync|pixel_column\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011001100110011001101110100000000000000000011110011011000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add1~5_sumout\,
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(1),
	datad => \u_vga_sync|ALT_INV_pixel_column\(0),
	datae => \u_vga_sync|ALT_INV_pixel_column\(4),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(3),
	combout => \u_bird|Mux24~12_combout\);

-- Location: LABCELL_X17_Y20_N42
\u_bird|Mux24~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~13_combout\ = ( \u_vga_sync|pixel_column\(0) & ( \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(2) & (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\)) # (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & 
-- ((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\) # (!\u_vga_sync|pixel_column\(1))))) ) ) ) # ( !\u_vga_sync|pixel_column\(0) & ( \u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(2) & 
-- ((\u_vga_sync|pixel_column\(4)) # (\u_vga_sync|pixel_column\(1))))) # (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(2) $ (!\u_vga_sync|pixel_column\(1))))) ) ) ) # ( \u_vga_sync|pixel_column\(0) & 
-- ( !\u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(2))) # (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (((!\u_vga_sync|pixel_column\(1) & \u_vga_sync|pixel_column\(4))))) ) ) ) # ( 
-- !\u_vga_sync|pixel_column\(0) & ( !\u_bird|Add1~5_sumout\ & ( (!\u_vga_sync|pixel_column\(2) & (((!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & \u_vga_sync|pixel_column\(1))) # (\u_vga_sync|pixel_column\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100011001100100010001101100000001000100111001000100010111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(1),
	datad => \u_vga_sync|ALT_INV_pixel_column\(4),
	datae => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_bird|ALT_INV_Add1~5_sumout\,
	combout => \u_bird|Mux24~13_combout\);

-- Location: LABCELL_X17_Y20_N18
\u_bird|Mux24~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~14_combout\ = ( \u_bird|Mux24~13_combout\ & ( (\u_bird|Mux24~12_combout\) # (\u_bird|Add1~9_sumout\) ) ) # ( !\u_bird|Mux24~13_combout\ & ( (!\u_bird|Add1~9_sumout\ & \u_bird|Mux24~12_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_bird|ALT_INV_Add1~9_sumout\,
	datad => \u_bird|ALT_INV_Mux24~12_combout\,
	dataf => \u_bird|ALT_INV_Mux24~13_combout\,
	combout => \u_bird|Mux24~14_combout\);

-- Location: LABCELL_X19_Y20_N15
\u_bird|Mux24~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~4_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(2) & (!\u_vga_sync|pixel_column\(3) $ (\u_vga_sync|pixel_column\(0))))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( 
-- (\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(2) & \u_vga_sync|pixel_column\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000001000000100000000100000010000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(4),
	datac => \u_vga_sync|ALT_INV_pixel_column\(2),
	datad => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux24~4_combout\);

-- Location: MLABCELL_X18_Y20_N12
\u_bird|Mux24~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~5_combout\ = ( \u_bird|Mux20~1_combout\ & ( \u_bird|Mux24~4_combout\ & ( (!\u_bird|Add1~9_sumout\) # (((\u_bird|Add1~5_sumout\ & !\u_bird|Mux24~1_combout\)) # (\u_bird|Add1~1_sumout\)) ) ) ) # ( !\u_bird|Mux20~1_combout\ & ( 
-- \u_bird|Mux24~4_combout\ & ( (!\u_bird|Add1~1_sumout\ & ((!\u_bird|Add1~9_sumout\) # ((\u_bird|Add1~5_sumout\ & !\u_bird|Mux24~1_combout\)))) # (\u_bird|Add1~1_sumout\ & (\u_bird|Add1~5_sumout\)) ) ) ) # ( \u_bird|Mux20~1_combout\ & ( 
-- !\u_bird|Mux24~4_combout\ & ( (!\u_bird|Add1~5_sumout\) # ((!\u_bird|Mux24~1_combout\) # ((!\u_bird|Add1~9_sumout\) # (\u_bird|Add1~1_sumout\))) ) ) ) # ( !\u_bird|Mux20~1_combout\ & ( !\u_bird|Mux24~4_combout\ & ( (!\u_bird|Add1~5_sumout\ & 
-- (((!\u_bird|Add1~1_sumout\)))) # (\u_bird|Add1~5_sumout\ & ((!\u_bird|Mux24~1_combout\) # ((!\u_bird|Add1~9_sumout\) # (\u_bird|Add1~1_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111001010101111111101111111111110100010101011111010011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Add1~5_sumout\,
	datab => \u_bird|ALT_INV_Mux24~1_combout\,
	datac => \u_bird|ALT_INV_Add1~9_sumout\,
	datad => \u_bird|ALT_INV_Add1~1_sumout\,
	datae => \u_bird|ALT_INV_Mux20~1_combout\,
	dataf => \u_bird|ALT_INV_Mux24~4_combout\,
	combout => \u_bird|Mux24~5_combout\);

-- Location: LABCELL_X17_Y20_N48
\u_bird|Mux41~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux41~0_combout\ = ( !\u_bird|Add1~17_sumout\ & ( (!\u_bird|Add1~13_sumout\ & (((\u_bird|Mux24~5_combout\)))) # (\u_bird|Add1~13_sumout\ & (\u_bird|Mux24~3_combout\)) ) ) # ( \u_bird|Add1~17_sumout\ & ( ((!\u_bird|Add1~1_sumout\ & 
-- ((!\u_bird|Add1~13_sumout\ & ((\u_bird|Mux24~14_combout\))) # (\u_bird|Add1~13_sumout\ & (\u_bird|Mux24~6_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001110100011101000000000011000000011101000111011100000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Mux24~3_combout\,
	datab => \u_bird|ALT_INV_Add1~13_sumout\,
	datac => \u_bird|ALT_INV_Add1~1_sumout\,
	datad => \u_bird|ALT_INV_Mux24~6_combout\,
	datae => \u_bird|ALT_INV_Add1~17_sumout\,
	dataf => \u_bird|ALT_INV_Mux24~14_combout\,
	datag => \u_bird|ALT_INV_Mux24~5_combout\,
	combout => \u_bird|Mux41~0_combout\);

-- Location: FF_X17_Y20_N49
\u_bird|bird_g[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_bird|Mux41~0_combout\,
	ena => \u_bird|process_0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_g\(0));

-- Location: LABCELL_X14_Y20_N24
\u_vga_sync|green_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|green_out~0_combout\ = ( \Equal1~0_combout\ & ( \mouse_pixel~6_combout\ & ( (\u_vga_sync|video_on~combout\ & ((!\u_bird|bird_on~q\) # (\u_bird|bird_g\(0)))) ) ) ) # ( !\Equal1~0_combout\ & ( \mouse_pixel~6_combout\ & ( 
-- \u_vga_sync|video_on~combout\ ) ) ) # ( \Equal1~0_combout\ & ( !\mouse_pixel~6_combout\ & ( (\u_vga_sync|video_on~combout\ & ((!\u_bird|bird_on~q\) # (\u_bird|bird_g\(0)))) ) ) ) # ( !\Equal1~0_combout\ & ( !\mouse_pixel~6_combout\ & ( 
-- (\u_vga_sync|video_on~combout\ & ((!\u_bird|bird_on~q\) # (\u_bird|bird_g\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111011000000001011101100000000111111110000000010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_bird_on~q\,
	datab => \u_bird|ALT_INV_bird_g\(0),
	datad => \u_vga_sync|ALT_INV_video_on~combout\,
	datae => \ALT_INV_Equal1~0_combout\,
	dataf => \ALT_INV_mouse_pixel~6_combout\,
	combout => \u_vga_sync|green_out~0_combout\);

-- Location: FF_X14_Y20_N26
\u_vga_sync|green_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|green_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|green_out~q\);

-- Location: LABCELL_X17_Y20_N27
\u_bird|Mux47~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux47~0_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(2))) # (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (\u_vga_sync|pixel_column\(2) & (\u_vga_sync|pixel_column\(4) & 
-- \u_vga_sync|pixel_column\(0)))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column[3]~DUPLICATE_q\ & (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(0)) # (\u_vga_sync|pixel_column\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100010001000000010001000100010001000100010011000100010001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	datab => \u_vga_sync|ALT_INV_pixel_column\(2),
	datac => \u_vga_sync|ALT_INV_pixel_column\(4),
	datad => \u_vga_sync|ALT_INV_pixel_column\(0),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux47~0_combout\);

-- Location: LABCELL_X17_Y20_N12
\u_bird|Mux24~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~11_combout\ = ( \u_bird|Add1~5_sumout\ & ( \u_bird|Mux47~0_combout\ & ( (!\u_bird|Add1~9_sumout\ & ((\u_bird|Mux37~0_combout\))) # (\u_bird|Add1~9_sumout\ & (\u_bird|Mux19~0_combout\)) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( 
-- \u_bird|Mux47~0_combout\ & ( (!\u_bird|Add1~9_sumout\) # (\u_bird|Mux20~1_combout\) ) ) ) # ( \u_bird|Add1~5_sumout\ & ( !\u_bird|Mux47~0_combout\ & ( (!\u_bird|Add1~9_sumout\ & ((\u_bird|Mux37~0_combout\))) # (\u_bird|Add1~9_sumout\ & 
-- (\u_bird|Mux19~0_combout\)) ) ) ) # ( !\u_bird|Add1~5_sumout\ & ( !\u_bird|Mux47~0_combout\ & ( (\u_bird|Mux20~1_combout\ & \u_bird|Add1~9_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000000111111001111110101111101010000001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Mux20~1_combout\,
	datab => \u_bird|ALT_INV_Mux19~0_combout\,
	datac => \u_bird|ALT_INV_Add1~9_sumout\,
	datad => \u_bird|ALT_INV_Mux37~0_combout\,
	datae => \u_bird|ALT_INV_Add1~5_sumout\,
	dataf => \u_bird|ALT_INV_Mux47~0_combout\,
	combout => \u_bird|Mux24~11_combout\);

-- Location: LABCELL_X19_Y20_N51
\u_bird|Mux24~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~7_combout\ = ( \u_vga_sync|pixel_column\(0) & ( (\u_vga_sync|pixel_column\(2) & ((\u_bird|Add1~5_sumout\) # (\u_bird|Add1~9_sumout\))) ) ) # ( !\u_vga_sync|pixel_column\(0) & ( (!\u_vga_sync|pixel_column\(2) & (\u_bird|Add1~9_sumout\ & 
-- !\u_bird|Add1~5_sumout\)) # (\u_vga_sync|pixel_column\(2) & ((\u_bird|Add1~5_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000001111001100000000111100000011000011110000001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_Add1~9_sumout\,
	datac => \u_vga_sync|ALT_INV_pixel_column\(2),
	datad => \u_bird|ALT_INV_Add1~5_sumout\,
	dataf => \u_vga_sync|ALT_INV_pixel_column\(0),
	combout => \u_bird|Mux24~7_combout\);

-- Location: LABCELL_X19_Y20_N9
\u_bird|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux16~0_combout\ = ( !\u_vga_sync|pixel_column\(2) & ( (!\u_vga_sync|pixel_column\(3) & (((\u_vga_sync|pixel_column\(4)) # (\u_vga_sync|pixel_column\(1))) # (\u_vga_sync|pixel_column\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(0),
	datac => \u_vga_sync|ALT_INV_pixel_column\(1),
	datad => \u_vga_sync|ALT_INV_pixel_column\(4),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(2),
	combout => \u_bird|Mux16~0_combout\);

-- Location: LABCELL_X19_Y20_N12
\u_bird|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux5~0_combout\ = ( \u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column\(2) & ((!\u_vga_sync|pixel_column\(3)) # (\u_vga_sync|pixel_column\(4)))) ) ) # ( !\u_vga_sync|pixel_column\(1) & ( (!\u_vga_sync|pixel_column\(3) & 
-- (!\u_vga_sync|pixel_column\(2) & ((\u_vga_sync|pixel_column\(0)) # (\u_vga_sync|pixel_column\(4))))) # (\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(0) $ (!\u_vga_sync|pixel_column\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100010000001010110001000010111011000000001011101100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(4),
	datac => \u_vga_sync|ALT_INV_pixel_column\(0),
	datad => \u_vga_sync|ALT_INV_pixel_column\(2),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(1),
	combout => \u_bird|Mux5~0_combout\);

-- Location: LABCELL_X19_Y20_N6
\u_bird|Mux24~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~8_combout\ = ( \u_vga_sync|pixel_column\(2) & ( (!\u_vga_sync|pixel_column\(3) & (\u_vga_sync|pixel_column\(0) & (\u_vga_sync|pixel_column\(4) & !\u_vga_sync|pixel_column\(1)))) ) ) # ( !\u_vga_sync|pixel_column\(2) & ( 
-- (!\u_vga_sync|pixel_column\(3) & (((\u_vga_sync|pixel_column\(1)) # (\u_vga_sync|pixel_column\(4))) # (\u_vga_sync|pixel_column\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101010101000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(3),
	datab => \u_vga_sync|ALT_INV_pixel_column\(0),
	datac => \u_vga_sync|ALT_INV_pixel_column\(4),
	datad => \u_vga_sync|ALT_INV_pixel_column\(1),
	dataf => \u_vga_sync|ALT_INV_pixel_column\(2),
	combout => \u_bird|Mux24~8_combout\);

-- Location: LABCELL_X19_Y20_N24
\u_bird|Mux24~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~9_combout\ = ( \u_bird|Add1~9_sumout\ & ( (!\u_bird|Add1~5_sumout\ & (\u_bird|Mux16~0_combout\)) # (\u_bird|Add1~5_sumout\ & ((\u_bird|Mux24~8_combout\))) ) ) # ( !\u_bird|Add1~9_sumout\ & ( (!\u_bird|Add1~5_sumout\ & 
-- (\u_bird|Mux5~0_combout\)) # (\u_bird|Add1~5_sumout\ & ((\u_bird|Mux24~8_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000111111001100000011111101010000010111110101000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Mux16~0_combout\,
	datab => \u_bird|ALT_INV_Mux5~0_combout\,
	datac => \u_bird|ALT_INV_Add1~5_sumout\,
	datad => \u_bird|ALT_INV_Mux24~8_combout\,
	dataf => \u_bird|ALT_INV_Add1~9_sumout\,
	combout => \u_bird|Mux24~9_combout\);

-- Location: MLABCELL_X18_Y20_N9
\u_bird|Mux24~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux24~10_combout\ = ( !\u_bird|Add1~1_sumout\ & ( \u_bird|Mux24~9_combout\ ) ) # ( !\u_bird|Add1~1_sumout\ & ( !\u_bird|Mux24~9_combout\ & ( (\u_vga_sync|pixel_column\(4) & (!\u_vga_sync|pixel_column\(1) & (\u_vga_sync|pixel_column[3]~DUPLICATE_q\ 
-- & \u_bird|Mux24~7_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_pixel_column\(4),
	datab => \u_vga_sync|ALT_INV_pixel_column\(1),
	datac => \u_vga_sync|ALT_INV_pixel_column[3]~DUPLICATE_q\,
	datad => \u_bird|ALT_INV_Mux24~7_combout\,
	datae => \u_bird|ALT_INV_Add1~1_sumout\,
	dataf => \u_bird|ALT_INV_Mux24~9_combout\,
	combout => \u_bird|Mux24~10_combout\);

-- Location: LABCELL_X17_Y20_N0
\u_bird|Mux53~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_bird|Mux53~0_combout\ = ( !\u_bird|Add1~17_sumout\ & ( (!\u_bird|Add1~13_sumout\ & (((\u_bird|Mux24~5_combout\)))) # (\u_bird|Add1~13_sumout\ & (\u_bird|Mux24~3_combout\)) ) ) # ( \u_bird|Add1~17_sumout\ & ( ((!\u_bird|Add1~13_sumout\ & 
-- (((\u_bird|Mux24~10_combout\)))) # (\u_bird|Add1~13_sumout\ & (!\u_bird|Add1~1_sumout\ & (\u_bird|Mux24~11_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001110100011101000000000011000000011101000111011100110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_bird|ALT_INV_Mux24~3_combout\,
	datab => \u_bird|ALT_INV_Add1~13_sumout\,
	datac => \u_bird|ALT_INV_Add1~1_sumout\,
	datad => \u_bird|ALT_INV_Mux24~11_combout\,
	datae => \u_bird|ALT_INV_Add1~17_sumout\,
	dataf => \u_bird|ALT_INV_Mux24~10_combout\,
	datag => \u_bird|ALT_INV_Mux24~5_combout\,
	combout => \u_bird|Mux53~0_combout\);

-- Location: FF_X17_Y20_N1
\u_bird|bird_b[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_bird|Mux53~0_combout\,
	ena => \u_bird|process_0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bird|bird_b\(0));

-- Location: LABCELL_X14_Y20_N30
\u_vga_sync|blue_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|blue_out~0_combout\ = ( \u_vga_sync|video_on~combout\ & ( (!\u_bird|bird_on~q\) # (\u_bird|bird_b\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_bird|ALT_INV_bird_b\(0),
	datac => \u_bird|ALT_INV_bird_on~q\,
	dataf => \u_vga_sync|ALT_INV_video_on~combout\,
	combout => \u_vga_sync|blue_out~0_combout\);

-- Location: MLABCELL_X13_Y20_N36
\mouse_pixel~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \mouse_pixel~7_combout\ = ( \mouse_pixel~4_combout\ & ( (\mouse_pixel~3_combout\ & \mouse_pixel~5_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_mouse_pixel~3_combout\,
	datad => \ALT_INV_mouse_pixel~5_combout\,
	dataf => \ALT_INV_mouse_pixel~4_combout\,
	combout => \mouse_pixel~7_combout\);

-- Location: LABCELL_X14_Y20_N42
\u_vga_sync|blue_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|blue_out~1_combout\ = ( \Equal1~0_combout\ & ( \mouse_pixel~7_combout\ & ( \u_vga_sync|blue_out~0_combout\ ) ) ) # ( !\Equal1~0_combout\ & ( \mouse_pixel~7_combout\ & ( (\u_vga_sync|blue_out~0_combout\ & ((!\mouse_pixel~0_combout\) # 
-- ((!\mouse_pixel~2_combout\) # (!\mouse_pixel~1_combout\)))) ) ) ) # ( \Equal1~0_combout\ & ( !\mouse_pixel~7_combout\ & ( \u_vga_sync|blue_out~0_combout\ ) ) ) # ( !\Equal1~0_combout\ & ( !\mouse_pixel~7_combout\ & ( \u_vga_sync|blue_out~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_blue_out~0_combout\,
	datab => \ALT_INV_mouse_pixel~0_combout\,
	datac => \ALT_INV_mouse_pixel~2_combout\,
	datad => \ALT_INV_mouse_pixel~1_combout\,
	datae => \ALT_INV_Equal1~0_combout\,
	dataf => \ALT_INV_mouse_pixel~7_combout\,
	combout => \u_vga_sync|blue_out~1_combout\);

-- Location: FF_X14_Y20_N44
\u_vga_sync|blue_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|blue_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|blue_out~q\);

-- Location: MLABCELL_X18_Y19_N33
\u_vga_sync|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~1_combout\ = ( \u_vga_sync|h_count\(8) & ( \u_vga_sync|h_count\(7) ) ) # ( !\u_vga_sync|h_count\(8) & ( \u_vga_sync|h_count\(7) & ( !\u_vga_sync|h_count[9]~DUPLICATE_q\ ) ) ) # ( \u_vga_sync|h_count\(8) & ( !\u_vga_sync|h_count\(7) ) 
-- ) # ( !\u_vga_sync|h_count\(8) & ( !\u_vga_sync|h_count\(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count[9]~DUPLICATE_q\,
	datae => \u_vga_sync|ALT_INV_h_count\(8),
	dataf => \u_vga_sync|ALT_INV_h_count\(7),
	combout => \u_vga_sync|process_0~1_combout\);

-- Location: LABCELL_X16_Y18_N21
\u_vga_sync|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~0_combout\ = ( \u_vga_sync|h_count\(1) & ( (!\u_vga_sync|h_count[4]~DUPLICATE_q\) # ((!\u_vga_sync|h_count\(0) & (!\u_vga_sync|h_count\(3) & !\u_vga_sync|h_count\(2)))) ) ) # ( !\u_vga_sync|h_count\(1) & ( 
-- (!\u_vga_sync|h_count[4]~DUPLICATE_q\) # ((!\u_vga_sync|h_count\(3) & !\u_vga_sync|h_count\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011001100111111001100110011101100110011001110110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(0),
	datab => \u_vga_sync|ALT_INV_h_count[4]~DUPLICATE_q\,
	datac => \u_vga_sync|ALT_INV_h_count\(3),
	datad => \u_vga_sync|ALT_INV_h_count\(2),
	dataf => \u_vga_sync|ALT_INV_h_count\(1),
	combout => \u_vga_sync|process_0~0_combout\);

-- Location: LABCELL_X17_Y19_N27
\u_vga_sync|process_0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~8_combout\ = ( !\u_vga_sync|h_count\(6) & ( ((((!\u_vga_sync|h_count\(5) & \u_vga_sync|process_0~0_combout\)) # (\u_vga_sync|process_0~1_combout\))) ) ) # ( \u_vga_sync|h_count\(6) & ( ((\u_vga_sync|h_count\(4) & 
-- (\u_vga_sync|h_count\(5) & ((\u_vga_sync|h_count\(3)) # (\u_vga_sync|h_count\(2)))))) # (\u_vga_sync|process_0~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000110000001100000000010001000111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(4),
	datab => \u_vga_sync|ALT_INV_h_count\(5),
	datac => \u_vga_sync|ALT_INV_h_count\(2),
	datad => \u_vga_sync|ALT_INV_h_count\(3),
	datae => \u_vga_sync|ALT_INV_h_count\(6),
	dataf => \u_vga_sync|ALT_INV_process_0~1_combout\,
	datag => \u_vga_sync|ALT_INV_process_0~0_combout\,
	combout => \u_vga_sync|process_0~8_combout\);

-- Location: FF_X17_Y19_N29
\u_vga_sync|horiz_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|horiz_sync~q\);

-- Location: LABCELL_X16_Y19_N42
\u_vga_sync|horiz_sync_out~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|horiz_sync_out~feeder_combout\ = \u_vga_sync|horiz_sync~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_horiz_sync~q\,
	combout => \u_vga_sync|horiz_sync_out~feeder_combout\);

-- Location: FF_X16_Y19_N43
\u_vga_sync|horiz_sync_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|horiz_sync_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|horiz_sync_out~q\);

-- Location: IOIBUF_X8_Y45_N58
\PB1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PB1,
	o => \PB1~input_o\);

-- Location: IOIBUF_X22_Y0_N35
\PB2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PB2,
	o => \PB2~input_o\);
END structure;


