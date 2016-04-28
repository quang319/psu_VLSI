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

	int i, file;
	int j = 0;

	reg signed [31:0] inputTransCr [5] = '{
		32'd2469953, 32'd2480242, 
		32'd2479292, 32'd2461548,
		32'd2475819	};
	reg signed [31:0] inputTransCb [5] = '{
		32'd1749319, 32'd1749876,
		32'd1747517, 32'd1741160,
		32'd1769472	};

	

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
		file = $fopen("stage2_output.csv", "w+");
		for (i = 0; i < 300; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 5) begin
				rTransCb <= inputTransCr[j];
				rTransCr <= inputTransCb[j];
			end
			else begin
				rTransCb <= 0;
				rTransCr <= 0;
			end
			$fdisplay(file, "%d, %d, %d",i, wLeftOutput, wRightOutput);
		end
		$fclose(file);
		$finish;
	end
endmodule