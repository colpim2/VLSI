library ieee;
use ieee.std_logic_1164.all;
--Fernández Rosales Sebastian
--317046647
entity trigger is 
port(clk,rst, echo: in std_logic;
     salida: out std_logic);
end entity;

architecture arqtrigger of trigger is 

begin 
   process(clk)
	    begin 
		  if(rst='1') then salida<='0';
		    if(echo<='1') then salida<='0';
			 else 
			 salida<=clk;
			 end if;
			end if;
		end process;
end architecture;
