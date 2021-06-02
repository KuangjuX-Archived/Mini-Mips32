`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/02 18:35:24
// Design Name: 
// Module Name: imem
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

// 32-bits instruction memory
module imem(
    input [5 : 0] a, // pc addr
    output logic [31 : 0] rd // instr data
    );
    logic [31 : 0] RAM [63 : 0];
    // initial RAM
    initial begin
        $readmemh("memfile.dat", RAM);
    end
    
    assign rd = RAM[a];
endmodule: imem
