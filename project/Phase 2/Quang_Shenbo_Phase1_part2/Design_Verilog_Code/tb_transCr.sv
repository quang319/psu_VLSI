module tb_transCr;
	reg clk;
	reg  [7:0] Y;
	reg  [7:0] Cr;

	wire [31:0] result;

	transcr uut_transcr (
		.clk(clk),
		.Y(Y),
		.Cr(Cr),
		.result(result)
		);

endmodule