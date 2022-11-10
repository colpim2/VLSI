library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is 
port(clk,s,dir:in std_logic;
		izq, der:in std_logic_vector(6 downto 0);
		salida:out std_logic_vector(6 downto 0));
end mux2x1;

architecture a of mux2x1 is
begin
	process(clk)
	begin
		if rising_edge(clk) and s='1' then
			case dir is
				when '0' => salida <= izq;
				when '1' => salida <= der;
			end case;
		end if;
	end process;
end a;