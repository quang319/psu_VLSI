`ifdef SIMULATION
`endif

`timescale 1ps / 1ps

module skintone_v1_00_a_color_converter_bank
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
	
	input		[127:0]	rgb_datain;
	input		[3:0]	rgb_datain_valid;
	
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
	
	output		[127:0]	ycbcr_dataout;
	output		[3:0]	ycbcr_dataout_valid;
	
	genvar i;
	generate
		for (i=0; i<4; i=i+1)
		begin : LBL_COLOR_CONVERT_ENGINES
			skintone_v1_00_a_color_converter
			i_engine
			(
				.clk						(clk								),
				.rst						(rst								),
				
				.rgb_datain				(rgb_datain				[i*32 +: 32]),
				.rgb_datain_valid		(rgb_datain_valid		[i]			),
				
				.ycbcr_dataout			(ycbcr_dataout			[i*32 +: 32]),
				.ycbcr_dataout_valid	(ycbcr_dataout_valid	[i]			),
				
				.offset_y				(offset_y							),
				.offset_cb				(offset_cb							),
				.offset_cr				(offset_cr							),
				
				.c0						(c0									),
				.c1						(c1									),
				.c2						(c2									),
				.c3						(c3									),
				.c4						(c4									),
				.c5						(c5									),
				.c6						(c6									),
				.c7						(c7									),
				.c8						(c8									)
			);
		end
	endgenerate
	
endmodule