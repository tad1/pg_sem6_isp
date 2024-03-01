----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 07:41:10 PM
-- Design Name: 
-- Module Name: tb_clk_div - Behavioral
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

entity tb_clk_div is
--  Port ( );
end tb_clk_div;

architecture Behavioral of tb_clk_div is

component clk_div is
	Generic(divisior : integer);
    Port ( clk_i : in STD_LOGIC;
    		rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC);
end component;

constant test_size : integer := 5;
signal clk_i : STD_LOGIC := '0';
signal clk_o : STD_LOGIC_VECTOR(test_size downto 0);

begin
clk_i <= not clk_i after 5 ns;

--G: for i in 1 to test_size generate
--	clk_divc: clk_div 
--	generic map(divisior => i*2)
--	port map(
--		clk_i => clk_i,
--		rst_i => '0',
--		clk_o => clk_o(i)
--	); 
--end generate;

	clk_divc: clk_div 
generic map(divisior => 100_000)
port map(
	clk_i => clk_i,
	rst_i => '0',
	clk_o => clk_o(0)
); 

end Behavioral;
