library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity motor is
port( clk, ud, rst, f, h: in std_logic;
			 led, mot: out std_logic_vector(3 downto 0)
	  );
end motor;


architecture a of motor is

	signal clkl: std_logic;

begin
	u1: entity work.divf(arqdivf) generic map(250000) port map (clk,clkl);
	u2: entity work.MotPasos(behavorial) port map (clkl, ud, rst, f, h, led, mot);
end;