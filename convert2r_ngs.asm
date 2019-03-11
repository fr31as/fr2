.data
out_string: .asciiz "abcd1234"
out_string_end:

.text
.main:
    li $v0 4
    la $a0, out_string
    syscall 
    
    la $a1, out_string_end
    la $a2, out_string
    li $t2, 1
    sub $t0, $a1, $a2 
    add $a1, $a1, $t0 
    sub $a1, $a1, $t2
    
LOOP:
    lb $t1, ($a0) #lb == load byte
    sb $t1, ($a1) #sb == store byte

    addi $a0, $a0, 1
    subi $t0, $t0, 1
    subi $a1, $a1, 1
    
    bgtz $t0, LOOP 
    
    la $a1, out_string_end
    la $a2, out_string
    li $t2, 1
    sub $t0, $a1, $a2
    add $a1, $a1, $t2 #null
LOOP2:
    lb $t1, ($a1)
    sb $t1, ($a2)
    subi $t0, $t0, 1
    addi $a1, $a1, 1
    addi $a2, $a2, 1
    bgtz $t0, LOOP2
    
    li $v0 4
    la $a0, out_string
    syscall
    
    li $v0, 10
    syscall
    
