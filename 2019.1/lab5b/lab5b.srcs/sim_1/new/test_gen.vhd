----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 08:30:59 PM
-- Design Name: 
-- Module Name: test_gen - Behavioral
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

entity test_gen is
--  Port ( );
end test_gen;

architecture Behavioral of test_gen is

component generator is
    Port ( 
    		clk : in STD_LOGIC;
    		value : in STD_LOGIC_VECTOR (7 downto 0);
           x_freq_set : in STD_LOGIC;
           y_freq_set : in STD_LOGIC;
           y_offset_set : in STD_LOGIC;
           areset : in STD_LOGIC;
           x_val : out STD_LOGIC_VECTOR (10 downto 0);
           y_val : out STD_LOGIC_VECTOR (10 downto 0);
           ready: out STD_LOGIC
           );
end component;
signal x_val : STD_LOGIC_VECTOR (10 downto 0);
signal y_val : STD_LOGIC_VECTOR (10 downto 0);
signal ready: STD_LOGIC;
signal clk : STD_LOGIC := '0';

signal value : STD_LOGIC_VECTOR(7 downto 0);
signal x_freq_set : STD_LOGIC := '0';
signal y_freq_set : STD_LOGIC := '0';
signal y_offset_set : STD_LOGIC := '0';
begin
	clk <= not clk after 5ns;
	
	genc: generator Port map(
		clk => clk,
		value => value,
		x_freq_set => x_freq_set,
		y_freq_set => y_freq_set,
		y_offset_set => y_offset_set,
		areset => '0',
		x_val => x_val,
		y_val => y_val,
		ready => ready
	);
	
	process begin
	wait for 200us;
	wait for 2ns;

	value <= "00001111";
	y_freq_set <= '1';
	wait for 10ns;
	y_freq_set <= '0';
	wait for 60us;
	value <= "10000000";
	y_offset_set <= '1';
	wait for 10ns;
	y_offset_set <= '0';
	wait for 50us;
	value <= "00000011";
	x_freq_set <= '1';
	wait for 10ns;
	x_freq_set <= '0';

	wait;
	end process;

end Behavioral;
