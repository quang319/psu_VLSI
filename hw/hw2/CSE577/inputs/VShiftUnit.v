`timescale 1ns / 1ps
`include "defs.vh"
module VShiftUnit (clk,reset,inOp,inPatch,inD_MEM,inV_REG_VM1,inV_REG_VP1,outD);
   parameter SIMD_ID = 0;
   parameter P1_VTOP = 0;
   parameter P1_VBOTTOM = 0;
   parameter P2_VTOP = 0;
   parameter P2_VBOTTOM = 0;
   parameter P4_VTOP = 0;
   parameter P4_VBOTTOM = 0;
   parameter P8_VTOP = 0;
   parameter P8_VBOTTOM = 0;
   //
   input clk;
   input reset;
   input [`INST_V_REG_OP_WIDTH-1:0] inOp; 
   input [`SEL_PATCH_WIDTH-1:0]     inPatch;
   //  <input> inOutSideRef;  
   input signed [`WORD_WIDTH-1:0]   inD_MEM;
   input signed [`WORD_WIDTH-1:0]   inV_REG_VM1;
   input signed [`WORD_WIDTH-1:0]   inV_REG_VP1;
   output signed [`WORD_WIDTH-1:0]  outD;
   
   // RegList inserted by <reg *>
   reg [`WORD_WIDTH-1:0] 	    r_outD; 
   // RegList end----------------

   // WireList inserted by <wire *>
   wire 			    w_vm1_fill_padding; // 8x8
   wire 			    w_vp1_fill_padding; // 8x8
   wire [`WORD_WIDTH-1:0] 	    w_set_sel; 
   wire [`WORD_WIDTH-1:0] 	    w_moveVM1_sel; 
   wire [`WORD_WIDTH-1:0] 	    w_moveVP1_sel; 
   wire 			    wOpNop; 
   // WireList end----------------

   assign w_vm1_fill_padding = ((inPatch == `SEL_PATCH1 & P1_VTOP    ) | // 8x8
				(inPatch == `SEL_PATCH2 & P2_VTOP    ) | // 16x16
				(inPatch == `SEL_PATCH4 & P4_VTOP    ) | // 32x32
				(inPatch == `SEL_PATCH8 & P8_VTOP    ) );  // 64x64
   assign w_vp1_fill_padding = ((inPatch == `SEL_PATCH1 & P1_VBOTTOM ) |  // 8x8
				(inPatch == `SEL_PATCH2 & P2_VBOTTOM ) |  // 16x16
				(inPatch == `SEL_PATCH4 & P4_VBOTTOM ) |  // 32x32
				(inPatch == `SEL_PATCH8 & P8_VBOTTOM ) ); // 64x64
   //  <wire> w_fill_padding = inOutSideRef ;    
   assign w_set_sel = inD_MEM;
   assign w_moveVM1_sel = (w_vm1_fill_padding)? `WORD_WIDTH'd0 : inV_REG_VM1;  
   assign w_moveVP1_sel = (w_vp1_fill_padding)? `WORD_WIDTH'd0 : inV_REG_VP1;
   //  <wire [`WORD_WIDTH-1:0]> w_moveVM1_sel = inV_REG_VM1;  
   //  <wire [`WORD_WIDTH-1:0]> w_moveVP1_sel = inV_REG_VP1;
   reg [`WORD_WIDTH-1:0] 	    w_sel;  
   always @ ( * ) begin
      case (inOp)
	`INST_V_REG_OP_NOP:     w_sel = r_outD;
	`INST_V_REG_OP_SET:     w_sel = w_set_sel;
	`INST_V_REG_OP_MOVE_M1: w_sel = w_moveVM1_sel;
	`INST_V_REG_OP_MOVE_P1: w_sel = w_moveVP1_sel;
	default: w_sel = r_outD;
      endcase // case (inOp)
   end

   assign wOpNop = inOp == `INST_V_REG_OP_NOP;
   always @(posedge clk) begin
      if(reset) begin
         r_outD <= #1 {`WORD_WIDTH{1'b0}}; 
      end
      else begin
         r_outD <= #1 w_sel; 
      end
   end
   assign outD = r_outD;  
endmodule


