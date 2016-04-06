`ifndef __TEST__
`define __TEST__

`include "io_interface.sv"

program automatic test
(
	input logic rst,
	input logic clk
);
	
	virtual io_interface acceleratorPorts = testbench.acceleratorPorts;
		
	`include "environment.sv"
	
	environment env;
	
	initial begin
		env = new(acceleratorPorts);
		env.gen_cfg();
		env.build();
		env.run();
		env.wrap_up();
	end
endprogram
`endif