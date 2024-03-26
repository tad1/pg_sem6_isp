----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 07:00:58 PM
-- Design Name: 
-- Module Name: test_singen - Behavioral
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

entity test_singen is
--  Port ( );
end test_singen;

architecture Behavioral of test_singen is

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
signal m_axis_data_tdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal m_axis_data_tvalid : STD_LOGIC;
signal clk : STD_LOGIC := '0';
begin

clk <= not clk after 5ns;

your_instance_name : singen
  PORT MAP (
    aclk => clk,
    aclken => '1',
    aresetn => '1',
    s_axis_config_tvalid => '0',
    s_axis_config_tdata => (others=>'0'),
    s_axis_config_tlast => '0',
    m_axis_data_tvalid => open,
    m_axis_data_tdata => m_axis_data_tdata,
    event_s_config_tlast_missing => open,
    event_s_config_tlast_unexpected => open
  );

end Behavioral;
