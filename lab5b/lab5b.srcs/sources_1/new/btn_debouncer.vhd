----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2024 09:47:53 AM
-- Design Name: 
-- Module Name: btn_debouncer - Behavioral
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

entity btn_debouncer is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC;
           sig_o : out STD_LOGIC);
end btn_debouncer;

architecture Behavioral of btn_debouncer is
	signal prev_sig : STD_LOGIC := '0';
begin
	process begin
	wait until rising_edge(clk_i);
		if(prev_sig = btn_i) then
			sig_o <= btn_i;
		end if;
		prev_sig <= btn_i;
	end process;

end Behavioral;
