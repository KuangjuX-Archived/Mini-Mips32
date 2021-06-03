`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/03 15:27:21
// Design Name: 
// Module Name: sign_ext
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


module sign_ext #(
    parameter InWidth = 16,
    parameter OutWidth = 32
    ) (
        input [InWidth : 0] in,
        output [OutWidth : 0] out
    );

    assign out  = {{(OutWidth - InWidth){in[InWidth - 1]}}, in};

endmodule: sign_ext
