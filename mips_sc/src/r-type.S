   .set noat
   .set noreorder
   .globl main		#使用QtSpim时，需要将此句注释，注释采用#号

   .text
main:
   addiu $t0, $zero, 0x3	#$t0 = 3
   addiu $t1, $zero, 0x5	#$t1 = 5
   addiu $s1, $zero, 0x1	#$s1 = 1
   slt $s0, $t0, $t1		#$s0 = 1
   beq $s0, $s1, TEST1          #should branch
   addu $t2, $t0, $zero		#$t2 = 3(ERROR)
   j TESTEND
TEST1:
   addu $t3, $t1, $zero		#$t3 = 5(CORRECT)
TESTEND:
   j TESTEND
