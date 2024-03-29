// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Mar 29 10:46:00 2024
// Host        : matrix-delta running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/tad1/Projects/PG_SEM6/ISP/2019.1/lab7/lab7.srcs/sources_1/bd/mb_system/ip/mb_system_clk_wiz_0_0/mb_system_clk_wiz_0_0_stub.v
// Design      : mb_system_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module mb_system_clk_wiz_0_0(clk_out1, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,resetn,locked,clk_in1" */;
  output clk_out1;
  input resetn;
  output locked;
  input clk_in1;
endmodule
