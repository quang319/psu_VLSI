`ifndef __io_xll_driver__
`define __io_xll_driver__

`include "io_interface.sv"
`include "pixel_group.sv"


typedef class io_xll_driver;

/////////////////////////////////////////////////////////////////////////////
// Port Driver Callback
/////////////////////////////////////////////////////////////////////////////

class io_xll_driver_cbs;
	//A task to call just before injecting
	virtual task pre_tx	(
							input io_xll_driver drv, 	
							input pixel_group 	pg,	
							inout bit 			drop
						); 
	endtask : pre_tx
	
	//A task to call just after injecting
	virtual task post_tx(
							input io_xll_driver	drv,	
							input pixel_group 	pg
						);	
	endtask : post_tx
	
endclass : io_xll_driver_cbs
	
/////////////////////////////////////////////////////////////////////////////
// Port Driver 
/////////////////////////////////////////////////////////////////////////////

class io_xll_driver;
	mailbox 			gen2drv;
	event				drv2gen;
	vAcceleratorPort	acceleratorPort;
	io_xll_driver_cbs	cbsq[$];
	int 				maxDelay = 5;
		
	extern function new	(
							input mailbox 			gen2drv, 
							input event 			drv2gen,	
							input vAcceleratorPort 	acceleratorPort
						);
						
	extern task run();
	extern task send(input pixel_group pg);
	extern task deassert();
endclass : io_xll_driver

//-----------------------------------------------------------------------------
function io_xll_driver::new	(	
							input mailbox 			gen2drv,
							input event 			drv2gen,
							input vAcceleratorPort 	acceleratorPort
						);
							
	this.gen2drv 			= gen2drv;
	this.drv2gen 			= drv2gen;
	this.acceleratorPort 	= acceleratorPort;
			
endfunction : new
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_xll_driver::run();
	pixel_group pg;
	bit drop = 0;
	
	$display("Starting IO Driver");
	
	// Initialize ports
	deassert();
		
	forever 
	begin
		//Read the pixel at the front of the mailbox
		gen2drv.peek(pg);
		begin : XMIT
			// Pre-transmit callbacks
			foreach (cbsq[i]) 
			begin
				cbsq[i].pre_tx(this, pg, drop);
				if (drop) disable XMIT; // Don't transmit this pixel
			end
			
			//Actually send the pixel
			//pg.display();
			send(pg);
			
			// Post-transmit callbacks
			foreach (cbsq[i])
				cbsq[i].post_tx(this,pg);
		end : XMIT
		
		gen2drv.get(pg); // Remove pixel 
		
		//Let the generator know we consumed a pixel group
		->drv2gen; 
	end
endtask : run
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_xll_driver::deassert();		
	// Initialize ports
	acceleratorPort.cbt.tx_valid	<= 0;
	acceleratorPort.cbt.tx_data		<= 128'd0;
	
endtask : deassert
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// send(): Send a pixel into the DUT
task io_xll_driver::send(input pixel_group pg);
	
	//Control the rate at which the input is injected
	repeat ($urandom_range(0,maxDelay))
		@(acceleratorPort.cbt);
		
	acceleratorPort.cbt.tx_valid	<= 1'b1;
	acceleratorPort.cbt.tx_data 	<= pg.getBits();
	@(acceleratorPort.cbt);
	
	wait(acceleratorPort.cbt.tx_ready == 1);
	
	deassert();
	
endtask : send
//-----------------------------------------------------------------------------

`endif