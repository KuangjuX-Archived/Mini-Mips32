`timescale 1ns / 1ps

/*------------------- 全局参数 -------------------*/
`define RST_ENABLE      1'b0                // 复位信号有效  RST_ENABLE
`define RST_DISABLE     1'b1                // 复位信号无效
`define ZERO_WORD       32'h00000000        // 32位的数值0
`define ZERO_DWORD      64'b0               // 64位的数值0
`define WRITE_ENABLE    1'b1                // 使能写
`define WRITE_DISABLE   1'b0                // 禁止写
`define READ_ENABLE     1'b1                // 使能读
`define READ_DISABLE    1'b0                // 禁止读
`define ALUCTRL_BUS     2 : 0               // 译码阶段的输出ALUCTRL的宽度
`define ALUOP_BUS       2 : 0               // 译码阶段第一级译码产生的ALUOP的宽度
`define SHIFT_ENABLE    1'b1                // 移位指令使能 
`define TRUE_V          1'b1                // 逻辑"真"  
`define FALSE_V         1'b0                // 逻辑"假"   
`define WORD_BUS        31: 0               // 32位宽
`define RT_ENABLE       1'b0                // rt选择使能
`define SIGNED_EXT      1'b1                // 符号扩展使能
`define IMM_ENABLE      1'b1                // 立即数选择使能
`define MREG_ENABLE     1'b1                // 写回阶段存储器结果选择信号
/************************转移指令添加 begin*******************************/
`define JUMP_BUS        25: 0               // J型指令字中instr_index字段的宽度
/*********************** 转移指令添加 end*********************************/
/************************UPDATE--更改PC初始值*******************************/
`define PC_INIT         32'h00000000        // PC初始值
/************************UPDATE--更改PC初始值*******************************/

/*------------------- 指令字参数 -------------------*/
`define INST_ADDR_BUS   31: 0               // 指令的地址宽度
`define INST_BUS        31: 0               // 指令的数据宽度

// 内部操作码ALUControl
`define MINIMIPS32_ADD             3'b010
`define MINIMIPS32_BEQ             3'b110 
`define MINIMIPS32_BNE             3'b100
`define MINIMIPS32_OR              3'b001
`define MINIMIPS32_SLT             3'b111
`define MINIMIPS32_LUI             3'b000

/*------------------- 通用寄存器堆参数 -------------------*/
`define REG_BUS         31: 0               // 寄存器数据宽度
`define REG_ADDR_BUS    4 : 0               // 寄存器的地址宽度
`define REG_NUM         32                  // 寄存器数量32个
`define REG_NOP         5'b00000            // 零号寄存器
