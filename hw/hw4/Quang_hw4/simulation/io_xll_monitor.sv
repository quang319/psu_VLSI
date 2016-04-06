`ifndef __IO_XLL_MONITOR__
`define __IO_XLL_MONITOR__

`include "io_interface.sv"
`include "pixel_group.sv"

typedef class io_xll_monitor;

/////////////////////////////////////////////////////////////////////////////
// IO Monitor Callback
/////////////////////////////////////////////////////////////////////////////
class io_xll_monitor_cbs;
	virtual task post_rx(	
							input io_xll_monitor 	mon,
							input pixel_group 		pg
						);
	
	endtask : post_rx
endclass : io_xll_monitor_cbs

/////////////////////////////////////////////////////////////////////////////
// Port Monitor 
/////////////////////////////////////////////////////////////////////////////
class io_xll_monitor;
	vAcceleratorPort 	acceleratorPort;
	io_xll_monitor_cbs 	cbsq[$];
	int 				maxDelay = 5;
	
	extern function new(input vAcceleratorPort acceleratorPort);							
	extern task run();
	extern task deassert();
	extern task receive(input int receiveCount, output pixel_group pg);
endclass : io_xll_monitor

//-----------------------------------------------------------------------------
function io_xll_monitor::new(input vAcceleratorPort acceleratorPort);
	this.acceleratorPort = acceleratorPort;
endfunction : new
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_xll_monitor::run();
	pixel_group pg;
	int receiveCount = 0;
	
	forever begin
		receive(receiveCount++,pg);
		foreach (cbsq[i])
			cbsq[i].post_rx(this,pg); // Post-receive callback
	end
endtask : run
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_xll_monitor::deassert();		
	// Initialize ports
	acceleratorPort.cbr.rx_ready	<= 0;
endtask : deassert
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_xll_monitor::receive(input int receiveCount, output pixel_group pg);
	bit[127:0] pixelBits;
	pixel p[4];
	
	//Control the rate at which the output is extracted
	repeat ($urandom_range(0,maxDelay))
		@(acceleratorPort.cbr);
		
	acceleratorPort.cbr.rx_ready <= 1;	
	@(acceleratorPort.cbr);
	
	wait(acceleratorPort.cbr.rx_valid == 1);
	
	pixelBits = acceleratorPort.cbr.rx_data;
	
	p[0] = new();
	p[1] = new();
	p[2] = new();
	p[3] = new();
	
	p[0].setBits(pixelBits[31:0]);
	p[1].setBits(pixelBits[63:32]);
	p[2].setBits(pixelBits[95:64]);
	p[3].setBits(pixelBits[127:96]);
	
	pg = new(receiveCount, p[0],p[1],p[2],p[3]);
	
	deassert();
	
endtask : receive
//-----------------------------------------------------------------------------

`endif