Library ieee;
use ieee.std_logic_1164.all;

Entity combinacional is
Port( Q0, Q1, Q2: in std_logic;
		J0, J1, J2: out std_logic;
		K0, K1, K2: out std_logic
);
End combinacional;

Architecture arqComb of combinacional is

Begin
	J0<='1';
	K0<='1';
	
	J1<=q0;
	K1<=q0;
	
	J2<= Q1 and Q0;
	K2<= Q1 and Q0;
	
End Architecture;