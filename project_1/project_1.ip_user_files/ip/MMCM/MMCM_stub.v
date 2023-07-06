// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Jun 16 17:15:05 2021
// Host        : LAPTOP-JPVCNHJS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/G/OneDrive/2021ss/fpga2021ss/project_1/project_1.srcs/sources_1/ip/MMCM/MMCM_stub.v
// Design      : MMCM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MMCM(clk_125, reset, locked, clk_200_in)
/* synthesis syn_black_box black_box_pad_pin="clk_125,reset,locked,clk_200_in" */;
  output clk_125;
  input reset;
  output locked;
  input clk_200_in;
endmodule
