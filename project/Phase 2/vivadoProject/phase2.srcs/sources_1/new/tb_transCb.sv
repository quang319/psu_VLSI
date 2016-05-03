module tb_transCb;
	reg clk = 0;
	reg  [7:0] Y;
	reg  [7:0] Cb;

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
	reg signed [7:0] inputCb [9] = '{
		8'd110, 	// 0, 155, 110
		8'd110,		// 85, 155, 110
		8'd110, 	// 185, 155, 110
		8'd11, 		// XX 
		8'd12,		// XX	
		8'd113, 		// XX
		8'd110, 	// 0, 155, 110
		8'd110,		// 85, 155, 110
		8'd110 		// 185, 155, 11 
	};

	//
	// 1395483
	// 1735812
	// 1802240
	//
	///// Output //////
	// 1413953 	// 0, 155, 110
	// 1803845 	// 115, 70, 110 
	// 1802240 	// 155, 70, 110 

	transcb uut_transcb (
		.clk(clk),
		.Y(Y),
		.Cb(Cb),
		.result(result)
		);


	always begin 
		#5 clk =~ clk;
	end

	initial begin 
		file = $fopen("TransCb_output.csv", "w+");
		for (i = 0; i < 20; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 9) begin
				Y <= inputY[j];
				Cb <= inputCb[j];
			end
			$fdisplay(file, "%d, %d",i, result);
		end
		$fclose(file);
		$finish;
	end
endmodule
