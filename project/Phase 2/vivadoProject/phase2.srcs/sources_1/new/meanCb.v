module meanCb (
	input wire clk,
	input wire [7:0] Y,

	output reg [31:0] result
	);

	always @(posedge clk) begin
		case (Y)
			8'd0: result = 32'h001dddf1; 
			8'd1: result = 32'h001dd812; 
			8'd2: result = 32'h001dd233; 
			8'd3: result = 32'h001dcc54; 
			8'd4: result = 32'h001dc675; 
			8'd5: result = 32'h001dc096; 
			8'd6: result = 32'h001dbab7; 
			8'd7: result = 32'h001db4d8; 
			8'd8: result = 32'h001daef8; 
			8'd9: result = 32'h001da919; 
			8'd10: result = 32'h001da33a; 
			8'd11: result = 32'h001d9d5b; 
			8'd12: result = 32'h001d977c; 
			8'd13: result = 32'h001d919d; 
			8'd14: result = 32'h001d8bbe; 
			8'd15: result = 32'h001d85df; 
			8'd16: result = 32'h001d8000; 
			8'd17: result = 32'h001d7a20; 
			8'd18: result = 32'h001d7441; 
			8'd19: result = 32'h001d6e62; 
			8'd20: result = 32'h001d6883; 
			8'd21: result = 32'h001d62a4; 
			8'd22: result = 32'h001d5cc5; 
			8'd23: result = 32'h001d56e6; 
			8'd24: result = 32'h001d5107; 
			8'd25: result = 32'h001d4b27; 
			8'd26: result = 32'h001d4548; 
			8'd27: result = 32'h001d3f69; 
			8'd28: result = 32'h001d398a; 
			8'd29: result = 32'h001d33ab; 
			8'd30: result = 32'h001d2dcc; 
			8'd31: result = 32'h001d27ed; 
			8'd32: result = 32'h001d220e; 
			8'd33: result = 32'h001d1c2e; 
			8'd34: result = 32'h001d164f; 
			8'd35: result = 32'h001d1070; 
			8'd36: result = 32'h001d0a91; 
			8'd37: result = 32'h001d04b2; 
			8'd38: result = 32'h001cfed3; 
			8'd39: result = 32'h001cf8f4; 
			8'd40: result = 32'h001cf315; 
			8'd41: result = 32'h001ced36; 
			8'd42: result = 32'h001ce756; 
			8'd43: result = 32'h001ce177; 
			8'd44: result = 32'h001cdb98; 
			8'd45: result = 32'h001cd5b9; 
			8'd46: result = 32'h001ccfda; 
			8'd47: result = 32'h001cc9fb; 
			8'd48: result = 32'h001cc41c; 
			8'd49: result = 32'h001cbe3d; 
			8'd50: result = 32'h001cb85d; 
			8'd51: result = 32'h001cb27e; 
			8'd52: result = 32'h001cac9f; 
			8'd53: result = 32'h001ca6c0; 
			8'd54: result = 32'h001ca0e1; 
			8'd55: result = 32'h001c9b02; 
			8'd56: result = 32'h001c9523; 
			8'd57: result = 32'h001c8f44; 
			8'd58: result = 32'h001c8964; 
			8'd59: result = 32'h001c8385; 
			8'd60: result = 32'h001c7da6; 
			8'd61: result = 32'h001c77c7; 
			8'd62: result = 32'h001c71e8; 
			8'd63: result = 32'h001c6c09; 
			8'd64: result = 32'h001c662a; 
			8'd65: result = 32'h001c604b; 
			8'd66: result = 32'h001c5a6c; 
			8'd67: result = 32'h001c548c; 
			8'd68: result = 32'h001c4ead; 
			8'd69: result = 32'h001c48ce; 
			8'd70: result = 32'h001c42ef; 
			8'd71: result = 32'h001c3d10; 
			8'd72: result = 32'h001c3731; 
			8'd73: result = 32'h001c3152; 
			8'd74: result = 32'h001c2b73; 
			8'd75: result = 32'h001c2593; 
			8'd76: result = 32'h001c1fb4; 
			8'd77: result = 32'h001c19d5; 
			8'd78: result = 32'h001c13f6; 
			8'd79: result = 32'h001c0e17; 
			8'd80: result = 32'h001c0838; 
			8'd81: result = 32'h001c0259; 
			8'd82: result = 32'h001bfc7a; 
			8'd83: result = 32'h001bf69b; 
			8'd84: result = 32'h001bf0bb; 
			8'd85: result = 32'h001beadc; 
			8'd86: result = 32'h001be4fd; 
			8'd87: result = 32'h001bdf1e; 
			8'd88: result = 32'h001bd93f; 
			8'd89: result = 32'h001bd360; 
			8'd90: result = 32'h001bcd81; 
			8'd91: result = 32'h001bc7a2; 
			8'd92: result = 32'h001bc1c2; 
			8'd93: result = 32'h001bbbe3; 
			8'd94: result = 32'h001bb604; 
			8'd95: result = 32'h001bb025; 
			8'd96: result = 32'h001baa46; 
			8'd97: result = 32'h001ba467; 
			8'd98: result = 32'h001b9e88; 
			8'd99: result = 32'h001b98a9; 
			8'd100: result = 32'h001b92c9; 
			8'd101: result = 32'h001b8cea; 
			8'd102: result = 32'h001b870b; 
			8'd103: result = 32'h001b812c; 
			8'd104: result = 32'h001b7b4d; 
			8'd105: result = 32'h001b756e; 
			8'd106: result = 32'h001b6f8f; 
			8'd107: result = 32'h001b69b0; 
			8'd108: result = 32'h001b63d1; 
			8'd109: result = 32'h001b5df1; 
			8'd110: result = 32'h001b5812; 
			8'd111: result = 32'h001b5233; 
			8'd112: result = 32'h001b4c54; 
			8'd113: result = 32'h001b4675; 
			8'd114: result = 32'h001b4096; 
			8'd115: result = 32'h001b3ab7; 
			8'd116: result = 32'h001b34d8; 
			8'd117: result = 32'h001b2ef8; 
			8'd118: result = 32'h001b2919; 
			8'd119: result = 32'h001b233a; 
			8'd120: result = 32'h001b1d5b; 
			8'd121: result = 32'h001b177c; 
			8'd122: result = 32'h001b119d; 
			8'd123: result = 32'h001b0bbe; 
			8'd124: result = 32'h001b05df; 
			8'd125: result = 32'h001b0000; 
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
			8'd188: result = 32'h001b0000; 
			8'd189: result = 32'h001b0d9d; 
			8'd190: result = 32'h001b1b3b; 
			8'd191: result = 32'h001b28d9; 
			8'd192: result = 32'h001b3677; 
			8'd193: result = 32'h001b4415; 
			8'd194: result = 32'h001b51b3; 
			8'd195: result = 32'h001b5f51; 
			8'd196: result = 32'h001b6cef; 
			8'd197: result = 32'h001b7a8d; 
			8'd198: result = 32'h001b882b; 
			8'd199: result = 32'h001b95c9; 
			8'd200: result = 32'h001ba367; 
			8'd201: result = 32'h001bb105; 
			8'd202: result = 32'h001bbea3; 
			8'd203: result = 32'h001bcc41; 
			8'd204: result = 32'h001bd9df; 
			8'd205: result = 32'h001be77d; 
			8'd206: result = 32'h001bf51b; 
			8'd207: result = 32'h001c02b9; 
			8'd208: result = 32'h001c1057; 
			8'd209: result = 32'h001c1df5; 
			8'd210: result = 32'h001c2b93; 
			8'd211: result = 32'h001c3931; 
			8'd212: result = 32'h001c46ce; 
			8'd213: result = 32'h001c546c; 
			8'd214: result = 32'h001c620a; 
			8'd215: result = 32'h001c6fa8; 
			8'd216: result = 32'h001c7d46; 
			8'd217: result = 32'h001c8ae4; 
			8'd218: result = 32'h001c9882; 
			8'd219: result = 32'h001ca620; 
			8'd220: result = 32'h001cb3be; 
			8'd221: result = 32'h001cc15c; 
			8'd222: result = 32'h001ccefa; 
			8'd223: result = 32'h001cdc98; 
			8'd224: result = 32'h001cea36; 
			8'd225: result = 32'h001cf7d4; 
			8'd226: result = 32'h001d0572; 
			8'd227: result = 32'h001d1310; 
			8'd228: result = 32'h001d20ae; 
			8'd229: result = 32'h001d2e4c; 
			8'd230: result = 32'h001d3bea; 
			8'd231: result = 32'h001d4988; 
			8'd232: result = 32'h001d5726; 
			8'd233: result = 32'h001d64c4; 
			8'd234: result = 32'h001d7262; 
			8'd235: result = 32'h001d8000; 
			8'd236: result = 32'h001d8d9d; 
			8'd237: result = 32'h001d9b3b; 
			8'd238: result = 32'h001da8d9; 
			8'd239: result = 32'h001db677; 
			8'd240: result = 32'h001dc415; 
			8'd241: result = 32'h001dd1b3; 
			8'd242: result = 32'h001ddf51; 
			8'd243: result = 32'h001decef; 
			8'd244: result = 32'h001dfa8d; 
			8'd245: result = 32'h001e082b; 
			8'd246: result = 32'h001e15c9; 
			8'd247: result = 32'h001e2367; 
			8'd248: result = 32'h001e3105; 
			8'd249: result = 32'h001e3ea3; 
			8'd250: result = 32'h001e4c41; 
			8'd251: result = 32'h001e59df; 
			8'd252: result = 32'h001e677d; 
			8'd253: result = 32'h001e751b; 
			8'd254: result = 32'h001e82b9; 
			8'd255: result = 32'h001e9057; 


			default : result = 32'h00000000;
		endcase
	end

endmodule