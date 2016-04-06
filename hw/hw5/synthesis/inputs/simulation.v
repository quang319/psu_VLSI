`timescale 1ps / 1ps

module simulation;
	wire clk,    			// clk
	wire emergency,			// Emergency
	wire reset,					// Reset

	reg LeftTurn_NS,
	reg Green_NS,
	reg Yellow_NS,
	reg Red_NS,

	reg LeftTurn_EW,
	reg Green_EW,
	reg Yellow_EW,
	reg Red_EW

endmodule