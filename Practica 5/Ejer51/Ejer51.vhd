library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Ejer51 is		--ServoMotor
Port( clk, pi, pf, inc, dec, rst: in std_logic;
		control: out std_logic);
End entity;

Architecture arqServo of Ejer51 is
signal clkl: std_logic;
signal duty: integer range 0 to 200:=85;

Begin
	u1: entity work.divf(arqdivf) generic map(500) port map (clk,clkl);
	u2: entity work.senal(arqsenal) port map(clkl,duty,control);
	u3: entity work.movimiento(arqmov) port map(clkl,pi,pf,inc,dec,rst,duty);
End Architecture;