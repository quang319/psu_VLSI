
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2016 02:13:03 PM
// Design Name: 
// Module Name: stage3
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

module stage3(
	input wire clk,
	input wire signed [DATA_WIDTH - 1 : 0] leftInput,
	input wire signed [DATA_WIDTH - 1 : 0] rightInput,

	output reg signed [DATA_WIDTH - 1 : 0] rOutput
    );
	parameter DATA_WIDTH = 32;

	reg signed [DATA_WIDTH -1 : 0] leftSub, rightSub;
	// reg signed [DATA_WIDTH * 2 - 1 :0] leftMult1, leftMult2, rightMult1, rightMult2;
	wire signed [DATA_WIDTH - 1 :0] leftMult1, leftMult2, rightMult1, rightMult2;

	always @(posedge clk) begin
		leftSub <= `ECx - leftInput;
		rightSub <= rightInput - `ECy;

		// leftMult1 <= { {DATA_WIDTH{leftSub[DATA_WIDTH-1]}} , leftSub} * 
		// 	{ {DATA_WIDTH{leftSub[DATA_WIDTH-1]}} , leftSub};
		// rightMult1 <= { {DATA_WIDTH{rightSub[DATA_WIDTH-1]}} , rightSub} * 
		// 	{ {DATA_WIDTH{rightSub[DATA_WIDTH-1]}} , rightSub};

		// leftMult2 <= { {DATA_WIDTH{leftMult1[DATA_WIDTH + DATA_WIDTH / 2 - 1]}},
		// 	leftMult1[DATA_WIDTH + DATA_WIDTH / 2 - 1 : DATA_WIDTH / 2 - 1]} *
		// 	{ {DATA_WIDTH{1'b0}} , `InvA};
		// rightMult2 <= { {DATA_WIDTH{1'b0}} , `InvB} * 
		// 	{ {DATA_WIDTH{rightMult1[DATA_WIDTH + DATA_WIDTH / 2 - 1]}},
		// 	rightMult1[DATA_WIDTH + DATA_WIDTH / 2 - 1 : DATA_WIDTH / 2 - 1]};

		// rOutput <= leftMult2[DATA_WIDTH + (DATA_WIDTH / 2) - 1 : (DATA_WIDTH / 2) - 1] +
		// 	rightMult2[DATA_WIDTH + (DATA_WIDTH / 2) - 1 : (DATA_WIDTH / 2) - 1];

		rOutput <= leftMult2 + rightMult2;
	end

	mult_gen_0 mult1 (
		  .CLK(clk),  // input wire CLK
		  .A(leftSub),      // input wire [31 : 0] A
		  .B(leftSub),      // input wire [31 : 0] B
		  .P(leftMult1)      // output wire [31 : 0] P
		);

	mult_gen_0 mult2 (
		  .CLK(clk),  // input wire CLK
		  .A(rightSub),      // input wire [31 : 0] A
		  .B(rightSub),      // input wire [31 : 0] B
		  .P(rightMult1)      // output wire [31 : 0] P
		);

	mult_gen_0 mult3 (
		  .CLK(clk),  // input wire CLK
		  .A(leftMult1),      // input wire [31 : 0] A
		  .B(`InvA),      // input wire [31 : 0] B
		  .P(leftMult2)      // output wire [31 : 0] P
		);

	mult_gen_0 mult4 (
		  .CLK(clk),  // input wire CLK
		  .A(`InvB),      // input wire [31 : 0] A
		  .B(rightMult1),      // input wire [31 : 0] B
		  .P(rightMult2)      // output wire [31 : 0] P
		);


endmodule
