
module TRAFFIC_lights ( clk, emg, lights );
  output [7:0] lights;
  input clk, emg;
  wire   N150, N151, N152, n10, n11, n13, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n88, n89, n90, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187;
  wire   [2:0] state;
  wire   [2:0] prevState;

  DFFX1_RVT state_reg_0_ ( .D(n83), .CLK(clk), .Q(state[0]), .QN(n141) );
  DFFX1_RVT cnt_reg_0_ ( .D(n76), .CLK(clk), .Q(n143), .QN(n13) );
  DFFX1_RVT cnt_reg_3_ ( .D(n82), .CLK(clk), .Q(n146), .QN(n10) );
  DFFX1_RVT cnt_reg_2_ ( .D(n74), .CLK(clk), .Q(n145), .QN(n11) );
  DFFX1_RVT cnt_reg_1_ ( .D(n75), .CLK(clk), .Q(n142), .QN(n137) );
  DFFX1_RVT prevState_reg_1_ ( .D(n77), .CLK(clk), .Q(prevState[1]), .QN(n147)
         );
  LATCHX1_RVT lights_reg_7_ ( .CLK(N150), .D(n138), .Q(lights[7]) );
  LATCHX1_RVT lights_reg_6_ ( .CLK(N150), .D(n88), .Q(lights[6]) );
  LATCHX1_RVT lights_reg_5_ ( .CLK(N150), .D(n90), .Q(lights[5]) );
  LATCHX1_RVT lights_reg_4_ ( .CLK(N150), .D(N152), .Q(lights[4]) );
  LATCHX1_RVT lights_reg_3_ ( .CLK(N150), .D(n140), .Q(lights[3]) );
  LATCHX1_RVT lights_reg_2_ ( .CLK(N150), .D(n89), .Q(lights[2]) );
  LATCHX1_RVT lights_reg_1_ ( .CLK(N150), .D(n139), .Q(lights[1]) );
  LATCHX1_RVT lights_reg_0_ ( .CLK(N150), .D(N151), .Q(lights[0]) );
  DFFX1_RVT state_reg_1_ ( .D(n78), .CLK(clk), .Q(state[1]), .QN(n144) );
  DFFX1_RVT prevState_reg_2_ ( .D(n79), .CLK(clk), .Q(prevState[2]) );
  DFFX1_RVT prevState_reg_0_ ( .D(n80), .CLK(clk), .Q(prevState[0]) );
  DFFX1_RVT state_reg_2_ ( .D(n81), .CLK(clk), .Q(state[2]), .QN(n162) );
  OR2X1_RVT U145 ( .A1(n138), .A2(n140), .Y(n170) );
  INVX1_RVT U146 ( .A(n157), .Y(n185) );
  INVX1_RVT U147 ( .A(emg), .Y(n184) );
  NAND3X0_RVT U148 ( .A1(state[1]), .A2(state[2]), .A3(state[0]), .Y(N150) );
  INVX0_RVT U149 ( .A(n183), .Y(n187) );
  INVX0_RVT U150 ( .A(n180), .Y(n149) );
  INVX0_RVT U151 ( .A(n168), .Y(n90) );
  OR3X1_RVT U152 ( .A1(emg), .A2(n89), .A3(n140), .Y(n176) );
  INVX1_RVT U153 ( .A(n166), .Y(n167) );
  INVX1_RVT U154 ( .A(n171), .Y(n163) );
  INVX1_RVT U155 ( .A(n160), .Y(n88) );
  INVX1_RVT U156 ( .A(n169), .Y(n155) );
  AND3X1_RVT U157 ( .A1(n144), .A2(n162), .A3(n141), .Y(n138) );
  AND3X1_RVT U158 ( .A1(state[1]), .A2(state[0]), .A3(n162), .Y(n140) );
  NAND3X0_RVT U159 ( .A1(state[0]), .A2(n144), .A3(n162), .Y(n160) );
  NAND2X0_RVT U160 ( .A1(state[1]), .A2(n141), .Y(n159) );
  NAND2X0_RVT U161 ( .A1(state[2]), .A2(n159), .Y(N151) );
  NAND2X0_RVT U162 ( .A1(state[1]), .A2(state[0]), .Y(n148) );
  AO21X1_RVT U163 ( .A1(state[2]), .A2(n148), .A3(n170), .Y(N152) );
  AND3X1_RVT U164 ( .A1(n143), .A2(n142), .A3(n184), .Y(n178) );
  OA221X1_RVT U165 ( .A1(state[0]), .A2(n144), .A3(n141), .A4(n162), .A5(n178), 
        .Y(n153) );
  NAND2X0_RVT U166 ( .A1(n10), .A2(n11), .Y(n171) );
  AO21X1_RVT U167 ( .A1(state[1]), .A2(state[2]), .A3(emg), .Y(n157) );
  NAND2X0_RVT U168 ( .A1(n143), .A2(n142), .Y(n150) );
  OA21X1_RVT U169 ( .A1(n162), .A2(state[0]), .A3(n160), .Y(n180) );
  NAND3X0_RVT U170 ( .A1(n10), .A2(n150), .A3(n149), .Y(n151) );
  NAND2X0_RVT U171 ( .A1(n185), .A2(n151), .Y(n152) );
  AO22X1_RVT U172 ( .A1(n153), .A2(n163), .A3(n145), .A4(n152), .Y(n74) );
  AO22X1_RVT U173 ( .A1(n13), .A2(n142), .A3(n143), .A4(n137), .Y(n156) );
  NAND3X0_RVT U174 ( .A1(n13), .A2(n137), .A3(n11), .Y(n179) );
  NAND2X0_RVT U175 ( .A1(n146), .A2(n179), .Y(n161) );
  NAND2X0_RVT U176 ( .A1(n185), .A2(n161), .Y(n169) );
  AND3X1_RVT U177 ( .A1(state[2]), .A2(n144), .A3(n141), .Y(n89) );
  OA21X1_RVT U178 ( .A1(n137), .A2(n170), .A3(n163), .Y(n154) );
  AO222X1_RVT U179 ( .A1(n155), .A2(n89), .A3(n155), .A4(n88), .A5(n155), .A6(
        n154), .Y(n158) );
  AO22X1_RVT U180 ( .A1(n156), .A2(n158), .A3(n142), .A4(n157), .Y(n75) );
  AO22X1_RVT U181 ( .A1(n13), .A2(n158), .A3(n143), .A4(n157), .Y(n76) );
  OA21X1_RVT U182 ( .A1(n162), .A2(n159), .A3(emg), .Y(n166) );
  AO22X1_RVT U183 ( .A1(n166), .A2(state[1]), .A3(n167), .A4(prevState[1]), 
        .Y(n77) );
  OA22X1_RVT U184 ( .A1(n161), .A2(n160), .A3(n159), .A4(n147), .Y(n165) );
  NAND3X0_RVT U185 ( .A1(state[1]), .A2(n162), .A3(n141), .Y(n168) );
  NAND3X0_RVT U186 ( .A1(state[1]), .A2(n163), .A3(n162), .Y(n164) );
  NAND4X0_RVT U187 ( .A1(n165), .A2(n184), .A3(n168), .A4(n164), .Y(n78) );
  AO22X1_RVT U188 ( .A1(n166), .A2(state[2]), .A3(n167), .A4(prevState[2]), 
        .Y(n79) );
  AO22X1_RVT U189 ( .A1(emg), .A2(state[0]), .A3(prevState[0]), .A4(n167), .Y(
        n80) );
  AND3X1_RVT U191 ( .A1(state[2]), .A2(state[0]), .A3(n144), .Y(n139) );
  OA22X1_RVT U192 ( .A1(n139), .A2(n90), .A3(n142), .A4(n171), .Y(n172) );
  AO221X1_RVT U193 ( .A1(1'b1), .A2(n172), .A3(n171), .A4(n170), .A5(n169), 
        .Y(n183) );
  NAND3X0_RVT U194 ( .A1(state[1]), .A2(prevState[2]), .A3(n141), .Y(n174) );
  NAND2X0_RVT U195 ( .A1(n174), .A2(n183), .Y(n175) );
  AO22X1_RVT U196 ( .A1(n183), .A2(n176), .A3(state[2]), .A4(n175), .Y(n81) );
  OR2X1_RVT U197 ( .A1(n88), .A2(n89), .Y(n177) );
  NAND4X0_RVT U198 ( .A1(n10), .A2(n178), .A3(n177), .A4(n145), .Y(n182) );
  AO221X1_RVT U199 ( .A1(n185), .A2(n180), .A3(n185), .A4(n179), .A5(n10), .Y(
        n181) );
  NAND2X0_RVT U200 ( .A1(n182), .A2(n181), .Y(n82) );
  OA221X1_RVT U201 ( .A1(n185), .A2(prevState[0]), .A3(n185), .A4(n184), .A5(
        n183), .Y(n186) );
  AO22X1_RVT U202 ( .A1(state[0]), .A2(n187), .A3(n141), .A4(n186), .Y(n83) );
endmodule

