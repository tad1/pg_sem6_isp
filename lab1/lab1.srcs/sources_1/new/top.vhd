library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- for XOR_REDUCE
--use IEEE.STD_LOGIC_MISC.XOR_REDUCE;

entity top is
    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
begin
	--			 "3210"
	led7_an_o <= "0111";
	
-- 	both (reduce, and without reduce) approaches yields the same shematics
--	with XOR_REDUCE(sw_i) select
	with ((sw_i(0) xor sw_i(1)) xor (sw_i(2) xor sw_i(3))) xor ((sw_i(4) xor sw_i(5)) xor (sw_i(6) xor sw_i(7))) select
		--				"ABCDEFG."
		led7_seg_o <= 	"00000011" when '1',
						"01100001" when '0';	
	
end Behavioral;