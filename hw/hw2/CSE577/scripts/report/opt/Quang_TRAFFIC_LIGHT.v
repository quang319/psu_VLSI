`timescale 1ps / 1ps
// 								LIGHTS
// 			North-South               |            East-West
// Left Turn | Green | Yellow | Red   | Left Turn | Green | Yellow | Red   |
// Bit 7     | Bit 6 | Bit 5  | Bit 4 | Bit 3	  | Bit 2 | Bit 1  | Bit 0 |

module TRAFFIC_lights(
	input wire clk,    			// Clock
	input	wire emg,				// Emergency
	output reg [7:0] lights 	// lights output
);
reg [2:0] state = 3'b000;
reg [3:0] cnt = 4'b0000;
reg [2:0] prevState;
reg		 northSouth = 1'b0;

parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s6 = 3'b110;
parameter sec3 = 4'b0010, sec5 = 4'b0100, sec10 = 4'b1001;

	always @(posedge clk) begin
	
		if (emg == 1) begin
			if (state != s6) prevState = state;
			state <= s6;
		end 
	
		else begin
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
						state <= s0;
						cnt <= 0;
						northSouth = !northSouth;
					end 
				s6:
					state <= prevState;
				default: state <= s0;
			endcase
		end
	end

	always @(*) begin
		case(state)
			s0:
				if(northSouth == 1'b0) 
					lights = 8'b1001_0001;
				else
					lights = 8'b0001_1001;
			s1: 
				if(northSouth == 1'b0)
					lights = 8'b0100_0001;
				else
					lights = 8'b0001_0100;
			s2: 
				if(northSouth == 1'b0)
					lights = 8'b0010_0001;
				else
					lights = 8'b0001_0010;
			s6: lights = 8'b0001_0001;
		endcase // state
	end 

endmodule
