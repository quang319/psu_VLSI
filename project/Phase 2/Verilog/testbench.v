`timescale 1ps /1ps
module testbench;
	reg clk;
	reg [7:0] Y = 8'h00;
	reg [7:0] Cr = 8'h00;

	// wire [15:0] result;
	wire result;

	// transCr uut(
	// 	.clk(clk),
	// 	.rst_n(),
	// 	.Y(Y),
	// 	.Cr(Cr),
	// 	.result(result));

	always begin
		#1 clk = ~clk;
	end

	assign result = clk;

endmodule
