// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Jun 18 20:04:13 2021
// Host        : DESKTOP-HJ97TPV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/User/Desktop/MiniMIPS32_stu/MiniMIPS32/MiniMIPS32.srcs/sources_1/ip/clkdiv/clkdiv_stub.v
// Design      : clkdiv
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clkdiv(clk_50MHz, clk_100MHz)
/* synthesis syn_black_box black_box_pad_pin="clk_50MHz,clk_100MHz" */;
  output clk_50MHz;
  input clk_100MHz;
endmodule
