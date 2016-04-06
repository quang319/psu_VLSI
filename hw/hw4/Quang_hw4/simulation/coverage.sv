

`ifndef __COVERAGE__
`define __COVERAGE__

/////////////////////////////////////////////////////////////////////////////
// Coverage
/////////////////////////////////////////////////////////////////////////////
class coverage;
	bit	[5:0] src;
	bit [5:0] dst;
	
	covergroup CG_source_to_destination;
		coverpoint src
			{bins src[] = {[0:63]};
				option.weight = 0;}
		coverpoint dst
			{bins dst[] = {[0:63]};
				option.weight = 0;}
		cross src, dst;
	endgroup : CG_source_to_destination
	
	function new();
		CG_source_to_destination = new;
	endfunction : new
	
	function void sample(input bit [5:0] src, input bit [5:0] dst);
	
		$display("@%0t: Coverage: src=%d. dst=%d", $time, src, dst);
		this.src = src;
		this.dst = dst;
		CG_source_to_destination.sample();
	endfunction : sample

endclass : coverage;

`endif