library ieee;
use ieee.std_logic_1164.all;

--Barreiro Valdez Alejandro
--Castillo Montes Pamela
--Fernández Rosales Sebastian
--Medina Segura Fernando
--Zepeda Baeza Jessica

entity movimiento is
port (
	clk, rst, manual: in std_logic;
	ancho: out integer
	);
end entity;

--25 -> 0°
--75 -> 90°
--125 -> 180°

architecture arqmov of movimiento is
	
	subtype state is integer;
	signal present_state, next_state: state;
	constant e0: state:= 0;
	constant e1: state:= 2;
	constant e2: state:= 1;
	constant e3: state:= 0;
	
	signal valor: integer range 0 to 200;
	
begin
	
	process(clk)
	begin
	if rising_edge(clk) then
		if (rst='1' or manual='0') then
			present_state <= e0;
		else
			present_state <= next_state;
		end if;
	end if;
	end process;
	
	process(present_state)
	begin
		case present_state is 
			when e0 => next_state <= e1;
			when e1 => next_state <= e2;
			when e2 => next_state <= e3;
			when others => next_state <= e0;
		end case;
	ancho <= present_state;
	end process;
	

end architecture;