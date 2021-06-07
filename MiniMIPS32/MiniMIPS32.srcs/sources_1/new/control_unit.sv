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
    output logic branch,
    output logic alu_src,
    output logic reg_dst,
    output logic reg_write,
    output logic jump,
    output logic pc_src,
    output logic select_imm,
    output [2 : 0] alu_control
    );

    logic [1 : 0] aluop;

    assign pc_src = branch & zero;

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
    output logic branch,
    output logic alu_src,
    output logic reg_dst,
    output logic reg_write,
    output logic jump,
    output logic select_imm,
    output logic [1 : 0] aluop
);

    logic [9 : 0] bundle;
    assign {reg_write, reg_dst, alu_src, branch, 
            mem_write, mem_to_reg, aluop, jump, select_imm} = bundle;
    
    /*  reg_write
        reg_dst
        alu_src
        branch
        mem_write
        mem_to_reg
        aluop
        jump
    */

    /*
        Example: ori
        ORI rt, rs, imm
        寄存器rs中的值与0扩展至32位的立即数按位逻辑或，结果写入寄存器rt中。
        GPR[rt] <- GPR[rt] or Zero_extend(imm)
        31-------26 25-------21 20------16 15-------0
           001101        rs         rt         imm

        reg_write: 1(write into rt)
        reg_dst: 0(write into rt(20 : 16))
        alu_src: 1(src_b as sign_imm)
        branch: 0(no jump)
        mem_write: 0(no write into mem)
        mem_to_reg: 0(alu_res write into reg)
        aluop: 10
        jump: 0
    */

    /*
        lw
        reg_write: 1
        reg_dst: 0
        alu_src: 1
        branch: 0
        mem_write: 0
        mem_to_reg:1
        aluop: 00
        jump: 0
    */

    /*
        lui
        reg_write: 1
        reg_dst: 0
        alu_src: 0
        branch: 0
        mem_write: 0
        mem_to_reg: 0
        aluop: 00
        jump: 0
    */

    always_comb begin 
        unique case(op)
            6'b000010: bundle = 10'b0_x_x_x_x_x_xx_1_0; // j
            6'b000000: bundle = 10'b1_1_0_0_0_0_10_0_0; // R-type
            6'b000100: bundle = 10'b0_x_0_1_0_x_01_0_0; // beq 如果相等则转移
            6'b000101: bundle = 10'bx_x_x_x_x_x_01_x_0; // bne 如果不相等则转移
            6'b001001: bundle = 10'b1_0_1_0_0_0_00_0_0; // addiu
            6'b001101: bundle = 10'b1_0_1_0_0_0_10_0_0; // ori
            6'b001111: bundle = 10'b1_0_0_0_0_0_11_0_1; // lui
            6'b100011: bundle = 10'b1_0_1_0_0_1_00_0_0; // lw
            6'b101011: bundle = 10'b0_x_1_0_1_x_00_0_0; // sw
            default: bundle = 10'bxxxxxxxxxx; // invalid op
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
        2'b10: begin
            unique case(funct)
                6'b100000: alu_control = 3'b010; // add
                6'b100010: alu_control = 3'b110; // sub
                6'b100100: alu_control = 3'b000; // and
                6'b100101: alu_control = 3'b001; // or
                6'b101010: alu_control = 3'b111; // slt
            endcase
        end
        2'b11: alu_control = 3'b011;
    endcase
end

endmodule: alu_decoder
