`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:36 01/19/2016 
// Design Name: 
// Module Name:    TRAFFIC_lights 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TRAFFIC_lights(
	input wire clk,    			// Clock
	input	wire emg,				// Emergency
	output reg [7:0] lights 	// lights output
);
reg [2:0] state = 3'b000;
reg [3:0] cnt = 4'b0000;
reg [2:0] prevState;

parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;
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
						state <= s3;
						cnt <= 0;
					end 
				s3: if (cnt < sec5)
						cnt <= cnt + 1;
					else begin
						state <= s4;
						cnt <= 0;
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
				default: state <= s0;
			endcase
		end
	end

	always @(*) begin
		case(state)
			s0: lights = 8'b1001_0001;
			s1: lights = 8'b0100_0001;
			s2: lights = 8'b0010_0001;
			s3: lights = 8'b0001_1001;
			s4: lights = 8'b0001_0100;
			s5: lights = 8'b0001_0010;
			s6: lights = 8'b0001_0001;
		endcase // state
	end 

endmodule
