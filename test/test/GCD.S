jal x0 .main


.gcd:
bne a1 x0 .down
jalr x0 0(ra)   # Return
.down:
div t0 a1 a0    # t0 will store remainder
mul t1 t0 a0
sub t0 a1 t1
addi sp sp -4    # Shift stack pointer
sw ra 0(sp)      # Only need to store the return address
add a1 a0 x0   # Update the arguments for next recursion call
add a0 t0 x0
jal x0 .gcd    # Recursion
lw ra 0(sp)    # Load the return address
addi sp sp 4
jalr x0 0(ra)  # Return


.main:
addi a0 x0 8
addi a1 x0 20
jal ra .gcd  # Answer will be stored in a0 (x10)