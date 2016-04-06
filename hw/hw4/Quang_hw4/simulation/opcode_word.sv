`ifndef __OPCODE_WORD__
`define __OPCODE_WORD__

/////////////////////////////////////////////////////////////////////////////
// Opcode
/////////////////////////////////////////////////////////////////////////////

class opcode_word;
	bit	[15:0]	opcode_data;
	
	extern function new	(input 	bit[15:0] opcode_data);
						
	extern virtual function bit[15:0] getBits();
	extern virtual function void setBits(bit [15:0] bits);
	extern virtual function bit equals(opcode_word other);
	extern virtual function void display();
	extern virtual function opcode_word copy(input opcode_word to=null);
	extern function void copy_data(input opcode_word copy);
	
endclass : opcode_word

//-----------------------------------------------------------------------------
function opcode_word::new(input 	bit[15:0] opcode_data); 
	this.opcode_data 	= opcode_data;
endfunction : new
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit [15:0] opcode_word::getBits();
	return opcode_data;
endfunction : getBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void opcode_word::setBits(bit [15:0] bits);
	opcode_data = bits;
endfunction : setBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit opcode_word::equals(opcode_word other);		
	if (this.getBits() != other.getBits())
		return 0;
	
	return 1;
endfunction : equals
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void opcode_word::display();
	$display("Opcode : 0x%X",getBits());
endfunction : display
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function opcode_word opcode_word::copy(input opcode_word to=null);
	opcode_word mkOpcode;
		
	if (to == null) mkOpcode = new(0);
	else			$cast(mkOpcode,to);
	copy_data(mkOpcode);
	return mkOpcode;
endfunction : copy
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void opcode_word::copy_data(input opcode_word copy);
	copy.opcode_data 	= this.opcode_data;
endfunction : copy_data
//-----------------------------------------------------------------------------
`endif