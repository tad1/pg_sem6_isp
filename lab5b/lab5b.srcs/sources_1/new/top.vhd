----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 10:57:10 AM
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
           red_o : out STD_LOGIC_VECTOR (3 downto 0);
           green_o : out STD_LOGIC_VECTOR (3 downto 0);
           blue_o : out STD_LOGIC_VECTOR (3 downto 0);
           hsync_o : out STD_LOGIC;
           vsync_o : out STD_LOGIC;
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           btn_i : in STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

COMPONENT singen
  PORT (
    aclk : IN STD_LOGIC; -- clock
    aclken : IN STD_LOGIC; -- enable
    aresetn : IN STD_LOGIC; -- reset
    s_axis_config_tvalid : IN STD_LOGIC; -- is data present?
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_config_tlast : IN STD_LOGIC;
    m_axis_data_tvalid : OUT STD_LOGIC; -- is data present?
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    event_s_config_tlast_missing : OUT STD_LOGIC;
    event_s_config_tlast_unexpected : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT video_mem
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;


signal x_valid : STD_LOGIC := '0';
signal y_valid : STD_LOGIC := '0';
-- x = A*sin()
-- y = B*sin()
-- A,B range = 

-- dedicated component for generating shapes
-- settings, and reset input
-- output: sequential data?

begin
	process (clk_i) begin
		-- gathering frame
		if x_valid = '1' and y_valid = '1' then
			-- save value to RAM
		end if;
	end process;

end Behavioral;
