// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Mon Mar 25 12:00:55 2024
// Host        : matrix-delta running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim
//               /home/tad1/Projects/PG_SEM6/ISP/lab5b/lab5b.srcs/sources_1/ip/singen/singen_sim_netlist.v
// Design      : singen
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "singen,dds_compiler_v6_0_19,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_19,Vivado 2019.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 aclken_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME aclken_intf, POLARITY ACTIVE_HIGH" *) input aclken;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 aresetn_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME aresetn_intf, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_CONFIG, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_config_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TDATA" *) input [31:0]s_axis_config_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TLAST" *) input s_axis_config_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [15:0]m_axis_data_tdata;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 event_s_config_tlast_missing_intf INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME event_s_config_tlast_missing_intf, SENSITIVITY EDGE_RISING, PortWidth 1" *) output event_s_config_tlast_missing;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 event_s_config_tlast_unexpected_intf INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME event_s_config_tlast_unexpected_intf, SENSITIVITY EDGE_RISING, PortWidth 1" *) output event_s_config_tlast_unexpected;

  wire aclk;
  wire aclken;
  wire aresetn;
  wire event_s_config_tlast_missing;
  wire event_s_config_tlast_unexpected;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [31:0]s_axis_config_tdata;
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
  (* C_LATENCY = "5" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "11" *) 
  (* C_PHASE_ANGLE_WIDTH = "11" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "100000000,100000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "1" *) 
  (* C_PHASE_OFFSET_VALUE = "0,100000000000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "32" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  singen_dds_compiler_v6_0_19 U0
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
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "5" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "0" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "11" *) 
(* C_PHASE_ANGLE_WIDTH = "11" *) (* C_PHASE_INCREMENT = "1" *) (* C_PHASE_INCREMENT_VALUE = "100000000,100000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "1" *) (* C_PHASE_OFFSET_VALUE = "0,100000000000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "32" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "1" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "dds_compiler_v6_0_19" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module singen_dds_compiler_v6_0_19
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
  input [31:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [15:0]m_axis_data_tdata;
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
  wire [10:0]\^m_axis_data_tdata ;
  wire m_axis_data_tvalid;
  wire [31:0]s_axis_config_tdata;
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
  wire [14:10]NLW_i_synth_m_axis_data_tdata_UNCONNECTED;
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
  (* C_LATENCY = "5" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "11" *) 
  (* C_PHASE_ANGLE_WIDTH = "11" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "100000000,100000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "1" *) 
  (* C_PHASE_OFFSET_VALUE = "0,100000000000000,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "32" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  singen_dds_compiler_v6_0_19_viv i_synth
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
        .m_axis_data_tdata({\^m_axis_data_tdata [10],NLW_i_synth_m_axis_data_tdata_UNCONNECTED[14:10],\^m_axis_data_tdata [9:0]}),
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
GChCViBDvBmAdEhOubfL25GMXfGxkXRdRqHGmAYIfuDlTr17bmWtS+GhikUinfgaTyxkmMH8CseP
gnd/2HW10g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MrlvIibpKEfGGLF89ZYa/MxSWreV1ceGqUI6m07gM/kuMQZAYp2a++EIZlP+UjNP51wFBhQ3c3zS
QdkFbBqG6uYLZzwSlk6gLqBqvuZE/svIDiGBQbqYiXvUtpsADkdJijHyEXCWIIfA2OybpwP9q9td
K8W1ihFrAkZes3XwNzA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S/HhZNGAOnVSjBaHp2/iJ+uhoS21MUt/ylKAWbdawBFCF9FkUaRlu5dlJRkeM7EFSLvmm6AdQ7tl
PFLc6nUqRxmcsib+JZVada3nOm2+ZzWt2pBGxOUWy1KlB3WROt2liUGfjrxKGEXvt9xlbj7bdIUb
2m+T4LI1aaXqhlGKjy/KpKUf1QOkJCRs0Ku5aotmezBo5GKTFGyZJ3MYO4GKMIfK9iu8sq6VaYMo
k1HNwS1FdJIkAS9xVgsyFkDCzQWeJzTkIZvZQmiwZL9HosMCrHwO2bB0MMldcTYqO/p/dWEFOMhj
t/a4spWmGP9HmOzdM3HjnWh6sHlnCzfHQSkgTA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Casey7LdMe+nZ1xDjbqn5ljtI3LEVuHmV02n1dKqHlXDDy8DngD/F/sT3eZKKWGTYI9OYA8xmK96
NDm7hPSP0ZbcSw2tiWAvyCZWlna3Dzb0oLOsECWeQTM9trjqnrFG881fwCtgX9vmTRQDy7PCg4mn
qaXt4R91tVE0xabKcbKkG3xbZWQa6qcQ1h11pI3DqCvtBoftQdeMm5iU3cfBpqJqka9rRftnPdqV
2HoyzByDV6pDJ1J8/KIiRxyv5NnLSS2sGS/CBn4pn75rlQww9RJEI6qSkYVBdTDgR6hlIRpCam7s
v6LGO0DaEGEJx4a29MQt1LmwETzoV0LC+Kto1g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Szmb9fARj7tLQ/kYcmela18wgMQOHuePfCjZoqT9rm2JaDsVv6W01aCED76msRM59qYJACEIkk+J
bcP8tgMPR2C/v734MT1slRro6En1Rh7JRymnQdCTkPfY0Gd+bBpKeCUjSHsEnypR3ANNLS7D3Wty
cqDCpd89/zwR4nU3fXm0CrN8SiZCmRUVpBfj7XWaBj7Yk+zSc5O3QSer4ary7oM/p77ZLrcUqPp4
rT+zRAzIxYRIx2Fwr4iC+RlgSveUS6anXWdYJCMvpvkqie/R1LODvRdI2STZ7+asbTdD3e3bEmUa
m0pCwPbzt7/lifwYfvlhF10n0yGIMhRwRY5peg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pL5q36kJfJC6ewp2x/1i7eeZBloaj/U5eYbGB9YTbBMi0l/bcSRiH+sqvmrNgzRd6nhqY8TvdSQx
+I7q+SxwYfHb7B6C5dIE2rOVpaRsOwRr9vEoe80+N3I+sArQRhW9gncruvIXEARrDzBmi6t0LD4T
S/NQ8qA26Znqzg7N6nE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XTdbHsxPlZvkQD0a/DK11HearLdHYvEKXjUg6uCX53UHblSKrvghRsCpGpo2P57LEqbC/O1sQefR
r+zkBI6qS66DFQTDwXUo5OXor8HluwZ2IM5iK90Im25PwSNoCgukNXIjcl+Du88CoEwH6KbHIt+V
ovklGLLjypbhfR0fjBexk6I+uBdRnUwsz1qjiXHfSPs+kiQpxLXUlNH6u9M1V1c+JvBpmMjLDs97
BLeZ0IQn8XeC0vmC/ga5xruNFULQ0L1x/bz7ogrEiNURm8YRyckk3MPZ5Ue2qe9rS6aFR5+BfbZs
aG8dmpJNqTItn6C4p5bVoGz/1SprAiE1UdTIIQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
euuuXgiCv1wOPpltLLnsWcSA5ILR7Z9Z2nZqW2W1SZ0RHMADeZd3r0Fm8aepgwBRrF47ZDKxcwIE
h/ogQEP/9UPuixzatre2Jg1RR3/B+0uPX/mOhoGz/iCwZBV3iHP+HLTWk6V09RT9mIl/txLdSARG
A5pL3qU+bwua/mqlHBBoh7SUZNlhRhXQjlQPAm9Ho6BR3uS0w6hvEFblGSN7YBoptM6X0/yX2m9y
bAvAkdyn+k1BbHMI9k6txj+oPWeymozWZ0b/R4Oe7mFFihDE4Z507yP9ZQFqWM5KfrPfrs0zHbbv
4mZRLDyxiI2J5Da7s1aCvIx8UzQ/XBIUH1eiVQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jX7yfxtYJkOPeKFOvnuSVuWzWECyKj33bT99650a6wXugm0Sl/be/TrSfyBlyPqxB1Jz2R1r+ziA
tUowb1eCprDCIX3zfjvYGUJ8/dNaQ3nQy+N7j5ZZB/1yVe+APXJqu8ZzV6wmTemKw/AWRAapC33j
23AjEiRkoQ+BZ/ziDH2Z02lB9iCXxqzY+nfOZXEq/7XEUkLg9eSisCbBC6PJDD1ZsE5pGeo0WMPa
2pq39yGm90wRIS35ZQbhSNBsRbCwNHHx9HUe4ZM8QD0C40b9JahXwELcT72Z+INEf3DSfRT1Ls7M
wvR0MSkeqZiWO+phnjF4WX9+utXeVDx4mRbwQg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WR9bf4sCETmisudEqCUpEPYda1Z4uAzXG7oiNbjw4hRxbnTMCpGM7FwbiGNIpB8NsoIdPmi8IP9i
9z29b6PDUJCaHZmypv18iiMJYm9C/G+FVgr563Zm8cg3jFLuY6Rhu68gsH15kdeg7U3kaQSm+5Vf
hEUZPsSjR9lhpcbggvBro8YD8aw8jkfb/1VIx/yLa6XV2e+uZA2WkwJIEPr5cauTjkvLbSu7xRRc
wpyBaiWIdjDs8g+0WSsiDiZ7GNbgwkbjXSAx+ZtYab5qclunDm32U1E5TuBlrGOFiwUoui9tp+7+
gMOtIRXt86dftaD1A0tVbF5OzvHJJlOheA3W6w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 81280)
`pragma protect data_block
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
GNjWcEayTw731b3fvT/nyOgOZCqSIfugqI08EMmVN+boUZfz5rVqNTWKVIP10t1JXiB2n1MbDOr0
WR4g/gdqUcUt7auRpm1gJxgJX9BKyyQJZzSCpVDKrYUsT9aeoaED/7lYDf6MIeRqeo9dczi6ulvQ
J/WbRE8MyzhQEOKMHqzHk5HxFyO67ZH61LMHODwnd1siFnHdtPNmbZhYLK3OeKxewBF4WGsQJn3z
T1uJ9Q8YJGIkKoze5CEWCUKZSljwniuR5dQNaLq+NLjwlpvX3nuJIhUGE7D/5NpnWNE3oK+2bl63
tfTD/T1yIfPlmXPPJ54VmW1HWSMbw5TNfSFQ3hrFpYaJJkgn5cTAr6lXjtuJCLmVPCjZBIvPcTM5
lqTYxuKMy7liKDM2accL0dS1d6rQ5v7l8pWvvNUct33P8vycAo2/dNOXKeal7nnGZnVKgwYlMcpy
cuchwwLgPl9EixNsiTOb6tq8LKdMdJxFtgE2QKd1NlJZRkJJ3m/CAHs0dezwRi6L2uS0l37HsoKC
z9EEuxNn8ZHEWB1Jp0xi0KHnuBRTMuAtnDlID14DnRdDptTUOhQU+em5RyhNGV6bfC+qwCvvWzlC
V/2+zZbwfXz+6QV1CEepPC26jwxVzpMuPcODkRdIpB/xKyesYEEQtqAzkQ5J5jxzUgkhdxIRcqRY
q1UyYu2cp47MKXspDo0jRcQ8eTMmHNcn/AMX/ij8EwvAiePA1VWMVcgcTEPTNnhUJQY150Hk+yFF
pqvpLyInDyXJ/e4H/1p9NddI7oky+hzK/VnkOEf4D0ZVacYd2vDF38cEG6CzzClt4W2wSZGkhqGE
AexXfghW6VPL+y0PrAv+chgncHBNu/MmvgmJG/S4IZ22uOrnKaSxc/XnctosHZbSrlDL1/ycdRFO
Mh40HfgXZ/sWKfejyrbC/k06kMI2N1TiMkfpgNYEr34uyswLDKR1q73WOiurn66W4F/Zfoay0V2j
t7XM2xJGLsZJDJKCLrb1zpqA+T/vAllOB4fJ8R1acOy/5pX84tGtEIiMxxttjgye7drm9eWVVypV
Kj5W9by2zk3yVZSKscf6L6gzUfz9JCrQFkaHD6YRGekExJm2ElOEMbmtMsXgWNtflRqMj8YO/u8D
XJ9/U6zHLrOsVbPWf4I1e07yKfnXBqASRKeRRieNDPlbSlrh/3ei9uF1Izf+DuW3M8+EyzwGAyXG
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
