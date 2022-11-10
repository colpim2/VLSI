library ieee;
use ieee.std_logic_1164.all;

entity reloj is
port(clk: in std_logic;
     ssg0: out std_logic_vector(6 downto 0);
     ssg1: out std_logic_vector(6 downto 0);
	  ssg2: out std_logic_vector(6 downto 0);
     ssg3: out std_logic_vector(6 downto 0);
	  carry:out std_logic);
end entity;

architecture a of reloj is

signal clkl: std_logic:='0';
signal contador: integer range 0 to 25000000:=0;
signal conteo1, conteo2, conteo3, conteo4, conteo23: integer:=0;
signal bandera1: std_logic:='0';
signal bandera2: std_logic:='0';
signal bandera3: std_logic:='0';
signal bandera4: std_logic:='0';


begin
	
	--Divisor de Frecuencia
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(contador=25000000) then
				contador <= 0;
				clkl <= not clkl;
			else
				contador <= contador + 1;
			end if;
		end if;
	end process;
	
	--Contador1
	process(clkl)
	begin
		if(rising_edge(clkl)) then
			if(conteo1=9) then
				conteo1 <= 0;
				bandera1 <= '1';
			else
				conteo1 <= conteo1 + 1;
				bandera1 <= '0';
			end if;
		end if;
	end process;
	
	carry <= bandera1;
	
	--Contador2
	process(bandera1)
	begin
		if(rising_edge(bandera1)) then
			if(conteo2=5) then
				conteo2 <= 0;
				bandera2 <= '1';
			else
				conteo2 <= conteo2 + 1;
				bandera2 <= '0';
			end if;
		end if;
	end process;
	
	--Contador3
	process(bandera2)
	begin
		if(rising_edge(bandera2)) then
			if(conteo3=9 or (conteo4=2 and conteo3=3)) then
				conteo3 <= 0;
				bandera3 <= '1';
			else
				conteo3 <= conteo3 + 1;
				bandera3 <= '0';
			end if;
		end if;
	end process;
	
	--Contador4
	process(bandera3)
	begin
		if(rising_edge(bandera3)) then
			if(conteo4=2) then
				conteo4 <= 0;
				bandera4 <= '1';
			else
				conteo4 <= conteo4 + 1;
				bandera4 <= '0';
			end if;
		end if;
	end process;
	
	
	--Inicio ssg
	with conteo1 select
		ssg0<="1000000" when 0,
			  "1111001" when 1,
			  "0100100" when 2,
			  "0110000" when 3,
			  "0011001" when 4,
			  "0010010" when 5,
			  "0000010" when 6,
			  "1111000" when 7,
			  "0000000" when 8,
			  "0011000" when 9,
			  "1111111" when others;
			  
	with conteo2 select
		ssg1<="1000000" when 0,
			  "1111001" when 1,
			  "0100100" when 2,
			  "0110000" when 3,
			  "0011001" when 4,
			  "0010010" when 5,
			  "0000010" when 6,
			  "1111000" when 7,
			  "0000000" when 8,
			  "0011000" when 9,
			  "1111111" when others;
			  
	with conteo3 select
		ssg2<="1000000" when 0,
			  "1111001" when 1,
			  "0100100" when 2,
			  "0110000" when 3,
			  "0011001" when 4,
			  "0010010" when 5,
			  "0000010" when 6,
			  "1111000" when 7,
			  "0000000" when 8,
			  "0011000" when 9,
			  "1111111" when others;
			  
	with conteo4 select
		ssg3<="1000000" when 0,
			  "1111001" when 1,
			  "0100100" when 2,
			  "0110000" when 3,
			  "0011001" when 4,
			  "0010010" when 5,
			  "0000010" when 6,
			  "1111000" when 7,
			  "0000000" when 8,
			  "0011000" when 9,
			  "1111111" when others;

end architecture;	