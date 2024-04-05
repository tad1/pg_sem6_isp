// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Apr  5 01:27:52 2024
// Host        : matrix-delta running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim
//               /home/tad1/Projects/PG_SEM6/ISP/lab8a/lab8a.srcs/sources_1/ip/singen/singen_sim_netlist.v
// Design      : singen
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "singen,dds_compiler_v6_0_18,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_18,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module singen
   (aclk,
    aclken,
    aresetn,
    s_axis_config_tvalid,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tdata,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 aclken_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME aclken_intf, POLARITY ACTIVE_LOW" *) input aclken;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 aresetn_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME aresetn_intf, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_CONFIG, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_config_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TDATA" *) input [15:0]s_axis_config_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TLAST" *) input s_axis_config_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [31:0]m_axis_data_tdata;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 event_s_config_tlast_missing_intf INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME event_s_config_tlast_missing_intf, SENSITIVITY EDGE_RISING, PortWidth 1" *) output event_s_config_tlast_missing;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 event_s_config_tlast_unexpected_intf INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME event_s_config_tlast_unexpected_intf, SENSITIVITY EDGE_RISING, PortWidth 1" *) output event_s_config_tlast_unexpected;

  wire aclk;
  wire aclken;
  wire aresetn;
  wire event_s_config_tlast_missing;
  wire event_s_config_tlast_unexpected;
  wire [31:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [15:0]s_axis_config_tdata;
  wire s_axis_config_tlast;
  wire s_axis_config_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [15:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [15:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [15:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "16" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "2" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "1" *) 
  (* C_HAS_ARESETN = "1" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "1" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "4" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "32" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "11" *) 
  (* C_PHASE_ANGLE_WIDTH = "11" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "100000000,100000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "16" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  singen_dds_compiler_v6_0_18 U0
       (.aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[15:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[15:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[15:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(event_s_config_tlast_missing),
        .event_s_config_tlast_unexpected(event_s_config_tlast_unexpected),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(s_axis_config_tdata),
        .s_axis_config_tlast(s_axis_config_tlast),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule

(* C_ACCUMULATOR_WIDTH = "16" *) (* C_AMPLITUDE = "0" *) (* C_CHANNELS = "2" *) 
(* C_CHAN_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "1" *) 
(* C_HAS_ARESETN = "1" *) (* C_HAS_M_DATA = "1" *) (* C_HAS_M_PHASE = "0" *) 
(* C_HAS_PHASEGEN = "1" *) (* C_HAS_PHASE_OUT = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_HAS_S_CONFIG = "1" *) (* C_HAS_S_PHASE = "0" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "4" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "32" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "2" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "11" *) 
(* C_PHASE_ANGLE_WIDTH = "11" *) (* C_PHASE_INCREMENT = "1" *) (* C_PHASE_INCREMENT_VALUE = "100000000,100000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "16" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "1" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "dds_compiler_v6_0_18" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module singen_dds_compiler_v6_0_18
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [0:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [15:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [31:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [0:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [15:0]debug_axi_pinc_in;
  output [15:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [15:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire aclk;
  wire aclken;
  wire aresetn;
  wire event_s_config_tlast_missing;
  wire event_s_config_tlast_unexpected;
  wire [26:0]\^m_axis_data_tdata ;
  wire m_axis_data_tvalid;
  wire [15:0]s_axis_config_tdata;
  wire s_axis_config_tlast;
  wire s_axis_config_tready;
  wire s_axis_config_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;
  wire NLW_i_synth_debug_core_nd_UNCONNECTED;
  wire NLW_i_synth_debug_phase_nd_UNCONNECTED;
  wire NLW_i_synth_event_phase_in_invalid_UNCONNECTED;
  wire NLW_i_synth_event_pinc_invalid_UNCONNECTED;
  wire NLW_i_synth_event_poff_invalid_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_i_synth_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_debug_axi_chan_in_UNCONNECTED;
  wire [15:0]NLW_i_synth_debug_axi_pinc_in_UNCONNECTED;
  wire [15:0]NLW_i_synth_debug_axi_poff_in_UNCONNECTED;
  wire [15:0]NLW_i_synth_debug_phase_UNCONNECTED;
  wire [30:10]NLW_i_synth_m_axis_data_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tuser_UNCONNECTED;

  assign debug_axi_chan_in[0] = \<const0> ;
  assign debug_axi_pinc_in[15] = \<const0> ;
  assign debug_axi_pinc_in[14] = \<const0> ;
  assign debug_axi_pinc_in[13] = \<const0> ;
  assign debug_axi_pinc_in[12] = \<const0> ;
  assign debug_axi_pinc_in[11] = \<const0> ;
  assign debug_axi_pinc_in[10] = \<const0> ;
  assign debug_axi_pinc_in[9] = \<const0> ;
  assign debug_axi_pinc_in[8] = \<const0> ;
  assign debug_axi_pinc_in[7] = \<const0> ;
  assign debug_axi_pinc_in[6] = \<const0> ;
  assign debug_axi_pinc_in[5] = \<const0> ;
  assign debug_axi_pinc_in[4] = \<const0> ;
  assign debug_axi_pinc_in[3] = \<const0> ;
  assign debug_axi_pinc_in[2] = \<const0> ;
  assign debug_axi_pinc_in[1] = \<const0> ;
  assign debug_axi_pinc_in[0] = \<const0> ;
  assign debug_axi_poff_in[15] = \<const0> ;
  assign debug_axi_poff_in[14] = \<const0> ;
  assign debug_axi_poff_in[13] = \<const0> ;
  assign debug_axi_poff_in[12] = \<const0> ;
  assign debug_axi_poff_in[11] = \<const0> ;
  assign debug_axi_poff_in[10] = \<const0> ;
  assign debug_axi_poff_in[9] = \<const0> ;
  assign debug_axi_poff_in[8] = \<const0> ;
  assign debug_axi_poff_in[7] = \<const0> ;
  assign debug_axi_poff_in[6] = \<const0> ;
  assign debug_axi_poff_in[5] = \<const0> ;
  assign debug_axi_poff_in[4] = \<const0> ;
  assign debug_axi_poff_in[3] = \<const0> ;
  assign debug_axi_poff_in[2] = \<const0> ;
  assign debug_axi_poff_in[1] = \<const0> ;
  assign debug_axi_poff_in[0] = \<const0> ;
  assign debug_axi_resync_in = \<const0> ;
  assign debug_core_nd = \<const0> ;
  assign debug_phase[15] = \<const0> ;
  assign debug_phase[14] = \<const0> ;
  assign debug_phase[13] = \<const0> ;
  assign debug_phase[12] = \<const0> ;
  assign debug_phase[11] = \<const0> ;
  assign debug_phase[10] = \<const0> ;
  assign debug_phase[9] = \<const0> ;
  assign debug_phase[8] = \<const0> ;
  assign debug_phase[7] = \<const0> ;
  assign debug_phase[6] = \<const0> ;
  assign debug_phase[5] = \<const0> ;
  assign debug_phase[4] = \<const0> ;
  assign debug_phase[3] = \<const0> ;
  assign debug_phase[2] = \<const0> ;
  assign debug_phase[1] = \<const0> ;
  assign debug_phase[0] = \<const0> ;
  assign debug_phase_nd = \<const0> ;
  assign event_phase_in_invalid = \<const0> ;
  assign event_pinc_invalid = \<const0> ;
  assign event_poff_invalid = \<const0> ;
  assign event_s_phase_chanid_incorrect = \<const0> ;
  assign event_s_phase_tlast_missing = \<const0> ;
  assign event_s_phase_tlast_unexpected = \<const0> ;
  assign m_axis_data_tdata[31] = \^m_axis_data_tdata [26];
  assign m_axis_data_tdata[30] = \^m_axis_data_tdata [26];
  assign m_axis_data_tdata[29] = \^m_axis_data_tdata [26];
  assign m_axis_data_tdata[28] = \^m_axis_data_tdata [26];
  assign m_axis_data_tdata[27] = \^m_axis_data_tdata [26];
  assign m_axis_data_tdata[26:16] = \^m_axis_data_tdata [26:16];
  assign m_axis_data_tdata[15] = \^m_axis_data_tdata [10];
  assign m_axis_data_tdata[14] = \^m_axis_data_tdata [10];
  assign m_axis_data_tdata[13] = \^m_axis_data_tdata [10];
  assign m_axis_data_tdata[12] = \^m_axis_data_tdata [10];
  assign m_axis_data_tdata[11] = \^m_axis_data_tdata [10];
  assign m_axis_data_tdata[10:0] = \^m_axis_data_tdata [10:0];
  assign m_axis_data_tlast = \<const0> ;
  assign m_axis_data_tuser[0] = \<const0> ;
  assign m_axis_phase_tdata[0] = \<const0> ;
  assign m_axis_phase_tlast = \<const0> ;
  assign m_axis_phase_tuser[0] = \<const0> ;
  assign m_axis_phase_tvalid = \<const0> ;
  assign s_axis_phase_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUMULATOR_WIDTH = "16" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "2" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "1" *) 
  (* C_HAS_ARESETN = "1" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "1" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "4" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "32" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "11" *) 
  (* C_PHASE_ANGLE_WIDTH = "11" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "100000000,100000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "16" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  singen_dds_compiler_v6_0_18_viv i_synth
       (.aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .debug_axi_chan_in(NLW_i_synth_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_i_synth_debug_axi_pinc_in_UNCONNECTED[15:0]),
        .debug_axi_poff_in(NLW_i_synth_debug_axi_poff_in_UNCONNECTED[15:0]),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_i_synth_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_i_synth_debug_phase_UNCONNECTED[15:0]),
        .debug_phase_nd(NLW_i_synth_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_i_synth_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_i_synth_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_i_synth_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(event_s_config_tlast_missing),
        .event_s_config_tlast_unexpected(event_s_config_tlast_unexpected),
        .event_s_phase_chanid_incorrect(NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_i_synth_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata({\^m_axis_data_tdata [26],NLW_i_synth_m_axis_data_tdata_UNCONNECTED[30:26],\^m_axis_data_tdata [25:16],\^m_axis_data_tdata [10],NLW_i_synth_m_axis_data_tdata_UNCONNECTED[14:10],\^m_axis_data_tdata [9:0]}),
        .m_axis_data_tlast(NLW_i_synth_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_i_synth_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_i_synth_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_i_synth_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_i_synth_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(s_axis_config_tdata),
        .s_axis_config_tlast(s_axis_config_tlast),
        .s_axis_config_tready(s_axis_config_tready),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_i_synth_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
ag49RSaXLOG4xxULlDyO1h9Bt1tXxD8QSYAdgfsZmsYA2qz7wg+SSUXB8JjzU2owt7o4eSmQVBkv
9kufty+oIQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
beER7wF1A3pmXiXm1TFX9IvmAFUcJ13uMC6TseJWrR0JDHD/O3dKRM6PO4Up/CFQ2H37nKClSGcK
Xug89GBtLfoDpFLh+xP2Vy07zuqOy7uywLvaukELsTzPf+0n/Xp60hkmPlC81KPi1DXhJUhJdbqA
yi5TP4w1WPUjCtK/688=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uJZzBmpzrESHK9uJTBRGbyDZMxFeU9+2SClZZYLsPBAU9V9oQiK75ubhJObpnmwewUOoBxz3zJhu
34asP1BGbunyLgeJYr0OiNow3a8XihoRSYbIdKxKq3vjl4MLatqJEBLCN8Uqf0Pu+E+jWbMFfcxy
YAnzqN8sgF4OZI5wLBzPXafQi1767wu3Wtw/sQe5anCy8TAyLarP9ast1O9Vj15Rk2tLtgm/LZqR
yZd0qKSqmW4A81G6x+ixR2y/IqQ1qALI1NCgPfvH4Ieyq7XPyblqlNyParNLhG2wjr0y4ofNWp/3
h4o2c+vYiIrkx6rmzrp/rUIybZ9A9HDZaA+ciA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MfuZTTml919Hbg0Ib2VBuKuYX6+OjqUB2INt3NN2eutVeJhuMufRcsa0q1J3vztEmpkdGV6+RTfb
HKoQKFD6EwJ10b0AcDFjpD8+L6fGReFnvS0g731shB/OodUdaV8giQpoNHCm2XtoKsv/Lgqn+U27
EV3lJK6Lt+nUx6DUsocHc5RcvRHw58/myY6ZtXqFDMXJfFOVK18LSGHnEg1OXkFqEApSxPVexe3t
s0jVQDZRqkFortHzVNrWx73GPD4RFe+7vmA/hegviTOrtvw99UpoL8yyjZyO3WOlde1quROnWZtl
8BwV/r+EPBUPh50jKc+nVMUwLKYH8/iDFUIpsA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJsfCx8emG9lVb/vjASSH6y78U+06ketn/XvcxXkuwOnvwxs7wpKbvKxuP4Ht/qw/W2x/0Yf02kE
WBxMF+BnpDUX67X5j60mOzT2j0ZYCuFJN9kbpdHjz3Ekw/u9MBVbJppIZsHCWkzk8bOejCc+dey6
uKr6E3w+/K97/Rld2HkJp2oTONv039xGcZEjeSi0lePhlRX0rhSfD0ixFje/nMEadDX5qmjf3+jt
/VeShbed51E8U6v7e1T5QOk3TdFmkYjH+NGfYuQg3iCCVd/1LP9eqPJHZkzv46tJ9yquR6upFVae
N2f7q08udoFP14ZZMSWY0FVcj+R8uc1SpoZ08w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
DD7F0WIA2tCJDGGyuiJBMJ6VkyzlY4wTm+PBxGw32rno1Lc5XJ6R/MdpajSKtZkvW3jP5SII6hW8
/NoKV4ROiGDYzmMIubH+jq3u0TtkWxCL8+cj3SNuMEayY39+8F4sUjaZEFERxcl1JK64XpQCcPdd
qDExjxIvRWRuuTD424M=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z8r/pZDFkssalgvLpiT5lxxnKwN27AIWvhfsYdefLfSuxYTC5pbsQO/glsRgaQ+pfMXTafAs1c8M
dypCXo6c0EAVYWrPv6LXzncAvpvkgF3equA0GovqWA9u1DpNOwpg1+9zyuK298jIW0FY3V+8XZYP
i9enkYei0sCGexSdPzqATDbRzjzApbpnBZpWe6z4en7Wb9o0cFYVvU0I2D694fRndQa2DDTk5yRa
yG9QYOCPabDGrsr3xHF371LpdUv9XcgOm45jMWa9bZ1oL2S9hL6xUIjS0C8vlmUWEtNohYiiamIC
mjfkGqLNOX02xYC0DG4kzfO01bAlP3sDf4JdCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j7vqldDpyh9D1sdmPxbFkyQx+3V47jdpikX8Y4OgYqKqApJOistNWkVLA8G4RWwqTuwz9eKlnSDe
QzDwtvo5gyxnsnl4BKV6KzWD9oY07XJN4VMdeCP1Repkdj1Zw3LVaddLR3Y0K19aphWsLPhv3DvD
ekNEwW+izG6hb5WwweFzXIpmodq83p1jgGMvdJDwX605EFZYs1YBisjpgbghFEKiDmybe8Rw3vtl
+rj3ZIj0jRVLfHzWBK21D58TYDyFczUDwmOI8IdbsF+Ldh8tfr36V1iIXwNxKJOmO5vD/ZUwpQDE
003iSmVFoCM6+6MrE9oWMG11FbmemTstEw4V5w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tCtJhzS/Q2sAXKgK67gA3/an3SifE1fEELGQftfLEfGVw8vvUFsWyZIFyN06/5bxQztEcJLifBhy
2p60M0EU607MmYGzevb+an/aTgiObFVP6hpTUYPWBKxe6gmeNJjtmLRTWw0a2xtqF+krp90+Ia+j
EYreBbtHveny91X/SR1SSJC1yzhxwkyukJz/0coVnap1/4GSp6VT3MqSfhdFc1Q1SBgXPrnDzNwn
kgvKkYF/fbfOZ5BUz18pxnAFvY8/+lCPsH9E3Ex6UlcIS3BBKiTGF3LVTm+JBPZWLqTnoxk4IWDV
y7Uh9h4t3HCqr0yEXmEe6Wrr9a5qKXiCMmCatA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 61536)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
