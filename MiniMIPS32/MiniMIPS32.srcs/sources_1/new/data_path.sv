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
    input [1 : 0] alu_control,
    input alu_src,
    input reg_dst,
    input reg_write,
    input [31 : 0] read_reg_data,
    output logic [31 : 0] pc_o,
    output logic [31 : 0] alu_res,
    output logic zero,
    output logic [31 : 0] wd
    );

    logic [31 : 0] pc_next, pc_plus_4, pc_branch, pc_branch_next;
    logic [31 : 0] sign_imm;
    logic [31 : 0] src_a, src_b;
    logic [31 : 0] write_reg_data;

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

    // register file logic
    reg_file reg_file(
        .clk(clk),
        .rst(rst),
        .a1(instr[25 : 21]), // rs seg
        .a2(instr[20 : 16]),
        .a3(),
        .wd(),
        .we(reg_write),
        .rd1(),
        .rd2()
    );

    // Data Memory logic
    dmem dmem(
        .clk(clk),
        .we(mem_write),
        .a(),
        .wd(),
        .rd()
    );

    mux2 write_reg_data_mux2(
        .data0(alu_res),
        .data0(read_reg_data),
        .select(mem_to_reg),
        .result(write_reg_data)
    );


    // ALU logic
    alu alu(
        .a(src_a),
        .b(src_b),
        .aluop(aluop),
        .res(alu_res),
        .ZF()
    );
endmodule: data_path
