----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 08:04:57 PM
-- Design Name: 
-- Module Name: test_top - Behavioral
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

entity test_top is
--  Port ( );
end test_top;

architecture Behavioral of test_top is

component top is

    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           button_i : in STD_LOGIC_VECTOR (3 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end component;
	signal clk_i : STD_LOGIC := '0';
	signal button_i : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
begin
	clk_i <= not clk_i after 5ns;
	
	topc: top port map(
		clk_i => clk_i,
		rst_i => '0',
		button_i => button_i,
		led7_an_o => open,
		led7_seg_o => open
	);
	
	buttons: process begin
		wait for 2ms;
			button_i(0) <= '1';
		wait for 1ms; 
			button_i(0) <= '0';
		wait for 1ms;
			button_i(1) <= '1';
		wait for 1ms;
			button_i(1) <= '0';

		wait;
	end process;

end Behavioral;
