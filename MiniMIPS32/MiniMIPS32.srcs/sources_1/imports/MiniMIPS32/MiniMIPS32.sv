`include "defines.sv"

module MiniMIPS32(
    input  logic cpu_clk,
    input  logic cpu_rst_n,
    output logic [31:0] iaddr, // transform address of instruction
    input  logic [31:0] inst, // receive instruction from imem
    output logic [31:0] daddr, // transform address of data
    output logic we, // write enable
    output logic [31:0] din, // data to write dmem
    input  logic [31:0] dout // receive data from dmem
    );
    /* instruction
     [31---26|25---21|20---16|15---11|10---6|5---0]
        op      rs      rt      rd      sa    func
    */
    logic pc_src, mem_to_reg, mem_write, branch, alu_src, reg_dst, reg_write, jump;
    logic [1 : 0] alu_control;
    logic zero;
    logic [31 : 0] pc;
    logic [31 : 0] alu_res;

    control_unit control_unit(
        .op(inst[31 : 26]),
        .funct(inst[5 : 0]),
        .zero(zero),
        .mem_to_reg(mem_to_reg),
        .mem_write(men_write),
        .branch(branch),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .jump(jump),
        .pc_src(pc_src),
        .alu_control(alu_control)
    );

    data_path data_path(
        .clk(cpu_clk),
        .rst(cpu_rst_n),
        .instr(inst[25 : 0]),
        .mem_to_reg(mem_to_reg),
        .pc_src(pc_src),
        .jump(jump),
        .alu_control(alu_control),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .read_data(dout),
        .pc_o(pc),
        .alu_res(alu_res),
        .zero(zero),
        .wd(din)
    );
    
endmodule: MiniMIPS32
