`timescale 1ns/1ns

module FPAdder (
	input 				clk,    // Clock
	input wire [7:0]	Y,
	input wire [7:0]	Cr,

	output reg [15:0] Result
);

	always @(posedge clk) begin : proc_
		Result <= {Y, 8'h00} + {Cr, 8'h00};
	end

endmodule
