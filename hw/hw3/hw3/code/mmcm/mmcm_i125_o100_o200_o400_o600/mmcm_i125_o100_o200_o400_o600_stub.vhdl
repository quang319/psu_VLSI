-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
-- Date        : Wed Jan 27 10:53:34 2016
-- Host        : redrealm.cse.psu.edu running 64-bit Red Hat Enterprise Linux Client release 5.11 (Tikanga)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/mdl/ska130/Repos/Realm/hardware/Projects/Simple_PLDA/mmcm/mmcm_i125_o100_o200_o400_o600/mmcm_i125_o100_o200_o400_o600_stub.vhdl
-- Design      : mmcm_i125_o100_o200_o400_o600
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1157-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mmcm_i125_o100_o200_o400_o600 is
  Port ( 
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );

end mmcm_i125_o100_o200_o400_o600;

architecture stub of mmcm_i125_o100_o200_o400_o600 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in1_p,clk_in1_n,clk_out1,clk_out2,clk_out3,clk_out4,reset,locked";
begin
end;
