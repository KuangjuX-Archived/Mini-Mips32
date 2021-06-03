`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/03 14:20:15
// Design Name: 
// Module Name: mux2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// 2-to-1 multiplexer
module mux2 #(
  parameter Width = 32
) (
  input        [Width-1:0] data0, data1,
  input                    select,
  output logic [Width-1:0] result
);
  assign result = select ? data1 : data0;
endmodule : mux2
