----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 06:51:24 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity top is
    Port ( clk_i : in STD_LOGIC;
           red_o : out STD_LOGIC_VECTOR (3 downto 0);
           green_o : out STD_LOGIC_VECTOR (3 downto 0);
           blue_o : out STD_LOGIC_VECTOR (3 downto 0);
           hsync_o : out STD_LOGIC;
           vsync_o : out STD_LOGIC;
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           btn_i : in STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

component generator is
    Port ( 
    		clk : in STD_LOGIC;
    		value : in STD_LOGIC_VECTOR (7 downto 0);
           	x_freq_set : in STD_LOGIC;
           	y_freq_set : in STD_LOGIC;
           	y_offset_set : in STD_LOGIC;
           	areset : in STD_LOGIC;
           	x_val : out STD_LOGIC_VECTOR (10 downto 0);
           	y_val : out STD_LOGIC_VECTOR (10 downto 0);
           	ready: out STD_LOGIC
           );
end component;

component clk_div is
	Generic(divisior : integer);
    Port ( clk_i : in STD_LOGIC;
    		rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC := '0');
end component;

component transmitter is
	Generic (
		h_vis : integer := 640-1;
		h_front: integer := 16-1;
		h_sync: integer := 96-1;
		h_back: integer := 48-1;
		
		v_vis: integer := 480;
		v_front: integer := 10;
		v_sync: integer := 2;
		v_back: integer := 33;
		
		size_x: integer := 384;
		size_y: integer := 384
	);
    Port ( clk : in STD_LOGIC; -- pixel, clock (25MHz)
           pixel_value : in STD_LOGIC;
           pixel_addr : out STD_LOGIC_VECTOR (17 downto 0);
           red_o : out STD_LOGIC_VECTOR (3 downto 0);
           green_o : out STD_LOGIC_VECTOR (3 downto 0);
           blue_o : out STD_LOGIC_VECTOR (3 downto 0);
           hsync_o : out STD_LOGIC;
           vsync_o : out STD_LOGIC
           );
end component;

component memory is
	Generic(
		x_size : integer := 384;
		y_size : integer := 384
	);
    Port ( clk_i : in STD_LOGIC;
           w_en : in STD_LOGIC;
           w_addr : in STD_LOGIC_VECTOR(17 DOWNTO 0);
           w_data : in STD_LOGIC;
           r_addr : in STD_LOGIC_VECTOR(17 DOWNTO 0);
           r_data : out STD_LOGIC;
           clear : in STD_LOGIC;
           busy : out STD_LOGIC);
end component;

component btn_debouncer is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC;
           sig_o : out STD_LOGIC);
end component;

component pulse_generator is
    Port ( clk : in STD_LOGIC;
           signal_i : in STD_LOGIC;
           pulse_o : out STD_LOGIC);
end component;
signal trx_clk : STD_LOGIC;

signal wr_addr :  STD_LOGIC_VECTOR (17 downto 0);

signal pixel_addr : STD_LOGIC_VECTOR (17 downto 0);
signal pixel_val : STD_LOGIC;
signal btn_dbn : STD_LOGIC_VECTOR(3 downto 0);

signal gen_ready : STD_LOGIC := '0';
signal write_signal :STD_LOGIC := '0';
signal write_pulse : STD_LOGIC := '0';
signal x_val : STD_LOGIC_VECTOR(10 downto 0);
signal y_val : STD_LOGIC_VECTOR(10 downto 0);

begin
	trx_clkc : clk_div 
	Generic map(
		divisior => 4
	)
	Port map(
		clk_i => clk_i,
		rst_i => '0',
		clk_o => trx_clk
	);
	
	transmitterc : transmitter Port map(
		clk => trx_clk,
		pixel_value => pixel_val,
		pixel_addr => pixel_addr,
		red_o => red_o,
		green_o => green_o,
		blue_o => blue_o,
		hsync_o => hsync_o,
		vsync_o => vsync_o
	);
	
	write_pulsec : pulse_generator Port map(
		clk => clk_i,
		signal_i => write_signal,
		pulse_o => write_pulse
	);
	
	memoryc : memory Port map(
		clk_i => clk_i,
		w_en => write_pulse,
		w_addr => wr_addr,
		w_data => '1',
		r_addr => pixel_addr,
		r_data => pixel_val,
		clear => btn_i(0),
		busy => open
		
	);

	generatorc: generator Port map(
		clk => clk_i,
		value => sw_i,
		x_freq_set => btn_i(3),
		y_freq_set => btn_i(2),
		y_offset_set => btn_i(1),
		areset => btn_i(0),
		x_val => x_val,
		y_val => y_val,
		ready => gen_ready
	);
	
	process 
	variable y : integer;
	variable x : integer;
	begin
		wait until rising_edge(clk_i);
		if (gen_ready = '1') then
			write_signal <= not write_signal;
			x := conv_integer(x_val(10 downto 3));
			y := conv_integer(y_val(10 downto 3));
			wr_addr <= CONV_STD_LOGIC_VECTOR((((x + 384) / 2) * 384) + ((y + 384) / 2), 18);
		end if;
	end process;

end Behavioral;
