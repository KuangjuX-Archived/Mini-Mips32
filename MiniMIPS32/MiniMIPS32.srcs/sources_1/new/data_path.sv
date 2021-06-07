`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/02 21:17:23
// Design Name: 
// Module Name: data_path
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

// data path invoked by MiniMIPS32.sv
module data_path(
    input clk,
    input rst,
    input [25 : 0] instr,
    input mem_to_reg,
    input pc_src,
    input jump,
    input [2 : 0] alu_control,
    input alu_src,
    input reg_dst,
    input reg_write_i,
    input select_imm,
    input [31 : 0] read_data,
    output logic [31 : 0] pc_o,
    output logic [31 : 0] alu_res,
    output logic zero,
    output logic [31 : 0] wd
    );

    logic [31 : 0] pc_next, pc_plus_4, pc_branch, pc_branch_next;
    logic [31 : 0] sign_imm;
    logic [31 : 0] src_a, src_b;
    logic [31 : 0] write_reg_data;
    logic [31 : 0] read_reg_data;
    logic [5 : 0] write_reg;
    
    logic [31 : 0] imm_1, imm_2;

    // sign extension for sign_imm
    sign_ext sign_imm_1_ext(
        .in(instr[15 : 0]),
        .out(imm_1)
    );

    // for lui instr
    assign imm_2 = {instr[15 : 0], 16'd0};



    // Next PC logic
    flip pc_reg(
        .clk(clk),
        .rst(rst),
        .in(pc_next),
        .out(pc_o)
    );

    adder u1_adder(
        .a(pc_o),
        .b(32'd4),
        .res(pc_plus_4)
    );

    adder u2_adder(
        .a(pc_plus_4),
        .b({sign_imm[29 : 0], 2'b00}), // sign_imm * 4
        .res(pc_branch)
    );

    // beq -> select pc_branch or pc_plus_4
    mux2 pc_branch_next_mux2(
        .data0(pc_plus_4),
        .data1(pc_branch),
        .select(pc_src),
        .result(pc_branch_next)
    );

    // mux4 to judege next PC address
    // mux4 pc_next_mux4(
    //     .data0(pc_branch_next),
    //     .data1({pc_plus_4[31 : 28], instr[25 : 0], 2'b00}),
    //     .data2(read_reg_data),
    //     .data3('0),
    //     .select(jump),
    //     .result(pc_next)
    // );

    // mux2 to judge next PC address
    mux2 pc_next_mux2(
        .data0(pc_branch_next),
        .data1({pc_plus_4[31 : 28], instr[25 : 0], 2'b00}),
        .select('0),
        .result(pc_next)
    );

    // register file logic
    reg_file reg_file(
        .clk(clk),
        .rst(rst),
        .a1(instr[25 : 21]), // rs seg
        .a2(instr[20 : 16]),
        .a3(write_reg),
        .wd(write_reg_data),
        .we(reg_write_i),
        .rd1(read_reg_data),
        .rd2(wd) // RD2 port --> WriteData
    );

    mux2 #(5) reg_write_addr_mux2(
        .data0(instr[20 : 16]),
        .data1(instr[15 : 11]),
        .select(reg_dst),
        .result(write_reg)
    );

    // Data Memory logic
    // Data Memory Module is implemented in MiniMIPS32_SYS Module
    // which work by reading and writing RAM


    mux2 write_reg_data_mux2(
        .data0(alu_res),
        .data1(read_data),
        .select(mem_to_reg),
        .result(write_reg_data)
    );


    // ALU logic
    alu alu(
        .a(read_reg_data),
        .b(src_b),
        .aluop(alu_control),
        .res(alu_res),
        .ZF(zero)
    );

    mux2 sign_imm_mux2(
        .data0(imm_1),
        .data1(imm_2),
        .select(select_imm),
        .result(sign_imm)
    );

    mux2 src_b_mux2(
        .data0(write_data),
        .data1(sign_imm),
        .select(alu_src),
        .result(src_b)
    );


endmodule: data_path
