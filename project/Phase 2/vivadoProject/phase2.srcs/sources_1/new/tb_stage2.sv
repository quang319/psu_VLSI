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
	reg clk = 0;
	reg signed [31:0] rTransCb;
	reg signed [31:0] rTransCr;

	wire signed [31:0] wLeftOutput;
	wire signed [31:0] wRightOutput;

	logic signed [31:0] inputTransCr, inputTransCb;

	int i, file_out, file_in, scan_file;

	stage2 uut_st2 (
		.clk(clk),
		.rTransCb(rTransCb),
		.rTransCr(rTransCr),
		.leftOutput(wLeftOutput),
		.rightOutput(wRightOutput)
		);

	always begin 
		#5 clk =~ clk;
	end

	initial begin 
		#200;
		// file_out = $fopen("stage2_output.csv", "w+");
		file_in = $fopen("stage2_input.csv","r");
		for (i = 0; i < 20; i = i + 1 ) begin
			@(posedge clk);
			scan_file = $fscanf(file_in, "%d\n", inputTransCr);
			if (!$feof(file_in)) begin
				rTransCb <= inputTransCr;
				rTransCr <= inputTransCr;
			end
			// $fdisplay(file_out, "%d, %d, %d",i, wLeftOutput, wRightOutput);
		end
		// $fclose(file_out);
		$finish;
	end
endmodule