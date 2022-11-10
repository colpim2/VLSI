Library ieee;
use ieee.std_logic_1164.all;

Entity miFFJK is
Port(  clk: in std_logic;
		 j,k: in std_logic;
		   q: inout std_logic;
		notq: inout std_logic;
);
End FFJK;

Architecture arqFFJK of FFJK is
Begin
	Process(clk)
	Begin
		if rising_edge(clk) then
			-- Ecuación caracteristica
			q<= (not k and q) or (not q and j);
			notq<= not q;
		End if;
	End Process;
End Architecture;