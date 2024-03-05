----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2024 02:20:08 PM
-- Design Name: 
-- Module Name: test_uar - Behavioral
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

entity test_uar is
--  Port ( );
end test_uar;


architecture Behavioral of test_uar is
	component uar is
		Generic(
			data_n : integer;
			sampling_rate: integer
			);
		Port(
			clk_i : in STD_LOGIC;
			RXD_i : in STD_LOGIC;
			ready_o: out STD_LOGIC;
			data_o: out STD_LOGIC_VECTOR(data_n-1 downto 0)
		);
	end component;
	
	signal clk : STD_LOGIC := '1';
	signal clk_r : STD_LOGIC := '1';
	signal RXD: STD_LOGIC := '1';
	signal ready: STD_LOGIC;
	signal data: STD_LOGIC_VECTOR(7 downto 0);
	
	-- send 1011_0010 1111_1100
	-- decoded bin: 0100 1101 0011 1111
	-- decoded hex: 4D3F
	constant transmission: STD_LOGIC_VECTOR(23 downto 0) := "111010110010101111110011";
begin
	clk <= not clk after 82 ms; -- 2.5% error
	clk_r <= not clk_r after 5 ms;
	
	uarc: uar 
		Generic map(
			data_n => 8,
			sampling_rate => 16
		)
		Port map(
			clk_i => clk_r,
			RXD_i => RXD,
			ready_o => ready,
			data_o => data
		);
		
	
	
	process(clk) is
		variable nbit : integer := 0;
	begin
		if nbit < 24 then
			RXD <= transmission(23 - nbit);
			nbit := nbit + 1;
	 	end if;
	end process;
end Behavioral;
