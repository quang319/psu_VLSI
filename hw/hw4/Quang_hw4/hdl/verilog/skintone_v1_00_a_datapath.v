
`ifdef SIMULATION
`endif

`timescale 1ps / 1ps

module skintone_v1_00_a_datapath
(
	clk									,
	rst									,
	
	config_address						,
	config_datain						,
	config_wrreq						,
	config_rdreq						,
	config_wrack						,
	config_rdack						,
	config_dataout						,
	
	pixel_datain						,
	pixel_datain_valid					,
	pixel_datain_ready					,
	
		
	result_dataout						,
	result_dataout_valid				,
	result_dataout_ready				,
	
	opcode								,
	opcode_valid						,
	opcode_accept						,
	
	status								
);
	`include "skintone_v1_00_a_defines.vh"

	parameter					C_PIXEL_WIDTH 				= 8;

	input							clk								;
	input							rst								;

	input 			[35:0]	config_address					;
	input 			[127:0]	config_datain					;
	input 						config_wrreq					;
	input 						config_rdreq					;
	output 	reg				config_wrack					;
	output 	reg				config_rdack					;
	output	reg	[127:0] 	config_dataout					;
		
	input				[127:0]	pixel_datain					;
	input							pixel_datain_valid				;
	output						pixel_datain_ready				;

	output			[127:0]	result_dataout					;
	output						result_dataout_valid			;
	input							result_dataout_ready			;

	input				[15:0]	opcode							;
	input							opcode_valid					;
	output						opcode_accept                   ;
	output			[35:0]	status                       	;
	
	wire							input_fifo_clk					;
	wire							input_fifo_rst					;
	wire							input_fifo_wren					;
	wire							input_fifo_rden					;
	wire				[127:0]	input_fifo_datain				;
	wire				[127:0]	input_fifo_dataout				;
	wire							input_fifo_empty				;
	wire							input_fifo_full					;
	wire							input_fifo_prog_full			;
	wire				[17:0]		input_fifo_count				;
	
	wire							output_fifo_clk					;
	wire							output_fifo_rst					;
	wire							output_fifo_wren				;
	wire							output_fifo_rden				;
	wire				[127:0]	output_fifo_datain				;
	wire				[127:0]	output_fifo_dataout				;
	wire							output_fifo_empty				;
	wire							output_fifo_full				;
	wire							output_fifo_prog_full			;
	wire				[17:0]				output_fifo_count				;
	
	wire				[127:0]	rgb_datain						;
	wire				[3:0]		rgb_datain_valid				;
	wire				[127:0]	ycbcr_dataout					;
	wire				[3:0]		ycbcr_dataout_valid				;
	
	reg							opcode_accept_r					;
	reg				[7:0]		control_registers[11:0]			;
	
/////////////////////////////////////////////////////////////////////////////
// Status Interface
/////////////////////////////////////////////////////////////////////////////
	assign status = 36'b0;
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Opcode Interface
/////////////////////////////////////////////////////////////////////////////
	always @(posedge clk)
		if (rst)
			opcode_accept_r <= 1'b0;
		else
			opcode_accept_r <= opcode_accept_r ? 1'b0 : opcode_valid;
	
	assign opcode_accept = opcode_accept_r & opcode_valid;
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Control Registers
/////////////////////////////////////////////////////////////////////////////
	always @(posedge clk)
	begin : LBL_CONTROL_REGISTERS
		integer i;
		
		if (rst)
		begin
			for (i=0; i<12; i=i+1)
				control_registers[i] <= 8'b0;
				
			config_wrack <= 1'b0;
			config_rdack <= 1'b0;
		end
		else
		begin
			if (config_wrreq)
				control_registers[config_address[35:4]] <= config_datain[7:0];
				
			config_dataout <= {120'b0,control_registers[config_address[35:4]]};
			
			config_wrack <= config_wrreq;
			config_rdack <= config_rdreq;
		end
	end
	
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Input Fifo
/////////////////////////////////////////////////////////////////////////////
	assign input_fifo_clk		= clk;
	assign input_fifo_rst		= rst;
	assign pixel_datain_ready 	= ~input_fifo_full;
	assign input_fifo_datain	= pixel_datain;
	assign input_fifo_wren		= pixel_datain_valid & pixel_datain_ready;
	
	fifo_fwft_prog_full_count
	#(
		.C_DATA_WIDTH 				(128),
		.C_FIFO_DEPTH				(512),
		.C_PROG_FULL_THRESHOLD	(512)
	)
	i_input_fifo
	(
		.clk					(input_fifo_clk			),
		.rst					(input_fifo_rst			),
		.wren					(input_fifo_wren			),
		.rden					(input_fifo_rden			),
		.datain				(input_fifo_datain		),
		.dataout				(input_fifo_dataout		),
		.empty				(input_fifo_empty			),
		.full					(input_fifo_full			),
		.prog_full			(input_fifo_prog_full	),
		.count				(input_fifo_count			)
	);
/////////////////////////////////////////////////////////////////////////////
	
/////////////////////////////////////////////////////////////////////////////
// Color Space Converter
/////////////////////////////////////////////////////////////////////////////
	assign rgb_datain 			= input_fifo_dataout;
	assign rgb_datain_valid 	= {4{~input_fifo_empty & ~output_fifo_full}};
	assign input_fifo_rden 		= ~input_fifo_empty & ~output_fifo_full;
		
	skintone_v1_00_a_color_converter_bank
	i_color_converter_bank
	(
		.clk					(clk					),
		.rst					(rst					),
		
		.rgb_datain				(rgb_datain				),
		.rgb_datain_valid		(rgb_datain_valid		),
		
		.ycbcr_dataout			(ycbcr_dataout			),
		.ycbcr_dataout_valid	(ycbcr_dataout_valid	),
		
		.c0						(control_registers[0]	),
		.c1						(control_registers[1]	),
		.c2						(control_registers[2]	),
		.c3						(control_registers[3]	),
		.c4						(control_registers[4]	),
		.c5						(control_registers[5]	),
		.c6						(control_registers[6]	),
		.c7						(control_registers[7]	),
		.c8						(control_registers[8]	),
		.offset_y				(control_registers[9]	),
		.offset_cb				(control_registers[10]	),
		.offset_cr				(control_registers[11]	)
	);
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Output Fifo
/////////////////////////////////////////////////////////////////////////////
	assign output_fifo_datain 	= ycbcr_dataout;
	assign output_fifo_wren 	= |ycbcr_dataout_valid;
	
	fifo_fwft_prog_full_count
	#(
		.C_DATA_WIDTH 			(128					),
		.C_FIFO_DEPTH			(512					),
		.C_PROG_FULL_THRESHOLD	(512					)
	)
	i_output_fifo
	(
		.clk					(output_fifo_clk		),
		.rst					(output_fifo_rst		),
		.wren					(output_fifo_wren		),
		.rden					(output_fifo_rden		),
		.datain					(output_fifo_datain		),
		.dataout				(output_fifo_dataout	),
		.empty					(output_fifo_empty		),
		.full					(output_fifo_full		),
		.prog_full				(output_fifo_prog_full	),
		.count					(output_fifo_count		)
	);

	assign output_fifo_clk		= clk;
	assign output_fifo_rst		= rst;
	assign result_dataout_valid = ~output_fifo_empty;
	assign output_fifo_rden 	= result_dataout_valid & result_dataout_ready;
	assign result_dataout		= output_fifo_dataout;
/////////////////////////////////////////////////////////////////////////////


endmodule
`ifdef SIMULATION
`uselib
`endif

