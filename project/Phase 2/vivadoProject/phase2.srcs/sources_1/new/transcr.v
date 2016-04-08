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

	output reg [15:0] result
    );
	reg  signed [15:0] MeanCr [0:255];
	reg  signed [15:0] WidthCr [0:255];

	initial begin 
		$readmemh("MeanCr_LUT.list", MeanCr);
		$readmemh("MeanCb_LUT.list", WidthCr);
	end

	always @(posedge clk) begin
		result <= MeanCr[Y];
	end 



endmodule
