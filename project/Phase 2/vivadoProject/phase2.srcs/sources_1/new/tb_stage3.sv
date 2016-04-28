module tb_stage3;
	reg clk = 0;
	reg signed [31 : 0] xx;
	reg signed [31 : 0] yy;

	wire signed [31 : 0] skinScore;

	int i, file;
	int j = 0;

	reg signed [31:0] inputXx [3] = '{
		32'd106897, // 0, 155, 110
		32'd64010, // 0, 0, 10
		-32'd826967 // 115, 70, 110 
	};
	reg signed [31:0] inputYy [3] = '{
		32'd506131, // 0, 155, 110
		32'd7447101, // 0, 0, 10
		32'd1158709 // 115, 70, 110 
	};

	///// Output //////
	// 68137 	// 0, 155, 110
	// 17014784	// 0, 0, 10 		// This value is wrong... use a different input
	// 457336 	// 115, 70, 110 

	stage3 uut_stage3(
		.clk(clk),
		.leftInput(xx),
		.rightInput(yy),
		.rOutput(skinScore)
		);

	always begin 
		#5 clk =~ clk;
	end

	initial begin 
		file = $fopen("stage3_output.csv", "w+");
		for (i = 0; i < 20; i = i + 1, j = j + 1 ) begin
			@(posedge clk);
			if (j < 3) begin
				xx <= inputXx[j];
				yy <= inputYy[j];
			end
			$fdisplay(file, "%d, %d",i, skinScore);
		end
		$fclose(file);
		$finish;
	end

endmodule