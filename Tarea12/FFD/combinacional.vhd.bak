library ieee;
use ieee.std_logic_1164.all;

Entity combinacional is
Port( Q0, Q1: inout std_logic;
		D0, D1: inout std_logic);
End combinacional;

Architecture arqcomb of combinacional is
Begin
	D1<= Q1 xor Q0;
	D0<= not Q1;
End Architecture;