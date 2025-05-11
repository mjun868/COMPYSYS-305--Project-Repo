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

-- DATE "05/11/2025 15:14:08"

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
	PS2_CLK : BUFFER std_logic;
	PS2_DAT : BUFFER std_logic;
	PB1 : IN std_logic;
	PB2 : IN std_logic;
	VGA_R : BUFFER std_logic_vector(3 DOWNTO 0);
	VGA_G : BUFFER std_logic_vector(3 DOWNTO 0);
	VGA_B : BUFFER std_logic_vector(3 DOWNTO 0);
	VGA_HS : BUFFER std_logic;
	VGA_VS : BUFFER std_logic
	);
END de0_cv_top;

-- Design Ports Information
-- PB1	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PB2	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
-- CLOCK_50	=>  Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset_n	=>  Location: PIN_P22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


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
SIGNAL ww_PS2_CLK : std_logic;
SIGNAL ww_PS2_DAT : std_logic;
SIGNAL ww_PB1 : std_logic;
SIGNAL ww_PB2 : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL \PB1~input_o\ : std_logic;
SIGNAL \PB2~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \clk25~0_combout\ : std_logic;
SIGNAL \clk25~q\ : std_logic;
SIGNAL \u_mouse|inhibit_wait_count[0]~0_combout\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
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
SIGNAL \u_mouse|Add0~6\ : std_logic;
SIGNAL \u_mouse|Add0~1_sumout\ : std_logic;
SIGNAL \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|Selector0~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.INHIBIT_TRANS~q\ : std_logic;
SIGNAL \u_mouse|Selector1~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.LOAD_COMMAND~q\ : std_logic;
SIGNAL \u_mouse|mouse_state.LOAD_COMMAND2~q\ : std_logic;
SIGNAL \u_mouse|mouse_state.LOAD_COMMAND~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|WideOr4~combout\ : std_logic;
SIGNAL \PS2_CLK~input_o\ : std_logic;
SIGNAL \u_mouse|filter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|filter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|filter[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|Equal2~0_combout\ : std_logic;
SIGNAL \u_mouse|Equal1~0_combout\ : std_logic;
SIGNAL \u_mouse|MOUSE_CLK_FILTER~0_combout\ : std_logic;
SIGNAL \u_mouse|MOUSE_CLK_FILTER~q\ : std_logic;
SIGNAL \u_mouse|SHIFTOUT[9]~feeder_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~0_combout\ : std_logic;
SIGNAL \u_mouse|send_char~0_combout\ : std_logic;
SIGNAL \u_mouse|send_char~q\ : std_logic;
SIGNAL \u_mouse|output_ready~0_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~2_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~3_combout\ : std_logic;
SIGNAL \u_mouse|OUTCNT~1_combout\ : std_logic;
SIGNAL \u_mouse|LessThan0~0_combout\ : std_logic;
SIGNAL \u_mouse|output_ready~q\ : std_logic;
SIGNAL \u_mouse|Selector3~0_combout\ : std_logic;
SIGNAL \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ : std_logic;
SIGNAL \PS2_DAT~input_o\ : std_logic;
SIGNAL \u_mouse|INCNT~0_combout\ : std_logic;
SIGNAL \u_mouse|INCNT[3]~1_combout\ : std_logic;
SIGNAL \u_mouse|INCNT~3_combout\ : std_logic;
SIGNAL \u_mouse|INCNT~2_combout\ : std_logic;
SIGNAL \u_mouse|INCNT~4_combout\ : std_logic;
SIGNAL \u_mouse|LessThan1~0_combout\ : std_logic;
SIGNAL \u_mouse|READ_CHAR~0_combout\ : std_logic;
SIGNAL \u_mouse|READ_CHAR~q\ : std_logic;
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
SIGNAL \u_vga_sync|Add1~25_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~33_sumout\ : std_logic;
SIGNAL \u_vga_sync|h_count[0]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|Add0~6\ : std_logic;
SIGNAL \u_vga_sync|Add0~1_sumout\ : std_logic;
SIGNAL \u_vga_sync|Equal0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|Equal0~1_combout\ : std_logic;
SIGNAL \u_vga_sync|Add0~34\ : std_logic;
SIGNAL \u_vga_sync|Add0~37_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~38\ : std_logic;
SIGNAL \u_vga_sync|Add0~29_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~30\ : std_logic;
SIGNAL \u_vga_sync|Add0~25_sumout\ : std_logic;
SIGNAL \u_vga_sync|h_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Add0~26\ : std_logic;
SIGNAL \u_vga_sync|Add0~21_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~22\ : std_logic;
SIGNAL \u_vga_sync|Add0~13_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~14\ : std_logic;
SIGNAL \u_vga_sync|Add0~17_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add0~18\ : std_logic;
SIGNAL \u_vga_sync|Add0~9_sumout\ : std_logic;
SIGNAL \u_vga_sync|h_count[7]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|Add0~10\ : std_logic;
SIGNAL \u_vga_sync|Add0~5_sumout\ : std_logic;
SIGNAL \u_vga_sync|h_count[8]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|h_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|process_0~9_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~5_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~10\ : std_logic;
SIGNAL \u_vga_sync|Add1~5_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[8]~0_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~7_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~6\ : std_logic;
SIGNAL \u_vga_sync|Add1~1_sumout\ : std_logic;
SIGNAL \u_vga_sync|process_0~8_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~10_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~26\ : std_logic;
SIGNAL \u_vga_sync|Add1~29_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add1~30\ : std_logic;
SIGNAL \u_vga_sync|Add1~37_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[2]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~38\ : std_logic;
SIGNAL \u_vga_sync|Add1~33_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add1~34\ : std_logic;
SIGNAL \u_vga_sync|Add1~21_sumout\ : std_logic;
SIGNAL \u_vga_sync|Add1~22\ : std_logic;
SIGNAL \u_vga_sync|Add1~13_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[5]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|v_count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|Add1~14\ : std_logic;
SIGNAL \u_vga_sync|Add1~17_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[6]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|Add1~18\ : std_logic;
SIGNAL \u_vga_sync|Add1~9_sumout\ : std_logic;
SIGNAL \u_vga_sync|v_count[7]~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|LessThan7~0_combout\ : std_logic;
SIGNAL \u_vga_sync|video_on_v~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|video_on_v~q\ : std_logic;
SIGNAL \u_vga_sync|video_on_h~q\ : std_logic;
SIGNAL \u_vga_sync|video_on~combout\ : std_logic;
SIGNAL \u_vga_sync|red_out~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|red_out~q\ : std_logic;
SIGNAL \u_vga_sync|process_0~3_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~1_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~2_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~4_combout\ : std_logic;
SIGNAL \u_vga_sync|horiz_sync~q\ : std_logic;
SIGNAL \u_vga_sync|horiz_sync_out~q\ : std_logic;
SIGNAL \u_vga_sync|LessThan7~1_combout\ : std_logic;
SIGNAL \u_vga_sync|process_0~6_combout\ : std_logic;
SIGNAL \u_vga_sync|vert_sync~q\ : std_logic;
SIGNAL \u_vga_sync|vert_sync_out~feeder_combout\ : std_logic;
SIGNAL \u_vga_sync|vert_sync_out~q\ : std_logic;
SIGNAL \u_vga_sync|v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga_sync|h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_mouse|inhibit_wait_count\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_mouse|SHIFTOUT\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \u_mouse|OUTCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|filter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_mouse|INCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_vga_sync|ALT_INV_v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga_sync|ALT_INV_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_vga_sync|ALT_INV_Add1~37_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_send_data~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_filter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_vga_sync|ALT_INV_video_on~combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_LessThan7~1_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_LessThan7~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~2_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~7_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~9_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_OUTCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_video_on_v~q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_vert_sync~q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_video_on_h~q\ : std_logic;
SIGNAL \ALT_INV_clk25~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~8_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~3_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_inhibit_wait_count\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_send_char~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_output_ready~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~5_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_process_0~10_combout\ : std_logic;
SIGNAL \u_mouse|ALT_INV_SHIFTOUT\ : std_logic_vector(9 DOWNTO 3);
SIGNAL \u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_INCNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_mouse|ALT_INV_iready_set~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_READ_CHAR~q\ : std_logic;
SIGNAL \ALT_INV_reset_n~input_o\ : std_logic;
SIGNAL \ALT_INV_PS2_DAT~input_o\ : std_logic;
SIGNAL \u_mouse|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_v_count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_h_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \u_vga_sync|ALT_INV_h_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~DUPLICATE_q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_reset_n <= reset_n;
PS2_CLK <= ww_PS2_CLK;
PS2_DAT <= ww_PS2_DAT;
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
\u_vga_sync|ALT_INV_v_count\(5) <= NOT \u_vga_sync|v_count\(5);
\u_vga_sync|ALT_INV_h_count\(9) <= NOT \u_vga_sync|h_count\(9);
\u_vga_sync|ALT_INV_h_count\(8) <= NOT \u_vga_sync|h_count\(8);
\u_vga_sync|ALT_INV_h_count\(7) <= NOT \u_vga_sync|h_count\(7);
\u_vga_sync|ALT_INV_h_count\(5) <= NOT \u_vga_sync|h_count\(5);
\u_vga_sync|ALT_INV_v_count\(6) <= NOT \u_vga_sync|v_count\(6);
\u_vga_sync|ALT_INV_h_count\(6) <= NOT \u_vga_sync|h_count\(6);
\u_vga_sync|ALT_INV_h_count\(4) <= NOT \u_vga_sync|h_count\(4);
\u_vga_sync|ALT_INV_v_count\(9) <= NOT \u_vga_sync|v_count\(9);
\u_vga_sync|ALT_INV_v_count\(8) <= NOT \u_vga_sync|v_count\(8);
\u_vga_sync|ALT_INV_v_count\(7) <= NOT \u_vga_sync|v_count\(7);
\u_vga_sync|ALT_INV_h_count\(2) <= NOT \u_vga_sync|h_count\(2);
\u_vga_sync|ALT_INV_v_count\(0) <= NOT \u_vga_sync|v_count\(0);
\u_vga_sync|ALT_INV_Add1~37_sumout\ <= NOT \u_vga_sync|Add1~37_sumout\;
\u_vga_sync|ALT_INV_h_count\(1) <= NOT \u_vga_sync|h_count\(1);
\u_vga_sync|ALT_INV_Add1~9_sumout\ <= NOT \u_vga_sync|Add1~9_sumout\;
\u_vga_sync|ALT_INV_h_count\(0) <= NOT \u_vga_sync|h_count\(0);
\u_vga_sync|ALT_INV_Add1~17_sumout\ <= NOT \u_vga_sync|Add1~17_sumout\;
\u_vga_sync|ALT_INV_v_count\(1) <= NOT \u_vga_sync|v_count\(1);
\u_vga_sync|ALT_INV_Add1~13_sumout\ <= NOT \u_vga_sync|Add1~13_sumout\;
\u_vga_sync|ALT_INV_Add0~33_sumout\ <= NOT \u_vga_sync|Add0~33_sumout\;
\u_vga_sync|ALT_INV_v_count\(4) <= NOT \u_vga_sync|v_count\(4);
\u_vga_sync|ALT_INV_v_count\(2) <= NOT \u_vga_sync|v_count\(2);
\u_vga_sync|ALT_INV_h_count\(3) <= NOT \u_vga_sync|h_count\(3);
\u_vga_sync|ALT_INV_Add0~5_sumout\ <= NOT \u_vga_sync|Add0~5_sumout\;
\u_vga_sync|ALT_INV_Add0~9_sumout\ <= NOT \u_vga_sync|Add0~9_sumout\;
\u_vga_sync|ALT_INV_v_count\(3) <= NOT \u_vga_sync|v_count\(3);
\u_mouse|ALT_INV_send_data~q\ <= NOT \u_mouse|send_data~q\;
\u_mouse|ALT_INV_filter\(5) <= NOT \u_mouse|filter\(5);
\u_mouse|ALT_INV_filter\(7) <= NOT \u_mouse|filter\(7);
\u_mouse|ALT_INV_filter\(0) <= NOT \u_mouse|filter\(0);
\u_vga_sync|ALT_INV_video_on~combout\ <= NOT \u_vga_sync|video_on~combout\;
\u_vga_sync|ALT_INV_LessThan7~1_combout\ <= NOT \u_vga_sync|LessThan7~1_combout\;
\u_mouse|ALT_INV_filter\(2) <= NOT \u_mouse|filter\(2);
\u_mouse|ALT_INV_filter\(3) <= NOT \u_mouse|filter\(3);
\u_vga_sync|ALT_INV_LessThan7~0_combout\ <= NOT \u_vga_sync|LessThan7~0_combout\;
\u_vga_sync|ALT_INV_process_0~2_combout\ <= NOT \u_vga_sync|process_0~2_combout\;
\u_vga_sync|ALT_INV_process_0~7_combout\ <= NOT \u_vga_sync|process_0~7_combout\;
\u_vga_sync|ALT_INV_process_0~9_combout\ <= NOT \u_vga_sync|process_0~9_combout\;
\u_mouse|ALT_INV_filter\(6) <= NOT \u_mouse|filter\(6);
\u_mouse|ALT_INV_Equal2~0_combout\ <= NOT \u_mouse|Equal2~0_combout\;
\u_mouse|ALT_INV_OUTCNT\(1) <= NOT \u_mouse|OUTCNT\(1);
\u_mouse|ALT_INV_filter\(1) <= NOT \u_mouse|filter\(1);
\u_mouse|ALT_INV_filter\(4) <= NOT \u_mouse|filter\(4);
\u_mouse|ALT_INV_Equal1~0_combout\ <= NOT \u_mouse|Equal1~0_combout\;
\u_vga_sync|ALT_INV_video_on_v~q\ <= NOT \u_vga_sync|video_on_v~q\;
\u_vga_sync|ALT_INV_process_0~1_combout\ <= NOT \u_vga_sync|process_0~1_combout\;
\u_vga_sync|ALT_INV_vert_sync~q\ <= NOT \u_vga_sync|vert_sync~q\;
\u_vga_sync|ALT_INV_video_on_h~q\ <= NOT \u_vga_sync|video_on_h~q\;
\ALT_INV_clk25~q\ <= NOT \clk25~q\;
\u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\ <= NOT \u_mouse|mouse_state.LOAD_COMMAND~q\;
\u_vga_sync|ALT_INV_process_0~8_combout\ <= NOT \u_vga_sync|process_0~8_combout\;
\u_vga_sync|ALT_INV_process_0~3_combout\ <= NOT \u_vga_sync|process_0~3_combout\;
\u_vga_sync|ALT_INV_Equal0~0_combout\ <= NOT \u_vga_sync|Equal0~0_combout\;
\u_vga_sync|ALT_INV_process_0~0_combout\ <= NOT \u_vga_sync|process_0~0_combout\;
\u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\ <= NOT \u_mouse|MOUSE_CLK_FILTER~q\;
\u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\ <= NOT \u_mouse|mouse_state.INHIBIT_TRANS~q\;
\u_mouse|ALT_INV_OUTCNT\(2) <= NOT \u_mouse|OUTCNT\(2);
\u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\ <= NOT \u_mouse|mouse_state.LOAD_COMMAND2~q\;
\u_mouse|ALT_INV_OUTCNT\(3) <= NOT \u_mouse|OUTCNT\(3);
\u_mouse|ALT_INV_inhibit_wait_count\(10) <= NOT \u_mouse|inhibit_wait_count\(10);
\u_mouse|ALT_INV_send_char~q\ <= NOT \u_mouse|send_char~q\;
\u_mouse|ALT_INV_output_ready~q\ <= NOT \u_mouse|output_ready~q\;
\u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\ <= NOT \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\;
\u_vga_sync|ALT_INV_process_0~5_combout\ <= NOT \u_vga_sync|process_0~5_combout\;
\u_vga_sync|ALT_INV_process_0~10_combout\ <= NOT \u_vga_sync|process_0~10_combout\;
\u_mouse|ALT_INV_inhibit_wait_count\(11) <= NOT \u_mouse|inhibit_wait_count\(11);
\u_mouse|ALT_INV_SHIFTOUT\(9) <= NOT \u_mouse|SHIFTOUT\(9);
\u_mouse|ALT_INV_inhibit_wait_count\(7) <= NOT \u_mouse|inhibit_wait_count\(7);
\u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\ <= NOT \u_mouse|mouse_state.WAIT_CMD_ACK~q\;
\u_mouse|ALT_INV_OUTCNT\(0) <= NOT \u_mouse|OUTCNT\(0);
\u_mouse|ALT_INV_inhibit_wait_count\(4) <= NOT \u_mouse|inhibit_wait_count\(4);
\u_mouse|ALT_INV_inhibit_wait_count\(2) <= NOT \u_mouse|inhibit_wait_count\(2);
\u_mouse|ALT_INV_inhibit_wait_count\(9) <= NOT \u_mouse|inhibit_wait_count\(9);
\u_mouse|ALT_INV_inhibit_wait_count\(0) <= NOT \u_mouse|inhibit_wait_count\(0);
\u_mouse|ALT_INV_INCNT\(3) <= NOT \u_mouse|INCNT\(3);
\u_mouse|ALT_INV_INCNT\(2) <= NOT \u_mouse|INCNT\(2);
\u_mouse|ALT_INV_SHIFTOUT\(4) <= NOT \u_mouse|SHIFTOUT\(4);
\u_mouse|ALT_INV_INCNT\(0) <= NOT \u_mouse|INCNT\(0);
\u_mouse|ALT_INV_SHIFTOUT\(5) <= NOT \u_mouse|SHIFTOUT\(5);
\u_mouse|ALT_INV_iready_set~q\ <= NOT \u_mouse|iready_set~q\;
\u_mouse|ALT_INV_inhibit_wait_count\(8) <= NOT \u_mouse|inhibit_wait_count\(8);
\u_mouse|ALT_INV_inhibit_wait_count\(6) <= NOT \u_mouse|inhibit_wait_count\(6);
\u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\ <= NOT \u_mouse|mouse_state.INPUT_PACKETS~q\;
\u_mouse|ALT_INV_INCNT\(1) <= NOT \u_mouse|INCNT\(1);
\u_mouse|ALT_INV_READ_CHAR~q\ <= NOT \u_mouse|READ_CHAR~q\;
\u_mouse|ALT_INV_inhibit_wait_count\(3) <= NOT \u_mouse|inhibit_wait_count\(3);
\ALT_INV_reset_n~input_o\ <= NOT \reset_n~input_o\;
\ALT_INV_PS2_DAT~input_o\ <= NOT \PS2_DAT~input_o\;
\u_mouse|ALT_INV_inhibit_wait_count\(1) <= NOT \u_mouse|inhibit_wait_count\(1);
\u_mouse|ALT_INV_SHIFTOUT\(3) <= NOT \u_mouse|SHIFTOUT\(3);
\u_mouse|ALT_INV_inhibit_wait_count\(5) <= NOT \u_mouse|inhibit_wait_count\(5);
\u_mouse|ALT_INV_LessThan1~0_combout\ <= NOT \u_mouse|LessThan1~0_combout\;
\u_vga_sync|ALT_INV_v_count[5]~DUPLICATE_q\ <= NOT \u_vga_sync|v_count[5]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_h_count[8]~DUPLICATE_q\ <= NOT \u_vga_sync|h_count[8]~DUPLICATE_q\;
\u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\ <= NOT \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\;
\u_vga_sync|ALT_INV_h_count[3]~DUPLICATE_q\ <= NOT \u_vga_sync|h_count[3]~DUPLICATE_q\;
\u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~DUPLICATE_q\ <= NOT \u_mouse|mouse_state.LOAD_COMMAND~DUPLICATE_q\;

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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	i => \u_vga_sync|red_out~q\,
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
	o => ww_PS2_CLK);

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
	o => ww_PS2_DAT);

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

