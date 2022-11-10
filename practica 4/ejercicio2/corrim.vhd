library ieee;
use ieee.std_logic_1164.all;

entity corrim is
port(clk: in std_logic;
		s:in std_logic_vector(8 downto 0);
		led: out std_logic_vector(8 downto 0));
end entity;

architecture a of corrim is
subtype state is std_logic_vector(3 downto 0);
signal present_state, next_state: state;
constant e0: state:= "0000";
constant e1: state:= "0001";
constant e2: state:= "0010";
constant e3: state:= "0011";
constant e4: state:= "0100";
constant e5: state:= "0101";
constant e6: state:= "0110";
constant e7: state:= "0111";
constant e8: state:= "1000";

begin
	process(clk)
	begin
		if rising_edge(clk) then
			present_state <= next_state;
		end if;
	end process;

	process(present_state)
	begin
		case present_state is 
			when e0 => 
				next_state <= e1;
				led <= s;
			when e1 => 
				next_state <= e2;
				led <= s(7 downto 0) & s(8);
			when e2 => 
				next_state <= e3;
				led <= s(6 downto 0) & s(8 downto 7);
			when e3 => 
				next_state <= e4;
				led <= s(5 downto 0) & s(8 downto 6);
			when e4 => 
				next_state <= e5;
				led <= s(4 downto 0) & s(8 downto 5);
			when e5 => 
				next_state <= e6;
				led <= s(3 downto 0) & s(8 downto 4);
			when e6 => 
				next_state <= e7;
				led <= s(2 downto 0) & s(8 downto 3);
			when e7 => 
				next_state <= e8;
				led <= s(1 downto 0) & s(8 downto 2);
			when others => 
				next_state <= e0;
				led <= s(0) & s(8 downto 1);
		end case;
	end process;
end;