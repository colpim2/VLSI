library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Barreiro Valdez Alejandro
--Castillo Montes Pamela
--Fernández Rosales Sebastian
--Medina Segura Fernando
--Zepeda Baeza Jessica

entity senal is
port(clk: in std_logic;
		duty: in integer;
		snl: out std_logic);
end entity;

architecture arqsenal of senal is
signal conteo: integer range 0 to 1000;

begin
	process(clk)
	begin 
		if rising_edge(clk) then
			if conteo<=duty then
				snl <= '1';
			else
				snl <= '0';
			end if;
			
			if conteo=1000 then
				conteo <= 0;
			else
				conteo <= conteo + 1;
			end if;
		end if;
	end process;
	
end architecture;