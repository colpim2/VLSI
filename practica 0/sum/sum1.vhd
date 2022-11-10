library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sum1 is
port(a,b: in std_logic;
     cin: in std_logic;
	  salsum: out std_logic;
	  cout: out std_logic);
end;

architecture arqsum of sum1 is
begin
	salsum <= a xor b xor cin;
	cout <= (a and b) or ((a xor b) and cin);
end;