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
    input [3 : 0] aluop,
    output logic [31 : 0] res,
    output logic ZF // zero
    );

    always_comb begin
        unique case (aluop) 
            4'd0: res = a & b;
            4'd1: res = a | b;
            4'd2: res = a + b;
            4'd3: res = b << a;
            4'd4: res = a & ~b;
            4'd5: res = a | ~b;
            4'd6: res = a - b;
            4'd7: res = a < b ? 32'b1 : '0;
            4'd8: res = b >> a;
            4'd9: res = b >>> a;
            default: res = '0;
        endcase

        assign ZF = !res;
    end

endmodule: alu
