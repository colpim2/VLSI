library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Barreiro Valdez Alejandro
--Castillo Montes Pamela
--Fernández Rosales Sebastian
--Medina Segura Fernando
--Zepeda Baeza Jessica

entity sonicos is
Port (clk,reversa: in STD_LOGIC;
		sensor_disp: out STD_LOGIC;
		sensor_eco: in STD_LOGIC;
		led1,led2,led3: out std_logic; 
		segmentos,segmentos2: out STD_LOGIC_VECTOR (7 downto 0)
		);
end sonicos;

architecture arqsonicos of sonicos is

	signal cuenta: unsigned(16 downto 0) := (others => '0');
	signal centimetros: unsigned(15 downto 0) := (others => '0'); 
	signal centimetros_unid: unsigned(3 downto 0) := (others => '0'); 
	signal centimetros_dece: unsigned(3 downto 0) := (others => '0'); 
	signal sal_unid: unsigned(3 downto 0) := (others => '0');
	signal sal_dece: unsigned(3 downto 0) := (others => '0');
	signal digito,digito2: unsigned(3 downto 0) := (others => '0');
	signal eco_pasado: std_logic := '0';
	signal eco_sinc: std_logic := '0';
	signal eco_nsinc: std_logic := '0';
	signal espera: std_logic:= '0';
	signal siete_seg_cuenta: unsigned(15 downto 0) := (others => '0');
	
begin
	
   siete_seg: process(clk)
   begin
		if rising_edge(clk) then
			if siete_seg_cuenta(siete_seg_cuenta'high) = '1' then
				digito <= sal_unid;   
			else
				digito2 <= sal_dece;
			end if;
			
			if (sal_dece=0 or (sal_unid<6 and sal_dece=1)) and reversa='1' then
				led1 <= '1';
			else 
				led1 <= '0';
			end if;
			
			if (sal_dece=0 or (sal_unid=0 and sal_dece=1)) and reversa='1' then
				led2 <= '1';
			else 
				led2 <= '0';
			end if;
			
			if (sal_dece=0 and sal_unid<6) and reversa='1' then
				led3 <= '1';
			else 
				led3 <= '0';
			end if;
			
			siete_seg_cuenta <= siete_seg_cuenta +1; 
		end if;
	end process;
	
	
	
	Trigger:process(clk)
	begin
		if rising_edge(clk) then
			if espera = '0' then
				if cuenta = 500 then
					sensor_disp <= '0';
					espera <= '1';
					cuenta <= (others => '0');
				else
					sensor_disp <= '1';
					cuenta <= cuenta+1;
				end if;
			elsif eco_pasado = '0' and eco_sinc = '1' then
				cuenta <= (others => '0');
				centimetros <= (others => '0');
				centimetros_unid <= (others => '0');
				centimetros_dece <= (others => '0');
			elsif eco_pasado = '1' and eco_sinc = '0' then
				sal_unid <= centimetros_unid;
				sal_dece <= centimetros_dece;
			elsif cuenta = 2900-1 then
				if centimetros_unid = 9 then
					centimetros_unid <= (others => '0');
					centimetros_dece <= centimetros_dece + 1; 
				else
					centimetros_unid <= centimetros_unid + 1; 
				end if;
				centimetros <= centimetros + 1;
				cuenta<= (others => '0');
				if centimetros = 3448 then
					espera <= '0';
				end if;
			else
				cuenta <= cuenta + 1;
			end if;
			eco_pasado<= eco_sinc;
			eco_sinc <= eco_nsinc;
			eco_nsinc <= sensor_eco;
		end if;
	end process;
	
	
	
	Decodificador: process (digito)
   begin
      if reversa = '0' then segmentos <= "11111111";   
		elsif digito=X"0" then segmentos <= "01000000";
      elsif digito=X"1" then segmentos <= "01111001";
      elsif digito=X"2" then segmentos <= "00100100";
      elsif digito=X"3" then segmentos <= "00110000";
      elsif digito=X"4" then segmentos <= "00011001";
      elsif digito=X"5" then segmentos <= "00010010";
      elsif digito=X"6" then segmentos <= "00000010";
      elsif digito=X"7" then segmentos <= "01111000";
      elsif digito=X"8" then segmentos <= "00000000";
      elsif digito=X"9" then segmentos <= "00011000";
      elsif digito=X"a" then segmentos <= "00001000";
      elsif digito=X"b" then segmentos <= "00000011";
      elsif digito=X"c" then segmentos <= "01000110";
      elsif digito=X"d" then segmentos <= "00100001";
      elsif digito=X"e" then segmentos <= "00000110";
      else  segmentos<= "00001110";
      end if;
   end process;
	
	Decodificador2: process (digito2)
   begin
      if reversa = '0' then segmentos2 <= "11111111";   
		elsif digito2=X"0" then segmentos2 <= "01000000";
      elsif digito2=X"1" then segmentos2 <= "01111001";
      elsif digito2=X"2" then segmentos2 <= "00100100";
      elsif digito2=X"3" then segmentos2 <= "00110000";
      elsif digito2=X"4" then segmentos2 <= "00011001";
      elsif digito2=X"5" then segmentos2 <= "00010010";
      elsif digito2=X"6" then segmentos2 <= "00000010";
      elsif digito2=X"7" then segmentos2 <= "01111000";
      elsif digito2=X"8" then segmentos2 <= "00000000";
      elsif digito2=X"9" then segmentos2 <= "00011000";
      elsif digito2=X"a" then segmentos2 <= "00001000";
      elsif digito2=X"b" then segmentos2 <= "00000011";
      elsif digito2=X"c" then segmentos2 <= "01000110";
      elsif digito2=X"d" then segmentos2 <= "00100001";
      elsif digito2=X"e" then segmentos2 <= "00000110";
      else  segmentos2<= "00001110";
		end if;
   end process;
	
end arqsonicos;