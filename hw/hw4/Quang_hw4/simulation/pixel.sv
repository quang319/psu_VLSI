`ifndef __PIXEL__
`define __PIXEL__

`define SV_RAND_CHECK(r) \
	do begin \
		if (!(r)) begin \
			$display("%s:%0d: Randomization failed \"%s\"", \
					`__FILE__, `__LINE__, `"r`"); \
			$finish; \
		end \
	end while (0)

/////////////////////////////////////////////////////////////////////////////
// Base Pixel
/////////////////////////////////////////////////////////////////////////////
class pixel;
	rand bit	[7:0]	R;
	rand bit	[7:0]	G;
	rand bit	[7:0]	B;
	rand bit	[7:0]	A;

	function new(); endfunction : new
	extern virtual function logic [31:0] getBits();
	extern virtual function void setBits(logic [31:0] bits);
	extern virtual function bit equals(pixel other);
	extern virtual function void display();
	extern virtual function pixel copy(input pixel to=null);
	extern function void copy_data(input pixel copy);
	function void setA(int value); A = value; endfunction : setA
	function void setB(int value); B = value; endfunction : setB
	function void setG(int value); G = value; endfunction : setG
	function void setR(int value); R = value; endfunction : setR
	
endclass : pixel

//-----------------------------------------------------------------------------
function logic [31:0] pixel::getBits();
	bit[31:0] pixelBits;

	pixelBits[31:24]	= A;
	pixelBits[23:16] 	= R;
	pixelBits[15:8]		= G;
	pixelBits[7:0]		= B;
	
	return pixelBits;
endfunction : getBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void pixel::setBits(logic [31:0] bits);
	A = bits[31:24]	;
	R = bits[23:16]	;
	G = bits[15:8]	;
	B = bits[7:0]	;
endfunction : setBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit pixel::equals(pixel other);		
	if (this.getBits() != other.getBits())
		return 0;
	
	return 1;
endfunction : equals
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function pixel pixel::copy(input pixel to=null);
	pixel mkPixel;
		
	if (to == null) mkPixel = new();
	else			$cast(mkPixel,to);
	copy_data(mkPixel);
	return mkPixel;
endfunction : copy
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void pixel::copy_data(input pixel copy);
	copy.A 	= this.A;
	copy.R 	= this.R;
	copy.G	= this.G;
	copy.B 	= this.B;
endfunction : copy_data
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void pixel::display();
	$display("PIXEL [A,R,G,B] :  = [%d,%d,%d,%d]",A,R,G,B);
endfunction : display
//-----------------------------------------------------------------------------

`endif