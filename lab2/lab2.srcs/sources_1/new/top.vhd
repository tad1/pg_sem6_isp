----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2024 12:37:03 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is

begin
	proc: process (clk_i, rst_i) is
	variable x: std_logic_vector(2 downto 0);
	begin
		if rst_i = '1' then
			x := "000";
		elsif rising_edge(clk_i) then
			x := x + 1;
		end if;
		led_o <= x xor shr(x,"1");
	end process proc;
-- 0 | 000
-- 1 | 001
-- 2 | 011
-- 3 | 010
-- 4 | 110
-- 5 | 111
-- 6 | 101
-- 7 | 100

end Behavioral;
