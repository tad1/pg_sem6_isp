----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2024 04:33:50 PM
-- Design Name: 
-- Module Name: uat_test - Behavioral
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

entity uat_test is
--  Port ( );
end uat_test;

architecture Behavioral of uat_test is
	component uat is
	Port ( clk_i : in STD_LOGIC;
           data_i : in STD_LOGIC_VECTOR (7 downto 0);
           TRX : out STD_LOGIC := '1';
           busy_o : out STD_LOGIC;
           send_i : in STD_LOGIC);
	end component;

signal clk : STD_LOGIC := '0';
signal data : STD_LOGIC_VECTOR(7 downto 0);
signal TRX : STD_LOGIC;
signal busy : STD_LOGIC;
signal send : STD_LOGIC;
begin
	
	uatc: uat
	 Port map(
		clk_i => clk,
		data_i => data,
		TRX => TRX,
		busy_o => busy,
		send_i => send
	);

	clk <= not clk after 5 ms;
	process begin
		data <= "11001010";
		wait for 13ms;
		send <= '1';
		wait for 1 ms;
		send <= '0';
		wait for 10 ms;
		send <= '1';
		wait for 10 ms;
		send <= '0';
		wait;
	end process;

end Behavioral;
