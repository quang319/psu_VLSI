module tb_stage3;
	reg clk;
	reg signed [31 : 0] leftInput;
	reg signed [31 : 0] rightInput;

	wire signed [31 : 0] rOutput;

	stage3 uut_stage3(
		.clk(clk),
		.leftInput(leftInput),
		.rightInput(rightInput),
		.rOutput(rOutput)
		);
endmodule