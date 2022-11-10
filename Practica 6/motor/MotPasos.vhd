library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MotPasos is
port( clk, ud, rst, f, h: in std_logic;
			 led, mot: out std_logic_vector(3 downto 0)
	  );
end MotPasos;

architecture behavorial of MotPasos is

	--signal div: std_logic_vector(17 downto 0);
	subtype estado is std_logic_vector(3 downto 0);
	signal pres_s, next_s: estado;
	--signal motor: std_logic_vector(3 downto 0);
	constant e0: estado:= "0000";
	constant e1: estado:= "1000";
	constant e2: estado:= "1100";
	constant e3: estado:= "0100";
	constant e4: estado:= "0110";
	constant e5: estado:= "0010";
	constant e6: estado:= "0011";
	constant e7: estado:= "0001";
	constant e8: estado:= "1001";


begin
	
	process(clk, rst)
	begin
		if rst = '1' then
			pres_s <= e0;
		elsif clk'event and clk = '1' then
			pres_s <= next_s;
		end if;
	end process;
	
	process(pres_s, ud, f, h)
	begin
		case(pres_s) is
			when e0 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e1;
				elsif h = '1' then
					next_s <= e8;
				else
					next_s <= e0;
				end if;
			when e1 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e2;
				elsif h = '1' then
					next_s <= e8;
				else
					next_s <= e1;
				end if;
			when e2 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e3;
				elsif h = '1' then
					next_s <= e1;
				else
					next_s <= e1;
				end if;
			when e3 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e4;
				elsif h = '1' then
					next_s <= e2;
				else
					next_s <= e1;
				end if;
			when e4 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e5;
				elsif h = '1' then
					next_s <= e3;
				else
					next_s <= e1;
				end if;
			when e5 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e6;
				elsif h = '1' then
					next_s <= e4;
				else
					next_s <= e1;
				end if;
			when e6 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e7;
				elsif h = '1' then
					next_s <= e5;
				else
					next_s <= e1;
				end if;
			when e7 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e8;
				elsif h = '1' then
					next_s <= e6;
				else
					next_s <= e1;
				end if;
			when e8 =>
				if ud = '1' then
					next_s <= pres_s;
				elsif f = '1' then
					next_s <= e1;
				elsif h = '1' then
					next_s <= e7;
				else
					next_s <= e1;
				end if;
			when others =>
					next_s <= e1;
		end case;
		led <= pres_s;
		mot <= pres_s;
	end process;
	
end architecture;