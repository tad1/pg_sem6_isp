library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
	Generic (clk_ratio : integer := 100_000);
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is

component clk_div is
	Generic(divisior : integer);
    Port ( clk_i : in STD_LOGIC;
    		rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC);
end component;

signal current_an : std_logic_vector(1 downto 0) := "00";
signal clk_d : STD_LOGIC := '0';
begin
	clk_divc: clk_div 
		generic map(
			divisior => clk_ratio
		)
		port map(
			clk_i => clk_i,
			rst_i => '0',
			clk_o => clk_d
		);

	-- component is synchronic to clock
	proc: process(clk_d, rst_i) is
	begin
		if rising_edge(clk_d) then
			current_an <= current_an + 1;
		end if;
	end process;

	with current_an select
		led7_an_o <= "0111" when "00",
					"1011" when "01",
					"1101" when "10",
					"1110" when "11",
					"1111" when others;


	with current_an select
		led7_seg_o <= 	digit_i(31 downto 24) when "00",
						digit_i(23 downto 16) when "01",
						digit_i(15 downto 8) when "10",
						digit_i(7 downto 0) when "11",
						"XXXXXXXX" when others;
	
end Behavioral;
