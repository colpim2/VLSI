library ieee;
use ieee.std_logic_1164.all;

entity mux1 is
	port ( SEL : in std_logic_vector (1 downto 0);
			 A	  : in std_logic_vector (3 downto 0);
			 F   : out std_logic);
end mux1;

architecture arqmux1 of mux1 is
begin
with SEL select
	F <= A(0) when "00",
		  A(1) when "01",
		  A(2) when "10",
		  A(3) when "11",
		  '0' when others;
end arqmux1;