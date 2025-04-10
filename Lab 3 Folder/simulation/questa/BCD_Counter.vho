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

-- DATE "04/10/2025 16:31:55"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
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

ENTITY 	Programmable_Timer IS
    PORT (
	Clk : IN std_logic;
	GlobalReset : IN std_logic;
	Start : IN std_logic;
	Data_In : IN std_logic_vector(9 DOWNTO 0);
	Time_Out : BUFFER std_logic;
	SevenSeg_Min : BUFFER std_logic_vector(6 DOWNTO 0);
	SevenSeg_SecTens : BUFFER std_logic_vector(6 DOWNTO 0);
	SevenSeg_SecOnes : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Programmable_Timer;

-- Design Ports Information
-- Time_Out	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[0]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[1]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[2]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[3]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[5]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_Min[6]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[0]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[1]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[2]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[3]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[4]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[5]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecTens[6]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[0]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[1]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[2]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[3]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[4]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[5]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SevenSeg_SecOnes[6]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GlobalReset	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[3]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[1]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[2]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[7]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[6]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[0]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[8]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[9]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[4]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[5]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Start	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Programmable_Timer IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_GlobalReset : std_logic;
SIGNAL ww_Start : std_logic;
SIGNAL ww_Data_In : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_Time_Out : std_logic;
SIGNAL ww_SevenSeg_Min : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_SevenSeg_SecTens : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_SevenSeg_SecOnes : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \GlobalReset~input_o\ : std_logic;
SIGNAL \Sec_Ones|count~3_combout\ : std_logic;
SIGNAL \Data_In[5]~input_o\ : std_logic;
SIGNAL \Data_In[7]~input_o\ : std_logic;
SIGNAL \Data_In[4]~input_o\ : std_logic;
SIGNAL \Data_In[6]~input_o\ : std_logic;
SIGNAL \preset_sec_tens~1_combout\ : std_logic;
SIGNAL \Start~input_o\ : std_logic;
SIGNAL \start_sync_0~q\ : std_logic;
SIGNAL \start_sync~q\ : std_logic;
SIGNAL \preset_sec_ones[3]~1_combout\ : std_logic;
SIGNAL \preset_sec_tens~2_combout\ : std_logic;
SIGNAL \Sec_Ones|count~4_combout\ : std_logic;
SIGNAL \Sec_Ones|count~0_combout\ : std_logic;
SIGNAL \Sec_Ones|Equal0~0_combout\ : std_logic;
SIGNAL \Sec_Tens|count[0]~3_combout\ : std_logic;
SIGNAL \Data_In[9]~input_o\ : std_logic;
SIGNAL \preset_min~1_combout\ : std_logic;
SIGNAL \local_reset_sec_tens~0_combout\ : std_logic;
SIGNAL \Sec_Tens|count[2]~0_combout\ : std_logic;
SIGNAL \Sec_Tens|count[3]~1_combout\ : std_logic;
SIGNAL \Sec_Tens|count[1]~2_combout\ : std_logic;
SIGNAL \Min_Cnt|count~2_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \sec_tens_reset~combout\ : std_logic;
SIGNAL \Min_Cnt|count~0_combout\ : std_logic;
SIGNAL \Min_Cnt|count~1_combout\ : std_logic;
SIGNAL \Min_Cnt|count~3_combout\ : std_logic;
SIGNAL \reached_preset~3_combout\ : std_logic;
SIGNAL \Data_In[3]~input_o\ : std_logic;
SIGNAL \Data_In[1]~input_o\ : std_logic;
SIGNAL \preset_sec_ones~4_combout\ : std_logic;
SIGNAL \preset_sec_tens~0_combout\ : std_logic;
SIGNAL \Data_In[0]~input_o\ : std_logic;
SIGNAL \Data_In[2]~input_o\ : std_logic;
SIGNAL \preset_sec_ones~3_combout\ : std_logic;
SIGNAL \reached_preset~1_combout\ : std_logic;
SIGNAL \Data_In[8]~input_o\ : std_logic;
SIGNAL \preset_min~0_combout\ : std_logic;
SIGNAL \reached_preset~2_combout\ : std_logic;
SIGNAL \timer_running~0_combout\ : std_logic;
SIGNAL \timer_running~q\ : std_logic;
SIGNAL \Sec_Ones|count[3]~1_combout\ : std_logic;
SIGNAL \Sec_Ones|count~2_combout\ : std_logic;
SIGNAL \preset_sec_ones~2_combout\ : std_logic;
SIGNAL \preset_sec_ones~0_combout\ : std_logic;
SIGNAL \reached_preset~0_combout\ : std_logic;
SIGNAL \reached_preset~4_combout\ : std_logic;
SIGNAL preset_sec_ones : std_logic_vector(3 DOWNTO 0);
SIGNAL preset_sec_tens : std_logic_vector(3 DOWNTO 0);
SIGNAL \Sec_Ones|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL preset_min : std_logic_vector(3 DOWNTO 0);
SIGNAL \Sec_Tens|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Min_Cnt|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_timer_running~q\ : std_logic;
SIGNAL ALT_INV_preset_sec_ones : std_logic_vector(3 DOWNTO 0);
SIGNAL \Sec_Ones|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_reached_preset~2_combout\ : std_logic;
SIGNAL ALT_INV_preset_min : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_reached_preset~0_combout\ : std_logic;
SIGNAL \Sec_Tens|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_preset_sec_tens : std_logic_vector(2 DOWNTO 0);
SIGNAL \Min_Cnt|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Sec_Ones|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_start_sync~q\ : std_logic;
SIGNAL \ALT_INV_local_reset_sec_tens~0_combout\ : std_logic;
SIGNAL \ALT_INV_reached_preset~1_combout\ : std_logic;
SIGNAL \ALT_INV_reached_preset~3_combout\ : std_logic;
SIGNAL \ALT_INV_Data_In[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_GlobalReset~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[9]~input_o\ : std_logic;

BEGIN

ww_Clk <= Clk;
ww_GlobalReset <= GlobalReset;
ww_Start <= Start;
ww_Data_In <= Data_In;
Time_Out <= ww_Time_Out;
SevenSeg_Min <= ww_SevenSeg_Min;
SevenSeg_SecTens <= ww_SevenSeg_SecTens;
SevenSeg_SecOnes <= ww_SevenSeg_SecOnes;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_timer_running~q\ <= NOT \timer_running~q\;
ALT_INV_preset_sec_ones(0) <= NOT preset_sec_ones(0);
\Sec_Ones|ALT_INV_count\(0) <= NOT \Sec_Ones|count\(0);
\ALT_INV_reached_preset~2_combout\ <= NOT \reached_preset~2_combout\;
ALT_INV_preset_min(0) <= NOT preset_min(0);
\Sec_Ones|ALT_INV_count\(1) <= NOT \Sec_Ones|count\(1);
\ALT_INV_reached_preset~0_combout\ <= NOT \reached_preset~0_combout\;
\Sec_Tens|ALT_INV_count\(3) <= NOT \Sec_Tens|count\(3);
ALT_INV_preset_min(1) <= NOT preset_min(1);
ALT_INV_preset_sec_tens(0) <= NOT preset_sec_tens(0);
ALT_INV_preset_sec_ones(3) <= NOT preset_sec_ones(3);
\Min_Cnt|ALT_INV_count\(0) <= NOT \Min_Cnt|count\(0);
\Sec_Ones|ALT_INV_Equal0~0_combout\ <= NOT \Sec_Ones|Equal0~0_combout\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_start_sync~q\ <= NOT \start_sync~q\;
ALT_INV_preset_sec_ones(2) <= NOT preset_sec_ones(2);
\Min_Cnt|ALT_INV_count\(1) <= NOT \Min_Cnt|count\(1);
\Sec_Tens|ALT_INV_count\(0) <= NOT \Sec_Tens|count\(0);
ALT_INV_preset_sec_tens(1) <= NOT preset_sec_tens(1);
\Sec_Ones|ALT_INV_count\(3) <= NOT \Sec_Ones|count\(3);
\Min_Cnt|ALT_INV_count\(3) <= NOT \Min_Cnt|count\(3);
\ALT_INV_local_reset_sec_tens~0_combout\ <= NOT \local_reset_sec_tens~0_combout\;
ALT_INV_preset_sec_tens(2) <= NOT preset_sec_tens(2);
\Sec_Ones|ALT_INV_count\(2) <= NOT \Sec_Ones|count\(2);
\ALT_INV_reached_preset~1_combout\ <= NOT \reached_preset~1_combout\;
\Min_Cnt|ALT_INV_count\(2) <= NOT \Min_Cnt|count\(2);
\Sec_Tens|ALT_INV_count\(2) <= NOT \Sec_Tens|count\(2);
ALT_INV_preset_sec_ones(1) <= NOT preset_sec_ones(1);
\Sec_Tens|ALT_INV_count\(1) <= NOT \Sec_Tens|count\(1);
\ALT_INV_reached_preset~3_combout\ <= NOT \reached_preset~3_combout\;
\ALT_INV_Data_In[8]~input_o\ <= NOT \Data_In[8]~input_o\;
\ALT_INV_GlobalReset~input_o\ <= NOT \GlobalReset~input_o\;
\ALT_INV_Data_In[6]~input_o\ <= NOT \Data_In[6]~input_o\;
\ALT_INV_Data_In[5]~input_o\ <= NOT \Data_In[5]~input_o\;
\ALT_INV_Data_In[1]~input_o\ <= NOT \Data_In[1]~input_o\;
\ALT_INV_Data_In[4]~input_o\ <= NOT \Data_In[4]~input_o\;
\ALT_INV_Data_In[2]~input_o\ <= NOT \Data_In[2]~input_o\;
\ALT_INV_Data_In[7]~input_o\ <= NOT \Data_In[7]~input_o\;
\ALT_INV_Data_In[0]~input_o\ <= NOT \Data_In[0]~input_o\;
\ALT_INV_Data_In[3]~input_o\ <= NOT \Data_In[3]~input_o\;
\ALT_INV_Data_In[9]~input_o\ <= NOT \Data_In[9]~input_o\;

-- Location: IOOBUF_X89_Y35_N45
\Time_Out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \reached_preset~4_combout\,
	devoe => ww_devoe,
	o => ww_Time_Out);

-- Location: IOOBUF_X52_Y81_N53
\SevenSeg_Min[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(0));

-- Location: IOOBUF_X56_Y81_N53
\SevenSeg_Min[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(1));

-- Location: IOOBUF_X66_Y0_N59
\SevenSeg_Min[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(2));

-- Location: IOOBUF_X52_Y81_N36
\SevenSeg_Min[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(3));

-- Location: IOOBUF_X26_Y0_N93
\SevenSeg_Min[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(4));

-- Location: IOOBUF_X34_Y81_N93
\SevenSeg_Min[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(5));

-- Location: IOOBUF_X74_Y81_N59
\SevenSeg_Min[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_Min(6));

-- Location: IOOBUF_X32_Y0_N36
\SevenSeg_SecTens[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(0));

-- Location: IOOBUF_X36_Y0_N2
\SevenSeg_SecTens[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(1));

-- Location: IOOBUF_X54_Y81_N53
\SevenSeg_SecTens[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(2));

-- Location: IOOBUF_X89_Y8_N5
\SevenSeg_SecTens[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(3));

-- Location: IOOBUF_X28_Y0_N2
\SevenSeg_SecTens[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(4));

-- Location: IOOBUF_X58_Y81_N93
\SevenSeg_SecTens[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(5));

-- Location: IOOBUF_X64_Y0_N2
\SevenSeg_SecTens[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecTens(6));

-- Location: IOOBUF_X68_Y81_N19
\SevenSeg_SecOnes[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(0));

-- Location: IOOBUF_X32_Y0_N53
\SevenSeg_SecOnes[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(1));

-- Location: IOOBUF_X8_Y0_N53
\SevenSeg_SecOnes[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(2));

-- Location: IOOBUF_X26_Y81_N59
\SevenSeg_SecOnes[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(3));

-- Location: IOOBUF_X60_Y81_N2
\SevenSeg_SecOnes[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(4));

-- Location: IOOBUF_X40_Y0_N36
\SevenSeg_SecOnes[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(5));

-- Location: IOOBUF_X38_Y0_N53
\SevenSeg_SecOnes[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SevenSeg_SecOnes(6));

-- Location: IOIBUF_X89_Y35_N61
\Clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G9
\Clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~input_o\,
	outclk => \Clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y38_N21
\GlobalReset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GlobalReset,
	o => \GlobalReset~input_o\);

