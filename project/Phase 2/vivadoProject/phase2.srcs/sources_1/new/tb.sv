`timescale 1ns / 1ns

module tb;
	reg clk;
	reg [7:0] Y;
	reg [7:0] Cr;

	wire [15:0] result;

	transcr uut(
		.clk(clk),
		.Y(Y),
		.Cr(Cr),
		.result(result)
		);

	initial begin
		clk = 1'b0;
		Y = 8'h00;
		Cr = 8'h00;
		#100;
	end 
	
	always begin
		#1 clk <= ~clk;
	end

	always begin 
		#10 Y <= 8'h01;
		#10 Y <= 8'h02;
		#10 Y <= 8'h03;
		#10 Y <= 8'h04;
	end

endmodule