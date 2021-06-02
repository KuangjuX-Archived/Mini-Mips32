   .set noat
   .set noreorder
   .globl main		#使用QtSpim时，需要将此句注释，注释采用#号

   .text
main:
   addiu $s0,$zero,1

   bne $s0, $s0, Next1   # should not branch
   bne $s0, $s1, Next2   # shoud branch

Next1:
   ori $t0, 0x1234	# ERROR:$t0 = 0x1234
   j BEQTEST
Next2:
   ori $t1, 0x5678	# CORRECT:$t1 = 0x5678

BEQTEST:
   beq $s0, $s1, Next3   # should not branch
   beq $s0, $s0, Next4   # shoud branch 

Next3:
   ori $t2, 0x9ABC	# ERROR:$t2 = 0x9ABC
   j TESTEND
Next4:
   ori $t3, 0xDEFF	# CORRECT:$t3 = 0xDEFF
TESTEND:
   j TESTEND
