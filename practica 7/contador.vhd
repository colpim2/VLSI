library ieee;
use ieee.std_logic_1164.all;
--Fernández Rosales Sebastian
--317046647
entity contador is 
port(echo,clkl1,tr: in std_logic;
     salida: out std_logic);
end entity;

architecture arqcontador of contador is 
signal conteo: integer range 0 to 12000;
begin 
   process(echo,clk1,rst)
	   begin
		if(rst<='1') then 
	            conteo<='0';
				else 
				if (echo='1') and (rising_edge(clk)) then conteo<= conteo+1;
				else 
				if (echo<=1200) then
				    salida<='1';
				else 
				   salida<='0';
				end if;
			end if;
		end if;
	end process;
end architecture; 