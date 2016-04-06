
`ifndef __SCOREBOARD__
`define __SCOREBOARD__

`include "pixel_group.sv"
`include "configuration.sv"

/////////////////////////////////////////////////////////////////////////////
// Expect Pixels
/////////////////////////////////////////////////////////////////////////////
class expect_pixels;
	pixel_group q[$];
	int iexpect;
	int iactual;
endclass : expect_pixels;

/////////////////////////////////////////////////////////////////////////////
// Scoreboard
/////////////////////////////////////////////////////////////////////////////
class scoreboard;
	configuration cfg;
	expect_pixels expected_pixels;
	int iexpect;
	int iactual;
	
	extern function new(configuration cfg);
	extern virtual function void wrap_up();
	extern function void save_expected(input pixel_group pg);
	extern function void check_actual(input pixel_group pg);
	extern function void display(string prefix="");
endclass : scoreboard

//---------------------------------------------------------------------------
function scoreboard::new(input configuration cfg);
	this.cfg = cfg;
	
	expected_pixels = new();
endfunction : new
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
function void scoreboard::save_expected(input pixel_group pg);
		
	expected_pixels.q.push_back(pg);
	iexpect++;
endfunction : save_expected
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
function void scoreboard::check_actual(	input pixel_group pg);
	pixel_group match;
	int match_idx;
	
	if (expected_pixels.q.size() == 0) begin
		$display("@%0t: ERROR: %m pixel groups not found",$time);
		pg.display();
		cfg.nErrors++;
		return;
	end
		
	expected_pixels.iactual++;
	iactual++;
	
	foreach (expected_pixels.q[i]) begin
		if (expected_pixels.q[i].id == pg.id)begin
			if (expected_pixels.q[i].equals(pg)) begin
				$display();
				$display("----------------SUCCESS: Scoreboard found match for pixel-----------------");
				$display("@%0t", $time);
				pg.display();
				expected_pixels.q.delete(i);
				$display("--------------------------------------------------------------------------");
				return;
			end
			else begin
				$display();
				$display("--------------------ERROR: Scoreboard pixel not found---------------------");
				$display("@%0t", $time);
				$display("actual pixel is:");
				pg.display();
				$display();
				$display("expected pixels is");
				expected_pixels.q[i].display();
				$display("--------------------------------------------------------------------------");
			end
		end
	end
	
	cfg.nErrors++;
	
endfunction : check_actual;
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
function void scoreboard::wrap_up();

	$display("@%0t: %m %0d expected pixels, %0d actual pixels received", $time, iexpect, iactual);

	// Look for leftover pixels
	
	if (expected_pixels.q.size()) begin
		$display("@%0t: %m cells remaining in scoreboard at end of test", $time);
		this.display("Unclaimed: ");
		cfg.nErrors++;
		$display();
	end
	
	$display("--------------------------------------------------------------------------");
endfunction : wrap_up
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
function void scoreboard::display(string prefix="");
	
	$display("@%0t: %m so far %0d expected pixels, %0d actual pixels received", $time, iexpect, iactual);
	
	if (expected_pixels.iexpect != expected_pixels.iactual)
	begin 
		$display("exp=%0d, act=%0d", expected_pixels.iexpect, expected_pixels.iactual);
		foreach (expected_pixels.q[j])
			expected_pixels.q[j].display();
	end
	
endfunction : display
//---------------------------------------------------------------------------

`endif