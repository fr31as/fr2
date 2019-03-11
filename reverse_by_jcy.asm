.data
out_string: .asciiz "\don't convert this string! DON'T CONVERT THIS STRING!"
out_string_end:

.text
.main:
	li $v0 4
	la $a0, out_string
	syscall
	
	la $a1, out_string_end
	la $a2, out_string
	sub $t0, $a1, $a2
	la $t6, out_string_end
	la $t7, out_string_end
	li $t1, 1

LOOP:	
	sub $t3, $a1, $t1
	la $a3, out_string_end
	add $t4, $a3, $t1
	subi $t4, $t4, 1
	lb $t2, ($t3) ###
	sb $t2, ($t4) ###
	
	addi $t1, $t1, 1
	subi $t0, $t0, 1
	bgtz $t0, LOOP
	

	li $v0, 4
	la $t5, out_string_end
	addi $t5, $t5, 1
	la $a0, ($t5)
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
