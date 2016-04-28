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

	reg signed [31:0] inputTransCr [3] = '{
		32'd2137685, // 0, 155, 110
		-32'd3569746, // 0, 0, 10
		32'd1067199 // 115, 70, 110 
	};
	reg signed [31:0] inputTransCb [3] = '{
		32'd1413954, // 0, 155, 110
		-32'd2536244, // 0, 0, 10
		32'd1803845 // 115, 70, 110 
	};

	///// Output //////
	// 106897, 506131 	// 0, 155, 110

	

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
		for (i = 0; i < 20; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 3) begin
				rTransCb <= inputTransCb[j];
				rTransCr <= inputTransCr[j];
			end
			// else begin
			// 	rTransCb <= 0;
			// 	rTransCr <= 0;
			// end
			$fdisplay(file, "%d, %d, %d",i, wLeftOutput, wRightOutput);
		end
		$fclose(file);
		$finish;
	end
endmodule