-- Location: LABCELL_X7_Y20_N51
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

-- Location: FF_X7_Y20_N50
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

-- Location: LABCELL_X7_Y20_N39
\u_mouse|inhibit_wait_count[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|inhibit_wait_count[0]~0_combout\ = ( !\u_mouse|inhibit_wait_count\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_mouse|ALT_INV_inhibit_wait_count\(0),
	combout => \u_mouse|inhibit_wait_count[0]~0_combout\);

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

-- Location: FF_X7_Y20_N35
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

-- Location: LABCELL_X7_Y20_N0
\u_mouse|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~41_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(0) ) + ( \u_mouse|inhibit_wait_count\(1) ) + ( !VCC ))
-- \u_mouse|Add0~42\ = CARRY(( \u_mouse|inhibit_wait_count\(0) ) + ( \u_mouse|inhibit_wait_count\(1) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_inhibit_wait_count\(0),
	datac => \u_mouse|ALT_INV_inhibit_wait_count\(1),
	cin => GND,
	sumout => \u_mouse|Add0~41_sumout\,
	cout => \u_mouse|Add0~42\);

-- Location: FF_X7_Y20_N2
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

-- Location: LABCELL_X7_Y20_N3
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

-- Location: FF_X7_Y20_N5
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

-- Location: LABCELL_X7_Y20_N6
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

-- Location: FF_X7_Y20_N8
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

-- Location: LABCELL_X7_Y20_N9
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

-- Location: FF_X7_Y20_N11
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

-- Location: LABCELL_X7_Y20_N12
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

-- Location: FF_X7_Y20_N14
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

-- Location: LABCELL_X7_Y20_N15
\u_mouse|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~21_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(6) ) + ( GND ) + ( \u_mouse|Add0~26\ ))
-- \u_mouse|Add0~22\ = CARRY(( \u_mouse|inhibit_wait_count\(6) ) + ( GND ) + ( \u_mouse|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_inhibit_wait_count\(6),
	cin => \u_mouse|Add0~26\,
	sumout => \u_mouse|Add0~21_sumout\,
	cout => \u_mouse|Add0~22\);

-- Location: FF_X7_Y20_N16
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

-- Location: LABCELL_X7_Y20_N18
\u_mouse|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Add0~17_sumout\ = SUM(( \u_mouse|inhibit_wait_count\(7) ) + ( GND ) + ( \u_mouse|Add0~22\ ))
-- \u_mouse|Add0~18\ = CARRY(( \u_mouse|inhibit_wait_count\(7) ) + ( GND ) + ( \u_mouse|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_inhibit_wait_count\(7),
	cin => \u_mouse|Add0~22\,
	sumout => \u_mouse|Add0~17_sumout\,
	cout => \u_mouse|Add0~18\);

-- Location: FF_X7_Y20_N19
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

-- Location: LABCELL_X7_Y20_N21
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

-- Location: FF_X7_Y20_N23
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

-- Location: LABCELL_X7_Y20_N24
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

-- Location: FF_X7_Y20_N25
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

-- Location: LABCELL_X7_Y20_N27
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

-- Location: FF_X7_Y20_N29
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

-- Location: LABCELL_X7_Y20_N30
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

-- Location: FF_X7_Y20_N31
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

-- Location: LABCELL_X7_Y20_N42
\u_mouse|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector0~0_combout\ = ( \u_mouse|inhibit_wait_count[11]~DUPLICATE_q\ & ( (\u_mouse|inhibit_wait_count\(10)) # (\u_mouse|mouse_state.INHIBIT_TRANS~q\) ) ) # ( !\u_mouse|inhibit_wait_count[11]~DUPLICATE_q\ & ( \u_mouse|mouse_state.INHIBIT_TRANS~q\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	datac => \u_mouse|ALT_INV_inhibit_wait_count\(10),
	dataf => \u_mouse|ALT_INV_inhibit_wait_count[11]~DUPLICATE_q\,
	combout => \u_mouse|Selector0~0_combout\);

-- Location: FF_X7_Y20_N47
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

-- Location: FF_X7_Y20_N32
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

-- Location: LABCELL_X7_Y20_N57
\u_mouse|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector1~0_combout\ = ( \u_mouse|inhibit_wait_count\(10) & ( (!\u_mouse|mouse_state.INHIBIT_TRANS~q\ & \u_mouse|inhibit_wait_count\(11)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	datad => \u_mouse|ALT_INV_inhibit_wait_count\(11),
	dataf => \u_mouse|ALT_INV_inhibit_wait_count\(10),
	combout => \u_mouse|Selector1~0_combout\);

-- Location: FF_X7_Y20_N59
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

-- Location: FF_X7_Y20_N56
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

-- Location: FF_X7_Y20_N58
\u_mouse|mouse_state.LOAD_COMMAND~DUPLICATE\ : dffeas
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
	q => \u_mouse|mouse_state.LOAD_COMMAND~DUPLICATE_q\);

-- Location: LABCELL_X7_Y20_N36
\u_mouse|WideOr4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|WideOr4~combout\ = ( \u_mouse|mouse_state.LOAD_COMMAND~DUPLICATE_q\ ) # ( !\u_mouse|mouse_state.LOAD_COMMAND~DUPLICATE_q\ & ( (!\u_mouse|mouse_state.INHIBIT_TRANS~q\) # (\u_mouse|mouse_state.LOAD_COMMAND2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110111011101110111011101110111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\,
	datab => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~DUPLICATE_q\,
	combout => \u_mouse|WideOr4~combout\);

-- Location: IOIBUF_X0_Y20_N4
\PS2_CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PS2_CLK,
	o => \PS2_CLK~input_o\);

-- Location: FF_X5_Y20_N32
\u_mouse|filter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \PS2_CLK~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(0));

-- Location: FF_X5_Y20_N11
\u_mouse|filter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(1));

