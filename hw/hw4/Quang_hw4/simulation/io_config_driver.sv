`ifndef __IO_CONFIG_DRIVER__
`define __IO_CONFIG_DRIVER__

`include "io_interface.sv"
`include "config_word.sv"

typedef class io_config_driver;

/////////////////////////////////////////////////////////////////////////////
// Config Driver Callback
/////////////////////////////////////////////////////////////////////////////

class io_config_driver_cbs;
	//A task to call just before injecting
	virtual task pre_tx	(
							input io_config_driver 	drv, 	
							input config_word 		cw,	
							inout bit 				drop
						); 
	endtask : pre_tx
	
	//A task to call just after injecting
	virtual task post_tx(
							input io_config_driver	drv,	
							input config_word 		cw
						);	
	endtask : post_tx
	
endclass : io_config_driver_cbs
	
/////////////////////////////////////////////////////////////////////////////
// Config Driver 
/////////////////////////////////////////////////////////////////////////////

class io_config_driver;
	mailbox 				gen2drv;
	event					drv2gen;
	vAcceleratorPort		acceleratorPort;
	io_config_driver_cbs	cbsq[$];
		
	extern function new	(
							input mailbox 			gen2drv, 
							input event 			drv2gen,	
							input vAcceleratorPort 	acceleratorPort
						);
						
	extern task run();
	extern task write(input config_word cw);
	extern task read(output config_word cw);
	extern task deassert();
endclass : io_config_driver

//-----------------------------------------------------------------------------
function io_config_driver::new	(	
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
task io_config_driver::run();
	config_word cw;
	bit drop = 0;
	
	$display("Starting IO Driver");
	
	// Initialize ports
	deassert();
		
	forever 
	begin
		//Read the config word at the front of the mailbox
		gen2drv.peek(cw);
		begin : XMIT
			// Pre-transmit callbacks
			foreach (cbsq[i]) 
			begin
				cbsq[i].pre_tx(this, cw, drop);
				if (drop) disable XMIT; // Don't transmit this config word
			end
			
			//Actually send the pixel
			cw.display();
			
			if (cw.config_type == CONFIG_READ)
				read(cw);
			else
				write(cw);
						
			// Post-transmit callbacks
			foreach (cbsq[i])
				cbsq[i].post_tx(this, cw);
		end : XMIT
		
		gen2drv.get(cw); // Remove config word 
		
		//Let the generator know we consumed a config word
		->drv2gen; 
	end
endtask : run
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_config_driver::deassert();		
	// Initialize ports
	
	acceleratorPort.cbc.config_address	<= 0;
	acceleratorPort.cbc.config_wrreq	<= 0;
	acceleratorPort.cbc.config_rdreq	<= 0;
	acceleratorPort.cbc.config_datain	<= 0;
	
endtask : deassert
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// write(): Write a config word into the DUT
task io_config_driver::write(input config_word cw);
	
	//@(acceleratorPort.cbc);
	acceleratorPort.cbc.config_address	<= cw.getAddressBits();
	acceleratorPort.cbc.config_wrreq 	<= 1;
	acceleratorPort.cbc.config_datain	<= cw.getDataBits();
	@(acceleratorPort.cbc);
	
	wait (acceleratorPort.cbc.config_wrack == 1);
	
	deassert();
endtask : write
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// read(): Read a config word into the DUT
task io_config_driver::read(output config_word cw);
	bit[127:0] configBits;
	
	acceleratorPort.cbc.config_address	<= cw.getAddressBits();
	acceleratorPort.cbc.config_rdreq 	<= 1'b1;
	@(acceleratorPort.cbc);
		
	wait (acceleratorPort.cbc.config_rdack == 1);
	configBits = acceleratorPort.cbc.config_dataout;
	cw.setDataBits(configBits);
	
	deassert();
endtask : read
//-----------------------------------------------------------------------------

`endif