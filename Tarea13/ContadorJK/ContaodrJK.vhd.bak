library ieee;
use ieee.std_logic_1164.all;

Entity Contador is
Port( clk, reset: in std_logic;
		 salMoore: out std_logic_vector(2 downto 0)
);
End Entity;

Architecture arqConta of Contador is
subtype state is std_logic_vector(2 downto 0);
signal present_state, next_state: state;

constant e0: state:="000";
constant e1: state:="001";
constant e2: state:="010";
constant e3: state:="011";
constant e4: state:="100";
constant e5: state:="101";
constant e6: state:="110";
constant e7: state:="111";

Begin
	Process(clk)
	Begin
		if rising_edge(clk) then
			if(reset='1') then
				present_state<=e0;
			else
				present_state<=next_state;
			End if;
		End if;
	End Process;

	Process(present_state)
	Begin
		case present_state is
			when e0=> next_state <= e1;
			when e1=> next_state <= e2;
			when e2=> next_state <= e3;
			when e3=> next_state <= e4;
			when e4=> next_state <= e5;
			when e5=> next_state <= e6;
			when e6=> next_state <= e7;
			when others=> next_state <= e0;
		End case;
		salMoore<=present_state;
	End Process;
End Architecture;