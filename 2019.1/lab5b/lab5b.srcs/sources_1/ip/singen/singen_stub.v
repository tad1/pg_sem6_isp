// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Apr  5 00:06:54 2024
// Host        : matrix-delta running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/tad1/Projects/PG_SEM6/ISP/2019.1/lab5b/lab5b.srcs/sources_1/ip/singen/singen_stub.v
// Design      : singen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dds_compiler_v6_0_18,Vivado 2019.1" *)
module singen(aclk, aclken, aresetn, s_axis_config_tvalid, 
  s_axis_config_tdata, s_axis_config_tlast, m_axis_data_tvalid, m_axis_data_tdata, 
  event_s_config_tlast_missing, event_s_config_tlast_unexpected)
/* synthesis syn_black_box black_box_pad_pin="aclk,aclken,aresetn,s_axis_config_tvalid,s_axis_config_tdata[31:0],s_axis_config_tlast,m_axis_data_tvalid,m_axis_data_tdata[15:0],event_s_config_tlast_missing,event_s_config_tlast_unexpected" */;
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_config_tvalid;
  input [31:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  output [15:0]m_axis_data_tdata;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
endmodule
