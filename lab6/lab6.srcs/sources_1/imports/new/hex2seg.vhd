library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity hex2seg is
    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
           seg_o : out STD_LOGIC_VECTOR (7 downto 0);
           bypas : in STD_LOGIC
           );
end hex2seg;


architecture Behavioral of hex2seg is
signal output : STD_LOGIC_VECTOR (7 downto 0);
begin
with hex_i select 
	output <= 
	"00000011" when "0000", -- 0
	"10011111" when "0001", -- 1
	"00100101" when "0010", -- 2
	"00001101" when "0011", -- 3
	"10011001" when "0100", 
	"01001001" when "0101",
	"01000001" when "0110",
	"00011111" when "0111",
	"00000001" when "1000",
	"00001001" when "1001",
	"00010001" when "1010",
	"11000001" when "1011",
	"11100101" when "1100",
	"10000101" when "1101",
	"01100001" when "1110",
	"01110001" when "1111",
	"XXXXXXXX" when others;

seg_o <= "11111111" when bypas = '1' else output;
end Behavioral;
