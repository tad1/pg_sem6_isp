----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 09:45:14 PM
-- Design Name: 
-- Module Name: test_sig_acc - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_sig_acc is
--  Port ( );
end test_sig_acc;

architecture Behavioral of test_sig_acc is

signal clk_i : STD_LOGIC := '0';
signal sig : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal sig_o : STD_LOGIC_VECTOR(2 downto 0) := "000";
component sig_acc is
	Generic (value : unsigned(31 downto 0));
    Port ( clk_i : in STD_LOGIC;
           sig_i : in STD_LOGIC;
           sig_o : out STD_LOGIC);
end component;

begin
	clk_i <= not clk_i after 5ns;
	sig(1) <= not sig(1) after 50ns;
	sig(2) <= not sig(2) after 50ns;
	gate1: sig_acc generic map(value => to_unsigned(2, 32))
		port map(
			clk_i => clk_i,
			sig_i => sig(0),
			sig_o => sig_o(0)
		);
		
	gate2: sig_acc generic map(value => to_unsigned(2, 32))
	port map(
		clk_i => clk_i,
		sig_i => sig(1),
		sig_o => sig_o(1)
	);
	
	gate3: sig_acc generic map(value => to_unsigned(5, 32))
		port map(
			clk_i => clk_i,
			sig_i => sig(2),
			sig_o => sig_o(2)
		);

	sig1: process begin
		sig(0) <= not sig(0);
		wait for 5ns;
		sig(0) <= not sig(0);
		wait for 5ns;
		sig(0) <= not sig(0);
		wait for 10ns;
		sig(0) <= not sig(0);
		wait for 20ns;
		sig(0) <= not sig(0);
		wait for 50ns;
	end process;
end Behavioral;
