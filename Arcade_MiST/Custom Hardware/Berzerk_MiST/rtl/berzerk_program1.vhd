library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity berzerk_program1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of berzerk_program1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"F3",X"AF",X"D3",X"4D",X"ED",X"47",X"DB",X"61",X"CB",X"47",X"C2",X"00",X"02",X"DB",X"60",
		X"CB",X"47",X"C2",X"31",X"05",X"DD",X"21",X"41",X"01",X"18",X"68",X"CD",X"7B",X"29",X"90",X"20",
		X"08",X"43",X"6F",X"6E",X"67",X"72",X"61",X"74",X"75",X"6C",X"61",X"74",X"69",X"6F",X"6E",X"73",
		X"20",X"50",X"6C",X"61",X"79",X"65",X"72",X"20",X"00",X"C9",X"CD",X"7B",X"29",X"90",X"10",X"08",
		X"46",X"65",X"6C",X"69",X"63",X"69",X"74",X"61",X"74",X"69",X"6F",X"6E",X"73",X"20",X"61",X"75",
		X"20",X"6A",X"6F",X"75",X"65",X"75",X"72",X"20",X"00",X"C9",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"D3",X"4D",X"F5",X"3A",X"00",X"40",X"B7",X"C2",X"1D",X"05",
		X"F1",X"C3",X"21",X"17",X"05",X"00",X"08",X"A3",X"00",X"01",X"00",X"00",X"0D",X"20",X"FD",X"10",
		X"FB",X"DB",X"66",X"3E",X"01",X"01",X"41",X"01",X"11",X"47",X"82",X"ED",X"41",X"0D",X"ED",X"51",
		X"0C",X"0C",X"ED",X"41",X"0C",X"ED",X"41",X"0C",X"0C",X"0C",X"ED",X"59",X"0E",X"51",X"3D",X"28",
		X"EA",X"01",X"00",X"00",X"0D",X"20",X"FD",X"10",X"FB",X"DB",X"67",X"AF",X"D3",X"40",X"D3",X"50",
		X"DD",X"E9",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"18",X"3B",X"01",X"C0",X"08",X"21",X"00",X"00",X"16",X"08",X"7E",X"09",X"AF",X"ED",X"4F",X"32",
		X"00",X"10",X"15",X"20",X"F5",X"0E",X"7F",X"16",X"20",X"7B",X"E6",X"20",X"47",X"ED",X"78",X"CB",
		X"0B",X"0D",X"15",X"20",X"F4",X"3E",X"80",X"01",X"57",X"80",X"ED",X"79",X"05",X"0D",X"CB",X"0F",
		X"30",X"F8",X"0E",X"47",X"ED",X"79",X"0D",X"CB",X"0F",X"30",X"F9",X"18",X"C5",X"3E",X"01",X"ED",
		X"47",X"1E",X"06",X"DD",X"21",X"00",X"10",X"01",X"00",X"08",X"26",X"00",X"2E",X"FF",X"DD",X"7E",
		X"00",X"57",X"A5",X"6F",X"7A",X"84",X"67",X"DD",X"23",X"0D",X"20",X"F2",X"10",X"F0",X"3A",X"74",
		X"00",X"FE",X"FF",X"28",X"25",X"83",X"D6",X"07",X"F2",X"6F",X"01",X"7D",X"3C",X"28",X"05",X"3E",
		X"FF",X"BC",X"20",X"16",X"7B",X"CB",X"07",X"DA",X"92",X"01",X"1D",X"20",X"CA",X"ED",X"57",X"A7",
		X"20",X"17",X"DD",X"21",X"00",X"00",X"1E",X"80",X"18",X"BD",X"ED",X"57",X"A7",X"C2",X"02",X"01",
		X"18",X"FE",X"DD",X"21",X"99",X"01",X"C3",X"79",X"00",X"2A",X"75",X"00",X"ED",X"4B",X"77",X"00",
		X"36",X"55",X"2B",X"ED",X"A1",X"E2",X"AB",X"01",X"23",X"18",X"F5",X"16",X"AA",X"31",X"FF",X"FF",
		X"ED",X"4B",X"77",X"00",X"7A",X"2F",X"AE",X"20",X"16",X"72",X"2B",X"ED",X"A1",X"EA",X"CC",X"01",
		X"7A",X"FE",X"55",X"28",X"25",X"31",X"01",X"00",X"16",X"55",X"18",X"E4",X"39",X"18",X"E5",X"57",
		X"ED",X"57",X"CB",X"0F",X"38",X"01",X"76",X"1E",X"12",X"7A",X"E6",X"0F",X"CA",X"02",X"01",X"1D",
		X"7A",X"E6",X"F0",X"CA",X"02",X"01",X"1D",X"C3",X"02",X"01",X"ED",X"57",X"CB",X"0F",X"1E",X"20",
		X"D2",X"B1",X"02",X"C3",X"02",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"01",X"48",X"10",X"ED",X"78",X"0C",X"ED",X"78",X"0C",X"ED",X"78",X"0C",X"0C",X"ED",X"78",X"0C",
		X"ED",X"78",X"0C",X"ED",X"78",X"0C",X"3E",X"01",X"ED",X"79",X"01",X"48",X"00",X"ED",X"78",X"0C",
		X"ED",X"78",X"0C",X"ED",X"78",X"21",X"00",X"50",X"11",X"00",X"70",X"06",X"10",X"78",X"3D",X"D3",
		X"4B",X"3E",X"80",X"77",X"12",X"4E",X"CB",X"0F",X"30",X"F9",X"AF",X"DB",X"4E",X"3E",X"08",X"32",
		X"00",X"50",X"32",X"00",X"70",X"AF",X"DB",X"4E",X"23",X"13",X"10",X"E1",X"06",X"0D",X"11",X"00",
		X"A0",X"21",X"FE",X"5F",X"3E",X"80",X"25",X"77",X"4E",X"24",X"37",X"CB",X"15",X"CB",X"14",X"19",
		X"CB",X"0F",X"10",X"F2",X"21",X"11",X"11",X"11",X"11",X"11",X"31",X"00",X"88",X"0E",X"10",X"06",
		X"10",X"E5",X"E5",X"E5",X"E5",X"10",X"FA",X"19",X"F1",X"3B",X"3B",X"0D",X"20",X"F1",X"DB",X"4C",
		X"AF",X"DB",X"4E",X"AF",X"DB",X"61",X"E6",X"02",X"28",X"FE",X"21",X"00",X"50",X"11",X"00",X"70",
		X"3E",X"F0",X"ED",X"47",X"01",X"4B",X"00",X"ED",X"57",X"ED",X"79",X"0E",X"00",X"79",X"70",X"12",
		X"48",X"2F",X"46",X"47",X"B1",X"20",X"F6",X"ED",X"57",X"D6",X"10",X"ED",X"47",X"20",X"E5",X"18",
		X"FE",X"DD",X"21",X"B8",X"02",X"C3",X"79",X"00",X"21",X"FF",X"5F",X"11",X"00",X"00",X"DD",X"21",
		X"C5",X"02",X"C3",X"95",X"03",X"01",X"00",X"00",X"21",X"00",X"40",X"DD",X"21",X"D2",X"02",X"C3",
		X"76",X"03",X"21",X"00",X"40",X"11",X"55",X"00",X"DD",X"21",X"DF",X"02",X"C3",X"95",X"03",X"21",
		X"FF",X"5F",X"11",X"AA",X"55",X"DD",X"21",X"EC",X"02",X"C3",X"95",X"03",X"21",X"00",X"40",X"11",
		X"FF",X"AA",X"DD",X"21",X"F9",X"02",X"C3",X"95",X"03",X"21",X"FF",X"5F",X"11",X"00",X"FF",X"DD",
		X"21",X"06",X"03",X"C3",X"95",X"03",X"79",X"B0",X"C2",X"C1",X"03",X"DD",X"21",X"12",X"03",X"C3",
		X"79",X"00",X"21",X"FF",X"87",X"11",X"00",X"00",X"DD",X"21",X"1F",X"03",X"C3",X"95",X"03",X"01",
		X"00",X"00",X"21",X"00",X"80",X"DD",X"21",X"2C",X"03",X"C3",X"76",X"03",X"21",X"00",X"84",X"DD",
		X"21",X"36",X"03",X"C3",X"76",X"03",X"21",X"00",X"80",X"11",X"55",X"00",X"DD",X"21",X"43",X"03",
		X"C3",X"8F",X"03",X"21",X"FF",X"87",X"11",X"AA",X"55",X"DD",X"21",X"50",X"03",X"C3",X"8F",X"03",
		X"21",X"00",X"80",X"11",X"FF",X"AA",X"DD",X"21",X"5D",X"03",X"C3",X"8F",X"03",X"21",X"FF",X"87",
		X"11",X"00",X"FF",X"DD",X"21",X"6A",X"03",X"C3",X"8F",X"03",X"79",X"B0",X"C2",X"6C",X"03",X"DD",
		X"21",X"42",X"04",X"C3",X"79",X"00",X"16",X"00",X"72",X"7E",X"AA",X"B0",X"47",X"23",X"72",X"7E",
		X"AA",X"B1",X"4F",X"2B",X"15",X"C2",X"78",X"03",X"36",X"00",X"23",X"36",X"00",X"DD",X"E9",X"D9",
		X"01",X"00",X"08",X"18",X"04",X"D9",X"01",X"00",X"20",X"D9",X"7E",X"AA",X"B0",X"47",X"73",X"7E",
		X"AB",X"B0",X"47",X"CB",X"43",X"C2",X"AA",X"03",X"2B",X"3E",X"23",X"78",X"41",X"4F",X"D9",X"0D",
		X"C2",X"B7",X"03",X"05",X"CA",X"BB",X"03",X"D9",X"C3",X"9A",X"03",X"D9",X"78",X"41",X"4F",X"DD",
		X"E9",X"21",X"22",X"04",X"11",X"01",X"00",X"78",X"A2",X"C2",X"E8",X"03",X"79",X"A3",X"C3",X"E8",
		X"03",X"EB",X"29",X"EB",X"D2",X"C7",X"03",X"11",X"00",X"40",X"1D",X"FD",X"7E",X"00",X"C2",X"DA",
		X"03",X"15",X"C2",X"DA",X"03",X"C3",X"B8",X"02",X"08",X"7E",X"23",X"D9",X"6F",X"D9",X"7E",X"23",
		X"D9",X"67",X"11",X"1F",X"00",X"06",X"03",X"08",X"B7",X"28",X"07",X"36",X"FC",X"23",X"36",X"3F",
		X"18",X"05",X"36",X"84",X"23",X"36",X"21",X"19",X"10",X"EE",X"06",X"24",X"B7",X"28",X"07",X"36",
		X"FF",X"23",X"36",X"FF",X"18",X"05",X"36",X"80",X"23",X"36",X"01",X"19",X"10",X"EE",X"D9",X"C3",
		X"D1",X"03",X"8D",X"50",X"4D",X"4A",X"0D",X"44",X"CD",X"56",X"15",X"44",X"55",X"4A",X"95",X"50",
		X"D5",X"56",X"89",X"50",X"49",X"4A",X"09",X"44",X"C9",X"56",X"11",X"44",X"51",X"4A",X"91",X"50",
		X"D1",X"56",X"21",X"00",X"60",X"16",X"01",X"42",X"AF",X"4F",X"5F",X"ED",X"47",X"ED",X"57",X"D3",
		X"4B",X"36",X"FF",X"72",X"36",X"00",X"7E",X"BB",X"20",X"FE",X"ED",X"57",X"3C",X"ED",X"47",X"FE",
		X"10",X"20",X"0B",X"CB",X"12",X"30",X"E0",X"DD",X"21",X"87",X"04",X"C3",X"79",X"00",X"79",X"CB",
		X"1F",X"CB",X"18",X"CB",X"19",X"59",X"ED",X"57",X"FE",X"08",X"38",X"D1",X"3E",X"08",X"CB",X"08",
		X"CB",X"13",X"3D",X"20",X"F9",X"18",X"C6",X"1E",X"00",X"DD",X"21",X"CA",X"04",X"21",X"00",X"60",
		X"01",X"01",X"01",X"7B",X"D3",X"4B",X"78",X"32",X"00",X"40",X"71",X"79",X"DD",X"E9",X"AE",X"20",
		X"FE",X"77",X"78",X"A1",X"28",X"02",X"3E",X"80",X"57",X"DB",X"4E",X"AA",X"17",X"38",X"FE",X"CB",
		X"00",X"30",X"E0",X"CB",X"01",X"30",X"DC",X"DD",X"23",X"DD",X"23",X"DD",X"23",X"3E",X"10",X"83",
		X"5F",X"30",X"D0",X"DD",X"21",X"FA",X"04",X"C3",X"79",X"00",X"00",X"18",X"D1",X"B0",X"18",X"CE",
		X"2F",X"18",X"18",X"AF",X"18",X"21",X"A0",X"18",X"C5",X"78",X"18",X"C2",X"A8",X"18",X"18",X"2F",
		X"18",X"EB",X"2F",X"18",X"0F",X"A8",X"18",X"B6",X"78",X"18",X"0C",X"A0",X"18",X"09",X"AF",X"18",
		X"AD",X"2F",X"18",X"E2",X"B0",X"18",X"00",X"2F",X"18",X"A4",X"ED",X"5E",X"3E",X"07",X"ED",X"47",
		X"DD",X"21",X"02",X"16",X"3E",X"FF",X"D3",X"4F",X"47",X"31",X"FF",X"43",X"DB",X"4E",X"1F",X"CB",
		X"10",X"78",X"EE",X"55",X"28",X"03",X"FB",X"18",X"FE",X"D3",X"4F",X"06",X"FF",X"31",X"FF",X"43",
		X"DB",X"4D",X"DB",X"4E",X"1F",X"CB",X"10",X"78",X"EE",X"20",X"CA",X"79",X"00",X"DB",X"4C",X"18",
		X"FE",X"31",X"00",X"44",X"CD",X"4E",X"1A",X"CD",X"F8",X"35",X"21",X"B9",X"05",X"11",X"20",X"00",
		X"CD",X"91",X"05",X"11",X"20",X"80",X"CD",X"91",X"05",X"11",X"08",X"10",X"CD",X"91",X"05",X"11",
		X"10",X"D0",X"CD",X"91",X"05",X"21",X"A0",X"47",X"CD",X"45",X"1A",X"21",X"A0",X"55",X"CD",X"45",
		X"1A",X"11",X"08",X"20",X"DB",X"61",X"CD",X"97",X"05",X"DB",X"60",X"CD",X"97",X"05",X"DB",X"62",
		X"CD",X"97",X"05",X"DB",X"63",X"CD",X"97",X"05",X"DB",X"64",X"CD",X"97",X"05",X"11",X"08",X"90",
		X"DB",X"48",X"CD",X"96",X"05",X"DB",X"49",X"CD",X"96",X"05",X"DB",X"4A",X"CD",X"96",X"05",X"18",
		X"D0",X"06",X"00",X"C3",X"B8",X"06",X"2F",X"0E",X"08",X"21",X"01",X"06",X"1F",X"38",X"03",X"21",
		X"03",X"06",X"F5",X"D5",X"C5",X"CD",X"91",X"05",X"C1",X"D1",X"F1",X"21",X"20",X"00",X"19",X"EB",
		X"0D",X"20",X"E6",X"21",X"00",X"0F",X"19",X"EB",X"C9",X"5A",X"50",X"55",X"20",X"44",X"49",X"50",
		X"20",X"53",X"57",X"49",X"54",X"43",X"48",X"45",X"53",X"00",X"56",X"46",X"42",X"20",X"53",X"57",
		X"49",X"54",X"43",X"48",X"45",X"53",X"00",X"31",X"20",X"20",X"20",X"32",X"20",X"20",X"20",X"33",
		X"20",X"20",X"20",X"34",X"20",X"20",X"20",X"35",X"20",X"20",X"20",X"36",X"20",X"20",X"20",X"37",
		X"20",X"20",X"20",X"38",X"00",X"30",X"3D",X"4F",X"46",X"46",X"20",X"20",X"7F",X"3D",X"4F",X"4E",
		X"00",X"7F",X"00",X"30",X"00",X"AF",X"D3",X"4F",X"DB",X"4E",X"31",X"00",X"43",X"DB",X"65",X"CB",
		X"7F",X"20",X"FA",X"CD",X"4E",X"1A",X"CD",X"3D",X"36",X"F3",X"21",X"CC",X"06",X"7E",X"B7",X"CA",
		X"02",X"16",X"CD",X"9A",X"06",X"06",X"00",X"11",X"00",X"CF",X"CD",X"B8",X"06",X"CD",X"9A",X"06",
		X"E5",X"5E",X"23",X"56",X"23",X"46",X"23",X"E5",X"21",X"00",X"00",X"E5",X"E5",X"E5",X"39",X"CD",
		X"73",X"06",X"11",X"CF",X"00",X"CD",X"8D",X"06",X"E1",X"E1",X"E1",X"E1",X"E3",X"DB",X"65",X"CB",
		X"7F",X"20",X"16",X"DB",X"48",X"CB",X"67",X"20",X"F4",X"E5",X"5E",X"23",X"56",X"23",X"46",X"AF",
		X"12",X"13",X"10",X"FC",X"E1",X"D1",X"C3",X"30",X"06",X"E1",X"DB",X"65",X"CB",X"7F",X"20",X"FA",
		X"C3",X"1D",X"06",X"E5",X"D5",X"C5",X"1A",X"13",X"E6",X"F0",X"4F",X"1A",X"13",X"07",X"07",X"07",
		X"07",X"E6",X"0F",X"B1",X"77",X"23",X"05",X"10",X"ED",X"C1",X"D1",X"E1",X"C9",X"C5",X"D5",X"E5",
		X"53",X"1E",X"00",X"CD",X"40",X"2A",X"E1",X"D1",X"C1",X"C9",X"C5",X"D5",X"E5",X"01",X"C0",X"19",
		X"11",X"00",X"44",X"21",X"00",X"46",X"ED",X"B0",X"01",X"00",X"02",X"AF",X"12",X"13",X"0D",X"C2",
		X"AC",X"06",X"10",X"F8",X"E1",X"D1",X"C1",X"C9",X"EB",X"CD",X"A3",X"29",X"EB",X"4E",X"CD",X"DB",
		X"29",X"13",X"23",X"47",X"7E",X"B7",X"78",X"C2",X"BD",X"06",X"23",X"C9",X"43",X"72",X"65",X"64",
		X"69",X"74",X"73",X"00",X"A4",X"08",X"02",X"43",X"68",X"75",X"74",X"65",X"20",X"31",X"00",X"A6",
		X"08",X"08",X"43",X"68",X"75",X"74",X"65",X"20",X"32",X"00",X"AE",X"08",X"08",X"43",X"68",X"75",
		X"74",X"65",X"20",X"33",X"00",X"B6",X"08",X"08",X"50",X"6C",X"61",X"79",X"73",X"00",X"BE",X"08",
		X"06",X"54",X"6F",X"74",X"61",X"6C",X"20",X"53",X"63",X"6F",X"72",X"65",X"00",X"C4",X"08",X"0C",
		X"54",X"6F",X"74",X"61",X"6C",X"20",X"53",X"65",X"63",X"6F",X"6E",X"64",X"73",X"20",X"6F",X"66",
		X"20",X"50",X"6C",X"61",X"79",X"00",X"D0",X"08",X"0C",X"48",X"69",X"67",X"68",X"20",X"53",X"63",
		X"6F",X"72",X"65",X"73",X"00",X"DC",X"08",X"06",X"00",X"F3",X"21",X"00",X"44",X"54",X"5D",X"36",
		X"01",X"23",X"73",X"23",X"01",X"FD",X"1B",X"EB",X"ED",X"B0",X"21",X"00",X"45",X"54",X"5D",X"06",
		X"20",X"36",X"FF",X"23",X"10",X"FB",X"01",X"80",X"02",X"09",X"EB",X"01",X"7F",X"18",X"ED",X"B0",
		X"CD",X"F8",X"35",X"CD",X"86",X"07",X"21",X"00",X"44",X"11",X"01",X"44",X"01",X"FF",X"1B",X"36",
		X"FF",X"ED",X"B0",X"21",X"00",X"81",X"11",X"01",X"81",X"01",X"FF",X"06",X"36",X"11",X"ED",X"B0",
		X"CD",X"86",X"07",X"C3",X"3A",X"07",X"DB",X"48",X"CB",X"67",X"20",X"FA",X"DB",X"48",X"CB",X"67",
		X"28",X"FA",X"C9",X"CD",X"7B",X"29",X"90",X"08",X"20",X"59",X"6F",X"75",X"20",X"68",X"61",X"76",
		X"65",X"20",X"6A",X"6F",X"69",X"6E",X"65",X"64",X"20",X"74",X"68",X"65",X"20",X"69",X"6D",X"6D",
		X"6F",X"72",X"74",X"61",X"6C",X"73",X"00",X"CD",X"7B",X"29",X"90",X"0C",X"30",X"69",X"6E",X"20",
		X"74",X"68",X"65",X"20",X"42",X"45",X"52",X"5A",X"45",X"52",X"4B",X"20",X"68",X"61",X"6C",X"6C",
		X"20",X"6F",X"66",X"20",X"66",X"61",X"6D",X"65",X"00",X"CD",X"7B",X"29",X"90",X"18",X"50",X"45",
		X"6E",X"74",X"65",X"72",X"20",X"79",X"6F",X"75",X"72",X"20",X"69",X"6E",X"69",X"74",X"69",X"61",
		X"6C",X"73",X"3A",X"00",X"C9",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"09",X"05",X"17",X"05");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
