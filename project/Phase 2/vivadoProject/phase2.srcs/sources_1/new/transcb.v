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
	wire signed [31:0] wMeanCb, wWidthCb, multOut;
	reg signed [31:0] rMeanCb, rWidthCb, rWidthCb2;
	reg rSelectIn;
	wire wSelectOut;
	reg [7:0] Cb2;
	wire [7:0] cbShiftRegOut;

	reg signed [31:0] subOut, addOut;

	//
	//	LUTs instances
	//
	meanCb meanCbLUT(
		.Y(Y),
		.result(wMeanCb)
		);
	widthCb widthCbLUT(
		.Y(Y),
		.result(wWidthCb)
		);

	//
	//	Shiftreg instances
	//
	shiftReg #(
		.DATA_WIDTH(1),	
		.NUM_OF_STAGES(8))

		selector(
			.clk(clk),
			.newInput(rSelect),
			.result(wSelectOut)
			);
	assign rSelect = (8'd125 <= Y && Y <= 8'd188) ? 1'b1 : 1'b0;
	shiftReg #(
		.DATA_WIDTH(8),	
		.NUM_OF_STAGES(7))

		cbShiftReg (
			.clk(clk),
			.newInput(Cb2),
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

		subOut <= { {10{1'b0}}, Cb2, {14{1'b0}}} - rMeanCb;
		rWidthCb2 <= rWidthCb;

		addOut <=  multOut + 32'h001b0000;

		result <= wSelectOut ? { {10{1'b0}}, cbShiftRegOut, {14{1'b0}}} :  addOut;

	end 



endmodule
