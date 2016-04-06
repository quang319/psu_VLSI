######################################################
#                                                    #
#                  CONSTRAINTS FILE                  #
#     FOR XILINX XpressV7 xc7vx690tffg1157-2 BOARD   #
#                                                    #
######################################################

# ----------------------------------------------------
#  TIMING CONSTRAINTS
# ----------------------------------------------------

# Frequency Constraints
create_clock -period 10.000 -name pcie_clk [get_pins * -hier -filter {NAME  =~ */refclk_ibuf/O}]
create_clock -period 10.000 -name txoutclk [get_pins * -hier -filter {NAME  =~ */txoutclk_i.txoutclk_i/O}]
create_clock -period 8.000 -name sys_clk [get_ports sys_clk_p]

create_generated_clock -name clk_125mhz_mux -source [get_pins * -hier -filter {NAME  =~ */ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/I0}] -divide_by 1 [get_pins * -hier -filter {NAME  =~ */ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/O}]

create_generated_clock -name clk_250mhz_mux -source [get_pins * -hier -filter {NAME  =~ */ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/I1}] -divide_by 1 -add -master_clock clk_250mhz [get_pins * -hier -filter {NAME  =~ */ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/O}]
#set_clock_groups -name pcieclkmux -physically_exclusive -group [get_clocks -include_generated_clocks clk_125mhz_mux] -group [get_clocks -include_generated_clocks clk_250mhz_mux]
set_clock_groups -name pcieclkmux -physically_exclusive -group clk_125mhz_mux -group clk_250mhz_mux
set_false_path -to [get_pins * -hier -filter {NAME  =~ */ext_clk.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/S*}]
set_max_delay -from [get_cells -hier *rst_sync_reg1_reg] -to [get_cells -hier *rst_sync_reg2_reg] 2.000

# False pathes
set_false_path -from [get_ports pcie_rst_n]
set_false_path -through [get_cells LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/aresetn_reg]

set_false_path -from [get_ports sys_rst_n]
set_false_path -through [get_cells -hier *rst_sync_reg2_reg]
set_false_path -through [get_cells -hier {vortex_rst_r_reg[31]}]


set_property VCCAUX_IO DONTCARE [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL135 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL135 [get_ports sys_clk_n]

# ----------------------------------------------------
#  PIN PROPERTIES
# ----------------------------------------------------

#ska - adding user mechanical switches

set_property IOSTANDARD LVCMOS18 [get_ports sys_sw_a]
set_property PACKAGE_PIN E11 [get_ports sys_sw_a]

set_property IOSTANDARD LVCMOS18 [get_ports sys_sw_b]
set_property PACKAGE_PIN F15 [get_ports sys_sw_b]

set_property IOSTANDARD LVCMOS18 [get_ports sys_sw_c]
set_property PACKAGE_PIN F14 [get_ports sys_sw_c]

#####

set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_n]
set_property PACKAGE_PIN G15 [get_ports sys_rst_n]

set_property IOSTANDARD LVCMOS18 [get_ports pcie_rst_n]
set_property PULLUP true [get_ports pcie_rst_n]
set_property PACKAGE_PIN L9 [get_ports pcie_rst_n]

set_property LOC PCIE3_X0Y2 [get_cells LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/PCIE_3_0_i]


###############################################################################
#
# Buffer (BRAM) Placement Constraints
#
###############################################################################
# Replay Buffer RAMB Placement
set_property LOC RAMB36_X12Y83 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/replay_buffer/U0/RAMB36E1[0].u_buffer}]
set_property LOC RAMB36_X12Y84 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/replay_buffer/U0/RAMB36E1[1].u_buffer}]

# Non-Posted Request Buffer RAMB Placement
set_property LOC RAMB18_X12Y150 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/req_fifo/U0/RAMB18E1[0].u_fifo}]
set_property LOC RAMB18_X12Y151 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/req_fifo/U0/RAMB18E1[1].u_fifo}]
set_property LOC RAMB18_X12Y152 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/req_fifo/U0/RAMB18E1[2].u_fifo}]
set_property LOC RAMB18_X12Y153 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/req_fifo/U0/RAMB18E1[3].u_fifo}]

# Completion Buffer RAMB Placement
set_property LOC RAMB36_X12Y78 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/cpl_fifo/genblk1.CPL_FIFO_16KB.U0/SPEED_250MHz.RAMB36E1[0].u_fifo}]
set_property LOC RAMB36_X12Y79 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/cpl_fifo/genblk1.CPL_FIFO_16KB.U0/SPEED_250MHz.RAMB36E1[1].u_fifo}]
set_property LOC RAMB36_X12Y80 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/cpl_fifo/genblk1.CPL_FIFO_16KB.U0/SPEED_250MHz.RAMB36E1[2].u_fifo}]
set_property LOC RAMB36_X12Y81 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/pcie_top_i/pcie_7vx_i/pcie_bram_7vx_i/cpl_fifo/genblk1.CPL_FIFO_16KB.U0/SPEED_250MHz.RAMB36E1[3].u_fifo}]


