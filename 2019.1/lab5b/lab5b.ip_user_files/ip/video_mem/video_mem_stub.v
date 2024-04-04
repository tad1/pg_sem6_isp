// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Apr  5 00:07:45 2024
// Host        : matrix-delta running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/tad1/Projects/PG_SEM6/ISP/2019.1/lab5b/lab5b.srcs/sources_1/ip/video_mem/video_mem_stub.v
// Design      : video_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module video_mem(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[17:0],dina[0:0],clkb,addrb[17:0],doutb[0:0]" */;
  input clka;
  input [0:0]wea;
  input [17:0]addra;
  input [0:0]dina;
  input clkb;
  input [17:0]addrb;
  output [0:0]doutb;
endmodule
