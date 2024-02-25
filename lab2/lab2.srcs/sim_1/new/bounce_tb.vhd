library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

	component top is
		Port ( clk_i : in STD_LOGIC;
			   rst_i : in STD_LOGIC;
			   led_o : out STD_LOGIC_VECTOR (2 downto 0));
	end component top;
	
	signal clk_i : STD_LOGIC := '0';
	signal rst_i : STD_LOGIC := '0';
	signal led_o : STD_LOGIC_VECTOR (2 downto 0);

begin

	comp: top port map (
		clk_i => clk_i,
		rst_i => rst_i,
		led_o => led_o);
	
	clk_i <= not clk_i after 50 ms; -- 10 Hz
	
	stin: process
	begin
		wait for 100 ms;
		rst_i <= '1';
		wait for 100 ms;
		rst_i <= '0';
		wait;
	end process;


end Behavioral;
