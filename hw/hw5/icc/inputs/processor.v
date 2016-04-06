
module TRAFFIC_lights ( clk, emergency, reset, LeftTurn_NS, Green_NS, 
        Yellow_NS, Red_NS, LeftTurn_EW, Green_EW, Yellow_EW, Red_EW );
  input clk, emergency, reset;
  output LeftTurn_NS, Green_NS, Yellow_NS, Red_NS, LeftTurn_EW, Green_EW,
         Yellow_EW, Red_EW;
  wire   northSouth, N108, N109, N110, N113, N114, n20, n22, n23, n41, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n120, n121, n122, n123,
         n124, n125, n126, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176;
  wire   [2:0] state;
  wire   [2:0] prevState;

  DFFX1_RVT prevState_reg_0_ ( .D(n70), .CLK(clk), .Q(prevState[0]) );
  DFFX1_RVT state_reg_0_ ( .D(n69), .CLK(clk), .Q(state[0]), .QN(n129) );
  DFFX1_RVT cnt_reg_3_ ( .D(n68), .CLK(clk), .Q(n136), .QN(n120) );
  DFFX1_RVT prevState_reg_1_ ( .D(n65), .CLK(clk), .Q(prevState[1]) );
  DFFX1_RVT state_reg_1_ ( .D(n66), .CLK(clk), .Q(state[1]), .QN(n133) );
  DFFX1_RVT cnt_reg_0_ ( .D(n64), .CLK(clk), .Q(n132), .QN(n23) );
  DFFX1_RVT cnt_reg_1_ ( .D(n63), .CLK(clk), .Q(n134), .QN(n22) );
  DFFX1_RVT cnt_reg_2_ ( .D(n62), .CLK(clk), .Q(n131), .QN(n20) );
  DFFX1_RVT northSouth_reg ( .D(n61), .CLK(clk), .Q(northSouth), .QN(n135) );
  DFFX1_RVT prevState_reg_2_ ( .D(n67), .CLK(clk), .Q(prevState[2]) );
  LATCHX1_RVT Green_EW_reg ( .CLK(N108), .D(n123), .Q(Green_EW) );
  LATCHX1_RVT LeftTurn_EW_reg ( .CLK(N108), .D(N114), .Q(LeftTurn_EW) );
  LATCHX1_RVT Yellow_EW_reg ( .CLK(N108), .D(n121), .Q(Yellow_EW) );
  LATCHX1_RVT Red_EW_reg ( .CLK(N108), .D(N109), .Q(Red_EW) );
  LATCHX1_RVT LeftTurn_NS_reg ( .CLK(N108), .D(N110), .Q(LeftTurn_NS) );
  LATCHX1_RVT Green_NS_reg ( .CLK(N108), .D(n124), .Q(Green_NS) );
  LATCHX1_RVT Yellow_NS_reg ( .CLK(N108), .D(n122), .Q(Yellow_NS) );
  LATCHX1_RVT Red_NS_reg ( .CLK(N108), .D(N113), .Q(Red_NS) );
  DFFSSRX1_RVT state_reg_2_ ( .D(n151), .SETB(1'b1), .RSTB(n41), .CLK(clk), 
        .Q(n130), .QN(state[2]) );
  AO221X1_RVT U136 ( .A1(1'b1), .A2(n126), .A3(state[1]), .A4(n175), .A5(
        emergency), .Y(n66) );
  INVX1_RVT U137 ( .A(n157), .Y(n172) );
  INVX1_RVT U138 ( .A(emergency), .Y(n151) );
  NAND3X0_RVT U139 ( .A1(n150), .A2(n149), .A3(n157), .Y(N108) );
  OR2X1_RVT U140 ( .A1(n162), .A2(n161), .Y(n125) );
  AND4X1_RVT U141 ( .A1(n138), .A2(n137), .A3(n160), .A4(n125), .Y(n175) );
  OA221X1_RVT U142 ( .A1(n165), .A2(prevState[1]), .A3(n165), .A4(n172), .A5(
        n174), .Y(n126) );
  INVX0_RVT U145 ( .A(n175), .Y(n163) );
  INVX0_RVT U146 ( .A(n176), .Y(n166) );
  NOR2X0_RVT U147 ( .A1(emergency), .A2(reset), .Y(n164) );
  INVX1_RVT U148 ( .A(n150), .Y(n165) );
  INVX1_RVT U149 ( .A(n159), .Y(n171) );
  INVX1_RVT U150 ( .A(n141), .Y(n123) );
  INVX1_RVT U151 ( .A(n139), .Y(n124) );
  INVX1_RVT U152 ( .A(n142), .Y(n121) );
  INVX1_RVT U153 ( .A(n140), .Y(n122) );
  OR2X1_RVT U154 ( .A1(n133), .A2(n129), .Y(n138) );
  AND2X1_RVT U155 ( .A1(n130), .A2(n164), .Y(n137) );
  INVX1_RVT U156 ( .A(n167), .Y(n154) );
  INVX1_RVT U157 ( .A(n161), .Y(n146) );
  INVX1_RVT U158 ( .A(n145), .Y(n162) );
  NAND3X0_RVT U159 ( .A1(state[0]), .A2(n133), .A3(n130), .Y(n150) );
  NAND2X0_RVT U160 ( .A1(n129), .A2(n130), .Y(n149) );
  NAND3X0_RVT U161 ( .A1(state[1]), .A2(state[2]), .A3(n129), .Y(n157) );
  NAND3X0_RVT U162 ( .A1(state[1]), .A2(n129), .A3(n130), .Y(n161) );
  NAND2X0_RVT U163 ( .A1(n146), .A2(n135), .Y(n140) );
  NAND2X0_RVT U164 ( .A1(n165), .A2(n135), .Y(n139) );
  NAND3X0_RVT U165 ( .A1(n129), .A2(n133), .A3(n130), .Y(n159) );
  NAND4X0_RVT U166 ( .A1(n159), .A2(n157), .A3(n140), .A4(n139), .Y(N109) );
  AND2X1_RVT U167 ( .A1(n171), .A2(n135), .Y(N110) );
  NAND2X0_RVT U168 ( .A1(n146), .A2(northSouth), .Y(n142) );
  NAND2X0_RVT U169 ( .A1(n165), .A2(northSouth), .Y(n141) );
  NAND4X0_RVT U170 ( .A1(n159), .A2(n157), .A3(n142), .A4(n141), .Y(N113) );
  AND2X1_RVT U171 ( .A1(n171), .A2(northSouth), .Y(N114) );
  NAND3X0_RVT U172 ( .A1(n164), .A2(n172), .A3(prevState[2]), .Y(n41) );
  NAND3X0_RVT U173 ( .A1(n20), .A2(n22), .A3(n120), .Y(n145) );
  AND2X1_RVT U174 ( .A1(n164), .A2(n145), .Y(n144) );
  NAND2X0_RVT U175 ( .A1(n144), .A2(n146), .Y(n143) );
  AO22X1_RVT U176 ( .A1(n144), .A2(n122), .A3(n143), .A4(northSouth), .Y(n61)
         );
  AO21X1_RVT U177 ( .A1(n20), .A2(n171), .A3(n165), .Y(n147) );
  AND3X1_RVT U178 ( .A1(n20), .A2(n22), .A3(n23), .Y(n158) );
  AO222X1_RVT U179 ( .A1(n147), .A2(n120), .A3(n162), .A4(n146), .A5(n165), 
        .A6(n158), .Y(n148) );
  NAND2X0_RVT U180 ( .A1(n164), .A2(n148), .Y(n167) );
  AND2X1_RVT U181 ( .A1(n22), .A2(n154), .Y(n156) );
  NAND2X0_RVT U182 ( .A1(n150), .A2(n149), .Y(n152) );
  OA21X1_RVT U183 ( .A1(reset), .A2(n152), .A3(n151), .Y(n168) );
  NAND2X0_RVT U184 ( .A1(n23), .A2(n154), .Y(n153) );
  NAND2X0_RVT U185 ( .A1(n168), .A2(n153), .Y(n155) );
  AND3X1_RVT U186 ( .A1(n134), .A2(n132), .A3(n154), .Y(n170) );
  AO222X1_RVT U187 ( .A1(n131), .A2(n156), .A3(n131), .A4(n155), .A5(n170), 
        .A6(n20), .Y(n62) );
  AO22X1_RVT U188 ( .A1(n156), .A2(n132), .A3(n134), .A4(n155), .Y(n63) );
  OAI22X1_RVT U189 ( .A1(n132), .A2(n167), .A3(n23), .A4(n168), .Y(n64) );
  NAND2X0_RVT U190 ( .A1(emergency), .A2(n157), .Y(n176) );
  AO22X1_RVT U191 ( .A1(n166), .A2(state[1]), .A3(n176), .A4(prevState[1]), 
        .Y(n65) );
  AO222X1_RVT U192 ( .A1(n120), .A2(n159), .A3(n120), .A4(n20), .A5(n159), 
        .A6(n158), .Y(n160) );
  AND2X1_RVT U193 ( .A1(n164), .A2(n163), .Y(n174) );
  AO22X1_RVT U194 ( .A1(n166), .A2(state[2]), .A3(n176), .A4(prevState[2]), 
        .Y(n67) );
  NAND2X0_RVT U195 ( .A1(n168), .A2(n167), .Y(n169) );
  AO22X1_RVT U196 ( .A1(n170), .A2(n131), .A3(n136), .A4(n169), .Y(n68) );
  AO21X1_RVT U197 ( .A1(n172), .A2(prevState[0]), .A3(n171), .Y(n173) );
  AO22X1_RVT U198 ( .A1(state[0]), .A2(n175), .A3(n174), .A4(n173), .Y(n69) );
  AO22X1_RVT U199 ( .A1(emergency), .A2(state[0]), .A3(prevState[0]), .A4(n176), .Y(n70) );
endmodule

