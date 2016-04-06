
module TRAFFIC_lights ( clk, emg, lights );
  output [7:0] lights;
  input clk, emg;
  wire   northSouth, N100, N101, N104, N105, N108, n20, n21, n23, n24, n59,
         n60, n61, n62, n63, n64, n65, n66, n68, n69, n113, n114, n115, n116,
         n117, n118, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156;
  wire   [2:0] state;
  wire   [2:0] prevState;

  DFFX1_RVT cnt_reg_0_ ( .D(n69), .CLK(clk), .Q(n124), .QN(n24) );
  DFFX1_RVT cnt_reg_2_ ( .D(n60), .CLK(clk), .Q(n123), .QN(n21) );
  DFFX1_RVT cnt_reg_3_ ( .D(n68), .CLK(clk), .Q(n128), .QN(n20) );
  DFFX1_RVT cnt_reg_1_ ( .D(n61), .CLK(clk), .Q(n127), .QN(n23) );
  DFFX1_RVT state_reg_0_ ( .D(n65), .CLK(clk), .Q(state[0]), .QN(n122) );
  DFFX1_RVT state_reg_1_ ( .D(n63), .CLK(clk), .Q(state[1]), .QN(n125) );
  DFFX1_RVT prevState_reg_1_ ( .D(n62), .CLK(clk), .Q(prevState[1]) );
  DFFX1_RVT prevState_reg_0_ ( .D(n64), .CLK(clk), .Q(prevState[0]) );
  DFFX1_RVT prevState_reg_2_ ( .D(n66), .CLK(clk), .Q(prevState[2]) );
  DFFX1_RVT northSouth_reg ( .D(n59), .CLK(clk), .Q(northSouth), .QN(n126) );
  LATCHX1_RVT lights_reg_7_ ( .CLK(N100), .D(N108), .Q(lights[7]) );
  LATCHX1_RVT lights_reg_6_ ( .CLK(N100), .D(n116), .Q(lights[6]) );
  LATCHX1_RVT lights_reg_5_ ( .CLK(N100), .D(n114), .Q(lights[5]) );
  LATCHX1_RVT lights_reg_4_ ( .CLK(N100), .D(N105), .Q(lights[4]) );
  LATCHX1_RVT lights_reg_3_ ( .CLK(N100), .D(N104), .Q(lights[3]) );
  LATCHX1_RVT lights_reg_2_ ( .CLK(N100), .D(n115), .Q(lights[2]) );
  LATCHX1_RVT lights_reg_1_ ( .CLK(N100), .D(n113), .Q(lights[1]) );
  LATCHX1_RVT lights_reg_0_ ( .CLK(N100), .D(N101), .Q(lights[0]) );
  DFFSSRX1_RVT state_reg_2_ ( .D(n138), .SETB(prevState[2]), .RSTB(n145), 
        .CLK(clk), .Q(n121), .QN(state[2]) );
  INVX1_RVT U127 ( .A(n130), .Y(n146) );
  INVX1_RVT U128 ( .A(emg), .Y(n145) );
  OA21X1_RVT U129 ( .A1(state[1]), .A2(n121), .A3(n134), .Y(N100) );
  AND3X1_RVT U130 ( .A1(n20), .A2(n21), .A3(n129), .Y(n117) );
  OA221X1_RVT U131 ( .A1(n117), .A2(n142), .A3(n117), .A4(n139), .A5(n144), 
        .Y(n156) );
  INVX0_RVT U132 ( .A(n149), .Y(n118) );
  AO221X1_RVT U134 ( .A1(1'b1), .A2(n139), .A3(n152), .A4(prevState[1]), .A5(
        emg), .Y(n120) );
  AO22X1_RVT U135 ( .A1(n149), .A2(state[1]), .A3(n118), .A4(n120), .Y(n63) );
  INVX0_RVT U136 ( .A(n150), .Y(n151) );
  INVX0_RVT U137 ( .A(n138), .Y(n152) );
  OR3X2_RVT U138 ( .A1(n114), .A2(n116), .A3(n131), .Y(N101) );
  OR3X2_RVT U139 ( .A1(n115), .A2(n113), .A3(n131), .Y(N105) );
  INVX1_RVT U140 ( .A(n148), .Y(n149) );
  INVX1_RVT U141 ( .A(n155), .Y(n144) );
  OR2X1_RVT U142 ( .A1(n146), .A2(n23), .Y(n129) );
  NAND2X0_RVT U143 ( .A1(state[1]), .A2(state[0]), .Y(n134) );
  AND4X1_RVT U144 ( .A1(state[1]), .A2(n121), .A3(n122), .A4(n126), .Y(n114)
         );
  AND3X1_RVT U145 ( .A1(state[0]), .A2(n125), .A3(n121), .Y(n139) );
  AND2X1_RVT U146 ( .A1(n139), .A2(n126), .Y(n116) );
  NAND3X0_RVT U147 ( .A1(n125), .A2(n122), .A3(n121), .Y(n130) );
  NAND3X0_RVT U148 ( .A1(state[1]), .A2(state[2]), .A3(n122), .Y(n138) );
  NAND2X0_RVT U149 ( .A1(n130), .A2(n138), .Y(n131) );
  AND2X1_RVT U150 ( .A1(n146), .A2(northSouth), .Y(N104) );
  AND4X1_RVT U151 ( .A1(state[1]), .A2(northSouth), .A3(n121), .A4(n122), .Y(
        n113) );
  AND2X1_RVT U152 ( .A1(n139), .A2(northSouth), .Y(n115) );
  AND2X1_RVT U153 ( .A1(n146), .A2(n126), .Y(N108) );
  NAND3X0_RVT U154 ( .A1(n21), .A2(n23), .A3(n20), .Y(n132) );
  NAND4X0_RVT U155 ( .A1(state[1]), .A2(n121), .A3(n122), .A4(n132), .Y(n141)
         );
  AND2X1_RVT U156 ( .A1(n114), .A2(n132), .Y(n133) );
  AO222X1_RVT U157 ( .A1(northSouth), .A2(emg), .A3(northSouth), .A4(n141), 
        .A5(n145), .A6(n133), .Y(n59) );
  OA222X1_RVT U158 ( .A1(n20), .A2(n24), .A3(n20), .A4(n21), .A5(n20), .A6(n23), .Y(n142) );
  NAND3X0_RVT U159 ( .A1(n134), .A2(n145), .A3(n121), .Y(n155) );
  AND2X1_RVT U160 ( .A1(n23), .A2(n156), .Y(n137) );
  NAND2X0_RVT U161 ( .A1(n24), .A2(n156), .Y(n135) );
  NAND2X0_RVT U162 ( .A1(n144), .A2(n135), .Y(n136) );
  AND3X1_RVT U163 ( .A1(n156), .A2(n124), .A3(n127), .Y(n154) );
  AO222X1_RVT U164 ( .A1(n123), .A2(n137), .A3(n123), .A4(n136), .A5(n154), 
        .A6(n21), .Y(n60) );
  AO22X1_RVT U165 ( .A1(n137), .A2(n124), .A3(n127), .A4(n136), .Y(n61) );
  NAND2X0_RVT U166 ( .A1(emg), .A2(n138), .Y(n150) );
  AO22X1_RVT U167 ( .A1(n151), .A2(state[1]), .A3(n150), .A4(prevState[1]), 
        .Y(n62) );
  NAND2X0_RVT U168 ( .A1(n21), .A2(n20), .Y(n140) );
  NAND2X0_RVT U169 ( .A1(n146), .A2(n140), .Y(n143) );
  NAND4X0_RVT U170 ( .A1(n144), .A2(n143), .A3(n142), .A4(n141), .Y(n148) );
  AO22X1_RVT U171 ( .A1(state[0]), .A2(emg), .A3(prevState[0]), .A4(n150), .Y(
        n64) );
  OA221X1_RVT U172 ( .A1(n146), .A2(n152), .A3(n146), .A4(prevState[0]), .A5(
        n145), .Y(n147) );
  AO22X1_RVT U173 ( .A1(n149), .A2(state[0]), .A3(n148), .A4(n147), .Y(n65) );
  AO22X1_RVT U174 ( .A1(n151), .A2(state[2]), .A3(n150), .A4(prevState[2]), 
        .Y(n66) );
  OR2X1_RVT U175 ( .A1(n155), .A2(n156), .Y(n153) );
  AO22X1_RVT U176 ( .A1(n154), .A2(n123), .A3(n128), .A4(n153), .Y(n68) );
  AO22X1_RVT U177 ( .A1(n24), .A2(n156), .A3(n124), .A4(n155), .Y(n69) );
endmodule

