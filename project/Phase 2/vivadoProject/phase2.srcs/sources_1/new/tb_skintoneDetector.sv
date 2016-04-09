module tb_skintoneDetector;
	reg clk;
	reg valid_in;
	reg [7:0] Cb;
	reg [7:0] Y;
	reg [7:0] Cr;

	wire valid_out;
	wire [7:0] skinScore;

	skintoneDetector uut_ST (
		.clk(clk),
		.valid_in(valid_in),
		.Cb(Cb),
		.Y(Y),
		.Cr(Cr),
		.valid_out(valid_out),
		.skinScore(skinScore)
		);

endmodule