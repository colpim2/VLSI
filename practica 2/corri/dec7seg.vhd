library ieee;
use ieee.std_logic_1164.all;

entity dec7seg is
port(bcd: in std_logic_vector(3 downto 0);
	  HEX: out std_logic_vector(6 downto 0));
end entity;

architecture a of dec7seg is
begin
	with bcd select
--		HEX <=	"0001100" when "0000",
--					"1000000" when "0001",
--					"1000111" when "0010",
--					"1000111" when "0011",
--					"1001111" when "0100",
--					"0000111" when "0101",
--					"1000000" when "0110",
--					"0010010" when "0111",
--					"0010010" when "1000",
--					"0010010" when "1001",
		HEX <=	"1000000" when "0000",
					"1111001" when "0001",
					"0100100" when "0010",
					"0110000" when "0011",
					"0011001" when "0100",
					"0010010" when "0101",
					"0000010" when "0110",
					"1111000" when "0111",
					"0000000" when "1000",
					"0011000" when "1001",
					"1111111" when others;
end architecture;