module tb_stage4;
	reg clk;
	reg signed [31:0] in1;
	wire [7:0] skinscore;

	stage4 uut_Stage4(
		.clk(clk),
		.in1(in1),
		.skinscore(skinscore)
		);

endmodule