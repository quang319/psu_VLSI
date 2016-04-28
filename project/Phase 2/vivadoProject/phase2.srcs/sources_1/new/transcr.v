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

module transcr(
	input wire clk,
	input wire [7:0] Y,
	input wire [7:0] Cr,

	output reg [31:0] result
    );
	wire signed [31:0] wMeanCr, wWidthCr;
	wire signed [63:0] multOut;
	reg signed [31:0] rMeanCr = 32'd0, rWidthCr = 32'd0, rWidthCr2 = 32'd0;
	wire rSelectIn;
	wire wSelectOut;
	reg [7:0] Cr2 = 8'd0, Cr3 = 8'd0;
	wire [7:0] crShiftRegOut;

	reg signed [31:0] subOut = 32'd0, addOut = 32'd0;

	//
	//	LUTs instances
	//
	meanCr meanCrLUT(
		.clk(clk),
		.Y(Y),
		.result(wMeanCr)
		);
	widthCr widthCrLUT(
		.clk(clk),
		.Y(Y),
		.result(wWidthCr)
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
		.NUM_OF_STAGES(7))

		crShiftReg (
			.clk(clk),
			.newInput(Cr2),
			.result(crShiftRegOut)
			);

	//
	//	Multiplier instances
	//
	mult_gen_0 mult1 (
		  .CLK(clk),  // input wire CLK
		  .A(subOut),      // input wire [31 : 0] A
		  .B(rWidthCr2),      // input wire [31 : 0] B
		  .P(multOut)      // output wire [31 : 0] P
		);


	always @(posedge clk) begin
		rMeanCr <= wMeanCr;
		rWidthCr <= wWidthCr;
		Cr2 <= Cr;
		Cr3 <= Cr2;

		subOut <= { {10{1'b0}}, Cr3, {14{1'b0}}} - rMeanCr;
		rWidthCr2 <= rWidthCr;

		addOut <=  {multOut[63], multOut[44 : 14]} + 32'h00268000;

		result <= wSelectOut ? { {10{1'b0}}, crShiftRegOut, {14{1'b0}}} :  addOut;

	end 



endmodule
