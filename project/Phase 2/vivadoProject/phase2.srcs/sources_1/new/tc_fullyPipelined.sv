`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2016 05:56:22 AM
// Design Name: 
// Module Name: tc_fullyPipelined
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


module tc_fullyPipelined;
	reg clk = 0;
	reg valid_in;
	reg [7:0] Cb;
	reg [7:0] Y;
	reg [7:0] Cr;

	wire valid_out;
	wire [7:0] skinScore;

	int i, file;
	int j = 0;

	reg signed [7:0] inputY [9] = '{
		8'd0, 		// 0, 155, 110
		8'd85,		// 85, 155, 110
		8'd185, 	// 185, 155, 110 
		8'd0, 		// XX 
		8'd85,		// XX	
		8'd185, 	// XX
		8'd0, 		// 0, 155, 110
		8'd85,		// 85, 155, 110
		8'd185 		// 185, 155, 110 

	};
	reg signed [7:0] inputCr [9] = '{
		8'd155, 	// 0, 155, 110
		8'd155,		// 85, 155, 110
		8'd155, 	// 185, 155, 110 
		8'd0, 		// XX 
		8'd85,		// XX	
		8'd185, 	// XX
		8'd155, 	// 0, 155, 110
		8'd155,		// 85, 155, 110
		8'd155 		// 185, 155, 110

	};
	reg signed [7:0] inputCb [9] = '{
		8'd110, 	// 0, 155, 110
		8'd110,		// 85, 155, 110
		8'd110, 	// 185, 155, 110
		8'd0, 		// XX 
		8'd85,		// XX	
		8'd185, 		// XX
		8'd110, 	// 0, 155, 110
		8'd110,		// 85, 155, 110
		8'd110 		// 185, 155, 11 
	};
	reg signed valid [9] = '{
		1'd1, 		// 0, 155, 110
		1'd1,		// 85, 155, 110
		1'd1, 		// 185, 155, 110 
		1'd0, 		// XX 
		1'd0,		// XX	
		1'd0, 		// XX 
		1'd1, 		// 0, 155, 110
		1'd1,		// 85, 155, 110
		1'd1 		// 185, 155, 110	
		};

	///// Output //////
	// 0 	// 0, 155, 110
	// 254	// 85, 155, 110
	// 184 	// 185, 155, 110 

	skintoneDetector uut_ST (
		.clk(clk),
		.valid_in(valid_in),
		.Cb(Cb),
		.Y(Y),
		.Cr(Cr),
		.valid_out(valid_out),
		.skinScore(skinScore)
		);

	always begin 
		#5 clk =~ clk;
	end

	initial begin 
		file = $fopen("testcase_FullyPipelined.csv", "w+");
		$fdisplay(file, "time, valid_out, skinScore");
		for (i = 0; i < 100; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 9) begin
				Y <= inputY[j];
				Cr <= inputCr[j];
				Cb <= inputCb[j];
				valid_in <= valid[j];
			end
			else
				valid_in <= 1'b0;
			$fdisplay(file, "%d, %d, %d",i, valid_out, skinScore);
		end
		$fclose(file);
		$finish;
	end
endmodule
