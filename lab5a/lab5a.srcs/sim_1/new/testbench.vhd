
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

	component top is
    	Port ( 
    		clk_i : in STD_LOGIC;
           	rst_i : in STD_LOGIC;
           	RXD_i : in STD_LOGIC;
           	led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           	led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
	end component;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '0';
signal RXD : STD_LOGIC;
signal led7_an : STD_LOGIC_VECTOR(3 downto 0);
signal led7_seg: STD_LOGIC_VECTOR(7 downto 0); 

constant nbits : integer := 11;
constant transmission: STD_LOGIC_VECTOR(nbits-1 downto 0) := "10110010101";


begin
	clk <= not clk after 5 ns;
	
	topc: top Port map(
		clk_i => clk,
		rst_i => rst,
		RXD_i => RXD,
		led7_an_o => led7_an,
		led7_seg_o => led7_seg
	);
	
	process is
		variable baud_rate: integer := 9600;
		
	begin
		for i in nbits-1 downto 0 loop
			RXD <= transmission(i);
			wait for 104.16 us; -- 1/9600 sec
		end loop;
		for i in nbits-1 downto 0 loop
			RXD <= transmission(i);
			wait for 100 us; -- 1/9600 * 0.96 sec
		end loop;
		for i in nbits-1 downto 0 loop
			RXD <= transmission(i);
			wait for 108.32 us; -- 1/9600 * 1.04 sec
		end loop;
		for i in nbits-1 downto 0 loop
			RXD <= transmission(i);
			wait for 145.82 us; -- 1/9600 * 1.40 sec
		end loop;
		rst <= '1';
		wait for 10ns;
		rst <= '0';
		wait for 10ns;
		for i in nbits-1 downto 0 loop
			RXD <= transmission(i);
			wait for 83.33 us; -- 1/9600 * 0.80 sec
		end loop;
		wait;
	end process;


end Behavioral;
