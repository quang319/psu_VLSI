`timescale 1ps / 1ps
module testbench_traffic();
reg clk ;
reg emg;
wire [7:0] lights ;

initial begin
clk = 1'b0 ;
emg = 1'b0 ;
end 

always #1 clk = ~clk ;

initial begin
#5 emg = 1'b1 ;
#1 emg = 1'b0 ;
#13 emg = 1'b1;
#1 emg = 1'b0 ;
#100 $stop ;
end

TRAFFIC_lights uut (clk , emg , lights) ;

endmodule