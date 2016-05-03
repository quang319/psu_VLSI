`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2016 08:55:21 PM
// Design Name: 
// Module Name: transcr
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

module transcb(
	input wire clk,
	input wire [7:0] Y,
	input wire [7:0] Cb,

	output reg [31:0] result
    );
	wire signed [31:0] wMeanCb, wWidthCb;
	wire signed [63:0] multOut;
	reg signed [31:0] rMeanCb = 32'd0, rWidthCb = 32'd0, rWidthCb2 = 32'd0;
	wire rSelectIn;
	wire wSelectOut;
	reg [7:0] Cb2 = 8'd0, Cb3 = 8'd0;
	wire [7:0] cbShiftRegOut;

	reg signed [31:0] subOut = 32'd0, addOut = 32'd0;

	//
	//	LUTs instances
	//
	meanCb meanCbLUT(
		.clk(clk),
		.Y(Y),
		.result(wMeanCb)
		);
	widthCb widthCbLUT(
		.clk(clk),
		.Y(Y),
		.result(wWidthCb)
		);

	//
	//	Shiftreg instances
	//
	shiftReg #(
		.DATA_WIDTH(1),	
		.NUM_OF_STAGES(10))

		selector(
			.clk(clk),
			.newInput(rSelectIn),
			.result(wSelectOut)
			);
	assign rSelectIn = (8'd125 <= Y && Y <= 8'd188) ? 1'b1 : 1'b0;
	shiftReg #(
		.DATA_WIDTH(8),	
		.NUM_OF_STAGES(8))

		cbShiftReg (
			.clk(clk),
			.newInput(Cb3),
			.result(cbShiftRegOut)
			);

	//
	//	Multiplier instances
	//
	mult_gen_0 mult1 (
		  .CLK(clk),  // input wire CLK
		  .A(subOut),      // input wire [31 : 0] A
		  .B(rWidthCb2),      // input wire [31 : 0] B
		  .P(multOut)      // output wire [31 : 0] P
		);


	always @(posedge clk) begin
		rMeanCb <= wMeanCb;
		rWidthCb <= wWidthCb;
		Cb2 <= Cb;
		Cb3 <= Cb2;

		subOut <= { {10{1'b0}}, Cb3, {14{1'b0}}} - rMeanCb;
		rWidthCb2 <= rWidthCb;

		addOut <=  {multOut[63], multOut[44 : 14]} + 32'h001b0000;

		result <= wSelectOut ? { {10{1'b0}}, cbShiftRegOut, {14{1'b0}}} :  addOut;

	end 



endmodule
