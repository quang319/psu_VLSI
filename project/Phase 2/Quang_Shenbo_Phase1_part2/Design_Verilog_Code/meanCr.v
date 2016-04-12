module meanCr (
	input wire [7:0] Y,

	output reg [31:0] result
	);

	always @(Y) begin
		case (Y)
			8'd0: result = 32'h00295df1; 
			8'd1: result = 32'h00295812; 
			8'd2: result = 32'h00295233; 
			8'd3: result = 32'h00294c54; 
			8'd4: result = 32'h00294675; 
			8'd5: result = 32'h00294096; 
			8'd6: result = 32'h00293ab7; 
			8'd7: result = 32'h002934d8; 
			8'd8: result = 32'h00292ef8; 
			8'd9: result = 32'h00292919; 
			8'd10: result = 32'h0029233a; 
			8'd11: result = 32'h00291d5b; 
			8'd12: result = 32'h0029177c; 
			8'd13: result = 32'h0029119d; 
			8'd14: result = 32'h00290bbe; 
			8'd15: result = 32'h002905df; 
			8'd16: result = 32'h00290000; 
			8'd17: result = 32'h0028fa20; 
			8'd18: result = 32'h0028f441; 
			8'd19: result = 32'h0028ee62; 
			8'd20: result = 32'h0028e883; 
			8'd21: result = 32'h0028e2a4; 
			8'd22: result = 32'h0028dcc5; 
			8'd23: result = 32'h0028d6e6; 
			8'd24: result = 32'h0028d107; 
			8'd25: result = 32'h0028cb27; 
			8'd26: result = 32'h0028c548; 
			8'd27: result = 32'h0028bf69; 
			8'd28: result = 32'h0028b98a; 
			8'd29: result = 32'h0028b3ab; 
			8'd30: result = 32'h0028adcc; 
			8'd31: result = 32'h0028a7ed; 
			8'd32: result = 32'h0028a20e; 
			8'd33: result = 32'h00289c2e; 
			8'd34: result = 32'h0028964f; 
			8'd35: result = 32'h00289070; 
			8'd36: result = 32'h00288a91; 
			8'd37: result = 32'h002884b2; 
			8'd38: result = 32'h00287ed3; 
			8'd39: result = 32'h002878f4; 
			8'd40: result = 32'h00287315; 
			8'd41: result = 32'h00286d36; 
			8'd42: result = 32'h00286756; 
			8'd43: result = 32'h00286177; 
			8'd44: result = 32'h00285b98; 
			8'd45: result = 32'h002855b9; 
			8'd46: result = 32'h00284fda; 
			8'd47: result = 32'h002849fb; 
			8'd48: result = 32'h0028441c; 
			8'd49: result = 32'h00283e3d; 
			8'd50: result = 32'h0028385d; 
			8'd51: result = 32'h0028327e; 
			8'd52: result = 32'h00282c9f; 
			8'd53: result = 32'h002826c0; 
			8'd54: result = 32'h002820e1; 
			8'd55: result = 32'h00281b02; 
			8'd56: result = 32'h00281523; 
			8'd57: result = 32'h00280f44; 
			8'd58: result = 32'h00280964; 
			8'd59: result = 32'h00280385; 
			8'd60: result = 32'h0027fda6; 
			8'd61: result = 32'h0027f7c7; 
			8'd62: result = 32'h0027f1e8; 
			8'd63: result = 32'h0027ec09; 
			8'd64: result = 32'h0027e62a; 
			8'd65: result = 32'h0027e04b; 
			8'd66: result = 32'h0027da6c; 
			8'd67: result = 32'h0027d48c; 
			8'd68: result = 32'h0027cead; 
			8'd69: result = 32'h0027c8ce; 
			8'd70: result = 32'h0027c2ef; 
			8'd71: result = 32'h0027bd10; 
			8'd72: result = 32'h0027b731; 
			8'd73: result = 32'h0027b152; 
			8'd74: result = 32'h0027ab73; 
			8'd75: result = 32'h0027a593; 
			8'd76: result = 32'h00279fb4; 
			8'd77: result = 32'h002799d5; 
			8'd78: result = 32'h002793f6; 
			8'd79: result = 32'h00278e17; 
			8'd80: result = 32'h00278838; 
			8'd81: result = 32'h00278259; 
			8'd82: result = 32'h00277c7a; 
			8'd83: result = 32'h0027769b; 
			8'd84: result = 32'h002770bb; 
			8'd85: result = 32'h00276adc; 
			8'd86: result = 32'h002764fd; 
			8'd87: result = 32'h00275f1e; 
			8'd88: result = 32'h0027593f; 
			8'd89: result = 32'h00275360; 
			8'd90: result = 32'h00274d81; 
			8'd91: result = 32'h002747a2; 
			8'd92: result = 32'h002741c2; 
			8'd93: result = 32'h00273be3; 
			8'd94: result = 32'h00273604; 
			8'd95: result = 32'h00273025; 
			8'd96: result = 32'h00272a46; 
			8'd97: result = 32'h00272467; 
			8'd98: result = 32'h00271e88; 
			8'd99: result = 32'h002718a9; 
			8'd100: result = 32'h002712c9; 
			8'd101: result = 32'h00270cea; 
			8'd102: result = 32'h0027070b; 
			8'd103: result = 32'h0027012c; 
			8'd104: result = 32'h0026fb4d; 
			8'd105: result = 32'h0026f56e; 
			8'd106: result = 32'h0026ef8f; 
			8'd107: result = 32'h0026e9b0; 
			8'd108: result = 32'h0026e3d1; 
			8'd109: result = 32'h0026ddf1; 
			8'd110: result = 32'h0026d812; 
			8'd111: result = 32'h0026d233; 
			8'd112: result = 32'h0026cc54; 
			8'd113: result = 32'h0026c675; 
			8'd114: result = 32'h0026c096; 
			8'd115: result = 32'h0026bab7; 
			8'd116: result = 32'h0026b4d8; 
			8'd117: result = 32'h0026aef8; 
			8'd118: result = 32'h0026a919; 
			8'd119: result = 32'h0026a33a; 
			8'd120: result = 32'h00269d5b; 
			8'd121: result = 32'h0026977c; 
			8'd122: result = 32'h0026919d; 
			8'd123: result = 32'h00268bbe; 
			8'd124: result = 32'h002685df; 
			8'd125: result = 32'h00268000; 
			8'd126: result = 32'h00000000; 
			8'd127: result = 32'h00000000; 
			8'd128: result = 32'h00000000; 
			8'd129: result = 32'h00000000; 
			8'd130: result = 32'h00000000; 
			8'd131: result = 32'h00000000; 
			8'd132: result = 32'h00000000; 
			8'd133: result = 32'h00000000; 
			8'd134: result = 32'h00000000; 
			8'd135: result = 32'h00000000; 
			8'd136: result = 32'h00000000; 
			8'd137: result = 32'h00000000; 
			8'd138: result = 32'h00000000; 
			8'd139: result = 32'h00000000; 
			8'd140: result = 32'h00000000; 
			8'd141: result = 32'h00000000; 
			8'd142: result = 32'h00000000; 
			8'd143: result = 32'h00000000; 
			8'd144: result = 32'h00000000; 
			8'd145: result = 32'h00000000; 
			8'd146: result = 32'h00000000; 
			8'd147: result = 32'h00000000; 
			8'd148: result = 32'h00000000; 
			8'd149: result = 32'h00000000; 
			8'd150: result = 32'h00000000; 
			8'd151: result = 32'h00000000; 
			8'd152: result = 32'h00000000; 
			8'd153: result = 32'h00000000; 
			8'd154: result = 32'h00000000; 
			8'd155: result = 32'h00000000; 
			8'd156: result = 32'h00000000; 
			8'd157: result = 32'h00000000; 
			8'd158: result = 32'h00000000; 
			8'd159: result = 32'h00000000; 
			8'd160: result = 32'h00000000; 
			8'd161: result = 32'h00000000; 
			8'd162: result = 32'h00000000; 
			8'd163: result = 32'h00000000; 
			8'd164: result = 32'h00000000; 
			8'd165: result = 32'h00000000; 
			8'd166: result = 32'h00000000; 
			8'd167: result = 32'h00000000; 
			8'd168: result = 32'h00000000; 
			8'd169: result = 32'h00000000; 
			8'd170: result = 32'h00000000; 
			8'd171: result = 32'h00000000; 
			8'd172: result = 32'h00000000; 
			8'd173: result = 32'h00000000; 
			8'd174: result = 32'h00000000; 
			8'd175: result = 32'h00000000; 
			8'd176: result = 32'h00000000; 
			8'd177: result = 32'h00000000; 
			8'd178: result = 32'h00000000; 
			8'd179: result = 32'h00000000; 
			8'd180: result = 32'h00000000; 
			8'd181: result = 32'h00000000; 
			8'd182: result = 32'h00000000; 
			8'd183: result = 32'h00000000; 
			8'd184: result = 32'h00000000; 
			8'd185: result = 32'h00000000; 
			8'd186: result = 32'h00000000; 
			8'd187: result = 32'h00000000; 
			8'd188: result = 32'h00268000; 
			8'd189: result = 32'h00269df5; 
			8'd190: result = 32'h0026bbea; 
			8'd191: result = 32'h0026d9df; 
			8'd192: result = 32'h0026f7d4; 
			8'd193: result = 32'h002715c9; 
			8'd194: result = 32'h002733be; 
			8'd195: result = 32'h002751b3; 
			8'd196: result = 32'h00276fa8; 
			8'd197: result = 32'h00278d9d; 
			8'd198: result = 32'h0027ab93; 
			8'd199: result = 32'h0027c988; 
			8'd200: result = 32'h0027e77d; 
			8'd201: result = 32'h00280572; 
			8'd202: result = 32'h00282367; 
			8'd203: result = 32'h0028415c; 
			8'd204: result = 32'h00285f51; 
			8'd205: result = 32'h00287d46; 
			8'd206: result = 32'h00289b3b; 
			8'd207: result = 32'h0028b931; 
			8'd208: result = 32'h0028d726; 
			8'd209: result = 32'h0028f51b; 
			8'd210: result = 32'h00291310; 
			8'd211: result = 32'h00293105; 
			8'd212: result = 32'h00294efa; 
			8'd213: result = 32'h00296cef; 
			8'd214: result = 32'h00298ae4; 
			8'd215: result = 32'h0029a8d9; 
			8'd216: result = 32'h0029c6ce; 
			8'd217: result = 32'h0029e4c4; 
			8'd218: result = 32'h002a02b9; 
			8'd219: result = 32'h002a20ae; 
			8'd220: result = 32'h002a3ea3; 
			8'd221: result = 32'h002a5c98; 
			8'd222: result = 32'h002a7a8d; 
			8'd223: result = 32'h002a9882; 
			8'd224: result = 32'h002ab677; 
			8'd225: result = 32'h002ad46c; 
			8'd226: result = 32'h002af262; 
			8'd227: result = 32'h002b1057; 
			8'd228: result = 32'h002b2e4c; 
			8'd229: result = 32'h002b4c41; 
			8'd230: result = 32'h002b6a36; 
			8'd231: result = 32'h002b882b; 
			8'd232: result = 32'h002ba620; 
			8'd233: result = 32'h002bc415; 
			8'd234: result = 32'h002be20a; 
			8'd235: result = 32'h002c0000; 
			8'd236: result = 32'h002c1df5; 
			8'd237: result = 32'h002c3bea; 
			8'd238: result = 32'h002c59df; 
			8'd239: result = 32'h002c77d4; 
			8'd240: result = 32'h002c95c9; 
			8'd241: result = 32'h002cb3be; 
			8'd242: result = 32'h002cd1b3; 
			8'd243: result = 32'h002cefa8; 
			8'd244: result = 32'h002d0d9d; 
			8'd245: result = 32'h002d2b93; 
			8'd246: result = 32'h002d4988; 
			8'd247: result = 32'h002d677d; 
			8'd248: result = 32'h002d8572; 
			8'd249: result = 32'h002da367; 
			8'd250: result = 32'h002dc15c; 
			8'd251: result = 32'h002ddf51; 
			8'd252: result = 32'h002dfd46; 
			8'd253: result = 32'h002e1b3b; 
			8'd254: result = 32'h002e3931; 
			8'd255: result = 32'h002e5726; 

			default : result = 32'h00000000;
		endcase
	end

endmodule