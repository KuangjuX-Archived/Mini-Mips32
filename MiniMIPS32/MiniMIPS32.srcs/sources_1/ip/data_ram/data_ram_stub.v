// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Mon May 31 20:18:29 2021
// Host        : LAPTOP-BEASOA6F running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Work/vivado_project/DLC/MiniMIPS32/MiniMIPS32.srcs/sources_1/ip/data_ram/data_ram_stub.v
// Design      : data_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.3" *)
module data_ram(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[31:0],clk,we,spo[31:0]" */;
  input [7:0]a;
  input [31:0]d;
  input clk;
  input we;
  output [31:0]spo;
endmodule
