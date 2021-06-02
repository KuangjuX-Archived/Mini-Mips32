   .set noat
   .set noreorder
   .globl main		#使用QtSpim时，需要将此句注释，注释采用#号
   .data
ans:
   .word 0x12345678, 0x8899AABB, 0xEEFF6677, 0xCCDD2233

   .text
main:
   lw	$t0,  0($s0)	# $t0 = 0x12345678
   lw	$t1,  4($s0)	# $t0 = 0x8899AABB
   lw	$t2,  8($s0)	# $t0 = 0xEEFF6677
   lw	$t3, 12($s0)	# $t0 = 0xCCDD2233
   sw	$t0, 16($s0)
   sw	$t1, 20($s0)
   sw	$t2, 24($s0)
   sw	$t3, 28($s0)
   lw	$t4, 16($s0)	# $t4 = 0x12345678
   lw	$t5, 20($s0)	# $t5 = 0x8899AABB
   lw	$t6, 24($s0)	# $t6 = 0xEEFF6677
   lw	$t7, 28($s0)	# $t7 = 0xCCDD2233

