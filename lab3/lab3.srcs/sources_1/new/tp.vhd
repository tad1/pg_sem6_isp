----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 06:57:44 PM
-- Design Name: 
-- Module Name: tp - Behavioral
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
           btn_i : in STD_LOGIC_VECTOR (3 downto 0) := "0000";
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0) := "0111";
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0) := "11111111");
end top;

architecture Behavioral of top is

component ewm is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           digit_i : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component display is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal digit_i: STD_LOGIC_VECTOR (31 downto 0);

begin

disp: display port map(
	clk_i => clk_i,
	rst_i => '0',
	digit_i => digit_i,
	led7_an_o => led7_an_o,
	led7_seg_o => led7_seg_o
);

ewmc: ewm port map(
	clk_i => clk_i,
	btn_i => btn_i,
	sw_i => sw_i,
	digit_i => digit_i
);


end Behavioral;
