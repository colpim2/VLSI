Library ieee;
use ieee.std_logic_1164.all;

Entity miJK is
Port( clk: in std_logic;
		sq1, sq2: out std_logic
);
End miJK;

Architecture arqmiJK of miJK is
Signal k0,j0,k1,j1,q0,q1: std_logic;

Begin
	j0<='1';
	k0<='1';
	ji<=q0;
	k1<=q0;
	
	u1: entity work.FFJK(arqFFJK) port map(clk,j0,k0,q0,'0');
	u2: entity work.FFJK(arqFFJK) port map(clk,j1,k1,q1,'0');

	sq1<=q1;
	sq0<=q0;
	
End Architecture;