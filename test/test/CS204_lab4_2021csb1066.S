# Name: Anant Prakash Singh
# Entry No.: 2021CSB1066


ADDI x20 x0 50        # Putting the value of N in the resistor
ADD x7 x0 x20         # x7 for storing the value of N
LUI x31 0x10002       # Storing the sorted array
LUI x4 0x10000        # Seed to generate random numbers
LUI x30 0x10001       # Storing the array initially




.main:
JAL x1 .generateRandomNumbers
LUI x30 0x10001
LUI x31 0x10002
ADD x10 x0 x31
SLLI x11 x20 2
ADD x11 x11 x31
ADDI x11 x11 -4
JAL x1 .MergeSort
JAL x0 .exit


.generateRandomNumbers:
SRAI x5 x4 17
XOR x4 x4 x5
SRAI x5 x4 16
XOR x4 x4 x5
SLLI x5 x4 18
XOR x4 x4 x5
SRLI x5 x4 3
XOR x4 x4 x5
SW x4 0(x30)
SW x4 0(x31)
ADDI x30 x30 4
ADDI x31 x31 4
ADDI x7 x7 -1
BNE x7 x0 .generateRandomNumbers
JALR x0 0(x1)






.MergeSort:
BNE x10 x11 .notSorted
JALR x0 0(x1)
.notSorted:
ADD x4 x10 x11          # x4 is mid
SRAI x4 x4 3            # dividing mid by 8
SLLI x4 x4 2            # multiplying mid by 4
ADDI x2 x2 -12          # shifting the stack pointer
SW x1 8(x2)
SW x10 4(x2)
SW x11 0(x2)
# Now updating the function arguments
ADD x11 x4 x0
JAL x1 .MergeSort   # Sort left Part
LW x1 8(x2)            # Loading return address
LW x10 4(x2)           # Loading values of x10 and x11 (func. args)
LW x11 0(x2)
ADD x4 x10 x11          # x4 is mid
SRAI x4 x4 3            # dividing mid by 8
SLLI x4 x4 2            # multiplying mid by 4
ADDI x10 x4 4
JAL x1 .MergeSort   # Sort right Part
LW x1 8(x2)            # Loading return address
LW x10 4(x2)           # Loading values of x10 and x11 (func. args)
LW x11 0(x2)
ADD x4 x10 x11          # x4 is mid
SRAI x4 x4 3            # dividing mid by 8
SLLI x4 x4 2            # multiplying mid by 4
ADD x21 x10 x0          # left pointer -> i
ADDI x22 x4 4		 	# right pointer -> j
ADD x29 x3 x0 			# To store copy of heap pointer (x3)
ADDI x7 x0 2            # to store const. TWO
.loop:
ADD x23 x0 x0
BGT x21 x4 .condition1
	ADDI x23 x0 1
.condition1:
ADD x24 x0 x0
BGT x22 x11 .condition2
	ADDI x24 x0 1
.condition2:
ADD x25 x23 x24     # OR of i <= mid, j <= end
BEQ x25 x0 .break
	BLT x25 x7 .leftElements
    LW x18 0(x21)       # *i
    LW x19 0(x22) 		# *j
    BLE x18 x19 .iIsGreater
    	ADD x17 x19 x0        # cur = *j
        ADDI x22 x22 4        # j += 4
        JAL x0 .comparisonDone
.iIsGreater:
		ADD x17 x18 x0        # cur = *i
        ADDI x21 x21 4        # i += 4
        JAL x0 .comparisonDone

        
.leftElements:
	BGT x21 x4 .rightElements
    	LW x18 0(x21)     	  # *i
		ADD x17 x18 x0        # cur = *i
        ADDI x21 x21 4        # i += 4
.rightElements:
	BGT x22 x11 .comparisonDone
    	LW x19 0(x22) 	     	# *j
    	ADD x17 x19 x0        	# cur = *j
        ADDI x22 x22 4        	# j += 4

.comparisonDone:
		SW x17 0(x3)
        ADDI x3 x3 4
        JAL x0 .loop


.break:

# Copying the sorted merged array
.copy:
LW x6 0(x29)        # Loading the sorted merged value
SW x6 0(x10)        # Storing the sorted merged value
ADDI x29 x29 4
ADDI x10 x10 4
BLT x29 x3 .copy
# Elements copied.
ADDI x2 x2 12       # Shift back the stack pointer
JALR x0 0(x1)  	 	# RETURN :D




.exit: