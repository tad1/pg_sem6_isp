-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri Mar 29 10:48:25 2024
-- Host        : matrix-delta running 64-bit Manjaro Linux
-- Command     : write_vhdl -force -mode synth_stub
--               /home/tad1/Projects/PG_SEM6/ISP/2019.1/lab7/lab7.srcs/sources_1/bd/mb_system/ip/mb_system_mdm_1_0/mb_system_mdm_1_0_stub.vhdl
-- Design      : mb_system_mdm_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mb_system_mdm_1_0 is
  Port ( 
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    Debug_SYS_Rst : out STD_LOGIC;
    Trig_In_0 : in STD_LOGIC;
    Trig_Ack_In_0 : out STD_LOGIC;
    Trig_Out_0 : out STD_LOGIC;
    Trig_Ack_Out_0 : in STD_LOGIC;
    M_AXI_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_AWLOCK : out STD_LOGIC;
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_WLAST : out STD_LOGIC;
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    M_AXI_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_ARLOCK : out STD_LOGIC;
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RLAST : in STD_LOGIC;
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC;
    LMB_Data_Addr_0 : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_Addr_Strobe_0 : out STD_LOGIC;
    LMB_Ready_0 : in STD_LOGIC;
    LMB_Byte_Enable_0 : out STD_LOGIC_VECTOR ( 0 to 3 );
    LMB_Data_Read_0 : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_Data_Write_0 : out STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_Read_Strobe_0 : out STD_LOGIC;
    LMB_Write_Strobe_0 : out STD_LOGIC;
    LMB_CE_0 : in STD_LOGIC;
    LMB_UE_0 : in STD_LOGIC;
    LMB_Wait_0 : in STD_LOGIC;
    Dbg_Clk_0 : out STD_LOGIC;
    Dbg_TDI_0 : out STD_LOGIC;
    Dbg_TDO_0 : in STD_LOGIC;
    Dbg_Reg_En_0 : out STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Capture_0 : out STD_LOGIC;
    Dbg_Shift_0 : out STD_LOGIC;
    Dbg_Update_0 : out STD_LOGIC;
    Dbg_Rst_0 : out STD_LOGIC;
    Dbg_Trig_In_0 : in STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Trig_Ack_In_0 : out STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Trig_Out_0 : out STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Trig_Ack_Out_0 : in STD_LOGIC_VECTOR ( 0 to 7 );
    Dbg_Disable_0 : out STD_LOGIC
  );

end mb_system_mdm_1_0;

architecture stub of mb_system_mdm_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "M_AXI_ACLK,M_AXI_ARESETN,Debug_SYS_Rst,Trig_In_0,Trig_Ack_In_0,Trig_Out_0,Trig_Ack_Out_0,M_AXI_AWID[0:0],M_AXI_AWADDR[31:0],M_AXI_AWLEN[7:0],M_AXI_AWSIZE[2:0],M_AXI_AWBURST[1:0],M_AXI_AWLOCK,M_AXI_AWCACHE[3:0],M_AXI_AWPROT[2:0],M_AXI_AWQOS[3:0],M_AXI_AWVALID,M_AXI_AWREADY,M_AXI_WDATA[31:0],M_AXI_WSTRB[3:0],M_AXI_WLAST,M_AXI_WVALID,M_AXI_WREADY,M_AXI_BRESP[1:0],M_AXI_BID[0:0],M_AXI_BVALID,M_AXI_BREADY,M_AXI_ARID[0:0],M_AXI_ARADDR[31:0],M_AXI_ARLEN[7:0],M_AXI_ARSIZE[2:0],M_AXI_ARBURST[1:0],M_AXI_ARLOCK,M_AXI_ARCACHE[3:0],M_AXI_ARPROT[2:0],M_AXI_ARQOS[3:0],M_AXI_ARVALID,M_AXI_ARREADY,M_AXI_RID[0:0],M_AXI_RDATA[31:0],M_AXI_RRESP[1:0],M_AXI_RLAST,M_AXI_RVALID,M_AXI_RREADY,LMB_Data_Addr_0[0:31],LMB_Addr_Strobe_0,LMB_Ready_0,LMB_Byte_Enable_0[0:3],LMB_Data_Read_0[0:31],LMB_Data_Write_0[0:31],LMB_Read_Strobe_0,LMB_Write_Strobe_0,LMB_CE_0,LMB_UE_0,LMB_Wait_0,Dbg_Clk_0,Dbg_TDI_0,Dbg_TDO_0,Dbg_Reg_En_0[0:7],Dbg_Capture_0,Dbg_Shift_0,Dbg_Update_0,Dbg_Rst_0,Dbg_Trig_In_0[0:7],Dbg_Trig_Ack_In_0[0:7],Dbg_Trig_Out_0[0:7],Dbg_Trig_Ack_Out_0[0:7],Dbg_Disable_0";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "MDM,Vivado 2019.1";
begin
end;
