`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2016 11:37:28 PM
// Design Name: 
// Module Name: tb_phase2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_phase2;
	reg clk;
	reg signed [15:0] rTransCb;
	reg signed [15:0] rTransCr;

	wire signed [15:0] leftOutput;
	wire signed [15:0] rightOutputreg;

	stage2 uut_st2(
		.clk(clk),
		.rTransCb(rTransCb),
		.rTransCr(rTransCr),
		.leftOutput(leftOutput),
		.rightOutputreg(rightOutputreg)
		);
endmodule