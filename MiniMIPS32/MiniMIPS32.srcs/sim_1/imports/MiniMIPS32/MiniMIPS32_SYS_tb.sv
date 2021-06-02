`timescale 1ns / 1ps

`define CLK_PERIOD 40
module MiniMIPS32_SYS_tb();

    logic sys_clk;
    logic sys_rst_n;
    logic led_r;
    logic led_g;
    
    MiniMIPS32_SYS SoC (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .led_r(led_r),
        .led_g(led_g)
    );
        
    initial begin
        // Initialize Inputs
        sys_clk = 0;
        sys_rst_n = 0;
        #400
        sys_rst_n = 1;     
        
            
        #15000 $stop;
    end
        
    always #(`CLK_PERIOD/2) sys_clk = ~sys_clk;

endmodule
