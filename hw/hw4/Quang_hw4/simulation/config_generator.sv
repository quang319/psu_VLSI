`ifndef __CONFIG_GENERATOR__
`define __CONFIG_GENERATOR__

`include "config_word.sv"
`include "configuration.sv"

/////////////////////////////////////////////////////////////////////////////
// Config Generator
/////////////////////////////////////////////////////////////////////////////
class config_generator;
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
						
		foreach (cfg.configuration_words[i]) begin
			if (cfg.configuration_words[i].config_type == CONFIG_WRITE) begin
				gen2drv.put(cfg.configuration_words[i]);
				@drv2gen; // Wait for driver to finish
			end
		end
	endtask : run
	
endclass : config_generator

`endif