`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/02 21:17:46
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [5 : 0] op, // Opcode,
    input [5 : 0] funct, // Funct
    output logic mem_to_reg, 
    output logic mem_write,
    output logic branch,
    output logic alu_src,
    output logic reg_dst,
    output logic reg_write,
    output [1 : 0] alu_control
    );
endmodule: control_unit

module main_decoder(
    input [5 : 0] op,
    output logic mem_to_reg,
    output logic mem_write,
    output logic branch,
    output logic alu_src,
    output logic reg_dst,
    output logic reg_write,
    output logic [1 : 0] aluop
);

endmodule: main_decoder

module alu_decoder(
    input [5 : 0] funct,
    input [1 : 0] aluop,
    output logic [2 : 0] alu_control
);

endmodule: alu_decoder
