library ieee;
use ieee.std_logic_1164.all;

entity pwm is
port(clk: in std_logic;
		led: buffer std_logic_vector(8 downto 0));
end entity;

architecture arqpwm of pwm is
signal clkl,clkl2: std_logic;
signal s: std_logic_vector(8 downto 0);

begin
	u1: entity work.divf(arqdivf) generic map (25000) port map (clk,clkl);
	u2: entity work.senal(arqsenal) port map (clkl,999,s(0));
	u3: entity work.senal(arqsenal) port map (clkl,500,s(1));
	u4: entity work.senal(arqsenal) port map (clkl,333,s(2));
	u5: entity work.senal(arqsenal) port map (clkl,250,s(3));
	u6: entity work.senal(arqsenal) port map (clkl,166,s(4));
	u7: entity work.senal(arqsenal) port map (clkl,142,s(5));
	u8: entity work.senal(arqsenal) port map (clkl,125,s(6));
	u9: entity work.senal(arqsenal) port map (clkl,111,s(7));
	u10: entity work.senal(arqsenal) port map (clkl,75,s(8));
	
	u11: entity work.divf(arqdivf) port map (clk,clkl2);
	u12: entity work.corrim(a) port map (clkl2,s,led);	
	
end architecture;