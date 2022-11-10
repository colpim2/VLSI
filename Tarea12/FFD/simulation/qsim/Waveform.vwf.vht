-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/12/2022 20:51:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ejer63
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ejer63_vhd_vec_tst IS
END ejer63_vhd_vec_tst;
ARCHITECTURE ejer63_arch OF ejer63_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Q0 : STD_LOGIC;
SIGNAL Q1 : STD_LOGIC;
COMPONENT ejer63
	PORT (
	clk : IN STD_LOGIC;
	Q0 : INOUT STD_LOGIC;
	Q1 : INOUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ejer63
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Q0 => Q0,
	Q1 => Q1
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- Q0
t_prcs_Q0: PROCESS
BEGIN
	Q0 <= 'Z';
WAIT;
END PROCESS t_prcs_Q0;

-- Q1
t_prcs_Q1: PROCESS
BEGIN
	Q1 <= 'Z';
WAIT;
END PROCESS t_prcs_Q1;
END ejer63_arch;
