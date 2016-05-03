module tb_transCr;
	reg clk = 0;
	reg  [7:0] Y;
	reg  [7:0] Cr;

	wire [31:0] result;

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
		8'd131, 	// XX 
		8'd121,		// XX	
		8'd1, 	// XX
		8'd155, 	// 0, 155, 110
		8'd155,		// 85, 155, 110
		8'd155 		// 185, 155, 110

	};

	//
	// 2137689
	// 2469950
	// 2539520
	//
	///// Output //////
	// 2137686 	// 0, 155, 110
	// 1067199 	// 115, 70, 110 
	// 1146880 	// 155, 70, 110 

	transcr uut_transcr (
		.clk(clk),
		.Y(Y),
		.Cr(Cr),
		.result(result)
		);

	always begin 
		#5 clk =~ clk;
	end

	initial begin 
		file = $fopen("TransCr_output.csv", "w+");
		for (i = 0; i < 20; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 9) begin
				Y <= inputY[j];
				Cr <= inputCr[j];
			end
			$fdisplay(file, "%d, %d",i, result);
		end
		$fclose(file);
		$finish;
	end

endmodule