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

-- DATE "04/10/2025 14:18:24"

-- 
-- Device: Altera EP4CE115F29I8L Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BCD_Counter IS
    PORT (
	Clk : IN std_logic;
	Reset : IN std_logic;
	Enable : IN std_logic;
	Direction : IN std_logic;
	Q_Out : OUT std_logic_vector(3 DOWNTO 0)
	);
END BCD_Counter;

-- Design Ports Information
-- Q_Out[0]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_Out[1]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_Out[2]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_Out[3]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Enable	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Direction	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BCD_Counter IS
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
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Enable : std_logic;
SIGNAL ww_Direction : std_logic;
SIGNAL ww_Q_Out : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Q_Out[0]~output_o\ : std_logic;
SIGNAL \Q_Out[1]~output_o\ : std_logic;
SIGNAL \Q_Out[2]~output_o\ : std_logic;
SIGNAL \Q_Out[3]~output_o\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Direction~input_o\ : std_logic;
SIGNAL \Enable~input_o\ : std_logic;
SIGNAL \count[0]~3_combout\ : std_logic;
SIGNAL \count[1]~5_cout\ : std_logic;
SIGNAL \count[1]~6_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \count[1]~7\ : std_logic;
SIGNAL \count[2]~11_combout\ : std_logic;
SIGNAL \count[0]~10_combout\ : std_logic;
SIGNAL \count[2]~12\ : std_logic;
SIGNAL \count[3]~13_combout\ : std_logic;
SIGNAL \Direction~_wirecell_combout\ : std_logic;
SIGNAL \count[1]~8_combout\ : std_logic;
SIGNAL \count[1]~9_combout\ : std_logic;
SIGNAL count : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Clk <= Clk;
ww_Reset <= Reset;
ww_Enable <= Enable;
ww_Direction <= Direction;
Q_Out <= ww_Q_Out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y34_N2
\Q_Out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(0),
	devoe => ww_devoe,
	o => \Q_Out[0]~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\Q_Out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(1),
	devoe => ww_devoe,
	o => \Q_Out[1]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\Q_Out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(2),
	devoe => ww_devoe,
	o => \Q_Out[2]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\Q_Out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(3),
	devoe => ww_devoe,
	o => \Q_Out[3]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\Clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G2
\Clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y34_N8
\Reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: IOIBUF_X0_Y35_N15
\Direction~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Direction,
	o => \Direction~input_o\);

-- Location: IOIBUF_X0_Y34_N15
\Enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Enable,
	o => \Enable~input_o\);

-- Location: LCCOMB_X1_Y34_N4
\count[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~3_combout\ = (\Reset~input_o\ & (!\Direction~input_o\)) # (!\Reset~input_o\ & ((count(0) $ (\Enable~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011101110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \Direction~input_o\,
	datac => count(0),
	datad => \Enable~input_o\,
	combout => \count[0]~3_combout\);

-- Location: FF_X1_Y34_N5
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X1_Y34_N6
\count[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~5_cout\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datad => VCC,
	cout => \count[1]~5_cout\);

-- Location: LCCOMB_X1_Y34_N8
\count[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~6_combout\ = (\Direction~input_o\ & ((count(1) & (!\count[1]~5_cout\)) # (!count(1) & ((\count[1]~5_cout\) # (GND))))) # (!\Direction~input_o\ & ((count(1) & (\count[1]~5_cout\ & VCC)) # (!count(1) & (!\count[1]~5_cout\))))
-- \count[1]~7\ = CARRY((\Direction~input_o\ & ((!\count[1]~5_cout\) # (!count(1)))) # (!\Direction~input_o\ & (!count(1) & !\count[1]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Direction~input_o\,
	datab => count(1),
	datad => VCC,
	cin => \count[1]~5_cout\,
	combout => \count[1]~6_combout\,
	cout => \count[1]~7\);

-- Location: LCCOMB_X1_Y34_N24
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X1_Y34_N10
\count[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[2]~11_combout\ = ((count(2) $ (\Direction~input_o\ $ (\count[1]~7\)))) # (GND)
-- \count[2]~12\ = CARRY((count(2) & ((!\count[1]~7\) # (!\Direction~input_o\))) # (!count(2) & (!\Direction~input_o\ & !\count[1]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => \Direction~input_o\,
	datad => VCC,
	cin => \count[1]~7\,
	combout => \count[2]~11_combout\,
	cout => \count[2]~12\);

-- Location: LCCOMB_X1_Y34_N26
\count[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~10_combout\ = (\Reset~input_o\) # (\Enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datad => \Enable~input_o\,
	combout => \count[0]~10_combout\);

-- Location: FF_X1_Y34_N11
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \count[2]~11_combout\,
	asdata => \~GND~combout\,
	sload => \count[1]~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X1_Y34_N12
\count[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[3]~13_combout\ = \Direction~input_o\ $ (\count[2]~12\ $ (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Direction~input_o\,
	datad => count(3),
	cin => \count[2]~12\,
	combout => \count[3]~13_combout\);

-- Location: LCCOMB_X1_Y34_N22
\Direction~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \Direction~_wirecell_combout\ = !\Direction~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Direction~input_o\,
	combout => \Direction~_wirecell_combout\);

-- Location: FF_X1_Y34_N13
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \count[3]~13_combout\,
	asdata => \Direction~_wirecell_combout\,
	sload => \count[1]~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X1_Y34_N2
\count[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~8_combout\ = (\Direction~input_o\ & (count(0) & count(3))) # (!\Direction~input_o\ & (!count(0) & !count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Direction~input_o\,
	datac => count(0),
	datad => count(3),
	combout => \count[1]~8_combout\);

-- Location: LCCOMB_X1_Y34_N28
\count[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~9_combout\ = (\Reset~input_o\) # ((!count(2) & (!count(1) & \count[1]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => \Reset~input_o\,
	datac => count(1),
	datad => \count[1]~8_combout\,
	combout => \count[1]~9_combout\);

-- Location: FF_X1_Y34_N9
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \count[1]~6_combout\,
	asdata => \~GND~combout\,
	sload => \count[1]~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

ww_Q_Out(0) <= \Q_Out[0]~output_o\;

ww_Q_Out(1) <= \Q_Out[1]~output_o\;

ww_Q_Out(2) <= \Q_Out[2]~output_o\;

ww_Q_Out(3) <= \Q_Out[3]~output_o\;
END structure;


