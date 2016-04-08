`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2016 11:02:05 PM
// Design Name: 
// Module Name: stage2
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
`include "projectHeader.vh"

module stage2(
	input wire clk,
	input wire signed [15:0] rTransCb,
	input wire signed [15:0] rTransCr,

	output reg signed [15:0] leftOutput,
	output reg signed [15:0] rightOutput
    );

	reg signed [15:0] leftSub, rightSub;
	reg signed [31:0] leftMult1, leftMult2, rightMult1, rightMult2;

	always @(posedge clk) begin
		leftSub <= rTransCb -`Cx;
		rightSub <=`Cy - rTransCr;

		leftMult1 <= { {16{1'b1}}, `NSint} * { {16{leftSub[15]}}, leftSub};
		leftMult2 <= { {16{leftSub[15]}}, leftSub} * { {16{1'b1}}, `Cost};
		rightMult1 <= { {16{1'b1}}, `Cost} * { {16{rightSub[15]}}, rightSub};
		rightMult2 <= { {16{rightSub[15]}}, rightSub} * { {16{1'b0}}, `Sint};

		leftOutput <= leftMult2[23:7] + rightMult2[23:7];
		rightOutput <= leftMult1[23:7] + rightMult1[23:7];
	end

endmodule
