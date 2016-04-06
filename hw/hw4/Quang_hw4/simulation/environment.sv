`ifndef __ENVIRONMENT__
`define __ENVIRONMENT__

`include "pixel_group.sv"
`include "io_xll_driver.sv"
`include "io_xll_monitor.sv"
`include "io_config_driver.sv"
`include "io_opcode_driver.sv"
`include "pixel_generator.sv"
`include "config_generator.sv"
`include "opcode_generator.sv"
`include "scoreboard.sv"

/////////////////////////////////////////////////////////////////////////////
// Scoreboard Driver Callback
/////////////////////////////////////////////////////////////////////////////

class scoreboard_driver_cbs extends io_xll_driver_cbs;
	scoreboard scb;
	configuration cfg;
	
	function new(scoreboard scb, configuration cfg);
		this.scb = scb;
		this.cfg = cfg;
	endfunction : new
	
	function pixel convert_ycbcr(pixel p);
		pixel mkP;
		
		int A   = p.A;
		int Y 	= cfg.OffsetY  + (cfg.C0 * p.R)/256 + (cfg.C1 * p.G)/256 - (cfg.C2 * p.B)/256;
		int Cb 	= cfg.OffsetCb - (cfg.C3 * p.R)/256 - (cfg.C4 * p.G)/256 + (cfg.C5 * p.B)/256;
		int Cr 	= cfg.OffsetCr + (cfg.C6 * p.R)/256 - (cfg.C7 * p.G)/256 - (cfg.C8 * p.B)/256;
		
		mkP = new();
		mkP.setA(A);
		mkP.setR(Y);
		mkP.setG(Cb);
		mkP.setB(Cr);
		
		return mkP;
	endfunction : convert_ycbcr
	
	virtual task post_tx(	input io_xll_driver drv,
							input pixel_group 	pg);
		
		pixel_group mkPG = new (
								pg.id, 
								convert_ycbcr(pg.p0),
								convert_ycbcr(pg.p1),
								convert_ycbcr(pg.p2),
								convert_ycbcr(pg.p3)
							);
								
		scb.save_expected(mkPG);
	endtask : post_tx
endclass : scoreboard_driver_cbs

/////////////////////////////////////////////////////////////////////////////
// Scoreboard Monitor Callback
/////////////////////////////////////////////////////////////////////////////
class scoreboard_monitor_cbs extends io_xll_monitor_cbs;
	scoreboard scb;
	
	function new(scoreboard scb);
		this.scb = scb;
	endfunction : new
	
	virtual task post_rx(	input io_xll_monitor mon,
							input pixel_group pg);
		this.scb.check_actual(pg);
	endtask : post_rx
endclass : scoreboard_monitor_cbs

/////////////////////////////////////////////////////////////////////////////
// Environment
/////////////////////////////////////////////////////////////////////////////
class environment;
	pixel_generator 	data_gen;
	mailbox 				data_gen2drv;
	event					data_drv2gen;
	io_xll_driver		data_drv;
	io_xll_monitor	 	data_mon;
	
	config_generator	config_gen;
	mailbox				config_gen2drv;
	event					config_drv2gen;
	io_config_driver	config_drv;
	
	opcode_generator	opcode_gen;
	mailbox				opcode_gen2drv;
	event					opcode_drv2gen;
	io_opcode_driver	opcode_drv;
		
	configuration 		cfg;
	scoreboard 			scb;
	virtual 			io_interface acceleratorPorts;
		
	extern function new(input vAcceleratorPort acceleratorPorts);
	extern virtual function void gen_cfg();
	extern virtual function void build();
	extern virtual task run();
	extern virtual function void wrap_up();

endclass : environment

//-----------------------------------------------------------------------------
function environment::new(input vAcceleratorPort acceleratorPorts);
	this.acceleratorPorts = acceleratorPorts;
	
	cfg = new();
	
	if ($test$plusargs("ntb_random_seed")) begin
		int seed;
		$value$plusargs("ntb_random_seed=%d", seed);
		$display("Simulation run with random seed=%0d", seed);
	end
	else
		$display("Simulation run with default random seed");
	
endfunction : new
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void environment::gen_cfg();
	`SV_RAND_CHECK(cfg.randomize());
	cfg.display();
endfunction : gen_cfg
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void environment::build();
	scoreboard_driver_cbs sdc;
	scoreboard_monitor_cbs smc;
	
	scb 			= new(cfg);
	sdc 			= new(scb,cfg);
	smc 			= new(scb);
	
	data_gen2drv 	= new();
	data_gen 		= new(data_gen2drv,data_drv2gen,cfg);
	data_drv 		= new(data_gen2drv,data_drv2gen,acceleratorPorts);
	data_mon		= new(acceleratorPorts);
	// Connect the scoreboard with callbacks
	data_drv.cbsq.push_back(sdc);
	data_mon.cbsq.push_back(smc);
	
	config_gen2drv	= new();
	config_gen		= new(config_gen2drv,config_drv2gen,cfg);
	config_drv		= new(config_gen2drv,config_drv2gen,acceleratorPorts);
	
	opcode_gen2drv	= new();
	opcode_gen		= new(opcode_gen2drv,opcode_drv2gen,cfg);
	opcode_drv		= new(opcode_gen2drv,opcode_drv2gen,acceleratorPorts);
	
endfunction : build
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task environment::run();
	int data_gen_done = 0;
	
	fork
		config_drv.run();
		opcode_drv.run();
		data_mon.run();
		data_drv.run();
		begin
			config_gen.run();
			opcode_gen.run();
			data_gen.run();
			data_gen_done = 1;
		end
	join_any
	
	fork : timeout_block
		wait (data_gen_done == 1);
		begin
			repeat (1_000_000) @(acceleratorPorts.cbt);
				$display("@%0t: %m ERROR: Timeout while waiting for generator to finish", $time);
				cfg.nErrors++;
		end
	join_any
	disable timeout_block;
	
	// Wait a little longer for the data flow through DUT, into monitors, and scoreboards
   repeat (1_000_000) @(acceleratorPorts.cbt);
   
endtask : run
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void environment::wrap_up();
   
   $display("@%0t: End of simulation, %0d error%s, %0d warning%s", 
	    $time, cfg.nErrors, cfg.nErrors==1 ? "" : "s", cfg.nWarnings, cfg.nWarnings==1 ? "" : "s");
   scb.wrap_up;
   
endfunction : wrap_up
//-----------------------------------------------------------------------------

`endif
