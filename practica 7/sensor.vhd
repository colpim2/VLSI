library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sensor is 
port(clk: in std_logic;
dis: out std_logic;
echo: in std_logic;
display0,display1: out std_logic_vector(6 downto 0)
);
end entity;

architecture arqsensor of sensor is 

   function numero(digito: unsigned) return std_logic_vector is 
	variable hex:std_logic_vector(0 to 6);
	begin 
	    case digito is 
		    when x"0"=> hex:="1000000";
			 when x"1"=> hex:="1111001";
			 when x"2"=> hex:="0100100";
			 when x"3"=> hex:="0110000";
			 when x"4"=> hex:="0011001";
			 when x"5"=> hex:="0010010";
			 when x"6"=> hex:="0000010";
			 when x"7"=> hex:="1111000";                
			 when x"8"=> hex:="0000000";
			 when x"9"=> hex:="0011000";	  
			 when others => null;
			end case;
		 return(hex);
	end numero;
		 
		 signal cuenta: unsigned(16 downto 0) := (others => '0');
		 
		 signal centimetros: unsigned(15 downto 0) := (others => '0');
		 signal centimetros_unid: unsigned(3 downto 0) := (others => '0');
		 signal centimetros_dece: unsigned(3 downto 0) := (others => '0');
		 
		 signal sal_unid: unsigned(3 downto 0) := (others => '0');
		 signal sal_dece: unsigned(3 downto 0) := (others => '0');
		 
		 signal digito: unsigned(3 downto 0) := (others => '0');
		 
		 signal eco_pasado:std_logic := '0';
		 signal eco_sinc:std_logic := '0';
		 signal eco_nsinc:std_logic := '0';
		 
		 signal espera:std_logic := '0';
		 
		 signal siete_seg_cuenta: unsigned(15 downto 0) := (others => '0');
begin

       siete_seg: process(clk) begin
		 if rising_edge(clk) then 
		 if siete_seg_cuenta(siete_seg_cuenta'high)='1' then
		    digito <= sal_unid;
		    display0 <= numero(digito);
		 else 
		    digito <=sal_dece;
			 display1 <= numero(digito);
		 end if;
		 siete_seg_cuenta <= siete_seg_cuenta+1;
		 end if;
		 
		 if sal_unid<10 and sal_dece=0 then
		    display1 <= "1111111";
			 display0 <= "0100100";
		 end if;
	end process;
	
	Trigger: process(clk) begin 
	   if rising_edge(clk) then 
		
		if espera = '0' then 
		  if cuenta = 500 then
		     dis <= '0';
			  espera <=  '1';
			  cuenta <= (others => '0');
			else 
		      dis <= '1';
				cuenta <= cuenta+1;
			end if;
			
		elsif eco_pasado = '0' and eco_sinc ='1' then
		    cuenta <= (others => '0');
			 centimetros <= (others => '0');
			 centimetros_unid <= (others => '0');
			 centimetros_dece <= (others => '0');
			 
		 elsif eco_pasado = '1' and eco_sinc = '0' then
		     sal_unid <= centimetros_unid;
			  sal_dece <= centimetros_dece;
			  
		 elsif cuenta= 2900-1 then
		    if centimetros_unid = 9 then
			    centimetros_unid <= (others =>'0');
				 centimetros_dece <= centimetros_dece + 1;
			 else 
			    centimetros_unid <= centimetros_unid + 1;
			 end if;
			 centimetros <= centimetros + 1;
			 cuenta <=(others => '0');
			 if centimetros = 3448 then
			    espera <= '0';
			 end if;
		 else 
		    cuenta <= cuenta +1;
		 end if;
		 
		eco_pasado <= eco_sinc;
		eco_sinc <= eco_nsinc;
		eco_nsinc <= echo;
	end if;
	end process;
end architecture;