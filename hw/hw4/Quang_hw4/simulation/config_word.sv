`ifndef __CONFIG_WORD__
`define __CONFIG_WORD__

/////////////////////////////////////////////////////////////////////////////
// Config Word
/////////////////////////////////////////////////////////////////////////////
typedef enum bit[1:0]	{
							CONFIG_READ,
							CONFIG_WRITE
						} configType;


class config_word;
	configType	config_type;
	bit	[35:0]	config_address;
	bit	[127:0]	config_data;
	
	extern function new	(
							input	configType	config_type,
							input 	bit[35:0]	config_address,
							input	bit[127:0]	config_data
						);
						
	extern virtual function bit[35:0] getAddressBits();
	extern virtual function void setAddressBits(bit [35:0] bits);
	extern virtual function bit[127:0] getDataBits();
	extern virtual function void setDataBits(bit [127:0] bits);
	extern virtual function bit equals(config_word other);
	extern virtual function void display();
	extern virtual function config_word copy(input config_word to=null);
	extern function void copy_data(input config_word copy);
	
endclass : config_word

//-----------------------------------------------------------------------------
function config_word::new(input	configType config_type,	input bit[35:0] config_address, input bit[127:0] config_data); 
	this.config_type 	= config_type;
	this.config_address = config_address;
	this.config_data 	= config_data;
endfunction : new
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit [35:0] config_word::getAddressBits();
	return config_address;
endfunction : getAddressBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void config_word::setAddressBits(bit [35:0] bits);
	config_address = bits;
endfunction : setAddressBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit [127:0] config_word::getDataBits();
	return config_data;
endfunction : getDataBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void config_word::setDataBits(bit [127:0] bits);
	config_data = bits;
endfunction : setDataBits
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function bit config_word::equals(config_word other);		
	if ((this.getAddressBits() != other.getAddressBits()) || (this.getDataBits() != other.getDataBits()))
		return 0;
	
	return 1;
endfunction : equals
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void config_word::display();
	$display("Address : 0x%X - Data : 0x%X",getAddressBits(),getDataBits());
endfunction : display
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function config_word config_word::copy(input config_word to=null);
	config_word mkConfigWord;
		
	if (to == null) mkConfigWord = new(CONFIG_READ,0,0);
	else			$cast(mkConfigWord,to);
	copy_data(mkConfigWord);
	return mkConfigWord;
endfunction : copy
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
function void config_word::copy_data(input config_word copy);
	copy.config_type	= this.config_type;
	copy.config_address = this.config_address;
	copy.config_data 	= this.config_data;
endfunction : copy_data
//-----------------------------------------------------------------------------
`endif