`ifndef __PIXEL_GENERATOR__
`define __PIXEL_GENERATOR__

`include "pixel_group.sv"
`include "configuration.sv"

/////////////////////////////////////////////////////////////////////////////
// Pixel Generator
/////////////////////////////////////////////////////////////////////////////
class pixel_generator;
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
		int sendCount = 0;
		pixel_group pg;
		pixel p[4];
		
		p[0] = new();
		p[1] = new();
		p[2] = new();
		p[3] = new();
		
		repeat (cfg.nPixels) begin
			`SV_RAND_CHECK(p[0].randomize());
			`SV_RAND_CHECK(p[1].randomize());
			`SV_RAND_CHECK(p[2].randomize());
			`SV_RAND_CHECK(p[3].randomize());
			
			pg = new(sendCount++, p[0], p[1], p[2], p[3]);
									
			//pg.display();
			gen2drv.put(pg);
			@drv2gen; // Wait for driver to finish
		end
	endtask : run
	
	
endclass : pixel_generator

`endif