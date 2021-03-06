`timescale 1ps/1ps
module transCr (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input wire [7:0] Y,
	input wire [7:0] Cr,
	output reg [15:0] result
);


	always @(Y[7:0], Cr[7:0]) begin : FirstAddition
		result = {Y[7:0] , Cr[7:0]};
	end

	// assign resultR = result;

endmodule
