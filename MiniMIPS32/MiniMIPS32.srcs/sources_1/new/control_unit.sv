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

// control unit invoked by MiniMips32.sv
module control_unit(
    input [5 : 0] op, // Opcode,
    input [5 : 0] funct, // Funct
    input zero,
    output logic mem_to_reg, 
    output logic mem_write,
    output logic alu_src,
    output logic reg_dst,
    output logic reg_write,
    output logic jump,
    output logic pc_src,
    output logic select_imm,
    output [2 : 0] alu_control
    );

    logic [2 : 0] aluop;
    logic [1 : 0] branch;

    assign pc_src = (branch[0] & zero) | (branch[1] & ~zero);

    main_decoder main_decoder(
        .op(op),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .branch(branch),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .jump(jump),
        .select_imm(select_imm),
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
    output logic [1 : 0] branch,
    output logic alu_src,
    output logic reg_dst,
    output logic reg_write,
    output logic jump,
    output logic select_imm,
    output logic [2 : 0] aluop
);

    logic [11 : 0] bundle;
    assign {reg_write, reg_dst, alu_src, branch, 
            mem_write, mem_to_reg, aluop, jump, select_imm} = bundle;


    always_comb begin 
        unique case(op)
            6'b000010: bundle = 12'b0_x_x_00_0_x_xxx_1_0; // j
            6'b000000: bundle = 12'b1_1_0_00_0_0_100_0_0; // R-type
            6'b000100: bundle = 12'b0_x_0_01_0_x_010_0_0; // beq 如果相等则转移
            6'b000101: bundle = 12'b0_x_0_10_0_x_010_0_0; // bne 如果不相等则转移
            6'b001001: bundle = 12'b1_0_1_00_0_0_000_0_0; // addiu
            6'b001101: bundle = 12'b1_0_1_00_0_0_011_0_0; // ori
            6'b001111: bundle = 12'b1_0_1_00_0_0_110_0_1; // lui
            6'b100011: bundle = 12'b1_0_1_00_0_1_000_0_0; // lw
            6'b101011: bundle = 12'b0_x_1_00_1_x_000_0_0; // sw
            default: bundle = 12'bxxxxxxxxxxxx; // invalid op
        endcase
    end

endmodule: main_decoder

module alu_decoder(
    input [5 : 0] funct,
    input [2 : 0] aluop,
    output logic [2 : 0] alu_control
);

always_comb begin
    unique case(aluop)
        3'b000: alu_control = 3'b010; // add
        3'b010: alu_control = 3'b110; // sub (For BEQ, BNE)
        3'b011: alu_control = 3'b001; // or
        3'b100: begin
            unique case(funct)
                6'b100000: alu_control = 3'b010; // add
                6'b100010: alu_control = 3'b110; // sub
                6'b100100: alu_control = 3'b000; // and
                6'b100101: alu_control = 3'b001; // or
                6'b101010: alu_control = 3'b111; // slt
            endcase
        end
        3'b110: alu_control = 3'b011;
    endcase
end

endmodule: alu_decoder
