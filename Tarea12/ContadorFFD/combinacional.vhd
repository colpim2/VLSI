library ieee;
use ieee.std_logic_1164.all;

Entity combinacional is
Port( Q0, Q1, Q2: inout std_logic;
		D0, D1, D2: inout std_logic);
End combinacional;

Architecture arqcomb of combinacional is
Begin
	D2<= (Q2 and not Q1) or (Q2 and not Q0) or (not Q2 and Q1 and Q0);
	D1<= Q1 xor Q0;
	D0<= not Q1;
End Architecture;