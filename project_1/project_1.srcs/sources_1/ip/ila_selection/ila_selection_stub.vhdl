-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Mon Jul 19 21:13:27 2021
-- Host        : LAPTOP-JPVCNHJS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/G/OneDrive/2021ss/fpga2021ss/project_1/project_1.srcs/sources_1/ip/ila_selection/ila_selection_stub.vhdl
-- Design      : ila_selection
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_selection is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 16 downto 0 )
  );

end ila_selection;

architecture stub of ila_selection is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[16:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2020.1";
begin
end;