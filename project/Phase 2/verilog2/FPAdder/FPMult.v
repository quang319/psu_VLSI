`timescale 1ns/1ns

module FPMult (
	input clk,    // Clock
	input wire [15:0]	Y,
	input wire [15:0]	Cr,

	output reg [15:0] Result
);
	reg [31:0] temptResult = 32'h00000000;

	always @(posedge clk) begin : proc_
		temptResult <= Y * Cr;
	end

	always @(temptResult) begin
		Result = temptResult[23:7];
	end

endmodule
