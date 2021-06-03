`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/02 18:55:46
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input clk,
    input rst,
    input [4 : 0] a1, // read address 1
    input [4 : 0] a2, // read address 2
    input [4 : 0] a3, // write address 3
    input [31 : 0] wd, // write data
    input we, // write enable
    output [31 : 0] rd1, // read data 1
    output [31 : 0] rd2  // read data 2
    );
    logic [31 : 0] rf[31 : 0];
    integer i;

    always_ff @(posedge clk) begin
        if(rst) begin
            for(i=0; i<32; i++) rf[i] <= '0;
        end
        else if(we) rf[a3] <= wd;
    end

    assign rd1 = (a1 != 0) ? rf[a1] : '0;
    assign rd2 = (a2 != 0) ? rf[a2] : '0;
 
endmodule: reg_file
