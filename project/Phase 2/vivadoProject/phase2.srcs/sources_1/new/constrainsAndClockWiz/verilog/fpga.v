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
reg		[31:0]								reset_r 	   = 32'hFFFFFFFF			;
reg     [127:0]                             alive_count    = 128'h0                 ;

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


//{{{ ------------------------- RESET GENERATION --------------------------------------

	always @(posedge clk100 or negedge sys_rst_n)
	begin
		if (sys_rst_n == 1'b0)
			reset_r <= 32'hFFFFFFFF;
		else
			reset_r <= {reset_r[30:0],1'b0};
	end
	assign reset = reset_r[31];								
    assign usr_led[7] = reset;
//}}} ------------------------- RESET GENERATION --------------------------------------



//{{{ ------------------------- INPUTS --------------------------------------

assign alive_clk = clk100; 

//}}} ------------------------- INPUTS --------------------------------------


//{{{ ------------------------- COUNT --------------------------------------

    always @(posedge alive_clk)
    begin
        if (sys_sw_a)
            alive_count <= alive_count + 1;
        else if (sys_sw_b)
            alive_count <= alive_count + 2;
        else if (sys_sw_c)
            alive_count <= alive_count + 3;
        else
            alive_count <= alive_count + 4;                                
    end

//}}} ------------------------- COUNT --------------------------------------

    
//{{{ ------------------------- VISUALIZE CLOCK --------------------------------------	

    assign usr_led[0] = alive_count[127] + alive_count[30];
    assign usr_led[1] = alive_count[126] + alive_count[29];
    assign usr_led[2] = alive_count[125] + alive_count[28];
    assign usr_led[3] = alive_count[124] + alive_count[27];
    assign usr_led[4] = alive_count[123] + alive_count[26];
    assign usr_led[5] = alive_count[122] + alive_count[25];
    assign usr_led[6] = alive_count[121] + alive_count[24]; 

//}}} ------------------------- VISUALIZE CLOCK ----------------------------------------


endmodule