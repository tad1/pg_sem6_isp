----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2024 03:54:55 PM
-- Design Name: 
-- Module Name: pulse_test - Behavioral
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

entity pulse_test is
--  Port ( );
end pulse_test;

architecture Behavioral of pulse_test is

	component pulse_generator is
    Port ( clk : in STD_LOGIC;
           signal_i : in STD_LOGIC;
           pulse_o : out STD_LOGIC);
	end component;

signal clk : STD_LOGIC := '0';
signal pulse: STD_LOGIC;
signal sig : STD_LOGIC := '0';
signal read_sig : STD_LOGIC := '0';
begin
	clk <= not clk after 5 ms;
	
	pulse_genc: pulse_generator Port map(
		clk => clk,
		signal_i => sig,
		pulse_o => pulse
	);
	
	process begin
		wait for 1ms;
		sig <= '1';
		wait for 5ms;
		sig <= '1';
		wait for 14ms;
		sig <= '0';
		wait for 10ms;
		sig <= '1';
		wait for 3ms;
		sig <= '0';
		wait for 10ms;
		sig <= '1';
		wait;
	end process;
	
	process(clk) begin
		if rising_edge(clk) then
			read_sig <= pulse;
		end if;
	end process;

end Behavioral;