###############################################################################
# On-board LEDs
set_property PACKAGE_PIN M11 [get_ports {usr_led[0]}]
set_property PACKAGE_PIN M10 [get_ports {usr_led[1]}]
set_property PACKAGE_PIN L10 [get_ports {usr_led[2]}]
set_property PACKAGE_PIN K11 [get_ports {usr_led[3]}]
set_property PACKAGE_PIN L13 [get_ports {usr_led[4]}]
set_property PACKAGE_PIN M13 [get_ports {usr_led[5]}]
set_property PACKAGE_PIN H17 [get_ports {usr_led[6]}]
set_property PACKAGE_PIN M12 [get_ports {usr_led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {usr_led[7]}]

###############################################################################
# Physical Constraints
###############################################################################

set_property PACKAGE_PIN AM31 [get_ports sys_clk_n]


#set_property LOC GTHE2_CHANNEL_X1Y31 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/gt_top.gt_top_i/pipe_wrapper_i/pipe_lane[4].gt_wrapper_i/gth_channel.gthe2_channel_i}]
#set_property LOC GTHE2_CHANNEL_X1Y30 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/gt_top.gt_top_i/pipe_wrapper_i/pipe_lane[5].gt_wrapper_i/gth_channel.gthe2_channel_i}]
#set_property LOC GTHE2_CHANNEL_X1Y29 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/gt_top.gt_top_i/pipe_wrapper_i/pipe_lane[6].gt_wrapper_i/gth_channel.gthe2_channel_i}]
#set_property LOC GTHE2_CHANNEL_X1Y28 [get_cells {LBL_SLOT0_IS_HOST_INTERFACE.i_slot0_host_interface/qpcie_ipcore/qpcie_v7_hip_gen3_top/core_inst/inst/gt_top.gt_top_i/pipe_wrapper_i/pipe_lane[7].gt_wrapper_i/gth_channel.gthe2_channel_i}]

set_property PACKAGE_PIN H5 [get_ports pcie_clk_n]



set_property PACKAGE_PIN A3 [get_ports {pcie_txn[0]}]
set_property PACKAGE_PIN B1 [get_ports {pcie_txn[1]}]
set_property PACKAGE_PIN C3 [get_ports {pcie_txn[2]}]
set_property PACKAGE_PIN D1 [get_ports {pcie_txn[3]}]

###############################################################################
# Protocore Signals
###############################################################################
set_property PACKAGE_PIN K12 [get_ports prot0_out]
set_property PACKAGE_PIN H14 [get_ports {prot2_in[0]}]
set_property PACKAGE_PIN J14 [get_ports {prot2_in[1]}]
set_property PACKAGE_PIN K13 [get_ports prot2_out]

set_property IOSTANDARD LVCMOS18 [get_ports prot0_out]
set_property IOSTANDARD LVCMOS18 [get_ports {prot2_in[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {prot2_in[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports prot2_out]


#create_pblock pblock_LBL_AM_ACLRTR.i_am_engn
#add_cells_to_pblock [get_pblocks pblock_LBL_AM_ACLRTR.i_am_engn] [get_cells -quiet [list LBL_SLOT1_IS_ACCELERATOR.i_slot1_accelerator]]
#resize_pblock [get_pblocks pblock_LBL_AM_ACLRTR.i_am_engn] -add {SLICE_X106Y0:SLICE_X221Y199}
#resize_pblock [get_pblocks pblock_LBL_AM_ACLRTR.i_am_engn] -add {DSP48_X7Y0:DSP48_X17Y79}
#resize_pblock [get_pblocks pblock_LBL_AM_ACLRTR.i_am_engn] -add {RAMB18_X7Y0:RAMB18_X14Y79}
#resize_pblock [get_pblocks pblock_LBL_AM_ACLRTR.i_am_engn] -add {RAMB36_X7Y0:RAMB36_X14Y39}

#set_property C_CLK_INPUT_FREQ_HZ 100000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets qpcie_clk_out]

############## Memory Controller Constraints ##################


create_clock -period 5.000 -name mem_clk [get_ports mem_clk_p]
#set_propagated_clock mem_clk_p

create_clock -period 5.000 -name mem_ref_clk_p [get_ports mem_ref_clk_p]
#set_propagated_clock mem_ref_clk_p

# Note: the following CLOCK_DEDICATED_ROUTE constraint will cause a warning in place similar
# to the following:
#   WARNING:Place:1402 - A clock IOB / PLL clock component pair have been found that are not
#   placed at an optimal clock IOB / PLL site pair.
# This warning can be ignored.  See the Users Guide for more information.

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets mem_clk_p]
current_instance LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]
current_instance -quiet
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hierarchical *pll*CLKIN1]


############## NET - IOSTANDARD ##################


# PadFunction: IO_L1P_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[0]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[0]}]
set_property PACKAGE_PIN L23 [get_ports {ddr3_dq[0]}]

# PadFunction: IO_L5N_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[1]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[1]}]
set_property PACKAGE_PIN K27 [get_ports {ddr3_dq[1]}]

# PadFunction: IO_L1N_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[2]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[2]}]
set_property PACKAGE_PIN K23 [get_ports {ddr3_dq[2]}]

# PadFunction: IO_L2N_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[3]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[3]}]
set_property PACKAGE_PIN L28 [get_ports {ddr3_dq[3]}]

# PadFunction: IO_L4P_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[4]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[4]}]
set_property PACKAGE_PIN M26 [get_ports {ddr3_dq[4]}]

# PadFunction: IO_L4N_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[5]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[5]}]
set_property PACKAGE_PIN L26 [get_ports {ddr3_dq[5]}]

# PadFunction: IO_L6P_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[6]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[6]}]
set_property PACKAGE_PIN M25 [get_ports {ddr3_dq[6]}]

# PadFunction: IO_L5P_T0_18
set_property SLEW FAST [get_ports {ddr3_dq[7]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[7]}]
set_property PACKAGE_PIN K26 [get_ports {ddr3_dq[7]}]

# PadFunction: IO_L4P_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[8]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[8]}]
set_property PACKAGE_PIN P24 [get_ports {ddr3_dq[8]}]

# PadFunction: IO_L1N_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[9]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[9]}]
set_property PACKAGE_PIN N25 [get_ports {ddr3_dq[9]}]

# PadFunction: IO_L4N_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[10]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[10]}]
set_property PACKAGE_PIN P25 [get_ports {ddr3_dq[10]}]

# PadFunction: IO_L2N_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[11]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[11]}]
set_property PACKAGE_PIN N28 [get_ports {ddr3_dq[11]}]

# PadFunction: IO_L5N_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[12]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[12]}]
set_property PACKAGE_PIN T25 [get_ports {ddr3_dq[12]}]

# PadFunction: IO_L2P_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[13]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[13]}]
set_property PACKAGE_PIN N27 [get_ports {ddr3_dq[13]}]

# PadFunction: IO_L5P_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[14]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[14]}]
set_property PACKAGE_PIN T24 [get_ports {ddr3_dq[14]}]

# PadFunction: IO_L6P_T0_17
set_property SLEW FAST [get_ports {ddr3_dq[15]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[15]}]
set_property PACKAGE_PIN P26 [get_ports {ddr3_dq[15]}]

# PadFunction: IO_L23N_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[16]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[16]}]
set_property PACKAGE_PIN T34 [get_ports {ddr3_dq[16]}]

# PadFunction: IO_L22N_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[17]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[17]}]
set_property PACKAGE_PIN N34 [get_ports {ddr3_dq[17]}]

# PadFunction: IO_L23P_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[18]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[18]}]
set_property PACKAGE_PIN U33 [get_ports {ddr3_dq[18]}]

# PadFunction: IO_L20P_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[19]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[19]}]
set_property PACKAGE_PIN M32 [get_ports {ddr3_dq[19]}]

# PadFunction: IO_L19P_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[20]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[20]}]
set_property PACKAGE_PIN P32 [get_ports {ddr3_dq[20]}]

# PadFunction: IO_L20N_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[21]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[21]}]
set_property PACKAGE_PIN M33 [get_ports {ddr3_dq[21]}]

# PadFunction: IO_L24P_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[22]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[22]}]
set_property PACKAGE_PIN R33 [get_ports {ddr3_dq[22]}]

# PadFunction: IO_L24N_T3_17
set_property SLEW FAST [get_ports {ddr3_dq[23]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[23]}]
set_property PACKAGE_PIN P34 [get_ports {ddr3_dq[23]}]

# PadFunction: IO_L14N_T2_SRCC_17
set_property SLEW FAST [get_ports {ddr3_dq[24]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[24]}]
set_property PACKAGE_PIN T30 [get_ports {ddr3_dq[24]}]

# PadFunction: IO_L18N_T2_17
set_property SLEW FAST [get_ports {ddr3_dq[25]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[25]}]
set_property PACKAGE_PIN T26 [get_ports {ddr3_dq[25]}]

# PadFunction: IO_L16N_T2_17
set_property SLEW FAST [get_ports {ddr3_dq[26]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[26]}]
set_property PACKAGE_PIN T28 [get_ports {ddr3_dq[26]}]

# PadFunction: IO_L17N_T2_17
set_property SLEW FAST [get_ports {ddr3_dq[27]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[27]}]
set_property PACKAGE_PIN U27 [get_ports {ddr3_dq[27]}]

# PadFunction: IO_L14P_T2_SRCC_17
set_property SLEW FAST [get_ports {ddr3_dq[28]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[28]}]
set_property PACKAGE_PIN T29 [get_ports {ddr3_dq[28]}]

# PadFunction: IO_L17P_T2_17
set_property SLEW FAST [get_ports {ddr3_dq[29]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[29]}]
set_property PACKAGE_PIN U26 [get_ports {ddr3_dq[29]}]

# PadFunction: IO_L16P_T2_17
set_property SLEW FAST [get_ports {ddr3_dq[30]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[30]}]
set_property PACKAGE_PIN U28 [get_ports {ddr3_dq[30]}]

# PadFunction: IO_L18P_T2_17
set_property SLEW FAST [get_ports {ddr3_dq[31]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[31]}]
set_property PACKAGE_PIN U25 [get_ports {ddr3_dq[31]}]

# PadFunction: IO_L4N_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[32]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[32]}]
set_property PACKAGE_PIN B34 [get_ports {ddr3_dq[32]}]

# PadFunction: IO_L5N_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[33]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[33]}]
set_property PACKAGE_PIN D31 [get_ports {ddr3_dq[33]}]

# PadFunction: IO_L2N_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[34]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[34]}]
set_property PACKAGE_PIN C34 [get_ports {ddr3_dq[34]}]

# PadFunction: IO_L1P_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[35]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[35]}]
set_property PACKAGE_PIN B31 [get_ports {ddr3_dq[35]}]

# PadFunction: IO_L4P_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[36]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[36]}]
set_property PACKAGE_PIN C33 [get_ports {ddr3_dq[36]}]

# PadFunction: IO_L1N_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[37]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[37]}]
set_property PACKAGE_PIN B32 [get_ports {ddr3_dq[37]}]

# PadFunction: IO_L2P_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[38]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[38]}]
set_property PACKAGE_PIN D34 [get_ports {ddr3_dq[38]}]

# PadFunction: IO_L6P_T0_19
set_property SLEW FAST [get_ports {ddr3_dq[39]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[39]}]
set_property PACKAGE_PIN D32 [get_ports {ddr3_dq[39]}]

# PadFunction: IO_L10N_T1_19
set_property SLEW FAST [get_ports {ddr3_dq[40]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[40]}]
set_property PACKAGE_PIN B27 [get_ports {ddr3_dq[40]}]

# PadFunction: IO_L8P_T1_19
set_property SLEW FAST [get_ports {ddr3_dq[41]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[41]}]
set_property PACKAGE_PIN A25 [get_ports {ddr3_dq[41]}]

# PadFunction: IO_L12N_T1_MRCC_19
set_property SLEW FAST [get_ports {ddr3_dq[42]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[42]}]
set_property PACKAGE_PIN B28 [get_ports {ddr3_dq[42]}]

# PadFunction: IO_L10P_T1_19
set_property SLEW FAST [get_ports {ddr3_dq[43]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[43]}]
set_property PACKAGE_PIN B26 [get_ports {ddr3_dq[43]}]

# PadFunction: IO_L12P_T1_MRCC_19
set_property SLEW FAST [get_ports {ddr3_dq[44]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[44]}]
set_property PACKAGE_PIN C27 [get_ports {ddr3_dq[44]}]

# PadFunction: IO_L11P_T1_SRCC_19
set_property SLEW FAST [get_ports {ddr3_dq[45]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[45]}]
set_property PACKAGE_PIN E27 [get_ports {ddr3_dq[45]}]

# PadFunction: IO_L11N_T1_SRCC_19
set_property SLEW FAST [get_ports {ddr3_dq[46]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[46]}]
set_property PACKAGE_PIN D27 [get_ports {ddr3_dq[46]}]

# PadFunction: IO_L8N_T1_19
set_property SLEW FAST [get_ports {ddr3_dq[47]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[47]}]
set_property PACKAGE_PIN A26 [get_ports {ddr3_dq[47]}]

# PadFunction: IO_L23N_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[48]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[48]}]
set_property PACKAGE_PIN D25 [get_ports {ddr3_dq[48]}]

# PadFunction: IO_L24P_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[49]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[49]}]
set_property PACKAGE_PIN G27 [get_ports {ddr3_dq[49]}]

# PadFunction: IO_L24N_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[50]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[50]}]
set_property PACKAGE_PIN F28 [get_ports {ddr3_dq[50]}]

# PadFunction: IO_L20N_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[51]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[51]}]
set_property PACKAGE_PIN H25 [get_ports {ddr3_dq[51]}]

# PadFunction: IO_L23P_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[52]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[52]}]
set_property PACKAGE_PIN E24 [get_ports {ddr3_dq[52]}]

# PadFunction: IO_L20P_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[53]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[53]}]
set_property PACKAGE_PIN J25 [get_ports {ddr3_dq[53]}]

# PadFunction: IO_L22N_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[54]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[54]}]
set_property PACKAGE_PIN F26 [get_ports {ddr3_dq[54]}]

# PadFunction: IO_L22P_T3_19
set_property SLEW FAST [get_ports {ddr3_dq[55]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[55]}]
set_property PACKAGE_PIN G26 [get_ports {ddr3_dq[55]}]

# PadFunction: IO_L7P_T1_17
set_property SLEW FAST [get_ports {ddr3_dq[56]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[56]}]
set_property PACKAGE_PIN N29 [get_ports {ddr3_dq[56]}]

# PadFunction: IO_L12N_T1_MRCC_17
set_property SLEW FAST [get_ports {ddr3_dq[57]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[57]}]
set_property PACKAGE_PIN P30 [get_ports {ddr3_dq[57]}]

# PadFunction: IO_L12P_T1_MRCC_17
set_property SLEW FAST [get_ports {ddr3_dq[58]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[58]}]
set_property PACKAGE_PIN P29 [get_ports {ddr3_dq[58]}]

# PadFunction: IO_L10P_T1_17
set_property SLEW FAST [get_ports {ddr3_dq[59]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[59]}]
set_property PACKAGE_PIN U31 [get_ports {ddr3_dq[59]}]

# PadFunction: IO_L8N_T1_17
set_property SLEW FAST [get_ports {ddr3_dq[60]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[60]}]
set_property PACKAGE_PIN M31 [get_ports {ddr3_dq[60]}]

# PadFunction: IO_L10N_T1_17
set_property SLEW FAST [get_ports {ddr3_dq[61]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[61]}]
set_property PACKAGE_PIN U32 [get_ports {ddr3_dq[61]}]

# PadFunction: IO_L8P_T1_17
set_property SLEW FAST [get_ports {ddr3_dq[62]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[62]}]
set_property PACKAGE_PIN M30 [get_ports {ddr3_dq[62]}]

# PadFunction: IO_L7N_T1_17
set_property SLEW FAST [get_ports {ddr3_dq[63]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[63]}]
set_property PACKAGE_PIN N30 [get_ports {ddr3_dq[63]}]

# PadFunction: IO_L16P_T2_19
set_property SLEW FAST [get_ports {ddr3_dq[64]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[64]}]
set_property PACKAGE_PIN D29 [get_ports {ddr3_dq[64]}]

# PadFunction: IO_L17P_T2_19
set_property SLEW FAST [get_ports {ddr3_dq[65]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[65]}]
set_property PACKAGE_PIN A30 [get_ports {ddr3_dq[65]}]

# PadFunction: IO_L18N_T2_19
set_property SLEW FAST [get_ports {ddr3_dq[66]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[66]}]
set_property PACKAGE_PIN E29 [get_ports {ddr3_dq[66]}]

# PadFunction: IO_L17N_T2_19
set_property SLEW FAST [get_ports {ddr3_dq[67]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[67]}]
set_property PACKAGE_PIN A31 [get_ports {ddr3_dq[67]}]

# PadFunction: IO_L14P_T2_SRCC_19
set_property SLEW FAST [get_ports {ddr3_dq[68]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[68]}]
set_property PACKAGE_PIN C28 [get_ports {ddr3_dq[68]}]

# PadFunction: IO_L16N_T2_19
set_property SLEW FAST [get_ports {ddr3_dq[69]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[69]}]
set_property PACKAGE_PIN D30 [get_ports {ddr3_dq[69]}]

# PadFunction: IO_L18P_T2_19
set_property SLEW FAST [get_ports {ddr3_dq[70]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[70]}]
set_property PACKAGE_PIN E28 [get_ports {ddr3_dq[70]}]

# PadFunction: IO_L14N_T2_SRCC_19
set_property SLEW FAST [get_ports {ddr3_dq[71]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddr3_dq[71]}]
set_property PACKAGE_PIN C29 [get_ports {ddr3_dq[71]}]

# PadFunction: IO_L16N_T2_18
set_property SLEW FAST [get_ports {ddr3_addr[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[15]}]
set_property PACKAGE_PIN J29 [get_ports {ddr3_addr[15]}]

# PadFunction: IO_L17N_T2_18
set_property SLEW FAST [get_ports {ddr3_addr[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[14]}]
set_property PACKAGE_PIN F29 [get_ports {ddr3_addr[14]}]

# PadFunction: IO_L23P_T3_18
set_property SLEW FAST [get_ports {ddr3_addr[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[13]}]
set_property PACKAGE_PIN K34 [get_ports {ddr3_addr[13]}]

# PadFunction: IO_L14P_T2_SRCC_18
set_property SLEW FAST [get_ports {ddr3_addr[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[12]}]
set_property PACKAGE_PIN J30 [get_ports {ddr3_addr[12]}]

# PadFunction: IO_L22P_T3_18
set_property SLEW FAST [get_ports {ddr3_addr[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[11]}]
set_property PACKAGE_PIN L33 [get_ports {ddr3_addr[11]}]

# PadFunction: IO_L24N_T3_18
set_property SLEW FAST [get_ports {ddr3_addr[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[10]}]
set_property PACKAGE_PIN L31 [get_ports {ddr3_addr[10]}]

# PadFunction: IO_L21N_T3_DQS_18
set_property SLEW FAST [get_ports {ddr3_addr[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[9]}]
set_property PACKAGE_PIN H34 [get_ports {ddr3_addr[9]}]

# PadFunction: IO_L12P_T1_MRCC_18
set_property SLEW FAST [get_ports {ddr3_addr[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[8]}]
set_property PACKAGE_PIN G30 [get_ports {ddr3_addr[8]}]

# PadFunction: IO_L7N_T1_18
set_property SLEW FAST [get_ports {ddr3_addr[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[7]}]
set_property PACKAGE_PIN F34 [get_ports {ddr3_addr[7]}]

# PadFunction: IO_L17P_T2_18
set_property SLEW FAST [get_ports {ddr3_addr[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[6]}]
set_property PACKAGE_PIN G28 [get_ports {ddr3_addr[6]}]

# PadFunction: IO_L10P_T1_18
set_property SLEW FAST [get_ports {ddr3_addr[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[5]}]
set_property PACKAGE_PIN F33 [get_ports {ddr3_addr[5]}]

# PadFunction: IO_L14N_T2_SRCC_18
set_property SLEW FAST [get_ports {ddr3_addr[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[4]}]
set_property PACKAGE_PIN J31 [get_ports {ddr3_addr[4]}]

# PadFunction: IO_L11N_T1_SRCC_18
set_property SLEW FAST [get_ports {ddr3_addr[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[3]}]
set_property PACKAGE_PIN G32 [get_ports {ddr3_addr[3]}]

# PadFunction: IO_L10N_T1_18
set_property SLEW FAST [get_ports {ddr3_addr[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[2]}]
set_property PACKAGE_PIN E34 [get_ports {ddr3_addr[2]}]

# PadFunction: IO_L20P_T3_18
set_property SLEW FAST [get_ports {ddr3_addr[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[1]}]
set_property PACKAGE_PIN K32 [get_ports {ddr3_addr[1]}]

# PadFunction: IO_L22N_T3_18
set_property SLEW FAST [get_ports {ddr3_addr[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[0]}]
set_property PACKAGE_PIN L34 [get_ports {ddr3_addr[0]}]

# PadFunction: IO_L8N_T1_18
set_property SLEW FAST [get_ports {ddr3_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[2]}]
set_property PACKAGE_PIN E33 [get_ports {ddr3_ba[2]}]

# PadFunction: IO_L18N_T2_18
set_property SLEW FAST [get_ports {ddr3_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[1]}]
set_property PACKAGE_PIN K29 [get_ports {ddr3_ba[1]}]

# PadFunction: IO_L7P_T1_18
set_property SLEW FAST [get_ports {ddr3_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[0]}]
set_property PACKAGE_PIN G33 [get_ports {ddr3_ba[0]}]

# PadFunction: IO_L8P_T1_18
set_property SLEW FAST [get_ports ddr3_ras_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_ras_n]
set_property PACKAGE_PIN E32 [get_ports ddr3_ras_n]

# PadFunction: IO_L11P_T1_SRCC_18
set_property SLEW FAST [get_ports ddr3_cas_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_cas_n]
set_property PACKAGE_PIN H32 [get_ports ddr3_cas_n]

# PadFunction: IO_L21P_T3_DQS_18
set_property SLEW FAST [get_ports ddr3_we_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_we_n]
set_property PACKAGE_PIN H33 [get_ports ddr3_we_n]

# PadFunction: IO_L23N_T3_18
set_property SLEW FAST [get_ports ddr3_reset_n]
set_property IOSTANDARD LVCMOS15 [get_ports ddr3_reset_n]
set_property PACKAGE_PIN J34 [get_ports ddr3_reset_n]

# PadFunction: IO_L16P_T2_18
set_property SLEW FAST [get_ports {ddr3_cke[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[0]}]
set_property PACKAGE_PIN K28 [get_ports {ddr3_cke[0]}]

# PadFunction: IO_L12N_T1_MRCC_18
set_property SLEW FAST [get_ports {ddr3_odt[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[0]}]
set_property PACKAGE_PIN G31 [get_ports {ddr3_odt[0]}]

# PadFunction: IO_L20N_T3_18
set_property SLEW FAST [get_ports {ddr3_cs_n[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cs_n[0]}]
set_property PACKAGE_PIN K33 [get_ports {ddr3_cs_n[0]}]

# PadFunction: IO_L2P_T0_18
set_property SLEW FAST [get_ports {ddr3_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[0]}]
set_property PACKAGE_PIN M27 [get_ports {ddr3_dm[0]}]

# PadFunction: IO_L1P_T0_17
set_property SLEW FAST [get_ports {ddr3_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[1]}]
set_property PACKAGE_PIN N24 [get_ports {ddr3_dm[1]}]

# PadFunction: IO_L22P_T3_17
set_property SLEW FAST [get_ports {ddr3_dm[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[2]}]
set_property PACKAGE_PIN N33 [get_ports {ddr3_dm[2]}]

# PadFunction: IO_L13P_T2_MRCC_17
set_property SLEW FAST [get_ports {ddr3_dm[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[3]}]
set_property PACKAGE_PIN R28 [get_ports {ddr3_dm[3]}]

# PadFunction: IO_L5P_T0_19
set_property SLEW FAST [get_ports {ddr3_dm[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[4]}]
set_property PACKAGE_PIN E31 [get_ports {ddr3_dm[4]}]

# PadFunction: IO_L7P_T1_19
set_property SLEW FAST [get_ports {ddr3_dm[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[5]}]
set_property PACKAGE_PIN C25 [get_ports {ddr3_dm[5]}]

# PadFunction: IO_L19P_T3_19
set_property SLEW FAST [get_ports {ddr3_dm[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[6]}]
set_property PACKAGE_PIN J24 [get_ports {ddr3_dm[6]}]

# PadFunction: IO_L11P_T1_SRCC_17
set_property SLEW FAST [get_ports {ddr3_dm[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[7]}]
set_property PACKAGE_PIN R31 [get_ports {ddr3_dm[7]}]

# PadFunction: IO_L13P_T2_MRCC_19
set_property SLEW FAST [get_ports {ddr3_dm[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[8]}]
set_property PACKAGE_PIN C30 [get_ports {ddr3_dm[8]}]

# PadFunction: IO_L13P_T2_MRCC_14
set_property IOSTANDARD LVDS [get_ports mem_clk_p]
set_property PACKAGE_PIN AK28 [get_ports {mem_clk_p}]

# PadFunction: IO_L13N_T2_MRCC_14
set_property IOSTANDARD LVDS [get_ports mem_clk_n]
set_property PACKAGE_PIN AL28 [get_ports {mem_clk_n}]

# PadFunction: IO_L12P_T1_MRCC_14
set_property IOSTANDARD LVDS [get_ports mem_ref_clk_p]
set_property PACKAGE_PIN AL29 [get_ports {mem_ref_clk_p}]

# PadFunction: IO_L12N_T1_MRCC_14
set_property IOSTANDARD LVDS [get_ports mem_ref_clk_n]
set_property PACKAGE_PIN AL30 [get_ports {mem_ref_clk_n}]

# PadFunction: IO_L3P_T0_DQS_18
set_property SLEW FAST [get_ports {ddr3_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[0]}]

# PadFunction: IO_L3N_T0_DQS_18
set_property SLEW FAST [get_ports {ddr3_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[0]}]
set_property PACKAGE_PIN K24 [get_ports {ddr3_dqs_n[0]}]

# PadFunction: IO_L3P_T0_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[1]}]

# PadFunction: IO_L3N_T0_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[1]}]
set_property PACKAGE_PIN R24 [get_ports {ddr3_dqs_n[1]}]

# PadFunction: IO_L21P_T3_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_p[2]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[2]}]

# PadFunction: IO_L21N_T3_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_n[2]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[2]}]
set_property PACKAGE_PIN R34 [get_ports {ddr3_dqs_n[2]}]

# PadFunction: IO_L15P_T2_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_p[3]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[3]}]

# PadFunction: IO_L15N_T2_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_n[3]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[3]}]
set_property PACKAGE_PIN R27 [get_ports {ddr3_dqs_n[3]}]

# PadFunction: IO_L3P_T0_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_p[4]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[4]}]

# PadFunction: IO_L3N_T0_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_n[4]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[4]}]
set_property PACKAGE_PIN A33 [get_ports {ddr3_dqs_n[4]}]

# PadFunction: IO_L9P_T1_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_p[5]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[5]}]

# PadFunction: IO_L9N_T1_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_n[5]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[5]}]
set_property PACKAGE_PIN D26 [get_ports {ddr3_dqs_n[5]}]

# PadFunction: IO_L21P_T3_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_p[6]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[6]}]

# PadFunction: IO_L21N_T3_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_n[6]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[6]}]
set_property PACKAGE_PIN F25 [get_ports {ddr3_dqs_n[6]}]

# PadFunction: IO_L9P_T1_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_p[7]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[7]}]

# PadFunction: IO_L9N_T1_DQS_17
set_property SLEW FAST [get_ports {ddr3_dqs_n[7]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[7]}]
set_property PACKAGE_PIN R32 [get_ports {ddr3_dqs_n[7]}]

# PadFunction: IO_L15P_T2_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_p[8]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_p[8]}]

# PadFunction: IO_L15N_T2_DQS_19
set_property SLEW FAST [get_ports {ddr3_dqs_n[8]}]
set_property IOSTANDARD DIFF_SSTL15_T_DCI [get_ports {ddr3_dqs_n[8]}]
set_property PACKAGE_PIN A29 [get_ports {ddr3_dqs_n[8]}]

# PadFunction: IO_L15P_T2_DQS_18
set_property SLEW FAST [get_ports {ddr3_ck_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_p[0]}]

# PadFunction: IO_L15N_T2_DQS_18
set_property SLEW FAST [get_ports {ddr3_ck_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_n[0]}]
set_property PACKAGE_PIN H28 [get_ports {ddr3_ck_n[0]}]



set_property LOC PHASER_OUT_PHY_X0Y31 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y30 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y29 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y28 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y34 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y33 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y32 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y35 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y39 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y38 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y37 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out]
set_property LOC PHASER_OUT_PHY_X0Y36 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out]

set_property LOC PHASER_IN_PHY_X0Y31 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y30 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y29 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y28 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in]
## set_property LOC PHASER_IN_PHY_X0Y34 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
## set_property LOC PHASER_IN_PHY_X0Y33 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
## set_property LOC PHASER_IN_PHY_X0Y32 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X0Y35 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y39 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y38 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y37 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in]
set_property LOC PHASER_IN_PHY_X0Y36 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in]



set_property LOC OUT_FIFO_X0Y31 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo]
set_property LOC OUT_FIFO_X0Y30 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo]
set_property LOC OUT_FIFO_X0Y29 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo]
set_property LOC OUT_FIFO_X0Y28 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo]
set_property LOC OUT_FIFO_X0Y34 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo]
set_property LOC OUT_FIFO_X0Y33 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo]
set_property LOC OUT_FIFO_X0Y32 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo]
set_property LOC OUT_FIFO_X0Y35 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo]
set_property LOC OUT_FIFO_X0Y39 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo]
set_property LOC OUT_FIFO_X0Y38 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo]
set_property LOC OUT_FIFO_X0Y37 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo]
set_property LOC OUT_FIFO_X0Y36 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo]

set_property LOC IN_FIFO_X0Y31 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y30 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y29 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y28 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y35 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y39 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y38 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y37 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo]
set_property LOC IN_FIFO_X0Y36 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo]

set_property LOC PHY_CONTROL_X0Y7 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/phy_control_i]
set_property LOC PHY_CONTROL_X0Y8 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/phy_control_i]
set_property LOC PHY_CONTROL_X0Y9 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/phy_control_i]

set_property LOC PHASER_REF_X0Y7 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/phaser_ref_i]
set_property LOC PHASER_REF_X0Y8 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/phaser_ref_i]
set_property LOC PHASER_REF_X0Y9 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/phaser_ref_i]

set_property LOC OLOGIC_X0Y393 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y381 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y369 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y357 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y443 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y493 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y481 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y469 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/slave_ts.oserdes_slave_ts]
set_property LOC OLOGIC_X0Y457 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/u_ddr_mc_phy/ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/slave_ts.oserdes_slave_ts]

set_property LOC PLLE2_ADV_X0Y8 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_ddr3_infrastructure/plle2_i]
set_property LOC MMCME2_ADV_X0Y8 [get_cells LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i]


set_multicycle_path -setup -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r_reg}] -to [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] 6

