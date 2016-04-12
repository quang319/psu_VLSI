`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2016 09:18:06 PM
// Design Name: 
// Module Name: stage4
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

module stage4(
	input wire clk,
	input wire signed [31:0] in1,
	output reg [7:0] skinscore
    );

	reg signed [31:0] subOut;
	wire select;
	wire selectOut;
	wire signed [31:0] multOut;
	

	//
	//	Shiftreg instances
	//
	shiftReg #(
		.DATA_WIDTH(1),	
		.NUM_OF_STAGES(6))

		selector(
			.clk(clk),
			.newInput(select),
			.result(selectOut)
			);

	assign select = (in1 <= `Radius) ? 1'b1 : 1'b0;

	mult_gen_0 mult1 (
		  .CLK(clk),  // input wire CLK
		  .A(subOut),      // input wire [31 : 0] A
		  .B(`fac),      // input wire [31 : 0] B
		  .P(multOut)      // output wire [31 : 0] P
		);

	always @(posedge clk) begin
		subOut <= `Radius - in1;

		skinscore <= selectOut ? multOut[21:14] : 8'h0;

	end
	
endmodule
