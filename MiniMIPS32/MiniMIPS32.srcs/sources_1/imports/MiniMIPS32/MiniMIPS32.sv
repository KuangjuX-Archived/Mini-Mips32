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

    // we(write enable) is equal to mem_write
    // pc register is equal to iaddr
    // aluout is equal to daddr
    logic pc_src, mem_to_reg, branch, alu_src, reg_dst, reg_write, jump;
    logic [1 : 0] alu_control;
    logic zero;

    // data to write into RAM with normal order
    logic [31 : 0] write_mem_data;
    // data read from RAM with normal order
    logic [31 : 0] read_mem_data;

    // next address to fetch instruction
    logic [31 : 0] instr_addr_o;
    
    // current instruction
    logic [31 : 0] cur_instr;

    // next address to fetch data
    logic [31 : 0] data_addr_o;


    assign din[7 : 0] = write_mem_data[31 : 24];
    assign din[15 : 8] = write_mem_data[23 : 16];
    assign din[23 : 16] = write_mem_data[15 : 8];
    assign din[31 : 24] = write_mem_data[7 : 0];

    assign read_mem_data[7 : 0] = dout[31 : 24];
    assign read_mem_data[15 : 8] = dout[23 : 16];
    assign read_mem_data[23 : 16] = dout[15 : 8];
    assign read_mem_data[31 : 24] = dout[7 : 0];

    assign iaddr[7 : 0] = instr_addr_o[31 : 24];
    assign iaddr[15 : 8] = instr_addr_o[23 : 16];
    assign iaddr[23 : 16] = instr_addr_o[15 : 8];
    assign iaddr[31 : 24] = instr_addr_o[7 : 0];

    assign cur_instr[7 : 0] = inst[31 : 24];
    assign cur_instr[15 : 8] = inst[23 : 16];
    assign cur_instr[23 : 16] = inst[15 : 8];
    assign cur_instr[31 : 24] = inst[7 : 0];

    assign daddr[7 : 0] = data_addr_o[31 : 24];
    assign daddr[15 : 8] = data_addr_o[23 : 16];
    assign daddr[23 : 16] = data_addr_o[15 : 8];
    assign daddr[31 : 24] = data_addr_o[7 : 0];



    control_unit control_unit(
        .op(cur_instr[31 : 26]),
        .funct(cur_instr[5 : 0]),
        .zero(zero),
        .mem_to_reg(mem_to_reg),
        .mem_write(we),
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
        .instr(cur_instr[25 : 0]),
        .mem_to_reg(mem_to_reg),
        .pc_src(pc_src),
        .jump(jump),
        .alu_control(alu_control),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write_i(reg_write),
        .read_data(read_mem_data),
        .pc_o(instr_addr_o),
        .alu_res(data_addr_o),
        .zero(zero),
        .wd(write_mem_data)
    );
    
endmodule: MiniMIPS32
