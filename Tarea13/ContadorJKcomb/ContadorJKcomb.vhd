Library ieee;
use ieee.std_logic_1164.all;

Entity ContadorJKcomb is
Port( clk: in std_logic;
		Q2,Q1, Q0: out std_logic
);
End ContadorJKcomb;

Architecture arqContJK of ContadorJKcomb is
Signal K0,J0,AuxQ0,notQ0, K1,J1,AuxQ1,notQ1, K2,J2,AuxQ2,notQ2: std_logic;

Begin
	-- JK
	u1: entity work.combinacional(arqComb) port map(AuxQ0,AuxQ1,AuxQ2, J0,J1,J2, K0,k1,K2);
	
	-- Flip Flops
	u2: entity work.FFJK(arqFFJK) port map(clk,J0,K0,AuxQ0,notQ0);
	u3: entity work.FFJK(arqFFJK) port map(clk,J1,K1,AuxQ1,notQ1);
	u4: entity work.FFJK(arqFFJK) port map(clk,J2,K2,AuxQ2,notQ2);
	
	--Q+1
	Q0<=AuxQ0;
	Q1<=AuxQ1;	
	Q2<=AuxQ2;
	
End Architecture;