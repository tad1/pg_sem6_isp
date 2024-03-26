----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 08:09:40 PM
-- Design Name: 
-- Module Name: generator - Behavioral
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

entity generator is
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
end generator;

architecture Behavioral of generator is
	COMPONENT singen
	  PORT (
		aclk : IN STD_LOGIC;
		aclken : IN STD_LOGIC;
		aresetn : IN STD_LOGIC;
		s_axis_config_tvalid : IN STD_LOGIC;
		s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		s_axis_config_tlast : IN STD_LOGIC;
		m_axis_data_tvalid : OUT STD_LOGIC;
		m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		event_s_config_tlast_missing : OUT STD_LOGIC;
		event_s_config_tlast_unexpected : OUT STD_LOGIC
	  );
	END COMPONENT;
	type GeneratorState is (reset, speeding, ready_x, ready_y, config1, config2);
	signal state : GeneratorState := speeding;
	signal raw_data : STD_LOGIC_VECTOR(10 downto 0);
	signal unused : STD_LOGIC_VECTOR(15 downto 11);
	signal settings : STD_LOGIC_VECTOR(31 downto 0);
	
	signal x_freq : STD_LOGIC_VECTOR(7 downto 0) := "11110000";
	signal x_offset : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

	signal y_freq : STD_LOGIC_VECTOR(7 downto 0) := "11110000";
	signal y_offset: STD_LOGIC_VECTOR(7 downto 0) := "11110000";
	
	signal raw_data_valid : STD_LOGIC;
	signal config_valid : STD_LOGIC := '0';
	signal config_last : STD_LOGIC := '0';
	signal rst : STD_LOGIC := '1';
begin

	dds_gen: singen
  PORT MAP (
    aclk => clk,
    aclken => '1',
    aresetn => rst,
    s_axis_config_tvalid => config_valid,
    s_axis_config_tdata => settings,
    s_axis_config_tlast => config_last,
    m_axis_data_tvalid => raw_data_valid,
    m_axis_data_tdata(15 downto 11) => unused,
    m_axis_data_tdata(10 downto 0) => raw_data,
    event_s_config_tlast_missing => open,
    event_s_config_tlast_unexpected => open
  );
  
  process begin
  	wait until rising_edge(clk);
  	case state is
  		when reset =>
  			rst <= '0';
			config_valid <= '0';
  			config_last <= '0';
  			state <= speeding;
  		when speeding =>
  			rst <= '1';
  			if(raw_data_valid = '1') then
				x_val <= raw_data;
  				state <= ready_y;
  			end if;
  		when ready_x =>
  			if(raw_data_valid = '1') then
				x_val <= raw_data;
  				state <= ready_y;
  				ready <= '0';
  			end if;
  		when ready_y =>
  			if(raw_data_valid = '1') then
				y_val <= raw_data;
	  			state <= ready_x;
	  			ready <= '1';
	  		end if;
  		when config1 =>
  			state <= config2;
  			config_valid <= '1';
  			settings(31 downto 24) <= x_offset;
			settings(23 downto 8) <= (others => '0');
  			settings(7 downto 0) <= x_freq;
  		when config2 =>
  			state <= reset;
  			config_last <= '1';
			settings(31 downto 24) <= y_offset;
			settings(23 downto 8) <= (others => '0');
  			settings(7 downto 0) <= y_freq;
  		
  		-- TODO: assert, not in config??
  	end case;
  	
  	
	if (x_freq_set = '1') then
  		x_freq <= value;
  	end if;
  	if (y_freq_set = '1') then
  		y_freq <= value;
  	end if;
  	if (y_offset_set = '1') then
  		y_offset <= value;
  	end if;
  	
	if(areset = '1' and (state /= config1 or state /= config2)) then
  		state <= config1;
  		ready <= '0';
  	end if;
  end process;

end Behavioral;
