----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2024 05:10:39 PM
-- Design Name: 
-- Module Name: test_top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_top is
--  Port ( );
end test_top;

architecture Behavioral of test_top is

component top is
    Port ( clk_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           TXD_o : out STD_LOGIC;
           ld0 : out STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk_i : STD_LOGIC := '0';
signal RXD_i : STD_LOGIC;
signal TXD_o : STD_LOGIC;
signal ld0 : STD_LOGIC;
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0);
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);

constant nbits : integer := 21;
constant transmission: STD_LOGIC_VECTOR(nbits-1 downto 0) := "10" & "10000010" & "10" & "10110000" & "1";

begin
	clk_i <= not clk_i after 5 ns;
	topc: top Port map(
		clk_i => clk_i,
		RXD_i => RXD_i,
		TXD_o => TXD_o,
		ld0 => ld0,
		led7_an_o => led7_an_o,
		led7_seg_o => led7_seg_o
	);
	
	process begin
	wait for 10ms;
	for i in nbits-1 downto 0 loop
		RXD_i <= transmission(i);
		wait for 104.16 us; -- 1/9600 sec
	end loop;
	wait;
	end process;

end Behavioral;
