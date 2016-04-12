// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
// Date        : Wed Jan 27 10:53:34 2016
// Host        : redrealm.cse.psu.edu running 64-bit Red Hat Enterprise Linux Client release 5.11 (Tikanga)
// Command     : write_verilog -force -mode synth_stub
//               /home/mdl/ska130/Repos/Realm/hardware/Projects/Simple_PLDA/mmcm/mmcm_i125_o100_o200_o400_o600/mmcm_i125_o100_o200_o400_o600_stub.v
// Design      : mmcm_i125_o100_o200_o400_o600
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1157-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module mmcm_i125_o100_o200_o400_o600(clk_in1_p, clk_in1_n, clk_out1, clk_out2, clk_out3, clk_out4, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in1_p,clk_in1_n,clk_out1,clk_out2,clk_out3,clk_out4,reset,locked" */;
  input clk_in1_p;
  input clk_in1_n;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  input reset;
  output locked;
endmodule
