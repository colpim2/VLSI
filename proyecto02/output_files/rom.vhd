library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Barreiro Valdez Alejandro
--Castillo Montes Pamela
--Fernández Rosales Sebastian
--Medina Segura Fernando
--Zepeda Baeza Jessica

entity rom is
port(
	bus_dir: in integer;
	cs: in std_logic;
	bus_datos: out integer);
end rom;

architecture arqromlcd of rom is

constant a0: integer:=25;
constant a90: integer:=75;
constant a180: integer:=125;

type memoria is array (2 downto 0) of integer;
constant mem_rom: memoria := (a180, a90, a0);

signal dato: integer;

begin

	prom: process(bus_dir)
	begin
		dato <= mem_rom(bus_dir);
	end process prom;
	
	pbuf: process (dato, cs)
	begin
		if(cs='1') then
		bus_datos<=dato;
		else
		bus_datos <= 25;
		end if;
	end process pbuf;
end arqromlcd;