library ieee;
use ieee.std_logic_1164.all;

--Barreiro Valdez Alejandro
--Castillo Montes Pamela
--Fernández Rosales Sebastian
--Medina Segura Fernando
--Zepeda Baeza Jessica

entity divf is
generic(num: integer :=25000000);
port(clk, rapido: in std_logic;
		clkl: buffer std_logic:='0');
end entity;

architecture arqdivf of divf is
signal conteo: integer range 0 to num;
signal num2: integer := num/2;

begin
	process(clk)
	begin 
		if rising_edge(clk) then
			if rapido='0' then
				if conteo=num then
					conteo <= 0;
					clkl <= not clkl;
				else
					conteo <= conteo + 1;
				end if;
			else 
				if conteo=num2 then
					conteo <= 0;
					clkl <= not clkl;
				else
					conteo <= conteo + 1;
				end if;
			end if;
		end if;
	end process;
	
end architecture;