set_multicycle_path -hold -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r_reg}] -to [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] 5

#set_multicycle_path -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r*}] #                    -to   [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] #                    -setup 6

#set_multicycle_path -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r*}] #                    -to   [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] #                    -hold 5

set_false_path -through [get_pins -filter {NAME =~ */DQSFOUND} -of [get_cells -hier -filter {REF_NAME == PHASER_IN_PHY}]]

set_multicycle_path -setup -start -through [get_pins -filter {NAME =~ */OSERDESRST} -of [get_cells -hier -filter {REF_NAME == PHASER_OUT_PHY}]] 2
set_multicycle_path -hold -start -through [get_pins -filter {NAME =~ */OSERDESRST} -of [get_cells -hier -filter {REF_NAME == PHASER_OUT_PHY}]] 1

set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/* && IS_SEQUENTIAL}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/device_temp_sync_r1*}] 20.000
set_max_delay -datapath_only -from [get_cells -hier *rstdiv0_sync_r1_reg*] -to [get_pins -filter {NAME =~ */RESET} -of [get_cells -hier -filter {REF_NAME == PHY_CONTROL}]] 5.000
#set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/*}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/device_temp_sync_r1*}] 20
#set_max_delay -from [get_cells -hier rstdiv0_sync_r1*] -to [get_pins -filter {NAME =~ */RESET} -of [get_cells -hier -filter {REF_NAME == PHY_CONTROL}]] -datapath_only 5

