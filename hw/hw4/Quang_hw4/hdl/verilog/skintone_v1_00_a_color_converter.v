`ifdef SIMULATION
`endif

`timescale 1ps / 1ps

module skintone_v1_00_a_color_converter
(
	clk,
	rst,
	
	rgb_datain,
	rgb_datain_valid,
	
	ycbcr_dataout,
	ycbcr_dataout_valid,
	
	c0,
	c1,
	c2,
	c3,
	c4,
	c5,
	c6,
	c7,
	c8,
	
	offset_y,
	offset_cb,
	offset_cr
);

	input				clk;
	input				rst;
	
	input		[31:0]	rgb_datain;
	input				rgb_datain_valid;
	
	input		[7:0]	c0;
	input		[7:0]	c1;
	input		[7:0]	c2;
	input		[7:0]	c3;
	input		[7:0]	c4;
	input		[7:0]	c5;
	input		[7:0]	c6;
	input		[7:0]	c7;
	input		[7:0]	c8;
	
	input		[7:0]	offset_y;
	input		[7:0]	offset_cb;
	input		[7:0]	offset_cr;
	
	output		[31:0]	ycbcr_dataout;
	output	reg			ycbcr_dataout_valid;
	
	wire		[7:0] 	A_in = rgb_datain[31:24];
	wire		[7:0] 	R_in = rgb_datain[23:16];
	wire		[7:0] 	G_in = rgb_datain[15:8];
	wire		[7:0] 	B_in = rgb_datain[7:0];
	
	reg			[7:0] 	A_out;
	reg			[10:0] 	Y_out;
	reg			[10:0] 	Cb_out;
	reg			[10:0] 	Cr_out;
	
	wire		[15:0]	R_times_C0;
	wire		[15:0]	G_times_C1;
	wire		[15:0]	B_times_C2;
	
	wire		[15:0]	R_times_C3;
	wire		[15:0]	G_times_C4;
	wire		[15:0]	B_times_C5;
	
	wire		[15:0]	R_times_C6;
	wire		[15:0]	G_times_C7;
	wire		[15:0]	B_times_C8;
	
	assign R_times_C0 = R_in * c0;
	assign G_times_C1 = G_in * c1;
	assign B_times_C2 = B_in * c2;
	
	assign R_times_C3 = R_in * c3;
	assign G_times_C4 = G_in * c4;
	assign B_times_C5 = B_in * c5;
	
	assign R_times_C6 = R_in * c6;
	assign G_times_C7 = G_in * c7;
	assign B_times_C8 = B_in * c8;
		
	always @(posedge clk)
	begin
		Y_out 	<= offset_y   + R_times_C0[15:8] + G_times_C1[15:8] - B_times_C2[15:8];
		Cb_out 	<= offset_cb  - R_times_C3[15:8] - G_times_C4[15:8] + B_times_C5[15:8];
		Cr_out 	<= offset_cr  + R_times_C6[15:8] - G_times_C7[15:8] - B_times_C8[15:8];
		A_out	<= A_in;
	end
	
	assign ycbcr_dataout = {A_out,Y_out[7:0],Cb_out[7:0],Cr_out[7:0]};
	
	always @(posedge clk)
	begin
		ycbcr_dataout_valid <= rgb_datain_valid;
	end
	
endmodule
