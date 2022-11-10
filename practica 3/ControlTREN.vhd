library ieee;
use ieee.std_logic_1164.all;

entity ControlTREN is 
port(clk,estacion,alto,emergencia,direccion:in std_logic;
		alto2,alto1,izq,der:out std_logic;
		d0,d1,d2,d3,d4,d5:out std_logic_vector(6 downto 0));
end ControlTREN;

architecture a of ControlTREN is
signal clkl,s: std_logic;

begin
	
	u1: entity work.relojlento(a) port map (clk,clkl);
	u2: entity work.states(arqsts) port map (clkl,estacion,alto,emergencia,direccion,s,alto2,alto1,izq,der);
	u3: entity work.moore(a) port map (clkl,s,direccion,"000",d5);
	u4: entity work.moore(a) port map (clkl,s,direccion,"001",d4);
	u5: entity work.moore(a) port map (clkl,s,direccion,"010",d3);
	u6: entity work.moore(a) port map (clkl,s,direccion,"011",d2);
	u7: entity work.moore(a) port map (clkl,s,direccion,"100",d1);
	u8: entity work.moore(a) port map (clkl,s,direccion,"101",d0);

end architecture a;
	