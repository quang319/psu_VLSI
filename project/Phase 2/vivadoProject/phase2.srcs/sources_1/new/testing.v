`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2016 11:19:44 AM
// Design Name: 
// Module Name: testing
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

module testing(
	input wire clk,
	input wire signed [15:0] in1,

	output reg signed [15:0] out1
    );
	
	reg signed [31:0] temp1;

	always @(posedge clk) begin
		temp1 <= {{16{in1[15]}}, in1[15:0]} * {{16{1'b1}},16'hffb7};
		out1 <= temp1[23:7];
	end
endmodule
