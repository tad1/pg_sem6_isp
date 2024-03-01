----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 07:03:49 PM
-- Design Name: 
-- Module Name: top_sim - Behavioral
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

entity top_sim is
--  Port ( );
end top_sim;

architecture Behavioral of top_sim is

component top is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;


signal clk_i: STD_LOGIC := '0';
signal btn_i :STD_LOGIC_VECTOR(3 downto 0);
signal sw_i : STD_LOGIC_VECTOR(7 downto 0) := "10100100";
signal led7_an_o: STD_LOGIC_VECTOR (3 downto 0);
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);

begin

topc: top port map(
	clk_i => clk_i,
	btn_i => btn_i,
	sw_i => sw_i,
	led7_an_o => led7_an_o,
	led7_seg_o => led7_seg_o
);
	
clk_i <= not clk_i after 5 ns;


btns: process is
begin
	for i in 0 to 3 loop
		btn_i(i) <= '1';
		wait for 1 ms;
		btn_i(i) <= '0';
		wait for 2 ms;
	end loop;
	wait;
end process;

test: process is
begin
	-- 1 + 2
	wait for 2 ms;
	sw_i(3 downto 0) <= "1011";
	wait for 0.6 ms;
	sw_i(7 downto 4) <= "1001";
	wait for 2.4 ms;
	sw_i(3 downto 0) <= "0001";
	wait for 0.5 ms;
	sw_i(7 downto 5) <= "011";
	wait for 2.5 ms;
	sw_i(3 downto 0) <= "1101";
	wait;
end process;

end Behavioral;
