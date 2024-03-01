----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2024 05:51:40 PM
-- Design Name: 
-- Module Name: tb_display - Behavioral
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

entity tb_display is
--  Port ( );
end tb_display;

architecture Behavioral of tb_display is

component display is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component display;
signal clk_i : STD_LOGIC := '0';
signal rst_i: STD_LOGIC := '0';
signal digit_i : STD_LOGIC_VECTOR (31 downto 0) := X"12345678";
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0);
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);

begin
	clk_i <= not clk_i after 5 ns;


	disp: display port map(
		clk_i => clk_i,
		rst_i => rst_i,
		digit_i => digit_i,
		led7_an_o => led7_an_o,
		led7_seg_o => led7_seg_o);
		

end Behavioral;