set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *ddr3_infrastructure/rstdiv0_sync_r1_reg*}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/xadc_supplied_temperature.rst_r1*}] 20.000
#set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *ddr3_infrastructure/rstdiv0_sync_r1*}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/*rst_r1*}] 20

set_false_path -from [get_cells -hier *rst_sync_reg1_reg]
set_false_path -to [get_cells -hier *rst_sync_reg1_reg]
set_false_path -to [get_cells -hier *rst_sync_reg2_reg]

set_max_delay -from [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_ddr3_infrastructure/rstdiv0_sync_r1_reg/C]
-to [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.i_nifmem_dram_adaptor/i_reset_sync/rst_sync_reg1_reg/PRE] 10.00000000000000000

set_max_delay -from [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_ddr3_infrastructure/rstdiv0_sync_r1_reg/C] -to [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.i_nifmem_dram_adaptor/i_reset_sync/rst_sync_reg2_reg/PRE] 10.000

set_max_delay -from [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_calib_top/init_calib_complete_reg/C] -to [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.i_init_calib_complete_sync/rst_sync_reg1_reg/PRE] 10.000

set_max_delay -from [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.controller/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_calib_top/init_calib_complete_reg/C] -to [get_pins LBL_INCLUDE_MEMORY.i_memory_interface/LBL_MEMORY_CONTROLLER.LBL_DDR3_CONTROLLER.i_init_calib_complete_sync/rst_sync_reg2_reg/PRE] 10.000

##################END########################