-- Location: MLABCELL_X87_Y38_N51
\Sec_Ones|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Ones|count~3_combout\ = (!\GlobalReset~input_o\ & !\Sec_Ones|count\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_GlobalReset~input_o\,
	datad => \Sec_Ones|ALT_INV_count\(0),
	combout => \Sec_Ones|count~3_combout\);

-- Location: IOIBUF_X89_Y37_N4
\Data_In[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(5),
	o => \Data_In[5]~input_o\);

-- Location: IOIBUF_X89_Y38_N55
\Data_In[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(7),
	o => \Data_In[7]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\Data_In[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(4),
	o => \Data_In[4]~input_o\);

-- Location: IOIBUF_X89_Y37_N21
\Data_In[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(6),
	o => \Data_In[6]~input_o\);

-- Location: LABCELL_X88_Y38_N0
\preset_sec_tens~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_tens~1_combout\ = ( \Data_In[6]~input_o\ & ( (!\GlobalReset~input_o\ & (((\Data_In[4]~input_o\) # (\Data_In[7]~input_o\)) # (\Data_In[5]~input_o\))) ) ) # ( !\Data_In[6]~input_o\ & ( (!\GlobalReset~input_o\ & ((\Data_In[4]~input_o\) # 
-- (\Data_In[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011001100000011001100110001001100110011000100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[5]~input_o\,
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \ALT_INV_Data_In[7]~input_o\,
	datad => \ALT_INV_Data_In[4]~input_o\,
	dataf => \ALT_INV_Data_In[6]~input_o\,
	combout => \preset_sec_tens~1_combout\);

-- Location: IOIBUF_X89_Y38_N38
\Start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Start,
	o => \Start~input_o\);

-- Location: FF_X88_Y38_N52
start_sync_0 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	asdata => \Start~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_sync_0~q\);

-- Location: FF_X88_Y38_N47
start_sync : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	asdata => \start_sync_0~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_sync~q\);

-- Location: LABCELL_X88_Y38_N3
\preset_sec_ones[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_ones[3]~1_combout\ = ( \start_sync~q\ ) # ( !\start_sync~q\ & ( \GlobalReset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	dataf => \ALT_INV_start_sync~q\,
	combout => \preset_sec_ones[3]~1_combout\);

-- Location: FF_X88_Y38_N1
\preset_sec_tens[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_sec_tens~1_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_tens(0));

-- Location: LABCELL_X88_Y38_N57
\preset_sec_tens~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_tens~2_combout\ = ( \Data_In[5]~input_o\ & ( (!\Data_In[7]~input_o\ & (!\GlobalReset~input_o\ & !\Data_In[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[7]~input_o\,
	datac => \ALT_INV_GlobalReset~input_o\,
	datad => \ALT_INV_Data_In[6]~input_o\,
	dataf => \ALT_INV_Data_In[5]~input_o\,
	combout => \preset_sec_tens~2_combout\);

-- Location: FF_X88_Y38_N59
\preset_sec_tens[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_sec_tens~2_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_tens(1));

-- Location: MLABCELL_X87_Y38_N39
\Sec_Ones|count~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Ones|count~4_combout\ = ( \Sec_Ones|count\(3) & ( (!\GlobalReset~input_o\ & ((!\Sec_Ones|count\(0) & ((\Sec_Ones|count\(1)))) # (\Sec_Ones|count\(0) & (\Sec_Ones|count\(2) & !\Sec_Ones|count\(1))))) ) ) # ( !\Sec_Ones|count\(3) & ( 
-- (!\GlobalReset~input_o\ & (!\Sec_Ones|count\(0) $ (!\Sec_Ones|count\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010010001000010001001000100000000100100010000000010010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sec_Ones|ALT_INV_count\(0),
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Sec_Ones|ALT_INV_count\(2),
	datad => \Sec_Ones|ALT_INV_count\(1),
	dataf => \Sec_Ones|ALT_INV_count\(3),
	combout => \Sec_Ones|count~4_combout\);

-- Location: FF_X87_Y38_N41
\Sec_Ones|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Ones|count~4_combout\,
	ena => \Sec_Ones|count[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Ones|count\(1));

-- Location: MLABCELL_X87_Y38_N18
\Sec_Ones|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Ones|count~0_combout\ = ( \Sec_Ones|count\(2) & ( \Sec_Ones|count\(1) & ( (!\GlobalReset~input_o\ & !\Sec_Ones|count\(0)) ) ) ) # ( !\Sec_Ones|count\(2) & ( \Sec_Ones|count\(1) & ( (!\GlobalReset~input_o\ & \Sec_Ones|count\(0)) ) ) ) # ( 
-- \Sec_Ones|count\(2) & ( !\Sec_Ones|count\(1) & ( !\GlobalReset~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000001100000011001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Sec_Ones|ALT_INV_count\(0),
	datae => \Sec_Ones|ALT_INV_count\(2),
	dataf => \Sec_Ones|ALT_INV_count\(1),
	combout => \Sec_Ones|count~0_combout\);

-- Location: FF_X87_Y38_N20
\Sec_Ones|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Ones|count~0_combout\,
	ena => \Sec_Ones|count[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Ones|count\(2));

-- Location: MLABCELL_X87_Y38_N15
\Sec_Ones|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Ones|Equal0~0_combout\ = ( \Sec_Ones|count\(0) & ( (!\Sec_Ones|count\(2) & (!\Sec_Ones|count\(1) & \Sec_Ones|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sec_Ones|ALT_INV_count\(2),
	datac => \Sec_Ones|ALT_INV_count\(1),
	datad => \Sec_Ones|ALT_INV_count\(3),
	dataf => \Sec_Ones|ALT_INV_count\(0),
	combout => \Sec_Ones|Equal0~0_combout\);

-- Location: MLABCELL_X87_Y38_N0
\Sec_Tens|count[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Tens|count[0]~3_combout\ = ( \Sec_Ones|Equal0~0_combout\ & ( (!\GlobalReset~input_o\ & (!\timer_running~q\ $ (!\Sec_Tens|count\(0)))) ) ) # ( !\Sec_Ones|Equal0~0_combout\ & ( (!\GlobalReset~input_o\ & \Sec_Tens|count\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000110000110000000011000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timer_running~q\,
	datac => \ALT_INV_GlobalReset~input_o\,
	datad => \Sec_Tens|ALT_INV_count\(0),
	dataf => \Sec_Ones|ALT_INV_Equal0~0_combout\,
	combout => \Sec_Tens|count[0]~3_combout\);

-- Location: FF_X87_Y38_N2
\Sec_Tens|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Tens|count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Tens|count\(0));

-- Location: IOIBUF_X89_Y37_N55
\Data_In[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(9),
	o => \Data_In[9]~input_o\);

-- Location: LABCELL_X88_Y38_N21
\preset_min~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_min~1_combout\ = ( \Data_In[9]~input_o\ & ( !\GlobalReset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	dataf => \ALT_INV_Data_In[9]~input_o\,
	combout => \preset_min~1_combout\);

-- Location: FF_X88_Y38_N22
\preset_min[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_min~1_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_min(1));

-- Location: MLABCELL_X87_Y38_N3
\local_reset_sec_tens~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \local_reset_sec_tens~0_combout\ = ( !\Sec_Ones|count\(2) & ( (\Sec_Ones|count\(0) & (\timer_running~q\ & (!\Sec_Ones|count\(1) & \Sec_Ones|count\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sec_Ones|ALT_INV_count\(0),
	datab => \ALT_INV_timer_running~q\,
	datac => \Sec_Ones|ALT_INV_count\(1),
	datad => \Sec_Ones|ALT_INV_count\(3),
	dataf => \Sec_Ones|ALT_INV_count\(2),
	combout => \local_reset_sec_tens~0_combout\);

-- Location: LABCELL_X88_Y38_N30
\Sec_Tens|count[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Tens|count[2]~0_combout\ = ( \Sec_Tens|count\(2) & ( \local_reset_sec_tens~0_combout\ & ( (!\GlobalReset~input_o\ & ((!\Sec_Tens|count\(0)) # ((\Sec_Tens|count\(3) & !\Sec_Tens|count\(1))))) ) ) ) # ( !\Sec_Tens|count\(2) & ( 
-- \local_reset_sec_tens~0_combout\ & ( (!\GlobalReset~input_o\ & (\Sec_Tens|count\(0) & \Sec_Tens|count\(1))) ) ) ) # ( \Sec_Tens|count\(2) & ( !\local_reset_sec_tens~0_combout\ & ( !\GlobalReset~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000011001100010011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sec_Tens|ALT_INV_count\(3),
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Sec_Tens|ALT_INV_count\(0),
	datad => \Sec_Tens|ALT_INV_count\(1),
	datae => \Sec_Tens|ALT_INV_count\(2),
	dataf => \ALT_INV_local_reset_sec_tens~0_combout\,
	combout => \Sec_Tens|count[2]~0_combout\);

-- Location: FF_X88_Y38_N32
\Sec_Tens|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Tens|count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Tens|count\(2));

-- Location: MLABCELL_X87_Y38_N42
\Sec_Tens|count[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Tens|count[3]~1_combout\ = ( \Sec_Tens|count\(3) & ( \Sec_Tens|count\(2) & ( (!\GlobalReset~input_o\ & ((!\local_reset_sec_tens~0_combout\) # ((!\Sec_Tens|count\(0)) # (!\Sec_Tens|count\(1))))) ) ) ) # ( !\Sec_Tens|count\(3) & ( \Sec_Tens|count\(2) & 
-- ( (\local_reset_sec_tens~0_combout\ & (!\GlobalReset~input_o\ & (\Sec_Tens|count\(0) & \Sec_Tens|count\(1)))) ) ) ) # ( \Sec_Tens|count\(3) & ( !\Sec_Tens|count\(2) & ( (!\GlobalReset~input_o\ & ((!\local_reset_sec_tens~0_combout\) # 
-- ((!\Sec_Tens|count\(0)) # (\Sec_Tens|count\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110010001100110000000000000001001100110011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_local_reset_sec_tens~0_combout\,
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Sec_Tens|ALT_INV_count\(0),
	datad => \Sec_Tens|ALT_INV_count\(1),
	datae => \Sec_Tens|ALT_INV_count\(3),
	dataf => \Sec_Tens|ALT_INV_count\(2),
	combout => \Sec_Tens|count[3]~1_combout\);

-- Location: FF_X87_Y38_N44
\Sec_Tens|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Tens|count[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Tens|count\(3));

-- Location: MLABCELL_X87_Y38_N6
\Sec_Tens|count[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Tens|count[1]~2_combout\ = ( \Sec_Tens|count\(1) & ( \Sec_Tens|count\(2) & ( (!\GlobalReset~input_o\ & ((!\local_reset_sec_tens~0_combout\) # (!\Sec_Tens|count\(0)))) ) ) ) # ( !\Sec_Tens|count\(1) & ( \Sec_Tens|count\(2) & ( 
-- (\local_reset_sec_tens~0_combout\ & (!\GlobalReset~input_o\ & (\Sec_Tens|count\(0) & \Sec_Tens|count\(3)))) ) ) ) # ( \Sec_Tens|count\(1) & ( !\Sec_Tens|count\(2) & ( (!\GlobalReset~input_o\ & ((!\local_reset_sec_tens~0_combout\) # 
-- (!\Sec_Tens|count\(0)))) ) ) ) # ( !\Sec_Tens|count\(1) & ( !\Sec_Tens|count\(2) & ( (\local_reset_sec_tens~0_combout\ & (!\GlobalReset~input_o\ & (\Sec_Tens|count\(0) & !\Sec_Tens|count\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000000110010001100100000000000000001001100100011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_local_reset_sec_tens~0_combout\,
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Sec_Tens|ALT_INV_count\(0),
	datad => \Sec_Tens|ALT_INV_count\(3),
	datae => \Sec_Tens|ALT_INV_count\(1),
	dataf => \Sec_Tens|ALT_INV_count\(2),
	combout => \Sec_Tens|count[1]~2_combout\);

-- Location: FF_X87_Y38_N8
\Sec_Tens|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Tens|count[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Tens|count\(1));

-- Location: MLABCELL_X87_Y38_N24
\Min_Cnt|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Min_Cnt|count~2_combout\ = (!\GlobalReset~input_o\ & !\Min_Cnt|count\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	datad => \Min_Cnt|ALT_INV_count\(0),
	combout => \Min_Cnt|count~2_combout\);

-- Location: MLABCELL_X87_Y38_N12
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( !\Sec_Tens|count\(1) & ( (!\Sec_Tens|count\(3) & (\Sec_Tens|count\(2) & \Sec_Tens|count\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Sec_Tens|ALT_INV_count\(3),
	datac => \Sec_Tens|ALT_INV_count\(2),
	datad => \Sec_Tens|ALT_INV_count\(0),
	dataf => \Sec_Tens|ALT_INV_count\(1),
	combout => \Equal1~0_combout\);

-- Location: MLABCELL_X87_Y38_N57
sec_tens_reset : cyclonev_lcell_comb
-- Equation(s):
-- \sec_tens_reset~combout\ = ( \Equal1~0_combout\ & ( ((\timer_running~q\ & \Sec_Ones|Equal0~0_combout\)) # (\GlobalReset~input_o\) ) ) # ( !\Equal1~0_combout\ & ( \GlobalReset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010111010101110101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_GlobalReset~input_o\,
	datab => \ALT_INV_timer_running~q\,
	datac => \Sec_Ones|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \sec_tens_reset~combout\);

-- Location: FF_X87_Y38_N26
\Min_Cnt|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Min_Cnt|count~2_combout\,
	ena => \sec_tens_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Min_Cnt|count\(0));

-- Location: MLABCELL_X87_Y38_N54
\Min_Cnt|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Min_Cnt|count~0_combout\ = ( \Min_Cnt|count\(1) & ( (!\GlobalReset~input_o\ & (!\Min_Cnt|count\(0) $ (!\Min_Cnt|count\(2)))) ) ) # ( !\Min_Cnt|count\(1) & ( (!\GlobalReset~input_o\ & \Min_Cnt|count\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000001010101000000000101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_GlobalReset~input_o\,
	datac => \Min_Cnt|ALT_INV_count\(0),
	datad => \Min_Cnt|ALT_INV_count\(2),
	dataf => \Min_Cnt|ALT_INV_count\(1),
	combout => \Min_Cnt|count~0_combout\);

-- Location: FF_X87_Y38_N56
\Min_Cnt|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Min_Cnt|count~0_combout\,
	ena => \sec_tens_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Min_Cnt|count\(2));

-- Location: MLABCELL_X87_Y38_N30
\Min_Cnt|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Min_Cnt|count~1_combout\ = ( \Min_Cnt|count\(0) & ( (!\GlobalReset~input_o\ & ((!\Min_Cnt|count\(2) & (\Min_Cnt|count\(1) & \Min_Cnt|count\(3))) # (\Min_Cnt|count\(2) & (!\Min_Cnt|count\(1) $ (!\Min_Cnt|count\(3)))))) ) ) # ( !\Min_Cnt|count\(0) & ( 
-- (!\GlobalReset~input_o\ & \Min_Cnt|count\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000100010010000000010001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Min_Cnt|ALT_INV_count\(2),
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Min_Cnt|ALT_INV_count\(1),
	datad => \Min_Cnt|ALT_INV_count\(3),
	dataf => \Min_Cnt|ALT_INV_count\(0),
	combout => \Min_Cnt|count~1_combout\);

-- Location: FF_X87_Y38_N32
\Min_Cnt|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Min_Cnt|count~1_combout\,
	ena => \sec_tens_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Min_Cnt|count\(3));

-- Location: MLABCELL_X87_Y38_N27
\Min_Cnt|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Min_Cnt|count~3_combout\ = ( \Min_Cnt|count\(0) & ( (!\GlobalReset~input_o\ & (!\Min_Cnt|count\(1) & ((!\Min_Cnt|count\(3)) # (\Min_Cnt|count\(2))))) ) ) # ( !\Min_Cnt|count\(0) & ( (!\GlobalReset~input_o\ & \Min_Cnt|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011000100000000001100010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Min_Cnt|ALT_INV_count\(2),
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Min_Cnt|ALT_INV_count\(3),
	datad => \Min_Cnt|ALT_INV_count\(1),
	dataf => \Min_Cnt|ALT_INV_count\(0),
	combout => \Min_Cnt|count~3_combout\);

-- Location: FF_X87_Y38_N29
\Min_Cnt|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Min_Cnt|count~3_combout\,
	ena => \sec_tens_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Min_Cnt|count\(1));

-- Location: LABCELL_X88_Y38_N6
\reached_preset~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \reached_preset~3_combout\ = ( \Sec_Tens|count\(1) & ( \Min_Cnt|count\(1) & ( (preset_sec_tens(1) & (preset_min(1) & (!preset_sec_tens(0) $ (\Sec_Tens|count\(0))))) ) ) ) # ( !\Sec_Tens|count\(1) & ( \Min_Cnt|count\(1) & ( (!preset_sec_tens(1) & 
-- (preset_min(1) & (!preset_sec_tens(0) $ (\Sec_Tens|count\(0))))) ) ) ) # ( \Sec_Tens|count\(1) & ( !\Min_Cnt|count\(1) & ( (preset_sec_tens(1) & (!preset_min(1) & (!preset_sec_tens(0) $ (\Sec_Tens|count\(0))))) ) ) ) # ( !\Sec_Tens|count\(1) & ( 
-- !\Min_Cnt|count\(1) & ( (!preset_sec_tens(1) & (!preset_min(1) & (!preset_sec_tens(0) $ (\Sec_Tens|count\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000000000001000010000000000000000100001000000000000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_preset_sec_tens(0),
	datab => ALT_INV_preset_sec_tens(1),
	datac => \Sec_Tens|ALT_INV_count\(0),
	datad => ALT_INV_preset_min(1),
	datae => \Sec_Tens|ALT_INV_count\(1),
	dataf => \Min_Cnt|ALT_INV_count\(1),
	combout => \reached_preset~3_combout\);

-- Location: IOIBUF_X89_Y36_N55
\Data_In[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(3),
	o => \Data_In[3]~input_o\);

-- Location: IOIBUF_X89_Y38_N4
\Data_In[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(1),
	o => \Data_In[1]~input_o\);

-- Location: LABCELL_X88_Y38_N27
\preset_sec_ones~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_ones~4_combout\ = ( \Data_In[1]~input_o\ & ( (!\Data_In[3]~input_o\ & !\GlobalReset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[3]~input_o\,
	datab => \ALT_INV_GlobalReset~input_o\,
	dataf => \ALT_INV_Data_In[1]~input_o\,
	combout => \preset_sec_ones~4_combout\);

-- Location: FF_X88_Y38_N29
\preset_sec_ones[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_sec_ones~4_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_ones(1));

-- Location: LABCELL_X88_Y38_N36
\preset_sec_tens~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_tens~0_combout\ = (!\GlobalReset~input_o\ & ((\Data_In[7]~input_o\) # (\Data_In[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011001100000011001100110000001100110011000000110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \ALT_INV_Data_In[6]~input_o\,
	datad => \ALT_INV_Data_In[7]~input_o\,
	combout => \preset_sec_tens~0_combout\);

-- Location: FF_X88_Y38_N38
\preset_sec_tens[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_sec_tens~0_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_tens(2));

-- Location: IOIBUF_X89_Y37_N38
\Data_In[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(0),
	o => \Data_In[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N38
\Data_In[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(2),
	o => \Data_In[2]~input_o\);

-- Location: LABCELL_X88_Y38_N39
\preset_sec_ones~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_ones~3_combout\ = ( \Data_In[1]~input_o\ & ( (!\GlobalReset~input_o\ & ((\Data_In[3]~input_o\) # (\Data_In[0]~input_o\))) ) ) # ( !\Data_In[1]~input_o\ & ( (!\GlobalReset~input_o\ & (((\Data_In[2]~input_o\ & \Data_In[3]~input_o\)) # 
-- (\Data_In[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001001100010001000100110001000100110011000100010011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[0]~input_o\,
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \ALT_INV_Data_In[2]~input_o\,
	datad => \ALT_INV_Data_In[3]~input_o\,
	dataf => \ALT_INV_Data_In[1]~input_o\,
	combout => \preset_sec_ones~3_combout\);

-- Location: FF_X88_Y38_N41
\preset_sec_ones[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_sec_ones~3_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_ones(0));

-- Location: LABCELL_X88_Y38_N48
\reached_preset~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \reached_preset~1_combout\ = ( preset_sec_tens(2) & ( preset_sec_ones(0) & ( (\Sec_Ones|count\(0) & (\Sec_Tens|count\(2) & (!\Sec_Ones|count\(1) $ (preset_sec_ones(1))))) ) ) ) # ( !preset_sec_tens(2) & ( preset_sec_ones(0) & ( (\Sec_Ones|count\(0) & 
-- (!\Sec_Tens|count\(2) & (!\Sec_Ones|count\(1) $ (preset_sec_ones(1))))) ) ) ) # ( preset_sec_tens(2) & ( !preset_sec_ones(0) & ( (!\Sec_Ones|count\(0) & (\Sec_Tens|count\(2) & (!\Sec_Ones|count\(1) $ (preset_sec_ones(1))))) ) ) ) # ( !preset_sec_tens(2) & 
-- ( !preset_sec_ones(0) & ( (!\Sec_Ones|count\(0) & (!\Sec_Tens|count\(2) & (!\Sec_Ones|count\(1) $ (preset_sec_ones(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000000000001000001001000001000000000000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sec_Ones|ALT_INV_count\(0),
	datab => \Sec_Ones|ALT_INV_count\(1),
	datac => ALT_INV_preset_sec_ones(1),
	datad => \Sec_Tens|ALT_INV_count\(2),
	datae => ALT_INV_preset_sec_tens(2),
	dataf => ALT_INV_preset_sec_ones(0),
	combout => \reached_preset~1_combout\);

-- Location: IOIBUF_X89_Y36_N21
\Data_In[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(8),
	o => \Data_In[8]~input_o\);

-- Location: LABCELL_X88_Y38_N18
\preset_min~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_min~0_combout\ = ( \Data_In[8]~input_o\ & ( !\GlobalReset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	dataf => \ALT_INV_Data_In[8]~input_o\,
	combout => \preset_min~0_combout\);

-- Location: FF_X88_Y38_N19
\preset_min[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_min~0_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_min(0));

-- Location: MLABCELL_X87_Y38_N48
\reached_preset~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \reached_preset~2_combout\ = ( !\Min_Cnt|count\(3) & ( (!\Min_Cnt|count\(2) & (!\Sec_Tens|count\(3) & (!\Min_Cnt|count\(0) $ (preset_min(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000100000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Min_Cnt|ALT_INV_count\(2),
	datab => \Sec_Tens|ALT_INV_count\(3),
	datac => \Min_Cnt|ALT_INV_count\(0),
	datad => ALT_INV_preset_min(0),
	dataf => \Min_Cnt|ALT_INV_count\(3),
	combout => \reached_preset~2_combout\);

-- Location: LABCELL_X88_Y38_N12
\timer_running~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \timer_running~0_combout\ = ( \timer_running~q\ & ( \start_sync~q\ ) ) # ( !\timer_running~q\ & ( \start_sync~q\ ) ) # ( \timer_running~q\ & ( !\start_sync~q\ & ( (!\reached_preset~0_combout\) # ((!\reached_preset~3_combout\) # 
-- ((!\reached_preset~1_combout\) # (!\reached_preset~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reached_preset~0_combout\,
	datab => \ALT_INV_reached_preset~3_combout\,
	datac => \ALT_INV_reached_preset~1_combout\,
	datad => \ALT_INV_reached_preset~2_combout\,
	datae => \ALT_INV_timer_running~q\,
	dataf => \ALT_INV_start_sync~q\,
	combout => \timer_running~0_combout\);

-- Location: FF_X88_Y38_N14
timer_running : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \timer_running~0_combout\,
	sclr => \GlobalReset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_running~q\);

-- Location: MLABCELL_X87_Y38_N33
\Sec_Ones|count[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Ones|count[3]~1_combout\ = ( \timer_running~q\ ) # ( !\timer_running~q\ & ( \GlobalReset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_GlobalReset~input_o\,
	dataf => \ALT_INV_timer_running~q\,
	combout => \Sec_Ones|count[3]~1_combout\);

-- Location: FF_X87_Y38_N53
\Sec_Ones|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Ones|count~3_combout\,
	ena => \Sec_Ones|count[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Ones|count\(0));

-- Location: MLABCELL_X87_Y38_N36
\Sec_Ones|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sec_Ones|count~2_combout\ = ( \Sec_Ones|count\(1) & ( (!\GlobalReset~input_o\ & (!\Sec_Ones|count\(3) $ (((!\Sec_Ones|count\(0)) # (!\Sec_Ones|count\(2)))))) ) ) # ( !\Sec_Ones|count\(1) & ( (!\GlobalReset~input_o\ & (\Sec_Ones|count\(3) & 
-- ((!\Sec_Ones|count\(0)) # (\Sec_Ones|count\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001100000000001000110000000100110010000000010011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sec_Ones|ALT_INV_count\(0),
	datab => \ALT_INV_GlobalReset~input_o\,
	datac => \Sec_Ones|ALT_INV_count\(2),
	datad => \Sec_Ones|ALT_INV_count\(3),
	dataf => \Sec_Ones|ALT_INV_count\(1),
	combout => \Sec_Ones|count~2_combout\);

-- Location: FF_X87_Y38_N38
\Sec_Ones|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Sec_Ones|count~2_combout\,
	ena => \Sec_Ones|count[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sec_Ones|count\(3));

-- Location: LABCELL_X88_Y38_N42
\preset_sec_ones~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_ones~2_combout\ = (\Data_In[3]~input_o\ & !\GlobalReset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Data_In[3]~input_o\,
	datad => \ALT_INV_GlobalReset~input_o\,
	combout => \preset_sec_ones~2_combout\);

-- Location: FF_X88_Y38_N5
\preset_sec_ones[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	asdata => \preset_sec_ones~2_combout\,
	sload => VCC,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_ones(3));

-- Location: LABCELL_X88_Y38_N24
\preset_sec_ones~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \preset_sec_ones~0_combout\ = ( \Data_In[2]~input_o\ & ( (!\Data_In[3]~input_o\ & !\GlobalReset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[3]~input_o\,
	datab => \ALT_INV_GlobalReset~input_o\,
	dataf => \ALT_INV_Data_In[2]~input_o\,
	combout => \preset_sec_ones~0_combout\);

-- Location: FF_X88_Y38_N25
\preset_sec_ones[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \preset_sec_ones~0_combout\,
	ena => \preset_sec_ones[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => preset_sec_ones(2));

-- Location: LABCELL_X88_Y38_N54
\reached_preset~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \reached_preset~0_combout\ = ( preset_sec_ones(2) & ( (\Sec_Ones|count\(2) & (!\Sec_Ones|count\(3) $ (preset_sec_ones(3)))) ) ) # ( !preset_sec_ones(2) & ( (!\Sec_Ones|count\(2) & (!\Sec_Ones|count\(3) $ (preset_sec_ones(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000110000110000000011000000001100000000110000110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Sec_Ones|ALT_INV_count\(3),
	datac => \Sec_Ones|ALT_INV_count\(2),
	datad => ALT_INV_preset_sec_ones(3),
	dataf => ALT_INV_preset_sec_ones(2),
	combout => \reached_preset~0_combout\);

-- Location: LABCELL_X88_Y38_N45
\reached_preset~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \reached_preset~4_combout\ = ( \reached_preset~1_combout\ & ( (\reached_preset~0_combout\ & (\reached_preset~3_combout\ & \reached_preset~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reached_preset~0_combout\,
	datab => \ALT_INV_reached_preset~3_combout\,
	datac => \ALT_INV_reached_preset~2_combout\,
	dataf => \ALT_INV_reached_preset~1_combout\,
	combout => \reached_preset~4_combout\);

-- Location: LABCELL_X83_Y53_N0
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


