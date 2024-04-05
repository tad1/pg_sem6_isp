-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri Apr  5 01:27:52 2024
-- Host        : matrix-delta running 64-bit Manjaro Linux
-- Command     : write_vhdl -force -mode synth_stub
--               /home/tad1/Projects/PG_SEM6/ISP/lab8a/lab8a.srcs/sources_1/ip/singen/singen_stub.vhdl
-- Design      : singen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity singen is
  Port ( 
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_config_tvalid : in STD_LOGIC;
    s_axis_config_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_config_tlast : in STD_LOGIC;
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    event_s_config_tlast_missing : out STD_LOGIC;
    event_s_config_tlast_unexpected : out STD_LOGIC
  );

end singen;

architecture stub of singen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aclken,aresetn,s_axis_config_tvalid,s_axis_config_tdata[15:0],s_axis_config_tlast,m_axis_data_tvalid,m_axis_data_tdata[31:0],event_s_config_tlast_missing,event_s_config_tlast_unexpected";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dds_compiler_v6_0_18,Vivado 2019.1";
begin
end;
