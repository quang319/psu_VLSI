`ifndef __CONFIGURATION__
`define __CONFIGURATION__

`include "config_word.sv"
`include "opcode_word.sv"
/////////////////////////////////////////////////////////////////////////////
// Configuration
/////////////////////////////////////////////////////////////////////////////
class configuration;
	int 		nErrors;
	int 		nWarnings;
	
	rand bit [31:0]	nPixels;
	
	int			OffsetY;
	int			OffsetCr;
	int			OffsetCb;
	int			C0;
	int			C1;
	int			C2;
	int			C3;
	int			C4;
	int			C5;
	int			C6;
	int			C7;
	int			C8;
	
	config_word	configuration_words[$];
	opcode_word opcodes[$];
	
	constraint c_nPixels_valid
		{nPixels > 0; }
	constraint c_nPixels_reasonable
		{nPixels < 5000; }
		
	function new();	
		opcode_word mkOpcode = new('hBEEF);
		config_word coefficient_configs[12];
		
		OffsetY		= 16;
		OffsetCb	= 128;
		OffsetCr	= 128;
		C0			= 65;
		C1			= 129;
		C2			= 25;
		C3			= 38;
		C4			= 74;
		C5			= 112;
		C6			= 112;
		C7			= 94;
		C8			= 18;
		
		coefficient_configs[0]  = new(CONFIG_WRITE,'h00,C0);
		coefficient_configs[1]  = new(CONFIG_WRITE,'h10,C1);
		coefficient_configs[2]  = new(CONFIG_WRITE,'h20,C2);
		coefficient_configs[3]  = new(CONFIG_WRITE,'h30,C3);
		coefficient_configs[4]  = new(CONFIG_WRITE,'h40,C4);
		coefficient_configs[5]  = new(CONFIG_WRITE,'h50,C5);
		coefficient_configs[6]  = new(CONFIG_WRITE,'h60,C6);
		coefficient_configs[7]  = new(CONFIG_WRITE,'h70,C7);
		coefficient_configs[8]  = new(CONFIG_WRITE,'h80,C8);
		coefficient_configs[9]  = new(CONFIG_WRITE,'h90,OffsetY);
		coefficient_configs[10] = new(CONFIG_WRITE,'hA0,OffsetCb);
		coefficient_configs[11] = new(CONFIG_WRITE,'hB0,OffsetCr);
		
		foreach (coefficient_configs[i])
			configuration_words.push_back(coefficient_configs[i]);
		
		opcodes.push_back(mkOpcode);
		
	endfunction : new				
	
	extern virtual function void display(input string prefix="");
endclass : configuration

//---------------------------------------------------------------------------
function void configuration::display(input string prefix="");
	
endfunction : display
//---------------------------------------------------------------------------

`endif