----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 07:50:00 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

component top is
    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

-- it appears that `signal` keyword is required here, but optional in `Port()`
signal sw_i : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0); 
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);

begin

	dut: top port map(
		sw_i => sw_i,
		led7_an_o => led7_an_o,
		led7_seg_o => led7_seg_o);
	
	stin: process
	begin
		wait for 100 ns;
		sw_i <= "00000001";
		wait for 100 ns;
		sw_i <= "00000011";
		wait for 100 ns;
		sw_i <= "00000111";
		wait for 100 ns;
		sw_i <= "00001111";
		wait for 100 ns;
		sw_i <= "00011111";
		wait for 100 ns;
		sw_i <= "00111111";
		wait for 100 ns;
		sw_i <= "01111111";
		wait for 100 ns;
		sw_i <= "11111111";
		
	
--		for x in 0 to 255 loop
--			wait for 100 ns;
--			sw_i <= std_logic_vector(to_unsigned(x, 8));
--		end loop;
		
	end process;

end Behavioral;
