library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity suma is
port(a,b: in std_logic;
     cin: in std_logic;
	  salsum: out std_logic;
	  cout: out std_logic);
end;

architecture arqsum of suma is
begin
	salsum <= a xor b xor cin;
	cout <= (a and b) or ((a xor b) and cin);
end;