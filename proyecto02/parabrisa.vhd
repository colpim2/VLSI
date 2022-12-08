library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Barreiro Valdez Alejandro
--Castillo Montes Pamela
--Fernández Rosales Sebastian
--Medina Segura Fernando
--Zepeda Baeza Jessica

entity parabrisa is 
port (
	clk, rst, rapido, manual, reversa: in std_logic;
	sensor_eco: in STD_LOGIC;
	sensor_disp: out STD_LOGIC;
	control, led1, led2, led3: out std_logic;
	dispu, dispd: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavioral of parabrisa is
	
	signal clkl, clkl2, clkl3: std_logic;
	signal duty,n_rom: integer range 0 to 200;
	
begin
	
	u1: entity work.divf(arqdivf) generic map(500) port map (clk, '0', clkl);
	u2: entity work.divf(arqdivf) generic map(12500000) port map (clk, rapido, clkl2);
	u3: entity work.senal(arqsenal) port map (clkl, duty, control);
	u4: entity work.movimiento(arqmov) port map(clkl2, rst, manual, n_rom);
	u5: entity work.rom(arqromlcd) port map(n_rom, '1', duty);
	u6: entity work.sonicos(arqsonicos) port map(clk, reversa, sensor_disp, sensor_eco, led1, led2, led3, dispu, dispd);
	
end architecture;