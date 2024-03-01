----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2024 07:15:12 PM
-- Design Name: 
-- Module Name: em - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Endoder With Memory
entity ewm is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0) := "0000";
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           digit_i : out STD_LOGIC_VECTOR (31 downto 0));
end ewm;

-- on falling edge?
-- btn_i(3) - BTNL - set sw_3-sw_0 and display on AN3
-- btn_i(2) - BTNC - set sw_3-sw_0 and display on AN2
-- btn_i(1) - BTNR - set sw_3-sw_0 and display on AN1
-- btn_i(0) - BTND - set sw_3-sw_0 and display on AN0

-- sw_3 - sw_0 - 4 bit hex number
-- sw_7 -> sw_4 - DP dot on AN3-AN0 (no button required)

-- digit_i - 4 leds with 8 segments - digit(0) is AN0 DP

architecture Behavioral of ewm is

begin

-- if btn_i(0) is clicked 
-- 		set current sw_i to digit_i(?
demux: process(clk_i) is
	variable values : STD_LOGIC_VECTOR (7 downto 1);
begin

	case sw_i(3 downto 0) is
		when "0000" => values := "0000001";
		when "0001" => values := "1001111";
		when "0010" => values := "0010010";
		when "0011" => values := "0110000";
		when "0100" => values := "1001100";
		when "0101" => values := "0101100";
		when "0110" => values := "0100000";
		when "0111" => values := "0001111";
		when "1000" => values := "0000000";
		when "1001" => values := "0001000";
		when "1010" => values := "0001000";
		when "1011" => values := "1100000";
		when "1100" => values := "0110001";
		when "1101" => values := "1000010";
		when "1110" => values := "0110000";
		when "1111" => values := "0111000";
		when others => values := "XXXXXXX";
	end case;
			
	if btn_i(0) = '1' then
		digit_i(7 downto 1) <= values;
	end if;
	
	if btn_i(1) = '1' then
		digit_i(15 downto 9) <= values;
	end if;
	
	if btn_i(2) = '1' then
		digit_i(23 downto 17) <= values;
	end if;
	
	if btn_i(3) = '1' then
		digit_i(31 downto 25) <= values;
	end if;

end process demux;

digit_i(0) <= sw_i(4);
digit_i(8) <= sw_i(5);
digit_i(16) <= sw_i(6);
digit_i(24) <= sw_i(7);
	
end Behavioral;