-- Location: FF_X5_Y20_N52
\u_mouse|filter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter[2]~DUPLICATE_q\);

-- Location: FF_X5_Y20_N4
\u_mouse|filter[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter[2]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter[3]~DUPLICATE_q\);

-- Location: FF_X5_Y20_N37
\u_mouse|filter[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter[3]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter[4]~DUPLICATE_q\);

-- Location: FF_X5_Y20_N35
\u_mouse|filter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter[4]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(5));

-- Location: FF_X5_Y20_N41
\u_mouse|filter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(6));

-- Location: FF_X5_Y20_N2
\u_mouse|filter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(7));

-- Location: FF_X5_Y20_N53
\u_mouse|filter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(2));

-- Location: FF_X5_Y20_N38
\u_mouse|filter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter[3]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(4));

-- Location: FF_X5_Y20_N5
\u_mouse|filter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|filter[2]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|filter\(3));

-- Location: LABCELL_X5_Y20_N21
\u_mouse|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Equal2~0_combout\ = ( !\u_mouse|filter\(3) & ( !\u_mouse|filter\(0) & ( (!\u_mouse|filter\(2) & (!\u_mouse|filter\(1) & !\u_mouse|filter\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_filter\(2),
	datac => \u_mouse|ALT_INV_filter\(1),
	datad => \u_mouse|ALT_INV_filter\(4),
	datae => \u_mouse|ALT_INV_filter\(3),
	dataf => \u_mouse|ALT_INV_filter\(0),
	combout => \u_mouse|Equal2~0_combout\);

-- Location: LABCELL_X5_Y20_N33
\u_mouse|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Equal1~0_combout\ = ( \u_mouse|filter\(4) & ( \u_mouse|filter\(1) & ( (\u_mouse|filter\(2) & (\u_mouse|filter\(0) & \u_mouse|filter\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_filter\(2),
	datac => \u_mouse|ALT_INV_filter\(0),
	datad => \u_mouse|ALT_INV_filter\(3),
	datae => \u_mouse|ALT_INV_filter\(4),
	dataf => \u_mouse|ALT_INV_filter\(1),
	combout => \u_mouse|Equal1~0_combout\);

-- Location: LABCELL_X5_Y20_N0
\u_mouse|MOUSE_CLK_FILTER~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|MOUSE_CLK_FILTER~0_combout\ = ( \u_mouse|filter\(6) & ( \u_mouse|Equal1~0_combout\ & ( ((\u_mouse|filter\(5) & \u_mouse|filter\(7))) # (\u_mouse|MOUSE_CLK_FILTER~q\) ) ) ) # ( !\u_mouse|filter\(6) & ( \u_mouse|Equal1~0_combout\ & ( 
-- (\u_mouse|MOUSE_CLK_FILTER~q\ & (((!\u_mouse|Equal2~0_combout\) # (\u_mouse|filter\(7))) # (\u_mouse|filter\(5)))) ) ) ) # ( \u_mouse|filter\(6) & ( !\u_mouse|Equal1~0_combout\ & ( \u_mouse|MOUSE_CLK_FILTER~q\ ) ) ) # ( !\u_mouse|filter\(6) & ( 
-- !\u_mouse|Equal1~0_combout\ & ( (\u_mouse|MOUSE_CLK_FILTER~q\ & (((!\u_mouse|Equal2~0_combout\) # (\u_mouse|filter\(7))) # (\u_mouse|filter\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100010101010101010101010101010101000101010101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	datab => \u_mouse|ALT_INV_filter\(5),
	datac => \u_mouse|ALT_INV_filter\(7),
	datad => \u_mouse|ALT_INV_Equal2~0_combout\,
	datae => \u_mouse|ALT_INV_filter\(6),
	dataf => \u_mouse|ALT_INV_Equal1~0_combout\,
	combout => \u_mouse|MOUSE_CLK_FILTER~0_combout\);

-- Location: FF_X5_Y20_N8
\u_mouse|MOUSE_CLK_FILTER\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_mouse|MOUSE_CLK_FILTER~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|MOUSE_CLK_FILTER~q\);

-- Location: LABCELL_X6_Y20_N24
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

-- Location: LABCELL_X6_Y20_N6
\u_mouse|OUTCNT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~0_combout\ = ( \u_mouse|OUTCNT\(2) & ( (!\u_mouse|OUTCNT\(3) & (\u_mouse|OUTCNT\(1) & \u_mouse|OUTCNT\(0))) ) ) # ( !\u_mouse|OUTCNT\(2) & ( (\u_mouse|OUTCNT\(3) & !\u_mouse|OUTCNT\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000000000000000010100000000000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(3),
	datac => \u_mouse|ALT_INV_OUTCNT\(1),
	datad => \u_mouse|ALT_INV_OUTCNT\(0),
	dataf => \u_mouse|ALT_INV_OUTCNT\(2),
	combout => \u_mouse|OUTCNT~0_combout\);

-- Location: LABCELL_X6_Y20_N21
\u_mouse|send_char~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|send_char~0_combout\ = ( \u_mouse|OUTCNT\(1) & ( ((\u_mouse|OUTCNT\(3) & \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\)) # (\u_mouse|send_char~q\) ) ) # ( !\u_mouse|OUTCNT\(1) & ( ((\u_mouse|OUTCNT\(3) & (\u_mouse|OUTCNT\(2) & 
-- \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\))) # (\u_mouse|send_char~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100011111000011110001111100001111010111110000111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(3),
	datab => \u_mouse|ALT_INV_OUTCNT\(2),
	datac => \u_mouse|ALT_INV_send_char~q\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	dataf => \u_mouse|ALT_INV_OUTCNT\(1),
	combout => \u_mouse|send_char~0_combout\);

-- Location: FF_X6_Y20_N50
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

-- Location: LABCELL_X6_Y20_N27
\u_mouse|output_ready~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|output_ready~0_combout\ = ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( !\u_mouse|send_char~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_send_char~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|output_ready~0_combout\);

-- Location: FF_X6_Y20_N5
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

-- Location: LABCELL_X6_Y20_N36
\u_mouse|OUTCNT~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~2_combout\ = ( \u_mouse|OUTCNT\(2) & ( (!\u_mouse|OUTCNT\(3) & (!\u_mouse|OUTCNT\(1) $ (!\u_mouse|OUTCNT\(0)))) ) ) # ( !\u_mouse|OUTCNT\(2) & ( (!\u_mouse|OUTCNT\(1) & (\u_mouse|OUTCNT\(0))) # (\u_mouse|OUTCNT\(1) & (!\u_mouse|OUTCNT\(0) 
-- & !\u_mouse|OUTCNT\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110001001100010011000100110001001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(1),
	datab => \u_mouse|ALT_INV_OUTCNT\(0),
	datac => \u_mouse|ALT_INV_OUTCNT\(3),
	dataf => \u_mouse|ALT_INV_OUTCNT\(2),
	combout => \u_mouse|OUTCNT~2_combout\);

-- Location: FF_X6_Y20_N56
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

-- Location: LABCELL_X6_Y20_N0
\u_mouse|OUTCNT~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~3_combout\ = ( !\u_mouse|OUTCNT\(0) & ( \u_mouse|OUTCNT\(2) & ( !\u_mouse|OUTCNT\(3) ) ) ) # ( !\u_mouse|OUTCNT\(0) & ( !\u_mouse|OUTCNT\(2) & ( (!\u_mouse|OUTCNT\(1)) # (!\u_mouse|OUTCNT\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111010000000000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(1),
	datac => \u_mouse|ALT_INV_OUTCNT\(3),
	datae => \u_mouse|ALT_INV_OUTCNT\(0),
	dataf => \u_mouse|ALT_INV_OUTCNT\(2),
	combout => \u_mouse|OUTCNT~3_combout\);

-- Location: FF_X6_Y20_N59
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

-- Location: LABCELL_X6_Y20_N51
\u_mouse|OUTCNT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|OUTCNT~1_combout\ = ( \u_mouse|OUTCNT\(1) & ( (!\u_mouse|OUTCNT\(3) & (!\u_mouse|OUTCNT\(2) $ (!\u_mouse|OUTCNT\(0)))) ) ) # ( !\u_mouse|OUTCNT\(1) & ( (\u_mouse|OUTCNT\(2) & !\u_mouse|OUTCNT\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000111100000000000011110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_OUTCNT\(2),
	datac => \u_mouse|ALT_INV_OUTCNT\(0),
	datad => \u_mouse|ALT_INV_OUTCNT\(3),
	dataf => \u_mouse|ALT_INV_OUTCNT\(1),
	combout => \u_mouse|OUTCNT~1_combout\);

-- Location: FF_X6_Y20_N17
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

-- Location: LABCELL_X6_Y20_N12
\u_mouse|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan0~0_combout\ = ( \u_mouse|OUTCNT\(1) & ( \u_mouse|OUTCNT\(3) ) ) # ( !\u_mouse|OUTCNT\(1) & ( \u_mouse|OUTCNT\(3) & ( \u_mouse|OUTCNT\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_OUTCNT\(2),
	datae => \u_mouse|ALT_INV_OUTCNT\(1),
	dataf => \u_mouse|ALT_INV_OUTCNT\(3),
	combout => \u_mouse|LessThan0~0_combout\);

-- Location: FF_X6_Y20_N14
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

-- Location: LABCELL_X6_Y20_N57
\u_mouse|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector3~0_combout\ = ( \u_mouse|output_ready~q\ & ( \u_mouse|mouse_state.LOAD_COMMAND2~q\ ) ) # ( !\u_mouse|output_ready~q\ & ( (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) # (\u_mouse|mouse_state.LOAD_COMMAND2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	dataf => \u_mouse|ALT_INV_output_ready~q\,
	combout => \u_mouse|Selector3~0_combout\);

-- Location: FF_X5_Y20_N14
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
	i => ww_PS2_DAT,
	o => \PS2_DAT~input_o\);

-- Location: LABCELL_X5_Y20_N15
\u_mouse|INCNT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~0_combout\ = ( !\u_mouse|INCNT\(3) & ( \u_mouse|INCNT\(2) & ( (\u_mouse|INCNT\(0) & \u_mouse|INCNT\(1)) ) ) ) # ( \u_mouse|INCNT\(3) & ( !\u_mouse|INCNT\(2) & ( (!\u_mouse|INCNT\(0) & !\u_mouse|INCNT\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100000000000000000010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_INCNT\(0),
	datad => \u_mouse|ALT_INV_INCNT\(1),
	datae => \u_mouse|ALT_INV_INCNT\(3),
	dataf => \u_mouse|ALT_INV_INCNT\(2),
	combout => \u_mouse|INCNT~0_combout\);

-- Location: LABCELL_X5_Y20_N9
\u_mouse|INCNT[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT[3]~1_combout\ = ( !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( \u_mouse|READ_CHAR~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_READ_CHAR~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|INCNT[3]~1_combout\);

-- Location: FF_X5_Y20_N23
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
	ena => \u_mouse|INCNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(3));

-- Location: LABCELL_X5_Y20_N24
\u_mouse|INCNT~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~3_combout\ = ( !\u_mouse|INCNT\(3) & ( !\u_mouse|INCNT\(1) $ (!\u_mouse|INCNT\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_mouse|ALT_INV_INCNT\(1),
	datad => \u_mouse|ALT_INV_INCNT\(0),
	dataf => \u_mouse|ALT_INV_INCNT\(3),
	combout => \u_mouse|INCNT~3_combout\);

-- Location: FF_X5_Y20_N20
\u_mouse|INCNT[1]\ : dffeas
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
	ena => \u_mouse|INCNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(1));

-- Location: LABCELL_X5_Y20_N54
\u_mouse|INCNT~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~2_combout\ = ( \u_mouse|INCNT\(2) & ( !\u_mouse|INCNT\(3) & ( (!\u_mouse|INCNT\(1)) # (!\u_mouse|INCNT\(0)) ) ) ) # ( !\u_mouse|INCNT\(2) & ( !\u_mouse|INCNT\(3) & ( (\u_mouse|INCNT\(1) & \u_mouse|INCNT\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111110101111101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_INCNT\(1),
	datac => \u_mouse|ALT_INV_INCNT\(0),
	datae => \u_mouse|ALT_INV_INCNT\(2),
	dataf => \u_mouse|ALT_INV_INCNT\(3),
	combout => \u_mouse|INCNT~2_combout\);

-- Location: FF_X5_Y20_N29
\u_mouse|INCNT[2]\ : dffeas
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
	ena => \u_mouse|INCNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(2));

-- Location: LABCELL_X5_Y20_N6
\u_mouse|INCNT~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|INCNT~4_combout\ = ( \u_mouse|INCNT\(3) & ( (!\u_mouse|INCNT\(2) & (!\u_mouse|INCNT\(0) & !\u_mouse|INCNT\(1))) ) ) # ( !\u_mouse|INCNT\(3) & ( !\u_mouse|INCNT\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_INCNT\(2),
	datab => \u_mouse|ALT_INV_INCNT\(0),
	datac => \u_mouse|ALT_INV_INCNT\(1),
	dataf => \u_mouse|ALT_INV_INCNT\(3),
	combout => \u_mouse|INCNT~4_combout\);

-- Location: FF_X5_Y20_N26
\u_mouse|INCNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_mouse|ALT_INV_MOUSE_CLK_FILTER~q\,
	asdata => \u_mouse|INCNT~4_combout\,
	clrn => \reset_n~input_o\,
	sload => VCC,
	ena => \u_mouse|INCNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_mouse|INCNT\(0));

-- Location: LABCELL_X5_Y20_N42
\u_mouse|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|LessThan1~0_combout\ = ( \u_mouse|INCNT\(2) & ( \u_mouse|INCNT\(1) & ( \u_mouse|INCNT\(3) ) ) ) # ( !\u_mouse|INCNT\(2) & ( \u_mouse|INCNT\(1) & ( \u_mouse|INCNT\(3) ) ) ) # ( \u_mouse|INCNT\(2) & ( !\u_mouse|INCNT\(1) & ( \u_mouse|INCNT\(3) ) ) 
-- ) # ( !\u_mouse|INCNT\(2) & ( !\u_mouse|INCNT\(1) & ( (\u_mouse|INCNT\(0) & \u_mouse|INCNT\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_INCNT\(0),
	datac => \u_mouse|ALT_INV_INCNT\(3),
	datae => \u_mouse|ALT_INV_INCNT\(2),
	dataf => \u_mouse|ALT_INV_INCNT\(1),
	combout => \u_mouse|LessThan1~0_combout\);

-- Location: LABCELL_X5_Y20_N48
\u_mouse|READ_CHAR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|READ_CHAR~0_combout\ = ( \u_mouse|READ_CHAR~q\ & ( \u_mouse|LessThan1~0_combout\ & ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ ) ) ) # ( !\u_mouse|READ_CHAR~q\ & ( \u_mouse|LessThan1~0_combout\ & ( (!\PS2_DAT~input_o\ & 
-- !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) ) ) # ( \u_mouse|READ_CHAR~q\ & ( !\u_mouse|LessThan1~0_combout\ ) ) # ( !\u_mouse|READ_CHAR~q\ & ( !\u_mouse|LessThan1~0_combout\ & ( (!\PS2_DAT~input_o\ & !\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000111111111111111111001100000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_PS2_DAT~input_o\,
	datad => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datae => \u_mouse|ALT_INV_READ_CHAR~q\,
	dataf => \u_mouse|ALT_INV_LessThan1~0_combout\,
	combout => \u_mouse|READ_CHAR~0_combout\);

