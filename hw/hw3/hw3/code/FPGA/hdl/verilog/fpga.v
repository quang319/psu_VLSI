/***********************************************************************************/
/*                                                                                 */     
/*                  CSE 577 VLSI Systems Design - HW 3                             */
/*                                                                                 */         
/***********************************************************************************/


`timescale 1ns / 1ns

module fpga

(
			
	input		                                        sys_clk_p      				,
	input		                                        sys_clk_n      				,
	input		                                        sys_rst_n      				,		
	input                                               sys_sw_a                    ,
	input                                               sys_sw_b                    ,
	input                                               sys_sw_c                    ,					
	output 		 	[8          -1:0]					usr_led				
);

//{{{ ------------------------- SIGNAL DECLARATIONS -----------------------------------

wire										clk100									;
wire										clk200									;
wire										clk400									;
wire										clk600									;
wire                                        alive_clk                               ;
wire										locked									;
wire										reset								    ;
wire                [7:0]                   leds                                    ;
//}}} ------------------------- SIGNAL DECLARATIONS -----------------------------------

//{{{ ------------------------- CLOCK GENERATION --------------------------------------

	//////////////////////// MMCM Clock Synthesizer ////////////////////////////////
	//----------------------------------------------------------------------------
	//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
	//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
	//----------------------------------------------------------------------------
	// CLK_OUT1___100.000______0.000______50.0______177.984____222.305
	// CLK_OUT2___200.000______0.000______50.0______161.296____222.305
	// CLK_OUT3___400.000______0.000______50.0______146.303____222.305
	// CLK_OUT4___600.000______0.000______50.0______138.255____222.305
	//
	//----------------------------------------------------------------------------
	// Input Clock   Freq (MHz)    Input Jitter (UI)
	//----------------------------------------------------------------------------
	// __primary_____________125____________0.010
	////////////////////////////////////////////////////////////////////////////////
	
	mmcm_i125_o100_o200_o400_o600_clk_wiz 
	i_clock_synth
	(
		// Clock in ports
		.clk_in1_p	(sys_clk_p),    // input clk_in1_p
		.clk_in1_n	(sys_clk_n),    // input clk_in1_n
		// Clock out ports
		.clk_out1	(clk100),     // output clk_out1
		.clk_out2	(clk200),     // output clk_out2
		.clk_out3	(clk400),     // output clk_out3
		.clk_out4	(clk600),     // output clk_out4
		// Status and control signals
		.reset		(~sys_rst_n),	// input reset
		.locked		(locked)		// output locked
	);      			
	
//}}} ------------------------- CLOCK GENERATION --------------------------------------


//{{{ ------------------------- INPUTS --------------------------------------

assign alive_clk = clk200; 

//}}} ------------------------- INPUTS --------------------------------------

TRAFFIC_lights TrafficLight (
	.clk 		(alive_clk),
	.emg        (),
	.lights     (leds)
	);

assign usr_led = leds;

endmodule