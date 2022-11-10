library ieee;
use ieee.std_logic_1164.all;

Entity FFD is
Port( d, clk: in std_logic;
		Q: out std_logic);
End FFD;

Architecture arqFFD of FFD is
Begin
	Process(clk)
	Begin
		if clk'event and clk='1' then
			Q<=d;
		End if;
	End Process;
End Architecture;