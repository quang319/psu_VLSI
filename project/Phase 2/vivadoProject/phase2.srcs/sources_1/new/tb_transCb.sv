module tb_transCb;
	reg clk = 0;
	reg  [7:0] Y;
	reg  [7:0] Cb;

	wire [31:0] result;

	int i, file;
	int j = 0;

	reg signed [7:0] inputY [3] = '{
		8'd0, // 0, 155, 110
		8'd115, // 115, 70, 110 
		8'd155 	// 155, 70, 110
	};
	reg signed [7:0] inputCb [3] = '{
		8'd110, // 0, 155, 110
		8'd110, // 115, 70, 110 
		8'd110 	// 155, 70, 110
	};

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
			if (j < 3) begin
				Y <= inputY[j];
				Cb <= inputCb[j];
			end
			$fdisplay(file, "%d, %d",i, result);
		end
		$fclose(file);
		$finish;
	end
endmodule
