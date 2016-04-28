`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2016 06:39:05 AM
// Design Name: 
// Module Name: tc_smallestValues
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


module tc_smallestValues;
	reg clk = 0;
	reg valid_in;
	reg [7:0] Cb;
	reg [7:0] Y;
	reg [7:0] Cr;

	wire valid_out;
	wire [7:0] skinScore;

	int i, file;
	int j = 0;

	reg signed [7:0] inputY [6] = '{
		8'd250, 	// Smallest TCr
		8'd250,		// Smallest TCb
		8'd250, 	// Smallest xx 
		8'd250, 	// Smallest yy 
		8'd85,		// Smallest pre_skintone	
		8'd250 		// Smallest skintone
			
				

	};
	reg signed [7:0] inputCr [6] = '{
		8'd0, 	// Smallest TCr
		8'd0,		// Smallest TCb
		8'd0, 	// Smallest xx
		8'd250, 		// Smallest yy
		8'd155,		// Smallest pre_skintone	
		8'd0 	// Smallest skintone
	

	};
	reg signed [7:0] inputCb [6] = '{
		8'd250, 		// Smallest TCr
		8'd0,		// Smallest TCb
		8'd250, 		// Smallest xx
		8'd250, 		// Smallest yy
		8'd110,		// Smallest pre_skintone	
		8'd0 	// Smallest skintone
		 	
				
				 
	};
	reg signed valid [6] = '{
		1'd1, 		
		1'd1,		
		1'd1, 		 
		1'd1, 		
		1'd1,		
		1'd1 		 		
		};

	///// Output //////
	// 0 	// 250, 0, 250
	// 0 	// 250, 0, 0
	// 0 	// 250, 0, 250
	// 0 	// 250, 250, 250
	// 254 	// 85, 155, 110
	// 0	// 250, 0, 0

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
		file = $fopen("testcase_SmallestValues.csv", "w+");
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
