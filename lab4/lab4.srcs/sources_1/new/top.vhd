library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- reference: https://onlinedocs.microchip.com/oxy/GUID-199548F4-607C-436B-80C7-E4F280C1CAD2-en-US-1/GUID-5656F99B-1F98-4042-88B8-47B31B93D1A6.html
-- clock: 100MHz = 100_000_000 Hz
-- baud rate: 9600 bps
-- samples: 16
-- divisor: 100_000_000/16/9600 = 651.041666667
-- Integer Divisor Factor = 651
-- Fractional Divisor Factor = 1
-- Fractional Divisor Cycle = 16
--
-- 100_000_000/16/(651 + 1/6) = 9598.16
-- that gives -0.00019166666% error


-- with legacy (from previous labs) divider:
--- 100_000_000/16/652 = 9585.89
--- (9585.89-9600)/9600 = -0.00146979166%
-- 8N1 error tolerance is about 3% (assuming synchonizing to start)
-- so I can use legacy module for that


entity top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
	component uar is
		Generic(
			data_n : integer;
			sampling_rate: integer
		); Port (
			clk_i : in STD_LOGIC;
			RXD_i : in STD_LOGIC;
			ready_o: out STD_LOGIC;
			data_o: out STD_LOGIC_VECTOR(data_n-1 downto 0));
	end component;
	
	component display is
		Generic (
			clk_ratio : integer := 100_000
		); Port ( 
			clk_i : in STD_LOGIC;
	        rst_i : in STD_LOGIC;
	        digit_i : in STD_LOGIC_VECTOR (31 downto 0);
	        led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
	        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component clk_div is
		Generic(
			divisior : integer
		); Port ( 
			clk_i : in STD_LOGIC;
	    	rst_i : in STD_LOGIC;
	        clk_o : out STD_LOGIC);
	end component;
	
	component hex2seg is
	    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
	           seg_o : out STD_LOGIC_VECTOR (7 downto 0));
	end component;

signal uar_clk : STD_LOGIC := '0';
signal ready : STD_LOGIC := '0';
signal uar_data : STD_LOGIC_VECTOR(7 downto 0);
signal latch_data : STD_LOGIC_VECTOR(7 downto 0);
signal disp_seg : STD_LOGIC_VECTOR(31 downto 0) := x"FFFFFFFF";

begin
	
	uar_clkc: clk_div Generic map(
		divisior => 652*2
	) Port map(
		clk_i => clk_i,
		rst_i => '0',
		clk_o => uar_clk
	);
	
	uarc: uar Generic map(
		data_n => 8,
		sampling_rate => 16
	) Port map (
		clk_i => uar_clk,
		RXD_i => RXD_i,
		ready_o => ready,
		data_o => uar_data
	);
	
	dispc: display 
	Generic map(
		clk_ratio => 1000
	) Port map(
		clk_i => clk_i,
		rst_i => '0',
		digit_i => disp_seg,
		led7_an_o => led7_an_o,
		led7_seg_o => led7_seg_o
	);
	
	hexc1: hex2seg Port map(
		hex_i => latch_data(3 downto 0),
		seg_o => disp_seg(7 downto 0)
	);
	
	hexc2: hex2seg Port map(
		hex_i => latch_data(7 downto 4),
		seg_o => disp_seg(15 downto 8)
	);
	
	process(ready) is
	begin
		if rising_edge(ready) then
			latch_data <= uar_data;
		end if;
	end process;
	
	
end Behavioral;
