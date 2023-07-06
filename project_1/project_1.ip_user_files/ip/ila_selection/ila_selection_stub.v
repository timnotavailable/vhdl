// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon Jul 19 21:13:27 2021
// Host        : LAPTOP-JPVCNHJS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/G/OneDrive/2021ss/fpga2021ss/project_1/project_1.srcs/sources_1/ip/ila_selection/ila_selection_stub.v
// Design      : ila_selection
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2020.1" *)
module ila_selection(clk, probe0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[16:0]" */;
  input clk;
  input [16:0]probe0;
endmodule
