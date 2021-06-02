`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/02 18:38:22
// Design Name: 
// Module Name: dmem
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

// 32-bits data memory
module dmem(
    input clk,
    input we, // write enable
    input [31 : 0] a, // memory read/write addr
    input [31 : 0] wd, // memory write data
    output logic [31 : 0] rd // memory read data
    );
    logic [31 : 0] RAM[63 : 0];
    always_ff @( posedge clk ) begin
        if(we) RAM[a] <= wd;
    end

    assign rd = RAM[a];

endmodule: dmem
