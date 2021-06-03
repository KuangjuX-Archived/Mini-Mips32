`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/03 20:01:10
// Design Name: 
// Module Name: mux4
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


module mux4 #(parameter Width = 32) (
    input [Width-1 : 0] data0, data1, data2, data3,
    input [1 : 0] select,
    output logic [Width-1 : 0] result
    );
    always_comb begin
        unique case(select)
            2'b00: result = data0;
            2'b01: result = data1;
            2'b10: result = data2;
            2'b11: result = data3;
        endcase
    end
endmodule
