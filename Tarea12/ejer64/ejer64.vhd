library ieee;
use ieee.std_logic_1164.all;

Entity ejer64 is
Port( clk, reset: in std_logic;
		 salMoore: out std_logic_vector(1 downto 0)
);
End Entity;

Architecture arqEjer64 of ejer64 is
subtype state is std_logic_vector(1 downto 0);
signal present_state, next_state: state;

constant e0: state:="00";
constant e1: state:="01";
constant e2: state:="10";
constant e3: state:="11";

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
			when others=> next_state <= e0;
		End case;
		salMoore<=present_state;
	End Process;
End Architecture;