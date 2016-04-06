`ifndef __OPCODE_GENERATOR__
`define __OPCODE_GENERATOR__

`include "configuration.sv"

/////////////////////////////////////////////////////////////////////////////
// Config Generator
/////////////////////////////////////////////////////////////////////////////
class opcode_generator;
	mailbox 		gen2drv;
	event 			drv2gen;
	configuration 	cfg;
	
	function new 	(	
						input mailbox gen2drv,
						input event drv2gen,
						input configuration cfg
					);
		
		this.gen2drv 		= gen2drv;
		this.drv2gen 		= drv2gen;
		this.cfg			= cfg;
	endfunction : new
	
	task run();
						
		foreach (cfg.opcodes[i]) begin
			gen2drv.put(cfg.opcodes[i]);
			@drv2gen; // Wait for driver to finish
		end
	endtask : run
	
endclass : opcode_generator

`endif