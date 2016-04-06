
`timescale 1ns/1ns

`include "skintone_v1_00_a_defines.vh"	
`include "io_interface.sv"

module testbench;
	parameter int C_DATA_WIDTH				= 128	;
	parameter int C_CONFIG_ADDRESS_WIDTH	= 36	;
	parameter int C_CONFIG_DATA_WIDTH		= 128	;
	parameter int C_OPCODE_WIDTH			= 16	;
	parameter int C_STATUS_WIDTH			= 36	;
	
	logic 										rst				;
	logic											clk				;
	wire	[C_DATA_WIDTH-1:0]				input_data		;
	wire											input_valid		;
	wire											input_ready		;
	wire	[C_DATA_WIDTH-1:0]				output_data		;
	wire											output_valid	;
	wire											output_ready	;
	
	wire	[C_CONFIG_ADDRESS_WIDTH-1:0]	config_address	;
	wire	[C_CONFIG_DATA_WIDTH-1:0]		config_datain	;
	wire											config_wrreq	;
	wire											config_rdreq	;
	wire 											config_wrack	;
	wire 											config_rdack	;
	wire	[C_CONFIG_DATA_WIDTH-1:0]		config_dataout	;
	
	wire	[C_OPCODE_WIDTH-1:0]				opcode			;
	wire											opcode_valid	;
	wire											opcode_accept	;
	
	wire	[C_STATUS_WIDTH-1:0]				status			;
	
	initial begin
		clk = 0;
		#10ns clk = 1;
		#5ns  clk = 0;
		forever
			#5ns clk = ~clk;
	end
	
	initial begin
		rst = 0;
		#5ns rst = 1;
		#50ns rst = 0;
	end
	
	skintone_v1_00_a_datapath
	i_skintone_datapath
	(
		.clk							(clk			),
		.rst							(rst			),
		.config_address			(config_address	),
		.config_datain				(config_datain	),
		.config_wrreq				(config_wrreq	),
		.config_rdreq				(config_rdreq	),
		.config_wrack				(config_wrack	),
		.config_rdack				(config_rdack	),
		.config_dataout			(config_dataout	),
		.pixel_datain				(input_data		),
		.pixel_datain_valid		(input_valid	),
		.pixel_datain_ready		(input_ready	),
		.result_dataout			(output_data	),
		.result_dataout_valid	(output_valid	),
		.result_dataout_ready	(output_ready	),
		.opcode						(opcode			),
		.opcode_valid				(opcode_valid	),
		.opcode_accept				(opcode_accept	),
		.status						(status			)
	);

	io_interface 
	#(
		.C_DATA_WIDTH				(C_DATA_WIDTH			),
		.C_CONFIG_ADDRESS_WIDTH	(C_CONFIG_ADDRESS_WIDTH	),
		.C_CONFIG_DATA_WIDTH		(C_CONFIG_DATA_WIDTH	)
	)	
	i_io_interface
	(
		.clk						(clk					), 
		.rst						(rst					), 
		.tx_data					(input_data				), 
		.tx_valid				(input_valid			),
		.tx_ready				(input_ready			),
		.rx_data					(output_data			),
		.rx_valid				(output_valid			),
		.rx_ready				(output_ready			),
		.config_address		(config_address			),
		.config_datain			(config_datain			),
		.config_wrreq			(config_wrreq			),
		.config_rdreq			(config_rdreq			),
		.config_wrack			(config_wrack			),
		.config_rdack			(config_rdack			),
		.config_dataout		(config_dataout			),
		.opcode					(opcode					),
		.opcode_valid			(opcode_valid			),
		.opcode_accept			(opcode_accept			)
	);
	
	virtual io_interface acceleratorPorts = i_io_interface;
	
	test t1(rst,clk);
	
endmodule