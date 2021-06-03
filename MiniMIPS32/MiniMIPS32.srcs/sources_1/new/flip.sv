`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/03 12:37:22
// Design Name: 
// Module Name: flip
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


module flip #(parameter Width = 31)(
    input clk,
    input rst,
    input [Width-1 : 0] in,
    output logic [Width-1 : 0] out
    );
    
    always_ff @(posedge clk ) begin
        if(rst) out <= '0;
        else out <= in;
    end
endmodule: flip
