.data
out_string: .asciiz "\don't convert this string! DON'T CONVERT THIS STRING!\n"
out_string_end:

.text
.main:
	li $v0 4
	la $a0, out_string
	syscall #syscall with $v0 == 4 : print string from $a0
	
	#calculate length of out_string. note that it will include 'end of string' (because of ascii 'z')
	la $a1, out_string_end #la == load address
	la $a2, out_string
	sub $t0, $a1, $a2
LOOP:
	lb $t1, ($a0) #lb == load byte
	
	#A == 65, Z == 90
	blt $t1, 65, SKIP #if $t1 is less than 65, branch to SKIP (not alphabet)
	bgt $t1, 122, SKIP #if $t1 is greater than 122, branch to SKIP (not alphabet)
	blt $t1, 97, LOOP2 #not capital letter
	
	#A == 65, Z == 90, a == 97, z == 122
	subi $t1, $t1, 32 #convert to small letters
	sb $t1, ($a0) #sb == store byte
	j SKIP
	
LOOP2:
	bgt $t1, 90, SKIP #if not an alphabet, branch to SKIP
	addi $t1, $t1, 32
	sb $t1, ($a0)
	
SKIP:
	addi $a0, $a0, 1
	subi $t0, $t0, 1
	
	bgtz $t0, LOOP #if $t0 is greater than zero, branch to LOOP
	
	li $v0 4
	la $a0, out_string
	syscall
	
	li $v0, 10
	syscall
