`timescale 1ns / 1ps

/*------------------- ȫ�ֲ��� -------------------*/
`define RST_ENABLE      1'b0                // ��λ�ź���Ч  RST_ENABLE
`define RST_DISABLE     1'b1                // ��λ�ź���Ч
`define ZERO_WORD       32'h00000000        // 32λ����ֵ0
`define ZERO_DWORD      64'b0               // 64λ����ֵ0
`define WRITE_ENABLE    1'b1                // ʹ��д
`define WRITE_DISABLE   1'b0                // ��ֹд
`define READ_ENABLE     1'b1                // ʹ�ܶ�
`define READ_DISABLE    1'b0                // ��ֹ��
`define ALUCTRL_BUS     2 : 0               // ����׶ε����ALUCTRL�Ŀ��
`define ALUOP_BUS       2 : 0               // ����׶ε�һ�����������ALUOP�Ŀ��
`define SHIFT_ENABLE    1'b1                // ��λָ��ʹ�� 
`define TRUE_V          1'b1                // �߼�"��"  
`define FALSE_V         1'b0                // �߼�"��"   
`define WORD_BUS        31: 0               // 32λ��
`define RT_ENABLE       1'b0                // rtѡ��ʹ��
`define SIGNED_EXT      1'b1                // ������չʹ��
`define IMM_ENABLE      1'b1                // ������ѡ��ʹ��
`define MREG_ENABLE     1'b1                // д�ؽ׶δ洢�����ѡ���ź�
/************************ת��ָ����� begin*******************************/
`define JUMP_BUS        25: 0               // J��ָ������instr_index�ֶεĿ��
/*********************** ת��ָ����� end*********************************/
/************************UPDATE--����PC��ʼֵ*******************************/
`define PC_INIT         32'h00000000        // PC��ʼֵ
/************************UPDATE--����PC��ʼֵ*******************************/

/*------------------- ָ���ֲ��� -------------------*/
`define INST_ADDR_BUS   31: 0               // ָ��ĵ�ַ���
`define INST_BUS        31: 0               // ָ������ݿ��

// �ڲ�������ALUControl
`define MINIMIPS32_ADD             3'b010
`define MINIMIPS32_BEQ             3'b110 
`define MINIMIPS32_BNE             3'b100
`define MINIMIPS32_OR              3'b001
`define MINIMIPS32_SLT             3'b111
`define MINIMIPS32_LUI             3'b000

/*------------------- ͨ�üĴ����Ѳ��� -------------------*/
`define REG_BUS         31: 0               // �Ĵ������ݿ��
`define REG_ADDR_BUS    4 : 0               // �Ĵ����ĵ�ַ���
`define REG_NUM         32                  // �Ĵ�������32��
`define REG_NOP         5'b00000            // ��żĴ���
