library ieee;
use ieee.std_logic_1164.all;

entity corri is
port(clk: in std_logic;
	  mi: in std_logic_vector(8 downto 0);
	  mo: out std_logic_vector(8 downto 0));
end entity;

architecture a of corri is
begin
process(clk)
	begin 
	if rising_edge(clk) then
		mo(0) <= mi(8);
		mo(1) <= mi(0);
		mo(2) <= mi(1);
		mo(3) <= mi(2);
		mo(4) <= mi(3);
		mo(5) <= mi(4);
		mo(6) <= mi(5);
		mo(7) <= mi(7);
		mo(8) <= mi(8);
	end if;
end process;
end;