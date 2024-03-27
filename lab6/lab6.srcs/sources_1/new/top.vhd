----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2024 11:54:07 PM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is

    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           button_i : in STD_LOGIC_VECTOR (3 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end top;

architecture Behavioral of top is

  component kcpsm6 
  generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";
                  interrupt_vector : std_logic_vector(11 downto 0) := X"3FF";
           scratch_pad_memory_size : integer := 64);
  port (                   address : out std_logic_vector(11 downto 0);
                       instruction : in std_logic_vector(17 downto 0);
                       bram_enable : out std_logic;
                           in_port : in std_logic_vector(7 downto 0);
                          out_port : out std_logic_vector(7 downto 0);
                           port_id : out std_logic_vector(7 downto 0);
                      write_strobe : out std_logic;
                    k_write_strobe : out std_logic;
                       read_strobe : out std_logic;
                         interrupt : in std_logic;
                     interrupt_ack : out std_logic;
                             sleep : in std_logic;
                             reset : in std_logic;
                               clk : in std_logic);
end component;

  component program
	generic(
		C_FAMILY : string := "7S";
		C_RAM_SIZE_KWORDS : integer := 1;
		C_JTAG_LOADER_ENABLE : integer := 0);
	Port (
 		address : in std_logic_vector(11 downto 0);
 		instruction : out std_logic_vector(17 downto 0);
 		enable : in std_logic;
 		rdl : out std_logic;
 		clk : in std_logic);
end component;

component display is
	Generic (clk_ratio : integer := 100_000);
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component hex2seg is
    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
           seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal         address : std_logic_vector(11 downto 0);
signal     instruction : std_logic_vector(17 downto 0);
signal     bram_enable : std_logic;
signal         in_port : std_logic_vector(7 downto 0);
signal        out_port : std_logic_vector(7 downto 0);
signal         port_id : std_logic_vector(7 downto 0);
signal    write_strobe : std_logic;

--
-- Some additional signals are required if your system also needs to reset KCPSM6. 
--

signal       cpu_reset : std_logic;
signal             rdl : std_logic;

--
-- When interrupt is to be used then the recommended circuit included below requires 
-- the following signal to represent the request made from your system.
--

signal     int_request : std_logic;

signal digit_i : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal seg_i : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

	bit0_h2sc: hex2seg port map(
		hex_i => digit_i(15 downto 12),
		seg_o => seg_i(31 downto 24)
	);
	
	bit1_h2sc: hex2seg port map(
		hex_i => digit_i(11 downto 8),
		seg_o => seg_i(23 downto 16)
	);
	
	bit2_h2sc: hex2seg port map(
		hex_i => digit_i(7 downto 4),
		seg_o => seg_i(15 downto 8)
	);
	
	bit3_h2sc: hex2seg port map(
		hex_i => digit_i(3 downto 0),
		seg_o => seg_i(7 downto 0)
	);

	displayc: display port map(
		clk_i => clk_i,
		rst_i => '0',
		digit_i => seg_i,
		led7_an_o => led7_an_o ,
		led7_seg_o => led7_seg_o
	);

  processor: kcpsm6
  generic map (                 hwbuild => X"00", 
                       interrupt_vector => X"7FF",
                scratch_pad_memory_size => 64)
  port map(      address => address,
             instruction => instruction,
             bram_enable => bram_enable,
                 port_id => port_id,
            write_strobe => write_strobe,
          k_write_strobe => open,
                out_port => out_port,
             read_strobe => open,
                 in_port => in_port,
               interrupt => '0',
           interrupt_ack => open,
                   sleep => '0',
                   reset => rst_i,
                     clk => clk_i);



  program_rom: program                    --Name to match your PSM file
	   generic map(
			C_FAMILY => "7S",   --Family 'S6', 'V6' or '7S'
		   C_RAM_SIZE_KWORDS => 2,      --Program size '1', '2' or '4'
			C_JTAG_LOADER_ENABLE => 0)      --Include JTAG Loader when set to '1' 
	   port map(      
	   		address => address,      
		  instruction => instruction,
		   enable => bram_enable,
		  rdl => open,
		  clk => clk_i);

	  input_ports: process begin
	  	-- todo: add debouncing here
	  	wait until rising_edge(clk_i);
		in_port <= "0000" & button_i;

	  end process input_ports;

	output_ports: process begin
	wait until rising_edge(clk_i);
		if write_strobe = '1' then
			if port_id(0) = '1' then
				digit_i(15 downto 12) <= out_port(3 downto 0);
			end if;
			if port_id(1) = '1' then
				digit_i(11 downto 8) <= out_port(3 downto 0);
			end if;
			if port_id(2) = '1' then
				digit_i(7 downto 4) <= out_port(3 downto 0);
			end if;
			if port_id(3) = '1' then
				digit_i(3 downto 0) <= out_port(3 downto 0);
			end if;
		end if;
	end process;

end Behavioral;
