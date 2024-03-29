vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/microblaze_v11_0_2
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_22
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_24
vlib modelsim_lib/msim/lmb_v10_v3_0_10
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_17
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_20
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_19
vlib modelsim_lib/msim/axi_crossbar_v2_1_21
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_20
vlib modelsim_lib/msim/axi_intc_v4_1_14
vlib modelsim_lib/msim/mdm_v3_2_17
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/axi_timer_v2_0_22

vmap xpm modelsim_lib/msim/xpm
vmap microblaze_v11_0_2 modelsim_lib/msim/microblaze_v11_0_2
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_22 modelsim_lib/msim/axi_gpio_v2_0_22
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 modelsim_lib/msim/axi_uartlite_v2_0_24
vmap lmb_v10_v3_0_10 modelsim_lib/msim/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 modelsim_lib/msim/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 modelsim_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 modelsim_lib/msim/axi_crossbar_v2_1_21
vmap axi_protocol_converter_v2_1_20 modelsim_lib/msim/axi_protocol_converter_v2_1_20
vmap axi_intc_v4_1_14 modelsim_lib/msim/axi_intc_v4_1_14
vmap mdm_v3_2_17 modelsim_lib/msim/mdm_v3_2_17
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap axi_timer_v2_0_22 modelsim_lib/msim/axi_timer_v2_0_22

vlog -work xpm -64 -incr -sv "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"/opt/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_2 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_microblaze_0_0/sim/mb_system_microblaze_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_clk_wiz_0_0/mb_system_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/mb_system/ip/mb_system_clk_wiz_0_0/mb_system_clk_wiz_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_22 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/f71e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_axi_gpio_0_0/sim/mb_system_axi_gpio_0_0.vhd" \
"../../../bd/mb_system/ip/mb_system_axi_gpio_1_0/sim/mb_system_axi_gpio_1_0.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_axi_uartlite_0_0/sim/mb_system_axi_uartlite_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_dlmb_v10_0/sim/mb_system_dlmb_v10_0.vhd" \
"../../../bd/mb_system/ip/mb_system_ilmb_v10_0/sim/mb_system_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_dlmb_bram_if_cntlr_0/sim/mb_system_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/mb_system/ip/mb_system_ilmb_bram_if_cntlr_0/sim/mb_system_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_lmb_bram_0/sim/mb_system_lmb_bram_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_lmb_v10_0/sim/mb_system_lmb_v10_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_xbar_0/sim/mb_system_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_20 -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/4fba" "+incdir+../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/ec67/hdl" \
"../../../bd/mb_system/ip/mb_system_auto_pc_0/sim/mb_system_auto_pc_0.v" \

vcom -work axi_intc_v4_1_14 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/f78a/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_microblaze_0_axi_intc_0/sim/mb_system_microblaze_0_axi_intc_0.vhd" \

vcom -work mdm_v3_2_17 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_mdm_1_0/sim/mb_system_mdm_1_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_rst_clk_wiz_0_100M_0/sim/mb_system_rst_clk_wiz_0_100M_0.vhd" \

vcom -work axi_timer_v2_0_22 -64 -93 \
"../../../../lab7.srcs/sources_1/bd/mb_system/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mb_system/ip/mb_system_axi_timer_0_0/sim/mb_system_axi_timer_0_0.vhd" \
"../../../bd/mb_system/sim/mb_system.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

