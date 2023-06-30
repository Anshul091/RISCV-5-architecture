# Ishant Sihag
# 2021CSB1098

addi x3 x0 10
lui x12 0x10000
lui x16 0x10001
lui x17 0x10002
jal x0 .main

.random:
	addi x14 x0 35
	slli x13 x12 21
    xor x12 x12 x13
    srl x13 x12 x14
    xor x12 x12 x13
    slli x13 x12 4
    xor x12 x12 x13
    jalr x0 x1 0



.merge:
	#x13 x14 x15 x21 x22
    # l   r   m  n1  n2

    sub x21 x15 x13
    addi x21 x21 1
    sub x22 x14 x15
    lui x16 0x10001
	lui x17 0x10002
    lui x18 0x10003
	lui x19 0x10004
    
    add x30 x13 x13
    add x30 x30 x30
    add x17 x17 x30
    add x5 x0 x0            # x5 = i
    add x6 x21 x0           # x6 = n
    .loop1merge:
        beq x6 x0 quitl1
    	lw x23 0(x17)
        sw x23 0(x18)
        addi x17 x17 4
        addi x18 x18 4
        
        
        addi x5 x5 1
        blt x5 x6 .loop1merge
    quitl1:
    
    lui x16 0x10001
	lui x17 0x10002
    lui x18 0x10003
	lui x19 0x10004
    
    add x30 x15 x15
    add x30 x30 x30
    add x17 x17 x30
    addi x17 x17 4
    add x5 x0 x0
    add x6 x22 x0
    .loop2merge:
        beq x6 x0 quitl2
    	lw x23 0(x17)
        sw x23 0(x19)
        addi x17 x17 4
        addi x19 x19 4
        
        
        addi x5 x5 1
        blt x5 x6 .loop2merge
    quitl2:
    
    lui x16 0x10001
	lui x17 0x10002
    lui x18 0x10003
	lui x19 0x10004
    
    add x5 x0 x0                # x5 = i
    add x6 x0 x0                # x6 = j
    add x30 x13 x13
    add x30 x30 x30
    add x17 x17 x30
    
    loop3:
        bge x5 x21 exitLoop3
        bge x6 x22 exitLoop3
            add x30 x5 x5
            add x30 x30 x30
            add x23 x30 x18
            add x30 x6 x6
            add x30 x30 x30
            add x24 x30 x19
            lw x25 0(x23)
            lw x26 0(x24)
            bgt x25 x26 cond1
                sw x25 0(x17)
                addi x17 x17 4
                addi x5 x5 1
            cond1:
            ble x25 x26 cond2
                sw x26 0(x17)
                addi x17 x17 4
                addi x6 x6 1
            cond2:
        jal x0 loop3
    
    exitLoop3:
    
   
    
    loop4:
    	bge x5 x21 exitLoop4
            add x30 x5 x5
            add x30 x30 x30
            add x23 x30 x18
            add x30 x6 x6
            add x30 x30 x30
            add x24 x30 x19
            lw x25 0(x23)
            lw x26 0(x24)
            sw x25 0(x17)
            addi x17 x17 4
            addi x5 x5 1
            jal x0 loop4
	exitLoop4:
    loop5:
    	bge x6 x22 exitLoop5
        
            add x30 x5 x5
            add x30 x30 x30
            add x23 x30 x18
            add x30 x6 x6
            add x30 x30 x30
            add x24 x30 x19
            lw x25 0(x23)
            lw x26 0(x24)
            sw x26 0(x17)
            addi x17 x17 4
            addi x6 x6 1
            jal x0 loop5
	exitLoop5:
    
    
    
    
	jalr x0 x1 0


.mergeSort:
	bge x13 x14 cond
        sub x15 x14 x13
        srli x15 x15 1
        add x15 x15 x13

        # store backup
        addi x2 x2 -16
        sw x13 0(x2)
        sw x14 4(x2) 
        sw x15 8(x2)
        sw x1 12(x2)

        add x14 x0 x15
        jal x1 .mergeSort

        lw x13 0(x2)
        lw x14 4(x2) 
        lw x15 8(x2)
        lw x1 12(x2)

        addi x13 x15 1
        jal x1 .mergeSort

        lw x13 0(x2)
        lw x14 4(x2) 
        lw x15 8(x2)
        lw x1 12(x2)


        jal x1 .merge
        
        lw x13 0(x2)
        lw x14 4(x2) 
        lw x15 8(x2)
        lw x1 12(x2)

        addi x2 x2 16
    cond:
	jalr x0 x1 0
    
    
.main:
	add x5 x0 x3
    add x31 x0 x0
    .loop:
        jal x1 .random
        sw x12 0(x16)
        sw x12 0(x17)
        addi x31 x31 1
        addi x16 x16 4
        addi x17 x17 4
        addi x5 x5 -1
        bne x5 x0 .loop
    
    lui x16 0x10001
    lui x17 0x10002
    
    add x13 x0 x0
    addi x14 x3 -1
    jal x1 .mergeSort


