`ifndef __IO_OPCODE_DRIVER__
`define __IO_OPCODE_DRIVER__

`include "io_interface.sv"
`include "opcode_word.sv"

/////////////////////////////////////////////////////////////////////////////
// Config Driver 
/////////////////////////////////////////////////////////////////////////////

class io_opcode_driver;
	mailbox 				gen2drv;
	event					drv2gen;
	vAcceleratorPort		acceleratorPort;
			
	extern function new	(
							input mailbox 			gen2drv, 
							input event 			drv2gen,	
							input vAcceleratorPort 	acceleratorPort
						);
						
	extern task run();
	extern task send(input opcode_word ow);
	extern task deassert();
endclass : io_opcode_driver

//-----------------------------------------------------------------------------
function io_opcode_driver::new	(	
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
task io_opcode_driver::run();
	opcode_word ow;
	bit drop = 0;
	
	// Initialize ports
	deassert();
		
	forever 
	begin
		//Read the config word at the front of the mailbox
		gen2drv.peek(ow);
		begin : XMIT
					
			//Actually send the pixel
			ow.display();
			send(ow);
			
		end : XMIT
		
		gen2drv.get(ow); // Remove config word 
		
		//Let the generator know we consumed a config word
		->drv2gen; 
	end
endtask : run
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
task io_opcode_driver::deassert();		
	// Initialize ports
	acceleratorPort.cbo.opcode			<= 0;
	acceleratorPort.cbo.opcode_valid	<= 0;
	
endtask : deassert
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// write(): Write a opcode word into the DUT
task io_opcode_driver::send(input opcode_word ow);
	
	//@(acceleratorPort.cbc);
	acceleratorPort.cbo.opcode			<= ow.getBits();
	acceleratorPort.cbo.opcode_valid	<= 1;
	@(acceleratorPort.cbo);
	
	wait (acceleratorPort.cbo.opcode_accept == 1);
	
	deassert();
endtask : send
//-----------------------------------------------------------------------------


`endif