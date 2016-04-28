module tb_skintoneDetector;
	reg clk = 0;
	reg valid_in;
	reg [7:0] Cb;
	reg [7:0] Y;
	reg [7:0] Cr;

	wire valid_out;
	wire [7:0] skinScore;

	int i, file;
	int j = 0;

	reg signed [7:0] inputY [3] = '{
		8'd0, // 0, 155, 110
		8'd85,		// 85, 155, 110
		8'd185 // 185, 155, 110 

	};
	reg signed [7:0] inputCr [3] = '{
		8'd155, // 0, 155, 110
		8'd155,		// 85, 155, 110
		8'd155 // 185, 155, 110 

	};
	reg signed [7:0] inputCb [3] = '{
		8'd110, // 0, 155, 110
		8'd110,		// 85, 155, 110
		8'd110 // 185, 155, 110 
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
		file = $fopen("skintone_output.csv", "w+");
		$fdisplay(file, "time, valid_out, skinScore");
		for (i = 0; i < 100; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 3) begin
				Y <= inputY[j];
				Cr <= inputCr[j];
				Cb <= inputCb[j];
				valid_in <= 1'b1;
			end
			else
				valid_in <= 1'b0;
			$fdisplay(file, "%d, %d, %d",i, valid_out, skinScore);
		end
		$fclose(file);
		$finish;
	end

endmodule