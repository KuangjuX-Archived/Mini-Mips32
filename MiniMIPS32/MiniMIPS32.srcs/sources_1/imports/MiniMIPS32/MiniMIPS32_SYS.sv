`include "defines.sv"

module MiniMIPS32_SYS(
    input logic sys_clk,
    input logic sys_rst_n,
    output logic led_r,
    output logic led_g
    );
    
    logic [31:0] iaddr;
    logic [31:0] inst;
    logic [31:0] daddr;
    logic we;
    logic [31:0] din;
    logic [31:0] dout;
    // logic we_dram;
    
    // 地址0x80000000对应红灯，地址0x80040000对应绿灯，地址0x10000000开始存放数据
    // assign we_dram = (daddr[31] == 1'b1) ? 1'b0 : we;
    logic led_r_reg, led_g_reg;
    always_ff @(posedge sys_clk) begin
        if (!sys_rst_n) {led_r_reg, led_g_reg} <= 2'b00;
        else if (daddr[31:16] == 16'h8000) {led_r_reg, led_g_reg} <= {din[0], led_g_reg};
        else if (daddr[31:16] == 16'h8004) {led_r_reg, led_g_reg} <= {led_r_reg, din[0]};
        else {led_r_reg, led_g_reg} <= {led_r_reg, led_g_reg};
    end
    assign led_r = led_r_reg;
    assign led_g = led_g_reg;

    MiniMIPS32 CPU (
        .cpu_clk(sys_clk),
        .cpu_rst_n(sys_rst_n),
        .iaddr(iaddr),
        .inst(inst),
        .daddr(daddr),
        .we(we),
        .din(din),
        .dout(dout)
    );
    
    inst_rom inst_rom (
        .a(iaddr[9:2]),  // input wire [9 : 2] a
        .spo(inst)  // output wire [31 : 0] spo
    );
    
    data_ram data_ram (
        .a(daddr[9:2]),      // input wire [9 : 2] a
        .d(din),      // input wire [31 : 0] d
        .clk(sys_clk),  // input wire clk
        .we(we),    // input wire we
        .spo(dout)  // output wire [31 : 0] spo
    );


endmodule: MiniMIPS32_SYS