-- Location: FF_X5_Y20_N47
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

-- Location: LABCELL_X5_Y20_N39
\u_mouse|iready_set~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|iready_set~0_combout\ = ( \u_mouse|iready_set~q\ & ( \u_mouse|LessThan1~0_combout\ & ( (((!\reset_n~input_o\) # (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\)) # (\u_mouse|READ_CHAR~q\)) # (\PS2_DAT~input_o\) ) ) ) # ( !\u_mouse|iready_set~q\ & ( 
-- \u_mouse|LessThan1~0_combout\ & ( (\u_mouse|READ_CHAR~q\ & (!\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & \reset_n~input_o\)) ) ) ) # ( \u_mouse|iready_set~q\ & ( !\u_mouse|LessThan1~0_combout\ & ( ((!\reset_n~input_o\) # ((\PS2_DAT~input_o\ & 
-- !\u_mouse|READ_CHAR~q\))) # (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100111100000000001100001111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PS2_DAT~input_o\,
	datab => \u_mouse|ALT_INV_READ_CHAR~q\,
	datac => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datad => \ALT_INV_reset_n~input_o\,
	datae => \u_mouse|ALT_INV_iready_set~q\,
	dataf => \u_mouse|ALT_INV_LessThan1~0_combout\,
	combout => \u_mouse|iready_set~0_combout\);

