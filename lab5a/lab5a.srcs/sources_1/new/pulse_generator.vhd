----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2024 03:49:01 PM
-- Design Name: 
-- Module Name: pulse_generator - Behavioral
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

entity pulse_generator is
    Port ( clk : in STD_LOGIC;
           signal_i : in STD_LOGIC;
           pulse_o : out STD_LOGIC);
end pulse_generator;

architecture Behavioral of pulse_generator is
signal prev_sig : STD_LOGIC := '0';
begin
	
	process(signal_i, clk) is
	begin
		if signal_i /= prev_sig then
			pulse_o <= '1';
		elsif rising_edge(clk) then
			pulse_o <= '0';
		end if;
		prev_sig <= signal_i;
	end process;

end Behavioral;
