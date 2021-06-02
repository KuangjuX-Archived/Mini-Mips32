#################################################################################
#本程序实现从地址0x10000000开始的8个字的降序排序
#################################################################################			
  .set noat
  .set noreorder
  .globl main		#使用QtSpim时，需要将此句注释，注释采用#号
 .data
testdata: .word -25, -30, 16, 24, -64, 35, 42, 66
 .text
main:
 la $s0,testdata  	#$s0=0x10000000; la是伪指令，它将被转化为两条汇编指令：lui s0,0x1000和addiu s0,s0,0
 ori $s1,$s0,0x1C   #排序区间 $s1=0x1000001C
sort_loop:
 lw $s3,0($s0)     
 lw $s4,0($s1)
 slt $t0,$s3,$s4
 beq $t0,$0,sort_next   #降序排序
 sw $s3, 0($s1)
 sw $s4, 0($s0)   
sort_next:
 addiu $s1, $s1, -4   
 bne $s0, $s1, sort_loop  
 
 addiu $s0,$s0,4     
 la $t0,testdata	#la是伪指令，它将被转化为两条汇编指令：lui t0,0x1000和addiu t0,t0,0
 ori $t1,$zero,0x1C
 addu $s1,$t0,$t1
 bne $s0, $s1, sort_loop  
 la $s0,testdata	#la是伪指令，它将被转化为两条汇编指令：lui s0,0x1000和addiu s0,s0,0
 lw $t0,  0($s0)
 lw $t1,  4($s0)
 lw $t2,  8($s0)
 lw $t3, 12($s0)
 lw $t4, 16($s0)
 lw $t5, 20($s0)
 lw $t6, 24($s0)
 lw $t7, 28($s0)  

sort_end:
 j sort_end    
