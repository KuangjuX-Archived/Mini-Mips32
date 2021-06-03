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
    output logic jump,
    output [1 : 0] alu_control
    );

    logic [1 : 0] aluop;

    main_decoder main_decoder(
        .op(op),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .branch(branch),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .jump(jump),
        .aluop(aluop)
    );

    alu_decoder alu_decoder(
        .funct(funct),
        .aluop(aluop),
        .alu_control(alu_control)
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
    output logic jump,
    output logic [1 : 0] aluop
);

    logic [8 : 0] bundle;
    assign {reg_write, reg_dst, alu_src, branch, 
            mem_write, mem_to_reg, aluop, jump} = bundle;
    
    always_comb begin 
        unique case(op)
            6'b000000: bundle = 9'b1_1_0_0_0_0_10_0; // R-type
            6'b100011: bundle = 9'b1_0_1_0_0_1_00_0; // lw
            6'b101011: bundle = 9'b0_x_1_0_1_x_00_0; // sw
            6'b000100: bundle = 9'b0_x_0_1_0_x_01_0; // beq
            6'b001000: bundle = 9'b1_0_1_0_0_0_00_0; // addi
            6'b000010: bundle = 9'b0_x_x_x_x_x_xx_1; // j
            default: bundle = 9'bxxxxxxxxx; // invalid op
        endcase
    end

endmodule: main_decoder

module alu_decoder(
    input [5 : 0] funct,
    input [1 : 0] aluop,
    output logic [2 : 0] alu_control
);

always_comb begin
    unique case(aluop)
        2'b00: alu_control = 3'b010; // add
        2'b01: alu_control = 3'b110; // sub
        default: begin
            unique case(funct)
                6'b100000: alu_control = 3'b010; // add
                6'b100010: alu_control = 3'b110; // sub
                6'b100100: alu_control = 3'b000; // and
                6'b100101: alu_control = 3'b001; // or
                6'b101010: alu_control = 3'b111; // slt
            endcase
        end
    endcase
end

endmodule: alu_decoder
