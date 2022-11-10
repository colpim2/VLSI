library ieee;
use ieee.std_logic_1164.all;

entity compuertaAnd is
port (a,b: in std_logic;
			c: out std_logic);
end;

architecture arq of compuertaAnd is
begin
	c <= a and b;
end architecture;