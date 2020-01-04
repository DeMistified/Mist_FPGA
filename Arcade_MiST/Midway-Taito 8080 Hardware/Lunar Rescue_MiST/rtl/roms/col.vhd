library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity col is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(9 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of col is
	type rom is array(0 to  1023) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1101","1101","1100","1100","1100","1100","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1101","1101","1100","1100","1100","1110","1111","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1101","1101","1100","1100","1011","1110","1111","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1101","1101","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1101","1101","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1101","1101","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1101","1101","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1100","1001","1111","1110","1110",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1110","1110",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1110","1110",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1110","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1001","1001",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1011","1011","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1111","1111","1100","1101","1011","1110","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1111","1111","1100","1100","1011","1110","1111","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1111","1111","1011","1100","1100","1110","1111","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1101",
		"1111","1111","1100","1100","1100","1100","1100","1100","1001","1001","1001","1101","1101","1101","1101","1110",
		"1110","1110","1011","1011","1011","1100","1100","1100","1100","1101","1101","1111","1001","1111","1101","1100");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
