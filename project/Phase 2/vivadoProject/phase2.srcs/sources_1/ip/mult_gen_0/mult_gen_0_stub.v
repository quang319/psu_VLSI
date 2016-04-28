// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
// Date        : Thu Apr 28 01:13:07 2016
// Host        : p218inst09.cse.psu.edu running 64-bit Red Hat Enterprise Linux Workstation release 6.7 (Santiago)
// Command     : write_verilog -force -mode synth_stub {/home/grads/qxn5005/Documents/psu_VLSI/project/Phase
//               2/vivadoProject/phase2.srcs/sources_1/ip/mult_gen_0/mult_gen_0_stub.v}
// Design      : mult_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1157-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *)
module mult_gen_0(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[31:0],B[31:0],P[63:0]" */;
  input CLK;
  input [31:0]A;
  input [31:0]B;
  output [63:0]P;
endmodule
