# Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_i }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_i }]; 
#virtual DIP Switches
set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { sw_i[0] }];
set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { sw_i[1] }];
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { sw_i[2] }];
set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { sw_i[3] }];
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { sw_i[4] }];
set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { sw_i[5] }];
set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { sw_i[6] }];
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { sw_i[7] }];
#virtual Buttons
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { btn_i[0] }];
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { btn_i[1] }];
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { btn_i[2] }];
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { btn_i[3] }];

#set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports sw_i[0] ]; #virtual SW0
#set_property -dict { PACKAGE_PIN G16 IOSTANDARD LVCMOS33 } [get_ports sw_i[1] ]; #virtual SW1
#set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports sw_i[2] ]; #virtual SW2
#set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports sw_i[3] ]; #virtual SW3
#set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 } [get_ports sw_i[4] ]; #virtual SW4
#set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports sw_i[5] ]; #virtual SW5
#set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports sw_i[6] ]; #virtual SW6
#set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports sw_i[7] ]; #virtual SW7

#set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports btn_i[0] ]; #virtual BTN0
#set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports btn_i[1] ]; #virtual BTN1
#set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports btn_i[2] ]; #virtual BTN2
#set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports btn_i[3] ]; #virtual BTN3


#VGA Connector
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { red_o[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { red_o[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { red_o[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { red_o[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]
set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { green_o[0] }]; #IO_L1P_T0_AD4P_35 Sch=vga_g[0]
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { green_o[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=vga_g[1]
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { green_o[2] }]; #IO_L2N_T0_AD12N_35 Sch=vga_g[2]
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { green_o[3] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=vga_g[3]
set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { blue_o[0] }]; #IO_L2P_T0_AD12P_35 Sch=vga_b[0]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { blue_o[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { blue_o[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { blue_o[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { hsync_o }]; #IO_L4P_T0_15 Sch=vga_hs
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { vsync_o }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs
## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
