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
	input wire signed [DATA_WIDTH - 1 : 0] rTransCb,
	input wire signed [DATA_WIDTH - 1 : 0] rTransCr,

	output reg signed [DATA_WIDTH - 1 : 0] leftOutput,
	output reg signed [DATA_WIDTH - 1 : 0] rightOutput
    );
	
	parameter DATA_WIDTH = 32;

	reg signed [DATA_WIDTH -1:0] leftSub, rightSub;
	reg signed [(DATA_WIDTH * 2) - 1 :0] leftMult1, leftMult2, rightMult1, rightMult2;

	always @(posedge clk) begin
		leftSub <= rTransCb -`Cx;
		rightSub <=`Cy - rTransCr;

		leftMult1 <= `NSint * leftSub;
		leftMult2 <= leftSub * `Cost;
		rightMult1 <= `Cost * rightSub;
		rightMult2 <= rightSub * `Sint;

		leftOutput <= leftMult2[DATA_WIDTH + DATA_WIDTH / 2 - 1 : DATA_WIDTH / 2 - 1] + rightMult2[DATA_WIDTH + DATA_WIDTH / 2 - 1 : DATA_WIDTH / 2 - 1];
		rightOutput <= leftMult1[DATA_WIDTH + DATA_WIDTH / 2 - 1 : DATA_WIDTH / 2 - 1] + rightMult1[DATA_WIDTH + DATA_WIDTH / 2 - 1 : DATA_WIDTH / 2 - 1];
	end

endmodule
