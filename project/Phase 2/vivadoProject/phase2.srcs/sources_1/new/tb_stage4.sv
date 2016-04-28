module tb_stage4;
	reg clk = 0;
	reg signed [31:0] in1;
	wire [7:0] skinscore;

	int i, file;
	int j = 0;

	reg signed [31:0] inputSkin [3] = '{
		32'd68137, // 0, 155, 110
		32'd2,		// 85, 155, 110
		32'd2259 // 185, 155, 110 

	};

	///// Output //////
	// 0 	// 0, 155, 110
	// 254	// 85, 155, 110
	// 184 	// 185, 155, 110 
	

	stage4 uut_Stage4(
		.clk(clk),
		.in1(in1),
		.skinscore(skinscore)
		);

	always begin 
		#5 clk =~ clk;
	end

	initial begin 
		file = $fopen("Stage4_output.csv", "w+");
		for (i = 0; i < 20; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 3) begin
				in1 <= inputSkin[j];
			end
			$fdisplay(file, "%d, %d",i, skinscore);
		end
		$fclose(file);
		$finish;
	end

endmodule