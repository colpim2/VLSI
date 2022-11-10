library ieee;
use ieee.std_logic_1164.all;

Entity ejer63 is
Port( clk: in std_logic;
		Q0, Q1: inout std_logic);
End ejer63;

Architecture arqejer63 of ejer63 is
Signal d0,d1: std_logic;
Begin
	u1: entity work.combinacional(arqcomb) port map(Q0,Q1,d0,d1);
	u2: entity work.FFD(arqFFD) port map(d0,clk,Q0);
	u3: entity work.FFD(arqFFD) port map(d1,clk,Q1);
End Architecture;