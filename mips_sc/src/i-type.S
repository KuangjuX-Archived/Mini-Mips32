   .set noat
   .set noreorder
   .globl main		#使用QtSpim时，需要将此句注释，注释采用#号

   .text
main:
   lui $s0, 0x1122		#$s0 = 0x1122
   ori $s0, $s0, 0x3344		#$s0 = 0x11223344
   lui $s1, 0xABCD		#$s1 = 0xABCD
   addiu $s1, $s1, 0x78EF	#$s1 = 0xABCD78EF
   addiu $s2, $zero, 0xFF56 	#$s2 = 0xFF56
   
   

