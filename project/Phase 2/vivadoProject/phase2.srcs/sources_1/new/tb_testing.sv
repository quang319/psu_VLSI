module tb_testing;
	reg clk;
	reg signed [15:0] in1;

	wire signed [15:0] out1;

	testing uut_testing(
		.clk(clk),
		.in1(in1),
		.out1(out1)
		);

endmodule