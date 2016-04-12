module tb_shiftReg;
	reg clk;
	reg [7:0] newInput1;
	wire [7:0] result1;

	reg newInput2;
	wire result2;

	shiftReg #(
		.DATA_WIDTH(8),	
		.NUM_OF_STAGES(5))

		uut_shift1(
			.clk(clk),
			.newInput(newInput1),
			.result(result1)
			);

	shiftReg #(
		.DATA_WIDTH(1),	
		.NUM_OF_STAGES(5))

		uut_shift2(
			.clk(clk),
			.newInput(newInput2),
			.result(result2)
			);
endmodule