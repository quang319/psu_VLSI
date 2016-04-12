module tb_transCb;
	reg clk;
	reg  [7:0] Y;
	reg  [7:0] Cb;

	wire [31:0] result;

	transcb uut_transcb (
		.clk(clk),
		.Y(Y),
		.Cb(Cb),
		.result(result)
		);
endmodule
