`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2016 07:35:56 PM
// Design Name: 
// Module Name: shiftReg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shiftReg(
	input wire clk,
	input wire [DATA_WIDTH-1:0] newInput,
	output reg [DATA_WIDTH-1:0] result
    );
	parameter DATA_WIDTH = 1;
	parameter NUM_OF_STAGES = 2;
	reg [DATA_WIDTH * NUM_OF_STAGES-1:0] temp;

 
  always @(posedge clk) 
    begin 
      temp = temp << DATA_WIDTH; 
      temp[DATA_WIDTH-1:0] = newInput; 
      result  = temp[DATA_WIDTH * NUM_OF_STAGES -1 : DATA_WIDTH * NUM_OF_STAGES - DATA_WIDTH];
    end 

endmodule
