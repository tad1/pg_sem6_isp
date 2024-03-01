----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2024 05:41:51 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
    Port ( s : in STD_LOGIC;
           x0 : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is

begin
	y <= x1 when ( s = '1') else x0;

end Behavioral;
