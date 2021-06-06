`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/02 20:54:51
// Design Name: 
// Module Name: alu
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


module alu(
    input [31 : 0] a,
    input [31 : 0] b,
    input [2 : 0] aluop,
    output logic [31 : 0] res,
    output logic ZF // zero
    );

    always_comb begin
        unique case (aluop)
            3'b000: res = a & b; 
            3'b001: res = a | b;
            3'b010: res = a + b;
            3'b011: res = b; // nop for lui
            3'b110: res = a - b;
            3'b111: res = a < b ? 32'd1 : '0;
            default: res = '0;
        endcase

        assign ZF = !res;
    end

endmodule: alu
