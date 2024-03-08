library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity hex2seg is
    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
           seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end hex2seg;

architecture Behavioral of hex2seg is

begin
with hex_i select 
	seg_o <= 
	"00000011" when "0000",
	"10011111" when "0001",
	"00100101" when "0010",
	"01100001" when "0011",
	"10011001" when "0100",
	"01011001" when "0101",
	"01000001" when "0110",
	"00011111" when "0111",
	"00000001" when "1000",
	"00010001" when "1001",
	"00010001" when "1010",
	"11000001" when "1011",
	"01100011" when "1100",
	"10000101" when "1101",
	"01100001" when "1110",
	"01110001" when "1111",
	"XXXXXXXX" when others;
end Behavioral;
