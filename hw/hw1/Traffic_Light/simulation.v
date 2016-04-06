`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:57:05 01/21/2016
// Design Name:   TRAFFIC_lights
// Module Name:   C:/Users/quang/Dropbox/School/Penn State/Spring/CSE 557 - VLSI/Traffic_Light/simulation.v
// Project Name:  Traffic_Light
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TRAFFIC_lights
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simulation;

	// Inputs
	reg clk;
	reg emg;

	// Outputs
	wire [7:0] lights;
	reg cnt = 0;

	// Instantiate the Unit Under Test (UUT)
	TRAFFIC_lights uut (
		.clk(clk), 
		.emg(emg), 
		.lights(lights)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		emg = 0;
		$monitor("cnt = %3d , EMG = %b , lights = %b_%b", cnt, emg, lights[7:4], lights[3:0]);
		// Wait 100 ns for global reset to finish
		#100;
		
	end
        
		// Add stimulus here
	always begin 
		#1 clk = ~clk;
	end
	
	always begin
		#150 emg = 1;
		#15 emg = 0;
	end
	
	always @(posedge clk) begin
		$monitor("cnt = %3d , EMG = %b , lights = %b_%b", cnt, emg, lights[7:4], lights[3:0]);
		cnt <= cnt + 1;
	
	end
      
endmodule

