`ifndef __PIXEL_GROUP__
`define __PIXEL_GROUP__

`include "pixel.sv"
/////////////////////////////////////////////////////////////////////////////
// Pixel Group
/////////////////////////////////////////////////////////////////////////////

class pixel_group;
	int		id;
	rand 	pixel p0;
	rand	pixel p1;
	rand	pixel p2;
	rand	pixel p3;
	
	extern function new	(input int id, input pixel p0, input pixel p1, input pixel p2, input pixel p3);
	extern virtual function logic[127:0] getBits();
	extern virtual function void setBits(logic [127:0] bits);
	extern virtual function bit equals(pixel_group other);
	extern virtual function void display();
endclass : pixel_group

//-----------------------------------------------------------------------------
function pixel_group::new(input int id, input pixel p0, input pixel p1, input pixel p2, input pixel p3); 
	this.id = id;
	this.p0 = p0.copy();
	this.p1 = p1.copy();
	this.p2 = p2.copy();
	this.p3 = p3.copy();
	//`SV_RAND_CHECK(TargetAddress.randomize());
endfunction : new
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function logic [127:0] pixel_group::getBits();
	bit[127:0] pixelBits;

	pixelBits[31:0]		= p0.getBits();
	pixelBits[63:32]	= p1.getBits();
	pixelBits[95:64] 	= p2.getBits();
	pixelBits[127:96] 	= p3.getBits();

	return pixelBits;
endfunction : getBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void pixel_group::setBits(logic [127:0] bits);
	p0 = new();
	p1 = new();
	p2 = new();
	p3 = new();
	
	p0.setBits(bits[31:0]);
	p1.setBits(bits[63:32]);
	p2.setBits(bits[95:64]);
	p3.setBits(bits[127:96]);
endfunction : setBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit pixel_group::equals(pixel_group other);		
	if (this.getBits() != other.getBits())
		return 0;
	
	return 1;
endfunction : equals
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void pixel_group::display();
	p0.display();
	p1.display();
	p2.display();
	p3.display();
endfunction : display
//-----------------------------------------------------------------------------

`endif