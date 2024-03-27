----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 09:38:41 PM
-- Design Name: 
-- Module Name: sig_acc - Behavioral
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

entity sig_acc is
	Generic (value : unsigned(31 downto 0));
    Port ( clk_i : in STD_LOGIC;
           sig_i : in STD_LOGIC;
           sig_o : out STD_LOGIC);
end sig_acc;

architecture Behavioral of sig_acc is
signal prev_sig : STD_LOGIC := '0';
signal accumulator : unsigned(31 downto 0) := to_unsigned(0, 32);
signal res : STD_LOGIC := '0';
begin
	process begin
		wait until rising_edge(clk_i);
		if(prev_sig = sig_i) then
			if(accumulator >= value) then
				res <= sig_i;
			else
				accumulator <= accumulator + 1;
			end if;
		else
			accumulator <= to_unsigned(0, 32);
		end if;
		prev_sig <= sig_i;
	end process;
	sig_o <= res;

end Behavioral;
