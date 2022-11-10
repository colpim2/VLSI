library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity movimiento is
Port( clk, pi, pf, inc, dec, rst: in std_logic;
		ancho: out integer);
End entity;

Architecture arqmov of movimiento is
signal valor: integer range 0 to 200;

Begin
	Process(clk, pi, pf, inc, dec)
	Begin
		if(rst = '1') then
			valor <= 75;		--90°
		elsif(pi = '1') then
			valor <= 30; 		--0°
		elsif(pf = '1') then
			valor <= 120; 		--180°
		elsif(inc = '1' and valor<=120) then
			valor <= valor + 1;
		elsif(dec = '1' and valor>=30) then
			valor <= valor-1;
		end if;
		
		ancho <= valor;
	End Process;
End Architecture;