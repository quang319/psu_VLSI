`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2016 09:57:16 PM
// Design Name: 
// Module Name: skintoneDetector
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


module skintoneDetector(
	input wire clk,
	input wire valid_in,
	input wire [7:0] Cb,
	input wire [7:0] Y,
	input wire [7:0] Cr,

	output reg valid_out,
	output wire [7:0] skinScore
    );
	
	wire wValid_out;
	wire signed [31:0] cb_stage2, cr_stage2, st2_st3_1, st2_st3_2, st3_st4;

	//
	//	Shiftreg instances
	//
	shiftReg #(
		.DATA_WIDTH(1),	
		.NUM_OF_STAGES(40))

		selector(
			.clk(clk),
			.newInput(valid_in),
			.result(wValid_out)
			);

	always @(posedge clk) begin
		valid_out = wValid_out;
	end
	
	//
	//	Stages for project
	//
	transcb TransCb (
		.clk(clk),
		.Y(Y),
		.Cb(Cb),
		.result(cb_stage2)
		);

	transcr TransCr (
		.clk(clk),
		.Y(Y),
		.Cr(Cr),
		.result(cr_stage2)
		);

	stage2 Stage2 (
		.clk(clk),
		.rTransCb(cb_stage2),
		.rTransCr(cr_stage2),
		.leftOutput(st2_st3_1),
		.rightOutput(st2_st3_2)
		);

	stage3 stage3(
		.clk(clk),
		.leftInput(st2_st3_1),
		.rightInput(st2_st3_2),
		.rOutput(st3_st4)
		);

	stage4 Stage4(
		.clk(clk),
		.in1(st3_st4),
		.skinscore(skinScore)
		);

endmodule
