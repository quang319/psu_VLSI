
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
	input wire signed [31 : 0] rTransCb,
	input wire signed [31 : 0] rTransCr,

	output reg signed [31 : 0] leftOutput,
	output reg signed [31 : 0] rightOutput
    );
	
	// parameter DATA_WIDTH = 32;

	reg signed [31:0] leftSub = 32'd0, rightSub = 32'd0;
	wire signed [31:0] leftMult1 = 32'd0, leftMult2 = 32'd0, rightMult1 = 32'd0, rightMult2 = 32'd0;

	always @(posedge clk) begin
		leftSub <= rTransCb -`Cx;
		rightSub <=`Cy - rTransCr;


		// leftMult1 <= { {32{1'b1}},`NSint} * { {32{leftSub[31]}}, leftSub};
		// leftMult2 <= { {32{leftSub[31]}}, leftSub} * { {32{1'b1}},`Cost};
		// rightMult1 <= { {32{1'b1}},`Cost} * { {32{rightSub[31]}}, rightSub};
		// rightMult2 <= { {32{rightSub[31]}}, rightSub} * { {32{1'b0}},`Sint};

		// leftOutput <= leftMult2[47 : 16] + rightMult2[47 : 16];
		// rightOutput <= leftMult1[47 : 16] + rightMult1[47 : 16];
		leftOutput <= leftMult2 + rightMult2;
		rightOutput <= leftMult1 + rightMult1;
	end

	mult_gen_0 mult1 (
		  .CLK(clk),  // input wire CLK
		  .A(`NSint),      // input wire [31 : 0] A
		  .B(leftSub),      // input wire [31 : 0] B
		  .P(leftMult1)      // output wire [31 : 0] P
		);

	mult_gen_0 mult2 (
		  .CLK(clk),  // input wire CLK
		  .A(leftSub),      // input wire [31 : 0] A
		  .B(`Cost),      // input wire [31 : 0] B
		  .P(leftMult2)      // output wire [31 : 0] P
		);

	mult_gen_0 mult3 (
		  .CLK(clk),  // input wire CLK
		  .A(`Cost),      // input wire [31 : 0] A
		  .B(rightSub),      // input wire [31 : 0] B
		  .P(rightMult1)      // output wire [31 : 0] P
		);

	mult_gen_0 mult4 (
		  .CLK(clk),  // input wire CLK
		  .A(rightSub),      // input wire [31 : 0] A
		  .B(`Sint),      // input wire [31 : 0] B
		  .P(rightMult2)      // output wire [31 : 0] P
		);

	// assign leftMult1 = wleftMult1;
	// assign leftMult2 = wleftMult2;
	// assign rightMult1 = wrightMult1;
	// assign rightMult2 = wrightMult2;
endmodule
