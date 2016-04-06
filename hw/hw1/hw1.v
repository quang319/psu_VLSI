module TRAFFIC_LIGHT (
	input wire clk,    			// Clock
	input	wire emg;				// Emergency
	output reg [7:0:] light 	// Light output
	);
reg [2:0] state = 3'b000;
reg [3:0] cnt = 4'b0000;
reg [2:0] prevState;

parameter s0 = 3'000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;
parameter sec3 = 4'b0011, sec5 = 4'b0101, sec10 = 4'b1010;

always @(posedge clk)

	if (emg == 1) begin
		prevState = state;
		state <= s6;
	end 

	else
		case (state)
			s0: if (cnt < sec5) 
					cnt <= cnt + 1;
				else begin
					state <= s1;
					cnt <= 0;
				end
			s1: if (cnt < sec10)
					cnt <= cnt + 1;
				else begin
					state <= s2;
					cnt <= 0;
				end
			s2: if (cnt < sec3)
					cnt <= cnt + 1;
				else begin 
					state <= s3;
					cnt <= 0;
				end 
			s3: if (cnt < sec5)
					cnt <= cnt + 1;
				else begin
					state <= s4;
					cnt <= 0
				end 
			s4: if (cnt < sec10)
					cnt <= cnt + 1;
				else begin
					state <= s5;
					cnt <= 0;
				end 
			s5: if (cnt < sec3)
					cnt <= cnt + 1;
				else begin
					state <= s0;
					cnt <= 0;
				end 
			s6:
				state <= prevState;
			default state <= s0;
		endcase

end

always @(*) begin
	case(state)
		s0: light = 8'b1001_0001;
		s1: light = 8'b0100_0001;
		s2: light = 8'b0010_0001;
		s3: light = 8'b0001_1001;
		s4: light = 8'b0001_0100;
		s5: light = 8'b0001_0010;
		s6: light = 8'b0001_0001;
	endcase // state
end 

endmodule