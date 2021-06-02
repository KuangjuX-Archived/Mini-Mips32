`include "defines.sv"

module MiniMIPS32(
    input  logic cpu_clk,
    input  logic cpu_rst_n,
    output logic [31:0] iaddr,
    input  logic [31:0] inst,
    output logic [31:0] daddr,
    output logic we,
    output logic [31:0] din,
    input  logic [31:0] dout
    );
    
    
endmodule
