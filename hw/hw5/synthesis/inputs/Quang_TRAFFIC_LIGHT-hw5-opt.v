`timescale 1ps / 1ps
// 								LIGHTS
// 			North-South               |            East-West
// Left Turn | Green | Yelloww | Red   | Left Turn | Green | Yelloww | Red   |
// Bit 7     | Bit 6 | Bit 5  | Bit 4 | Bit 3	  | Bit 2 | Bit 1  | Bit 0 |

module TRAFFIC_lights(
	input wire clk,    			// clk
	input wire emergency,			// Emergency
	input wire reset,					// Reset

	output reg LeftTurn_NS,
	output reg Green_NS,
	output reg Yellow_NS,
	output reg Red_NS,

	output reg LeftTurn_EW,
	output reg Green_EW,
	output reg Yellow_EW,
	output reg Red_EW
);


reg [2:0] state = 3'b000;
reg [3:0] cnt = 4'b0000;
reg [2:0] prevState;
reg		 northSouth = 1'b0;

parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s6 = 3'b110;
parameter sec3 = 4'b0010, sec5 = 4'b0100, sec10 = 4'b1001;

	always @(posedge clk) begin
	
		if (emergency == 1) begin
			if (state != s6) prevState = state;
			state <= s6;
		end 
		
		else if (reset == 1) begin
			state <= s0;
			cnt 	<= 0;
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
						northSouth <= !northSouth;
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
				if(northSouth == 1'b0) begin
					// lights = 8'b1001_0001;
					LeftTurn_NS	= 1'b1;
					Green_NS	= 1'b0;
					Yellow_NS	= 1'b0;
					Red_NS		= 1'b1;

					LeftTurn_EW = 1'b0;
					Green_EW 	= 1'b0;
					Yellow_EW 	= 1'b0;
					Red_EW 		= 1'b1;
				end


				else	begin
					// lights = 8'b0001_1001;
					LeftTurn_NS	= 1'b0;
					Green_NS		= 1'b0;
					Yellow_NS		= 1'b0;
					Red_NS		= 1'b1;

					LeftTurn_EW = 1'b1;
					Green_EW 	= 1'b0;
					Yellow_EW 	= 1'b0;
					Red_EW 		= 1'b1;
				end
			s1: 
				if(northSouth == 1'b0) begin
					// lights = 8'b0100_0001;
					LeftTurn_NS	= 1'b0;
					Green_NS		= 1'b1;
					Yellow_NS		= 1'b0;
					Red_NS		= 1'b0;

					LeftTurn_EW = 1'b0;
					Green_EW 	= 1'b0;
					Yellow_EW 	= 1'b0;
					Red_EW 		= 1'b1;
				end
				else begin
					// lights = 8'b0001_0100;
					LeftTurn_NS	= 1'b0;
					Green_NS		= 1'b0;
					Yellow_NS		= 1'b0;
					Red_NS		= 1'b1;

					LeftTurn_EW = 1'b0;
					Green_EW 	= 1'b1;
					Yellow_EW 	= 1'b0;
					Red_EW 		= 1'b0;
				end
			s2: 
				if(northSouth == 1'b0) begin
					// lights = 8'b0010_0001;
					LeftTurn_NS	= 1'b0;
					Green_NS		= 1'b0;
					Yellow_NS		= 1'b1;
					Red_NS		= 1'b0;

					LeftTurn_EW = 1'b0;
					Green_EW 	= 1'b0;
					Yellow_EW 	= 1'b0;
					Red_EW 		= 1'b1;
				end
				else	begin
					// lights = 8'b0001_0010;
					LeftTurn_NS	= 1'b0;
					Green_NS		= 1'b0;
					Yellow_NS		= 1'b0;
					Red_NS		= 1'b1;

					LeftTurn_EW = 1'b0;
					Green_EW 	= 1'b0;
					Yellow_EW 	= 1'b1;
					Red_EW 		= 1'b0;
				end
			s6: begin
				// lights = 8'b0001_0001;
				LeftTurn_NS	= 1'b0;
				Green_NS		= 1'b0;
				Yellow_NS		= 1'b0;
				Red_NS		= 1'b1;

				LeftTurn_EW = 1'b0;
				Green_EW 	= 1'b0;
				Yellow_EW 	= 1'b0;
				Red_EW 		= 1'b1;
			end
				
				
		endcase // state
	end 

endmodule
