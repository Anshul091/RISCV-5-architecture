#Anshul Mittal
#2021csb1070
addi x1, x0, 0 #Initialising x1 with 0
addi x2, x0, 1 #Initialising x2 with 1
addi x3, x0, 10 #Storing the value of x3 in N
addi x6, x0, 2 #Storing the value of index in x6
bgt x3, x2, loop
add x2, x0, x3
addi x1, x2, -1
beq x2, x3, exit
loop:
add x4, x2, x1
addi x1, x2, 0
addi x2, x4, 0
addi x6, x6, 1
bge x3, x6, loop
exit: