library ieee;
use ieee.std_logic_1164.all;

entity contador is
port(clk: in std_logic;
	  reset: in std_logic);
end entity;

architecture arqcontador of contador is

signal clkl: std_logic;
signal count: integer range 0 to 9;


begin
	
	u1: entity work.divf(arqdivf) port map(clk, clkl);
	u2: entity work.cont(arqcont) port map(clkl, count, reset);
	
end architecture;