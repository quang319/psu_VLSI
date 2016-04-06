
module trafficlight ( clk, ec, light );
  output [7:0] light;
  input clk, ec;
  wire   state_2_, n43, n45, n46, n47, n48, n49, n50, n51, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n67, n177, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386;
  wire   [2:1] temp;

  DFFX1_RVT temp_reg_0_ ( .D(n59), .CLK(clk), .QN(n290) );
  DFFX1_RVT count_reg_1_ ( .D(n55), .CLK(clk), .Q(n303), .QN(n43) );
  DFFX1_RVT count_reg_0_ ( .D(n54), .CLK(clk), .Q(n302), .QN(n67) );
  DFFX1_RVT count_reg_2_ ( .D(n56), .CLK(clk), .Q(n301), .QN(n45) );
  DFFX1_RVT count_reg_3_ ( .D(n57), .CLK(clk), .Q(n306), .QN(n293) );
  DFFX1_RVT temp_reg_2_ ( .D(n61), .CLK(clk), .Q(temp[2]) );
  DFFX1_RVT temp_reg_1_ ( .D(n60), .CLK(clk), .Q(temp[1]) );
  DFFX1_RVT light_reg_7_ ( .D(n53), .CLK(clk), .Q(light[7]), .QN(n289) );
  DFFX1_RVT light_reg_5_ ( .D(n51), .CLK(clk), .Q(light[5]), .QN(n284) );
  DFFX1_RVT light_reg_2_ ( .D(n48), .CLK(clk), .Q(light[2]), .QN(n291) );
  DFFX1_RVT light_reg_1_ ( .D(n47), .CLK(clk), .Q(light[1]), .QN(n292) );
  DFFX1_RVT state_reg_0_ ( .D(n58), .CLK(clk), .Q(n317), .QN(n304) );
  DFFX1_RVT light_reg_0_ ( .D(n46), .CLK(clk), .Q(light[0]), .QN(n288) );
  DFFX1_RVT light_reg_4_ ( .D(n50), .CLK(clk), .Q(light[4]), .QN(n285) );
  DFFX1_RVT light_reg_6_ ( .D(n309), .CLK(clk), .Q(light[6]), .QN(n287) );
  DFFX1_RVT light_reg_3_ ( .D(n49), .CLK(clk), .Q(light[3]), .QN(n286) );
  DFFX1_RVT state_reg_1_ ( .D(n62), .CLK(clk), .Q(n315), .QN(n177) );
  DFFX1_RVT state_reg_2_ ( .D(n305), .CLK(clk), .Q(state_2_), .QN(n311) );
  AO221X1_RVT U228 ( .A1(1'b1), .A2(n310), .A3(temp[1]), .A4(n304), .A5(n381), 
        .Y(n296) );
  OA221X1_RVT U229 ( .A1(1'b0), .A2(n345), .A3(n326), .A4(n307), .A5(n325), 
        .Y(n327) );
  INVX1_RVT U230 ( .A(n367), .Y(n380) );
  OR2X1_RVT U231 ( .A1(n177), .A2(n319), .Y(n307) );
  INVX1_RVT U232 ( .A(n307), .Y(n341) );
  AO221X1_RVT U233 ( .A1(n301), .A2(n303), .A3(n301), .A4(n302), .A5(n306), 
        .Y(n367) );
  NAND2X0_RVT U234 ( .A1(n319), .A2(n358), .Y(n350) );
  INVX1_RVT U235 ( .A(n333), .Y(n352) );
  INVX1_RVT U236 ( .A(ec), .Y(n376) );
  AND4X1_RVT U237 ( .A1(n340), .A2(n370), .A3(n334), .A4(n384), .Y(n319) );
  AO222X1_RVT U240 ( .A1(n380), .A2(n311), .A3(n317), .A4(n378), .A5(n314), 
        .A6(n379), .Y(n297) );
  AO22X1_RVT U241 ( .A1(n315), .A2(n296), .A3(n386), .A4(n297), .Y(n62) );
  OA22X1_RVT U242 ( .A1(n286), .A2(n350), .A3(n338), .A4(n333), .Y(n298) );
  NAND2X0_RVT U243 ( .A1(n298), .A2(n343), .Y(n299) );
  AO221X1_RVT U244 ( .A1(n341), .A2(n317), .A3(n341), .A4(n371), .A5(n299), 
        .Y(n49) );
  OA21X1_RVT U245 ( .A1(n359), .A2(n362), .A3(n360), .Y(n300) );
  INVX0_RVT U246 ( .A(n335), .Y(n316) );
  NOR2X0_RVT U247 ( .A1(n315), .A2(n310), .Y(n314) );
  INVX0_RVT U248 ( .A(n346), .Y(n322) );
  INVX0_RVT U249 ( .A(n334), .Y(n359) );
  OAI221X1_RVT U250 ( .A1(n367), .A2(n368), .A3(n367), .A4(n371), .A5(n341), 
        .Y(n349) );
  OAI221X1_RVT U251 ( .A1(n317), .A2(n372), .A3(n304), .A4(n316), .A5(n177), 
        .Y(n358) );
  INVX1_RVT U252 ( .A(n360), .Y(n375) );
  NAND2X0_RVT U253 ( .A1(n337), .A2(n336), .Y(n50) );
  INVX1_RVT U254 ( .A(n350), .Y(n339) );
  NAND4X0_RVT U255 ( .A1(n356), .A2(n355), .A3(n354), .A4(n353), .Y(n53) );
  INVX1_RVT U256 ( .A(n386), .Y(n381) );
  INVX1_RVT U257 ( .A(n314), .Y(n377) );
  INVX1_RVT U258 ( .A(n308), .Y(n310) );
  INVX1_RVT U259 ( .A(n383), .Y(n329) );
  INVX1_RVT U260 ( .A(n351), .Y(n372) );
  OAI22X1_RVT U261 ( .A1(n311), .A2(n312), .A3(n381), .A4(n313), .Y(n305) );
  OA21X1_RVT U262 ( .A1(n304), .A2(n311), .A3(n332), .Y(n308) );
  NAND3X0_RVT U263 ( .A1(n348), .A2(n349), .A3(n347), .Y(n309) );
  OAI221X1_RVT U264 ( .A1(n335), .A2(n334), .A3(n335), .A4(n304), .A5(n350), 
        .Y(n336) );
  AOI221X1_RVT U265 ( .A1(n177), .A2(n304), .A3(n315), .A4(temp[2]), .A5(n381), 
        .Y(n312) );
  AND2X1_RVT U266 ( .A1(n385), .A2(n384), .Y(n313) );
  NAND3X0_RVT U267 ( .A1(state_2_), .A2(n304), .A3(n315), .Y(n360) );
  AND2X1_RVT U268 ( .A1(n360), .A2(n376), .Y(n370) );
  AND3X1_RVT U269 ( .A1(n43), .A2(n293), .A3(n45), .Y(n326) );
  NAND3X0_RVT U270 ( .A1(n304), .A2(n326), .A3(n315), .Y(n334) );
  NAND2X0_RVT U271 ( .A1(n177), .A2(n380), .Y(n384) );
  NAND3X0_RVT U272 ( .A1(n380), .A2(n317), .A3(n311), .Y(n340) );
  NAND2X0_RVT U273 ( .A1(n43), .A2(n45), .Y(n318) );
  NAND2X0_RVT U274 ( .A1(n306), .A2(n318), .Y(n379) );
  NAND2X0_RVT U275 ( .A1(state_2_), .A2(n379), .Y(n351) );
  OA21X1_RVT U276 ( .A1(n67), .A2(n293), .A3(n379), .Y(n383) );
  NAND2X0_RVT U277 ( .A1(n383), .A2(n311), .Y(n335) );
  NAND2X0_RVT U278 ( .A1(n317), .A2(n367), .Y(n320) );
  OA222X1_RVT U279 ( .A1(n339), .A2(n372), .A3(n339), .A4(n320), .A5(n288), 
        .A6(n350), .Y(n321) );
  NAND2X0_RVT U280 ( .A1(n321), .A2(n307), .Y(n46) );
  NAND2X0_RVT U281 ( .A1(n304), .A2(n379), .Y(n346) );
  NAND2X0_RVT U282 ( .A1(state_2_), .A2(n350), .Y(n325) );
  NAND2X0_RVT U283 ( .A1(n177), .A2(n350), .Y(n333) );
  NAND2X0_RVT U284 ( .A1(n352), .A2(n367), .Y(n345) );
  NAND2X0_RVT U285 ( .A1(n304), .A2(n311), .Y(n332) );
  OA22X1_RVT U286 ( .A1(n322), .A2(n325), .A3(n345), .A4(n332), .Y(n324) );
  NAND3X0_RVT U287 ( .A1(n352), .A2(n317), .A3(n329), .Y(n343) );
  NAND2X0_RVT U288 ( .A1(n317), .A2(n311), .Y(n368) );
  NAND2X0_RVT U289 ( .A1(n326), .A2(n311), .Y(n371) );
  OR2X1_RVT U290 ( .A1(n292), .A2(n350), .Y(n323) );
  NAND4X0_RVT U291 ( .A1(n324), .A2(n343), .A3(n349), .A4(n323), .Y(n47) );
  OA22X1_RVT U292 ( .A1(n291), .A2(n350), .A3(n311), .A4(n307), .Y(n331) );
  AND2X1_RVT U293 ( .A1(n325), .A2(n307), .Y(n328) );
  OA22X1_RVT U294 ( .A1(n380), .A2(n328), .A3(n327), .A4(n317), .Y(n330) );
  NAND3X0_RVT U295 ( .A1(n352), .A2(n311), .A3(n329), .Y(n355) );
  NAND3X0_RVT U296 ( .A1(n331), .A2(n330), .A3(n355), .Y(n48) );
  OA21X1_RVT U297 ( .A1(n380), .A2(n308), .A3(n379), .Y(n338) );
  OA22X1_RVT U298 ( .A1(n359), .A2(n307), .A3(n285), .A4(n350), .Y(n337) );
  AO22X1_RVT U299 ( .A1(n339), .A2(n284), .A3(n350), .A4(n338), .Y(n344) );
  NAND2X0_RVT U300 ( .A1(n341), .A2(n340), .Y(n342) );
  NAND3X0_RVT U301 ( .A1(n344), .A2(n343), .A3(n342), .Y(n51) );
  OA22X1_RVT U302 ( .A1(n308), .A2(n345), .A3(n287), .A4(n350), .Y(n348) );
  NAND3X0_RVT U303 ( .A1(n352), .A2(n308), .A3(n346), .Y(n347) );
  OA21X1_RVT U304 ( .A1(n289), .A2(n350), .A3(n349), .Y(n356) );
  NAND3X0_RVT U305 ( .A1(n304), .A2(n352), .A3(n351), .Y(n354) );
  NAND4X0_RVT U306 ( .A1(state_2_), .A2(n352), .A3(n317), .A4(n367), .Y(n353)
         );
  NAND3X0_RVT U307 ( .A1(state_2_), .A2(n317), .A3(n315), .Y(n357) );
  NAND2X0_RVT U308 ( .A1(n358), .A2(n357), .Y(n365) );
  AO221X1_RVT U309 ( .A1(n380), .A2(n177), .A3(n380), .A4(n317), .A5(n365), 
        .Y(n362) );
  AO22X1_RVT U310 ( .A1(n67), .A2(n300), .A3(n302), .A4(n375), .Y(n54) );
  HADDX1_RVT U311 ( .A0(n43), .B0(n67), .SO(n361) );
  AO22X1_RVT U312 ( .A1(n303), .A2(n375), .A3(n361), .A4(n300), .Y(n55) );
  NAND3X0_RVT U313 ( .A1(n303), .A2(n302), .A3(n301), .Y(n364) );
  OA221X1_RVT U314 ( .A1(n301), .A2(n303), .A3(n301), .A4(n302), .A5(n364), 
        .Y(n363) );
  AO22X1_RVT U315 ( .A1(n375), .A2(n301), .A3(n363), .A4(n362), .Y(n56) );
  HADDX1_RVT U316 ( .A0(n293), .B0(n364), .SO(n366) );
  AO22X1_RVT U317 ( .A1(n306), .A2(n375), .A3(n366), .A4(n365), .Y(n57) );
  NAND2X0_RVT U318 ( .A1(n367), .A2(n377), .Y(n378) );
  AO222X1_RVT U319 ( .A1(n378), .A2(n368), .A3(n378), .A4(n383), .A5(n368), 
        .A6(n315), .Y(n369) );
  NAND2X0_RVT U320 ( .A1(n370), .A2(n369), .Y(n386) );
  NAND2X0_RVT U321 ( .A1(n381), .A2(n317), .Y(n374) );
  NAND2X0_RVT U322 ( .A1(n304), .A2(n371), .Y(n382) );
  AO221X1_RVT U323 ( .A1(n177), .A2(n372), .A3(n177), .A4(n380), .A5(n382), 
        .Y(n373) );
  AOI22X1_RVT U324 ( .A1(n375), .A2(n290), .A3(n374), .A4(n373), .Y(n58) );
  OAI22X1_RVT U325 ( .A1(n376), .A2(n304), .A3(ec), .A4(n290), .Y(n59) );
  AO22X1_RVT U326 ( .A1(ec), .A2(n315), .A3(n376), .A4(temp[1]), .Y(n60) );
  AO22X1_RVT U327 ( .A1(ec), .A2(state_2_), .A3(n376), .A4(temp[2]), .Y(n61)
         );
  AOI22X1_RVT U328 ( .A1(n314), .A2(n383), .A3(n315), .A4(n382), .Y(n385) );
endmodule

