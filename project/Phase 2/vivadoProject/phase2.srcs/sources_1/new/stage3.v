
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
	input wire signed [31 : 0] leftInput,
	input wire signed [31 : 0] rightInput,

	output reg signed [31 : 0] rOutput
    );

	reg signed [31 : 0] leftSub = 32'd0, rightSub = 32'd0, tempLeftMult1 = 32'd0, tempLeftMult2 = 32'd0, tempRightMult1 = 32'd0, tempRightMult2 = 32'd0;
	// reg signed [DATA_WIDTH * 2 - 1 :0] leftMult1, leftMult2, rightMult1, rightMult2;
	wire signed [63 :0] leftMult1, leftMult2, rightMult1, rightMult2;

	always @(posedge clk) begin
		leftSub <= leftInput - `ECx;
		rightSub <= rightInput - `ECy;
		tempLeftMult1 <= {leftMult1[63], leftMult1[44 : 14]};
		tempRightMult1 <= {rightMult1[63], rightMult1[44 : 14]};
		tempLeftMult2 <= {leftMult2[63], leftMult2[44 : 14]};
		tempRightMult2 <= {rightMult2[63], rightMult2[44 : 14]};

		rOutput <=  tempLeftMult2 + tempRightMult2 ;
	end

	mult_gen_0 mult1 (
		  .CLK(clk),  // input wire CLK
		  .A(leftSub),      // input wire [31 : 0] A
		  .B(leftSub),      // input wire [31 : 0] B
		  .P(leftMult1)      // output wire [63 : 0] P
		);

	mult_gen_0 mult2 (
		  .CLK(clk),  // input wire CLK
		  .A(rightSub),      // input wire [31 : 0] A
		  .B(rightSub),      // input wire [31 : 0] B
		  .P(rightMult1)      // output wire [63 : 0] P
		);

	mult_gen_0 mult3 (
		  .CLK(clk),  // input wire CLK
		  .A(tempLeftMult1),      // input wire [31 : 0] A
		  .B(`InvA),      // input wire [31 : 0] B
		  .P(leftMult2)      // output wire [63 : 0] P
		);

	mult_gen_0 mult4 (
		  .CLK(clk),  // input wire CLK
		  .A(`InvB),      // input wire [31 : 0] A
		  .B(tempRightMult1),      // input wire [31 : 0] B
		  .P(rightMult2)      // output wire [63 : 0] P
		);


endmodule
