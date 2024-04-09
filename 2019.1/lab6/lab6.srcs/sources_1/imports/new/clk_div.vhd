----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 07:26:38 PM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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


-- https://ics.uci.edu/~jmoorkan/vhdlref/generics.html
entity clk_div is
	Generic(divisior : integer);
    Port ( clk_i : in STD_LOGIC;
    		rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC := '0');
end clk_div;

architecture Behavioral of clk_div is

constant max_count: integer := divisior / 2;
signal counter: integer := -1;
begin

proc: process(clk_i, rst_i) is
begin
	if rst_i = '1' then
		counter <= 0;
		clk_o <= '0';
	elsif rising_edge(clk_i) then
		counter <= counter + 1;
		
		if(counter = 2*max_count-1) then
			counter <= 0;
			clk_o <= '0';
		end if;
		if(counter = max_count-1) then
			clk_o <= '1';
		end if;
	end if;
end process;

end Behavioral;
