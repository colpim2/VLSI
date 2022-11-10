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
-- Generated on "10/16/2022 14:42:11"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          pruebaPWM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY pruebaPWM_vhd_vec_tst IS
END pruebaPWM_vhd_vec_tst;
ARCHITECTURE pruebaPWM_arch OF pruebaPWM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL duty : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL snl : STD_LOGIC;
COMPONENT pruebaPWM
	PORT (
	clk : IN STD_LOGIC;
	duty : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	snl : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : pruebaPWM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	duty => duty,
	snl => snl
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
-- duty[3]
t_prcs_duty_3: PROCESS
BEGIN
	duty(3) <= '1';
WAIT;
END PROCESS t_prcs_duty_3;
-- duty[2]
t_prcs_duty_2: PROCESS
BEGIN
	duty(2) <= '0';
WAIT;
END PROCESS t_prcs_duty_2;
-- duty[1]
t_prcs_duty_1: PROCESS
BEGIN
	duty(1) <= '1';
WAIT;
END PROCESS t_prcs_duty_1;
-- duty[0]
t_prcs_duty_0: PROCESS
BEGIN
	duty(0) <= '0';
WAIT;
END PROCESS t_prcs_duty_0;
END pruebaPWM_arch;
