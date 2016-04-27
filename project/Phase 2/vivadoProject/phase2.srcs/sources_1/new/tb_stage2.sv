`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2016 11:37:28 PM
// Design Name: 
// Module Name: tb_phase2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_stage2;
	reg clk;
	reg signed [31:0] rTransCb;
	reg signed [31:0] rTransCr;

	wire signed [31:0] wLeftOutput;
	wire signed [31:0] wRightOutput;

	// reg signed [31:0] rLeftOutput;
	// reg signed [31:0] rRightOutput;

	int i;

	stage2 uut_st2 (
		.clk(clk),
		.rTransCb(rTransCb),
		.rTransCr(rTransCr),
		.leftOutput(wLeftOutput),
		.rightOutput(wRightOutput)
		);

	always #5 clk =~ clk;

	// Set clk value 
	intitial begin
		clk = 0;
	end

	initial begin 
		f = $fopen("stage2_output.txt","w");
		for (i = 0; i < 20; i = i + 1 ) begin
			@(posedge clk);
			rTransCb <= 32d'2469953;
			rTransCb <= 32d'1749319;
			// rLeftOutput <= wLeftOutput;
			// rRightOutput <= wRightOutput;
			$display("%d, %d, %d\n",i, wLeftOutput, wRightOutput);
			$fwrite("%d, %d, %d\n",i, wLeftOutput, wRightOutput);
		end
		$fclose(f);
		$finish;
	end
endmodule