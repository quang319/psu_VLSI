`ifndef __IO_INTERFACE__
`define __IO_INTERFACE__

interface io_interface 
#(
	C_DATA_WIDTH 				= 128,
	C_CONFIG_ADDRESS_WIDTH	= 36,
	C_CONFIG_DATA_WIDTH		= 128,
	C_OPCODE_WIDTH 			= 16
)
(
	input		bit												clk				,
	input		bit												rst				,
	
	output 	logic 	[C_DATA_WIDTH-1:0]				tx_data			,
	output 	logic 											tx_valid		,
	input		logic												tx_ready		,

	input		logic 	[C_DATA_WIDTH-1:0]				rx_data			,
	input		logic												rx_valid		,
	output	logic												rx_ready		,
	
	output	logic		[C_CONFIG_ADDRESS_WIDTH-1:0]	config_address	,
	output	logic		[C_CONFIG_DATA_WIDTH-1:0]		config_datain	,
	output	logic												config_wrreq	,
	output	logic												config_rdreq	,
	input		logic												config_wrack	,
	input		logic												config_rdack	,
	input		logic		[C_CONFIG_DATA_WIDTH-1:0]			config_dataout	,
	
	output	logic		[C_OPCODE_WIDTH-1:0]				opcode			,
	output	logic												opcode_valid	,
	input		logic												opcode_accept
);

	clocking cbr @(posedge clk);
		input	rst			;
		input	rx_data		;
		input 	rx_valid	;
		output  rx_ready	;
	endclocking : cbr
	modport TB_recv (clocking cbr);
	
	clocking cbt @(posedge clk);
		input	rst			;
		output	tx_data		;
		inout	tx_valid	;
		input	tx_ready	;
	endclocking : cbt
	modport TB_send (clocking cbt);
	
	clocking cbc @(posedge clk);
		input	rst				;
		output	config_address	;
		output	config_datain	;
		output	config_wrreq	;
		output	config_rdreq	;
		input	config_wrack	;
		input	config_rdack	;
		input	config_dataout	;
	endclocking : cbc
	modport TB_config (clocking cbc);
	
	clocking cbo @(posedge clk);
		input	rst				;
		output	opcode			;
		output	opcode_valid	;
		input	opcode_accept	;
	endclocking : cbo
	modport TB_opcode (clocking cbo);
	
endinterface: io_interface

typedef virtual io_interface 					vAcceleratorPort;
typedef virtual io_interface.TB_recv 		vAcceleratorPortRX;
typedef virtual io_interface.TB_send 		vAcceleratorPortTX;
typedef virtual io_interface.TB_config 	vAcceleratorPortCONFIG;
typedef virtual io_interface.TB_opcode 	vAcceleratorPortOPCODE;

`endif