-- Location: FF_X5_Y20_N59
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

-- Location: LABCELL_X5_Y20_N27
\u_mouse|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector4~0_combout\ = ( \u_mouse|output_ready~q\ & ( ((\u_mouse|mouse_state.WAIT_CMD_ACK~q\ & !\u_mouse|iready_set~q\)) # (\u_mouse|mouse_state.WAIT_OUTPUT_READY~q\) ) ) # ( !\u_mouse|output_ready~q\ & ( (\u_mouse|mouse_state.WAIT_CMD_ACK~q\ & 
-- !\u_mouse|iready_set~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001110011011100110111001101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_mouse_state.WAIT_CMD_ACK~q\,
	datab => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	datac => \u_mouse|ALT_INV_iready_set~q\,
	dataf => \u_mouse|ALT_INV_output_ready~q\,
	combout => \u_mouse|Selector4~0_combout\);

-- Location: FF_X5_Y20_N17
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

-- Location: LABCELL_X6_Y20_N42
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

-- Location: FF_X7_Y20_N44
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

-- Location: LABCELL_X7_Y20_N54
\u_mouse|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|Selector6~0_combout\ = ( \u_mouse|mouse_state.INPUT_PACKETS~q\ & ( ((\u_mouse|mouse_state.LOAD_COMMAND~q\) # (\u_mouse|mouse_state.LOAD_COMMAND2~q\)) # (\u_mouse|send_data~q\) ) ) # ( !\u_mouse|mouse_state.INPUT_PACKETS~q\ & ( 
-- (((\u_mouse|send_data~q\ & !\u_mouse|mouse_state.INHIBIT_TRANS~q\)) # (\u_mouse|mouse_state.LOAD_COMMAND~q\)) # (\u_mouse|mouse_state.LOAD_COMMAND2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111111111111010011111111111101011111111111110101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_send_data~q\,
	datab => \u_mouse|ALT_INV_mouse_state.INHIBIT_TRANS~q\,
	datac => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND2~q\,
	datad => \u_mouse|ALT_INV_mouse_state.LOAD_COMMAND~q\,
	dataf => \u_mouse|ALT_INV_mouse_state.INPUT_PACKETS~q\,
	combout => \u_mouse|Selector6~0_combout\);

-- Location: FF_X7_Y20_N41
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

-- Location: LABCELL_X6_Y20_N33
\u_mouse|MOUSE_DATA_BUF~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|MOUSE_DATA_BUF~0_combout\ = ( \u_mouse|mouse_state.WAIT_OUTPUT_READY~q\ & ( (!\u_mouse|send_char~q\ & ((!\u_mouse|OUTCNT\(3)) # ((!\u_mouse|OUTCNT\(2) & !\u_mouse|OUTCNT\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011100000101000001110000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_mouse|ALT_INV_OUTCNT\(3),
	datab => \u_mouse|ALT_INV_OUTCNT\(2),
	datac => \u_mouse|ALT_INV_send_char~q\,
	datad => \u_mouse|ALT_INV_OUTCNT\(1),
	dataf => \u_mouse|ALT_INV_mouse_state.WAIT_OUTPUT_READY~q\,
	combout => \u_mouse|MOUSE_DATA_BUF~0_combout\);

-- Location: FF_X6_Y20_N25
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

-- Location: LABCELL_X6_Y20_N39
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

-- Location: FF_X6_Y20_N40
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

-- Location: FF_X6_Y20_N37
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

-- Location: FF_X6_Y20_N10
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

-- Location: FF_X6_Y20_N8
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

-- Location: LABCELL_X6_Y20_N30
\u_mouse|SHIFTOUT[4]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[4]~2_combout\ = !\u_mouse|SHIFTOUT\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_mouse|ALT_INV_SHIFTOUT\(5),
	combout => \u_mouse|SHIFTOUT[4]~2_combout\);

-- Location: FF_X6_Y20_N32
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

-- Location: LABCELL_X6_Y20_N45
\u_mouse|SHIFTOUT[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[3]~1_combout\ = ( !\u_mouse|SHIFTOUT\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_mouse|ALT_INV_SHIFTOUT\(4),
	combout => \u_mouse|SHIFTOUT[3]~1_combout\);

-- Location: FF_X6_Y20_N47
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

-- Location: LABCELL_X6_Y20_N18
\u_mouse|SHIFTOUT[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_mouse|SHIFTOUT[2]~0_combout\ = ( !\u_mouse|SHIFTOUT\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_mouse|ALT_INV_SHIFTOUT\(3),
	combout => \u_mouse|SHIFTOUT[2]~0_combout\);

-- Location: FF_X6_Y20_N19
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

-- Location: FF_X6_Y20_N29
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

-- Location: FF_X6_Y20_N35
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

-- Location: LABCELL_X12_Y18_N30
\u_vga_sync|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~25_sumout\ = SUM(( \u_vga_sync|v_count\(0) ) + ( VCC ) + ( !VCC ))
-- \u_vga_sync|Add1~26\ = CARRY(( \u_vga_sync|v_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(0),
	cin => GND,
	sumout => \u_vga_sync|Add1~25_sumout\,
	cout => \u_vga_sync|Add1~26\);

-- Location: MLABCELL_X13_Y18_N30
\u_vga_sync|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~33_sumout\ = SUM(( \u_vga_sync|h_count\(0) ) + ( VCC ) + ( !VCC ))
-- \u_vga_sync|Add0~34\ = CARRY(( \u_vga_sync|h_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count\(0),
	cin => GND,
	sumout => \u_vga_sync|Add0~33_sumout\,
	cout => \u_vga_sync|Add0~34\);

-- Location: LABCELL_X14_Y18_N30
\u_vga_sync|h_count[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|h_count[0]~feeder_combout\ = ( \u_vga_sync|Add0~33_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add0~33_sumout\,
	combout => \u_vga_sync|h_count[0]~feeder_combout\);

-- Location: FF_X14_Y18_N49
\u_vga_sync|h_count[3]\ : dffeas
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
	q => \u_vga_sync|h_count\(3));

-- Location: MLABCELL_X13_Y18_N54
\u_vga_sync|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~5_sumout\ = SUM(( \u_vga_sync|h_count[8]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add0~10\ ))
-- \u_vga_sync|Add0~6\ = CARRY(( \u_vga_sync|h_count[8]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count[8]~DUPLICATE_q\,
	cin => \u_vga_sync|Add0~10\,
	sumout => \u_vga_sync|Add0~5_sumout\,
	cout => \u_vga_sync|Add0~6\);

-- Location: MLABCELL_X13_Y18_N57
\u_vga_sync|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~1_sumout\ = SUM(( \u_vga_sync|h_count\(9) ) + ( GND ) + ( \u_vga_sync|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(9),
	cin => \u_vga_sync|Add0~6\,
	sumout => \u_vga_sync|Add0~1_sumout\);

-- Location: FF_X14_Y18_N44
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

-- Location: LABCELL_X14_Y18_N6
\u_vga_sync|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Equal0~0_combout\ = ( \u_vga_sync|h_count\(3) & ( \u_vga_sync|h_count\(9) & ( (\u_vga_sync|h_count\(4) & (!\u_vga_sync|h_count\(6) & (\u_vga_sync|h_count\(1) & \u_vga_sync|h_count\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(4),
	datab => \u_vga_sync|ALT_INV_h_count\(6),
	datac => \u_vga_sync|ALT_INV_h_count\(1),
	datad => \u_vga_sync|ALT_INV_h_count\(0),
	datae => \u_vga_sync|ALT_INV_h_count\(3),
	dataf => \u_vga_sync|ALT_INV_h_count\(9),
	combout => \u_vga_sync|Equal0~0_combout\);

-- Location: FF_X14_Y18_N22
\u_vga_sync|h_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|h_count[8]~feeder_combout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(8));

-- Location: LABCELL_X14_Y18_N24
\u_vga_sync|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Equal0~1_combout\ = ( \u_vga_sync|h_count\(8) & ( (!\u_vga_sync|h_count\(5) & (\u_vga_sync|Equal0~0_combout\ & (!\u_vga_sync|h_count\(7) & \u_vga_sync|h_count\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(5),
	datab => \u_vga_sync|ALT_INV_Equal0~0_combout\,
	datac => \u_vga_sync|ALT_INV_h_count\(7),
	datad => \u_vga_sync|ALT_INV_h_count\(2),
	dataf => \u_vga_sync|ALT_INV_h_count\(8),
	combout => \u_vga_sync|Equal0~1_combout\);

-- Location: FF_X14_Y18_N32
\u_vga_sync|h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|h_count[0]~feeder_combout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(0));

-- Location: MLABCELL_X13_Y18_N33
\u_vga_sync|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~37_sumout\ = SUM(( \u_vga_sync|h_count\(1) ) + ( GND ) + ( \u_vga_sync|Add0~34\ ))
-- \u_vga_sync|Add0~38\ = CARRY(( \u_vga_sync|h_count\(1) ) + ( GND ) + ( \u_vga_sync|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count\(1),
	cin => \u_vga_sync|Add0~34\,
	sumout => \u_vga_sync|Add0~37_sumout\,
	cout => \u_vga_sync|Add0~38\);

-- Location: FF_X14_Y18_N20
\u_vga_sync|h_count[1]\ : dffeas
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
	q => \u_vga_sync|h_count\(1));

-- Location: MLABCELL_X13_Y18_N36
\u_vga_sync|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~29_sumout\ = SUM(( \u_vga_sync|h_count\(2) ) + ( GND ) + ( \u_vga_sync|Add0~38\ ))
-- \u_vga_sync|Add0~30\ = CARRY(( \u_vga_sync|h_count\(2) ) + ( GND ) + ( \u_vga_sync|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_h_count\(2),
	cin => \u_vga_sync|Add0~38\,
	sumout => \u_vga_sync|Add0~29_sumout\,
	cout => \u_vga_sync|Add0~30\);

-- Location: FF_X14_Y18_N26
\u_vga_sync|h_count[2]\ : dffeas
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
	q => \u_vga_sync|h_count\(2));

-- Location: MLABCELL_X13_Y18_N39
\u_vga_sync|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~25_sumout\ = SUM(( \u_vga_sync|h_count[3]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add0~30\ ))
-- \u_vga_sync|Add0~26\ = CARRY(( \u_vga_sync|h_count[3]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count[3]~DUPLICATE_q\,
	cin => \u_vga_sync|Add0~30\,
	sumout => \u_vga_sync|Add0~25_sumout\,
	cout => \u_vga_sync|Add0~26\);

-- Location: FF_X14_Y18_N50
\u_vga_sync|h_count[3]~DUPLICATE\ : dffeas
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
	q => \u_vga_sync|h_count[3]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y18_N42
\u_vga_sync|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~21_sumout\ = SUM(( \u_vga_sync|h_count\(4) ) + ( GND ) + ( \u_vga_sync|Add0~26\ ))
-- \u_vga_sync|Add0~22\ = CARRY(( \u_vga_sync|h_count\(4) ) + ( GND ) + ( \u_vga_sync|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(4),
	cin => \u_vga_sync|Add0~26\,
	sumout => \u_vga_sync|Add0~21_sumout\,
	cout => \u_vga_sync|Add0~22\);

-- Location: FF_X14_Y18_N5
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

-- Location: MLABCELL_X13_Y18_N45
\u_vga_sync|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~13_sumout\ = SUM(( \u_vga_sync|h_count\(5) ) + ( GND ) + ( \u_vga_sync|Add0~22\ ))
-- \u_vga_sync|Add0~14\ = CARRY(( \u_vga_sync|h_count\(5) ) + ( GND ) + ( \u_vga_sync|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_h_count\(5),
	cin => \u_vga_sync|Add0~22\,
	sumout => \u_vga_sync|Add0~13_sumout\,
	cout => \u_vga_sync|Add0~14\);

-- Location: FF_X14_Y18_N2
\u_vga_sync|h_count[5]\ : dffeas
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
	q => \u_vga_sync|h_count\(5));

-- Location: MLABCELL_X13_Y18_N48
\u_vga_sync|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~17_sumout\ = SUM(( \u_vga_sync|h_count\(6) ) + ( GND ) + ( \u_vga_sync|Add0~14\ ))
-- \u_vga_sync|Add0~18\ = CARRY(( \u_vga_sync|h_count\(6) ) + ( GND ) + ( \u_vga_sync|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(6),
	cin => \u_vga_sync|Add0~14\,
	sumout => \u_vga_sync|Add0~17_sumout\,
	cout => \u_vga_sync|Add0~18\);

-- Location: FF_X14_Y18_N17
\u_vga_sync|h_count[6]\ : dffeas
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
	q => \u_vga_sync|h_count\(6));

-- Location: MLABCELL_X13_Y18_N51
\u_vga_sync|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add0~9_sumout\ = SUM(( \u_vga_sync|h_count\(7) ) + ( GND ) + ( \u_vga_sync|Add0~18\ ))
-- \u_vga_sync|Add0~10\ = CARRY(( \u_vga_sync|h_count\(7) ) + ( GND ) + ( \u_vga_sync|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(7),
	cin => \u_vga_sync|Add0~18\,
	sumout => \u_vga_sync|Add0~9_sumout\,
	cout => \u_vga_sync|Add0~10\);

-- Location: LABCELL_X14_Y18_N33
\u_vga_sync|h_count[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|h_count[7]~feeder_combout\ = ( \u_vga_sync|Add0~9_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add0~9_sumout\,
	combout => \u_vga_sync|h_count[7]~feeder_combout\);

-- Location: FF_X14_Y18_N35
\u_vga_sync|h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|h_count[7]~feeder_combout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count\(7));

-- Location: LABCELL_X14_Y18_N21
\u_vga_sync|h_count[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|h_count[8]~feeder_combout\ = ( \u_vga_sync|Add0~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add0~5_sumout\,
	combout => \u_vga_sync|h_count[8]~feeder_combout\);

-- Location: FF_X14_Y18_N23
\u_vga_sync|h_count[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|h_count[8]~feeder_combout\,
	sclr => \u_vga_sync|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|h_count[8]~DUPLICATE_q\);

-- Location: LABCELL_X14_Y18_N36
\u_vga_sync|process_0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~9_combout\ = ( !\u_vga_sync|h_count\(6) & ( !\u_vga_sync|h_count[8]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count[8]~DUPLICATE_q\,
	dataf => \u_vga_sync|ALT_INV_h_count\(6),
	combout => \u_vga_sync|process_0~9_combout\);

-- Location: MLABCELL_X13_Y18_N15
\u_vga_sync|process_0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~5_combout\ = ( \u_vga_sync|v_count\(2) & ( \u_vga_sync|v_count\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_vga_sync|ALT_INV_v_count\(2),
	dataf => \u_vga_sync|ALT_INV_v_count\(3),
	combout => \u_vga_sync|process_0~5_combout\);

-- Location: LABCELL_X12_Y18_N51
\u_vga_sync|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~9_sumout\ = SUM(( \u_vga_sync|v_count\(7) ) + ( GND ) + ( \u_vga_sync|Add1~18\ ))
-- \u_vga_sync|Add1~10\ = CARRY(( \u_vga_sync|v_count\(7) ) + ( GND ) + ( \u_vga_sync|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(7),
	cin => \u_vga_sync|Add1~18\,
	sumout => \u_vga_sync|Add1~9_sumout\,
	cout => \u_vga_sync|Add1~10\);

-- Location: LABCELL_X12_Y18_N54
\u_vga_sync|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~5_sumout\ = SUM(( \u_vga_sync|v_count\(8) ) + ( GND ) + ( \u_vga_sync|Add1~10\ ))
-- \u_vga_sync|Add1~6\ = CARRY(( \u_vga_sync|v_count\(8) ) + ( GND ) + ( \u_vga_sync|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(8),
	cin => \u_vga_sync|Add1~10\,
	sumout => \u_vga_sync|Add1~5_sumout\,
	cout => \u_vga_sync|Add1~6\);

-- Location: MLABCELL_X13_Y18_N27
\u_vga_sync|v_count[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[8]~0_combout\ = ( \u_vga_sync|process_0~10_combout\ & ( \u_vga_sync|h_count\(5) ) ) # ( !\u_vga_sync|process_0~10_combout\ & ( \u_vga_sync|h_count\(5) & ( (!\u_vga_sync|h_count[8]~DUPLICATE_q\ & (\u_vga_sync|h_count\(7) & 
-- (!\u_vga_sync|h_count\(2) & \u_vga_sync|Equal0~0_combout\))) ) ) ) # ( \u_vga_sync|process_0~10_combout\ & ( !\u_vga_sync|h_count\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000001000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count[8]~DUPLICATE_q\,
	datab => \u_vga_sync|ALT_INV_h_count\(7),
	datac => \u_vga_sync|ALT_INV_h_count\(2),
	datad => \u_vga_sync|ALT_INV_Equal0~0_combout\,
	datae => \u_vga_sync|ALT_INV_process_0~10_combout\,
	dataf => \u_vga_sync|ALT_INV_h_count\(5),
	combout => \u_vga_sync|v_count[8]~0_combout\);

-- Location: FF_X13_Y18_N14
\u_vga_sync|v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~5_sumout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(8));

-- Location: MLABCELL_X13_Y18_N21
\u_vga_sync|process_0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~7_combout\ = ( !\u_vga_sync|v_count\(7) & ( !\u_vga_sync|v_count\(6) & ( (!\u_vga_sync|v_count\(8) & (!\u_vga_sync|v_count[5]~DUPLICATE_q\ & !\u_vga_sync|v_count\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(8),
	datac => \u_vga_sync|ALT_INV_v_count[5]~DUPLICATE_q\,
	datad => \u_vga_sync|ALT_INV_v_count\(4),
	datae => \u_vga_sync|ALT_INV_v_count\(7),
	dataf => \u_vga_sync|ALT_INV_v_count\(6),
	combout => \u_vga_sync|process_0~7_combout\);

-- Location: LABCELL_X12_Y18_N57
\u_vga_sync|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~1_sumout\ = SUM(( \u_vga_sync|v_count\(9) ) + ( GND ) + ( \u_vga_sync|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(9),
	cin => \u_vga_sync|Add1~6\,
	sumout => \u_vga_sync|Add1~1_sumout\);

-- Location: FF_X13_Y18_N29
\u_vga_sync|v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~1_sumout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(9));

-- Location: LABCELL_X14_Y18_N45
\u_vga_sync|process_0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~8_combout\ = ( \u_vga_sync|h_count\(4) & ( \u_vga_sync|h_count[3]~DUPLICATE_q\ & ( (\u_vga_sync|h_count\(5) & (((\u_vga_sync|h_count\(0) & \u_vga_sync|h_count\(1))) # (\u_vga_sync|h_count\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(2),
	datab => \u_vga_sync|ALT_INV_h_count\(0),
	datac => \u_vga_sync|ALT_INV_h_count\(5),
	datad => \u_vga_sync|ALT_INV_h_count\(1),
	datae => \u_vga_sync|ALT_INV_h_count\(4),
	dataf => \u_vga_sync|ALT_INV_h_count[3]~DUPLICATE_q\,
	combout => \u_vga_sync|process_0~8_combout\);

-- Location: LABCELL_X14_Y18_N51
\u_vga_sync|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~0_combout\ = ( !\u_vga_sync|h_count[8]~DUPLICATE_q\ & ( \u_vga_sync|h_count\(9) & ( !\u_vga_sync|h_count\(7) ) ) ) # ( \u_vga_sync|h_count[8]~DUPLICATE_q\ & ( !\u_vga_sync|h_count\(9) ) ) # ( !\u_vga_sync|h_count[8]~DUPLICATE_q\ & ( 
-- !\u_vga_sync|h_count\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(7),
	datae => \u_vga_sync|ALT_INV_h_count[8]~DUPLICATE_q\,
	dataf => \u_vga_sync|ALT_INV_h_count\(9),
	combout => \u_vga_sync|process_0~0_combout\);

-- Location: LABCELL_X14_Y18_N54
\u_vga_sync|process_0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~10_combout\ = ( \u_vga_sync|process_0~8_combout\ & ( !\u_vga_sync|process_0~0_combout\ & ( (\u_vga_sync|v_count\(9) & ((!\u_vga_sync|process_0~7_combout\) # (\u_vga_sync|process_0~5_combout\))) ) ) ) # ( 
-- !\u_vga_sync|process_0~8_combout\ & ( !\u_vga_sync|process_0~0_combout\ & ( (!\u_vga_sync|process_0~9_combout\ & (\u_vga_sync|v_count\(9) & ((!\u_vga_sync|process_0~7_combout\) # (\u_vga_sync|process_0~5_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100010000000001111001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_process_0~9_combout\,
	datab => \u_vga_sync|ALT_INV_process_0~5_combout\,
	datac => \u_vga_sync|ALT_INV_process_0~7_combout\,
	datad => \u_vga_sync|ALT_INV_v_count\(9),
	datae => \u_vga_sync|ALT_INV_process_0~8_combout\,
	dataf => \u_vga_sync|ALT_INV_process_0~0_combout\,
	combout => \u_vga_sync|process_0~10_combout\);

-- Location: FF_X13_Y18_N23
\u_vga_sync|v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~25_sumout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(0));

-- Location: LABCELL_X12_Y18_N33
\u_vga_sync|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~29_sumout\ = SUM(( \u_vga_sync|v_count\(1) ) + ( GND ) + ( \u_vga_sync|Add1~26\ ))
-- \u_vga_sync|Add1~30\ = CARRY(( \u_vga_sync|v_count\(1) ) + ( GND ) + ( \u_vga_sync|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(1),
	cin => \u_vga_sync|Add1~26\,
	sumout => \u_vga_sync|Add1~29_sumout\,
	cout => \u_vga_sync|Add1~30\);

-- Location: FF_X13_Y18_N17
\u_vga_sync|v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~29_sumout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(1));

-- Location: LABCELL_X12_Y18_N36
\u_vga_sync|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~37_sumout\ = SUM(( \u_vga_sync|v_count\(2) ) + ( GND ) + ( \u_vga_sync|Add1~30\ ))
-- \u_vga_sync|Add1~38\ = CARRY(( \u_vga_sync|v_count\(2) ) + ( GND ) + ( \u_vga_sync|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(2),
	cin => \u_vga_sync|Add1~30\,
	sumout => \u_vga_sync|Add1~37_sumout\,
	cout => \u_vga_sync|Add1~38\);

-- Location: MLABCELL_X13_Y18_N0
\u_vga_sync|v_count[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[2]~feeder_combout\ = ( \u_vga_sync|Add1~37_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add1~37_sumout\,
	combout => \u_vga_sync|v_count[2]~feeder_combout\);

-- Location: FF_X13_Y18_N2
\u_vga_sync|v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[2]~feeder_combout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(2));

-- Location: LABCELL_X12_Y18_N39
\u_vga_sync|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~33_sumout\ = SUM(( \u_vga_sync|v_count\(3) ) + ( GND ) + ( \u_vga_sync|Add1~38\ ))
-- \u_vga_sync|Add1~34\ = CARRY(( \u_vga_sync|v_count\(3) ) + ( GND ) + ( \u_vga_sync|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_v_count\(3),
	cin => \u_vga_sync|Add1~38\,
	sumout => \u_vga_sync|Add1~33_sumout\,
	cout => \u_vga_sync|Add1~34\);

-- Location: FF_X13_Y18_N26
\u_vga_sync|v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~33_sumout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(3));

-- Location: LABCELL_X12_Y18_N42
\u_vga_sync|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~21_sumout\ = SUM(( \u_vga_sync|v_count\(4) ) + ( GND ) + ( \u_vga_sync|Add1~34\ ))
-- \u_vga_sync|Add1~22\ = CARRY(( \u_vga_sync|v_count\(4) ) + ( GND ) + ( \u_vga_sync|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_vga_sync|ALT_INV_v_count\(4),
	cin => \u_vga_sync|Add1~34\,
	sumout => \u_vga_sync|Add1~21_sumout\,
	cout => \u_vga_sync|Add1~22\);

-- Location: FF_X13_Y18_N20
\u_vga_sync|v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|Add1~21_sumout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	sload => VCC,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(4));

-- Location: LABCELL_X12_Y18_N45
\u_vga_sync|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~13_sumout\ = SUM(( \u_vga_sync|v_count[5]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~22\ ))
-- \u_vga_sync|Add1~14\ = CARRY(( \u_vga_sync|v_count[5]~DUPLICATE_q\ ) + ( GND ) + ( \u_vga_sync|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count[5]~DUPLICATE_q\,
	cin => \u_vga_sync|Add1~22\,
	sumout => \u_vga_sync|Add1~13_sumout\,
	cout => \u_vga_sync|Add1~14\);

-- Location: MLABCELL_X13_Y18_N9
\u_vga_sync|v_count[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[5]~feeder_combout\ = ( \u_vga_sync|Add1~13_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add1~13_sumout\,
	combout => \u_vga_sync|v_count[5]~feeder_combout\);

-- Location: FF_X13_Y18_N11
\u_vga_sync|v_count[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[5]~feeder_combout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count[5]~DUPLICATE_q\);

-- Location: LABCELL_X12_Y18_N48
\u_vga_sync|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|Add1~17_sumout\ = SUM(( \u_vga_sync|v_count\(6) ) + ( GND ) + ( \u_vga_sync|Add1~14\ ))
-- \u_vga_sync|Add1~18\ = CARRY(( \u_vga_sync|v_count\(6) ) + ( GND ) + ( \u_vga_sync|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_v_count\(6),
	cin => \u_vga_sync|Add1~14\,
	sumout => \u_vga_sync|Add1~17_sumout\,
	cout => \u_vga_sync|Add1~18\);

-- Location: MLABCELL_X13_Y18_N6
\u_vga_sync|v_count[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[6]~feeder_combout\ = ( \u_vga_sync|Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add1~17_sumout\,
	combout => \u_vga_sync|v_count[6]~feeder_combout\);

-- Location: FF_X13_Y18_N8
\u_vga_sync|v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[6]~feeder_combout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(6));

-- Location: MLABCELL_X13_Y18_N3
\u_vga_sync|v_count[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|v_count[7]~feeder_combout\ = ( \u_vga_sync|Add1~9_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_Add1~9_sumout\,
	combout => \u_vga_sync|v_count[7]~feeder_combout\);

-- Location: FF_X13_Y18_N5
\u_vga_sync|v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[7]~feeder_combout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(7));

-- Location: FF_X13_Y18_N10
\u_vga_sync|v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|v_count[5]~feeder_combout\,
	sclr => \u_vga_sync|process_0~10_combout\,
	ena => \u_vga_sync|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|v_count\(5));

-- Location: LABCELL_X12_Y18_N12
\u_vga_sync|LessThan7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|LessThan7~0_combout\ = ( !\u_vga_sync|v_count\(9) & ( \u_vga_sync|v_count\(8) & ( (!\u_vga_sync|v_count\(7)) # ((!\u_vga_sync|v_count\(6)) # (!\u_vga_sync|v_count\(5))) ) ) ) # ( !\u_vga_sync|v_count\(9) & ( !\u_vga_sync|v_count\(8) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111110100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_v_count\(7),
	datac => \u_vga_sync|ALT_INV_v_count\(6),
	datad => \u_vga_sync|ALT_INV_v_count\(5),
	datae => \u_vga_sync|ALT_INV_v_count\(9),
	dataf => \u_vga_sync|ALT_INV_v_count\(8),
	combout => \u_vga_sync|LessThan7~0_combout\);

-- Location: LABCELL_X7_Y18_N39
\u_vga_sync|video_on_v~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|video_on_v~feeder_combout\ = ( \u_vga_sync|LessThan7~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_LessThan7~0_combout\,
	combout => \u_vga_sync|video_on_v~feeder_combout\);

-- Location: FF_X7_Y18_N41
\u_vga_sync|video_on_v\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|video_on_v~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|video_on_v~q\);

-- Location: FF_X7_Y18_N44
\u_vga_sync|video_on_h\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|process_0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|video_on_h~q\);

-- Location: LABCELL_X7_Y18_N51
\u_vga_sync|video_on\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|video_on~combout\ = ( \u_vga_sync|video_on_h~q\ & ( \u_vga_sync|video_on_v~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_vga_sync|ALT_INV_video_on_v~q\,
	dataf => \u_vga_sync|ALT_INV_video_on_h~q\,
	combout => \u_vga_sync|video_on~combout\);

-- Location: MLABCELL_X9_Y20_N48
\u_vga_sync|red_out~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|red_out~feeder_combout\ = ( \u_vga_sync|video_on~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_video_on~combout\,
	combout => \u_vga_sync|red_out~feeder_combout\);

-- Location: FF_X9_Y20_N49
\u_vga_sync|red_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|red_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|red_out~q\);

-- Location: LABCELL_X14_Y18_N39
\u_vga_sync|process_0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~3_combout\ = ( \u_vga_sync|h_count\(9) & ( (\u_vga_sync|h_count\(7) & !\u_vga_sync|h_count\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(7),
	datab => \u_vga_sync|ALT_INV_h_count\(8),
	dataf => \u_vga_sync|ALT_INV_h_count\(9),
	combout => \u_vga_sync|process_0~3_combout\);

-- Location: LABCELL_X14_Y18_N27
\u_vga_sync|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~1_combout\ = ( !\u_vga_sync|h_count\(2) & ( !\u_vga_sync|h_count\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_vga_sync|ALT_INV_h_count\(3),
	dataf => \u_vga_sync|ALT_INV_h_count\(2),
	combout => \u_vga_sync|process_0~1_combout\);

-- Location: LABCELL_X14_Y18_N0
\u_vga_sync|process_0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~2_combout\ = ( !\u_vga_sync|h_count\(5) & ( !\u_vga_sync|h_count[3]~DUPLICATE_q\ & ( (!\u_vga_sync|h_count\(2) & (!\u_vga_sync|h_count\(6) & ((!\u_vga_sync|h_count\(1)) # (!\u_vga_sync|h_count\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(1),
	datab => \u_vga_sync|ALT_INV_h_count\(0),
	datac => \u_vga_sync|ALT_INV_h_count\(2),
	datad => \u_vga_sync|ALT_INV_h_count\(6),
	datae => \u_vga_sync|ALT_INV_h_count\(5),
	dataf => \u_vga_sync|ALT_INV_h_count[3]~DUPLICATE_q\,
	combout => \u_vga_sync|process_0~2_combout\);

-- Location: LABCELL_X10_Y18_N15
\u_vga_sync|process_0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~4_combout\ = ( \u_vga_sync|process_0~1_combout\ & ( \u_vga_sync|process_0~2_combout\ ) ) # ( !\u_vga_sync|process_0~1_combout\ & ( \u_vga_sync|process_0~2_combout\ ) ) # ( \u_vga_sync|process_0~1_combout\ & ( 
-- !\u_vga_sync|process_0~2_combout\ & ( (!\u_vga_sync|process_0~3_combout\) # ((!\u_vga_sync|h_count\(5) & (!\u_vga_sync|h_count\(4) & !\u_vga_sync|h_count\(6)))) ) ) ) # ( !\u_vga_sync|process_0~1_combout\ & ( !\u_vga_sync|process_0~2_combout\ & ( 
-- (!\u_vga_sync|process_0~3_combout\) # ((!\u_vga_sync|h_count\(5) & (!\u_vga_sync|h_count\(4) & !\u_vga_sync|h_count\(6))) # (\u_vga_sync|h_count\(5) & (\u_vga_sync|h_count\(4) & \u_vga_sync|h_count\(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110000001111111111000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_h_count\(5),
	datab => \u_vga_sync|ALT_INV_h_count\(4),
	datac => \u_vga_sync|ALT_INV_h_count\(6),
	datad => \u_vga_sync|ALT_INV_process_0~3_combout\,
	datae => \u_vga_sync|ALT_INV_process_0~1_combout\,
	dataf => \u_vga_sync|ALT_INV_process_0~2_combout\,
	combout => \u_vga_sync|process_0~4_combout\);

-- Location: FF_X10_Y18_N16
\u_vga_sync|horiz_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|process_0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|horiz_sync~q\);

-- Location: FF_X9_Y20_N35
\u_vga_sync|horiz_sync_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	asdata => \u_vga_sync|horiz_sync~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|horiz_sync_out~q\);

-- Location: LABCELL_X12_Y18_N9
\u_vga_sync|LessThan7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|LessThan7~1_combout\ = ( \u_vga_sync|v_count\(6) & ( \u_vga_sync|v_count\(8) & ( (\u_vga_sync|v_count\(7) & \u_vga_sync|v_count[5]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_v_count\(7),
	datad => \u_vga_sync|ALT_INV_v_count[5]~DUPLICATE_q\,
	datae => \u_vga_sync|ALT_INV_v_count\(6),
	dataf => \u_vga_sync|ALT_INV_v_count\(8),
	combout => \u_vga_sync|LessThan7~1_combout\);

-- Location: LABCELL_X10_Y18_N33
\u_vga_sync|process_0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|process_0~6_combout\ = ( \u_vga_sync|v_count\(1) & ( \u_vga_sync|LessThan7~1_combout\ & ( (((!\u_vga_sync|process_0~5_combout\) # (\u_vga_sync|v_count\(4))) # (\u_vga_sync|v_count\(0))) # (\u_vga_sync|v_count\(9)) ) ) ) # ( 
-- !\u_vga_sync|v_count\(1) & ( \u_vga_sync|LessThan7~1_combout\ & ( ((!\u_vga_sync|v_count\(0)) # ((!\u_vga_sync|process_0~5_combout\) # (\u_vga_sync|v_count\(4)))) # (\u_vga_sync|v_count\(9)) ) ) ) # ( \u_vga_sync|v_count\(1) & ( 
-- !\u_vga_sync|LessThan7~1_combout\ ) ) # ( !\u_vga_sync|v_count\(1) & ( !\u_vga_sync|LessThan7~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111110111111111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_vga_sync|ALT_INV_v_count\(9),
	datab => \u_vga_sync|ALT_INV_v_count\(0),
	datac => \u_vga_sync|ALT_INV_v_count\(4),
	datad => \u_vga_sync|ALT_INV_process_0~5_combout\,
	datae => \u_vga_sync|ALT_INV_v_count\(1),
	dataf => \u_vga_sync|ALT_INV_LessThan7~1_combout\,
	combout => \u_vga_sync|process_0~6_combout\);

-- Location: FF_X10_Y18_N34
\u_vga_sync|vert_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|process_0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|vert_sync~q\);

-- Location: MLABCELL_X9_Y20_N12
\u_vga_sync|vert_sync_out~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_vga_sync|vert_sync_out~feeder_combout\ = ( \u_vga_sync|vert_sync~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_vga_sync|ALT_INV_vert_sync~q\,
	combout => \u_vga_sync|vert_sync_out~feeder_combout\);

-- Location: FF_X9_Y20_N14
\u_vga_sync|vert_sync_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25~q\,
	d => \u_vga_sync|vert_sync_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_vga_sync|vert_sync_out~q\);

-- Location: IOIBUF_X44_Y45_N52
\PB1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PB1,
	o => \PB1~input_o\);

-- Location: IOIBUF_X12_Y45_N35
\PB2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PB2,
	o => \PB2~input_o\);

-- Location: LABCELL_X6_Y34_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


