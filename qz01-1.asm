.data

.text
.main:
    li $s0, 7
    li $s1, 3
    li $s2, 1
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    
    la $t0, ($s0)
    la $t1, ($s0)
    
loop:
    blt $t0, 2, skip
    add $s0, $s0, $t1
    subi $t0, $t0, 1
skip:
    bgt $t0, 1, loop
    add $s2, $s0, $s1