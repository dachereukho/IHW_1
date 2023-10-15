# Checking the correctness of the entered amount of numbers (%x - amount of numbers)
.macro check_n(%x)
	blez %x input_error
	li t0 10
	bgt %x t0 input_error
	j passed
	
input_error:
	print_str("Error! Invalid input data")
	exit()
		
passed:
.end_macro

# Filling the array(%x - size of the arrays, %y - array A from which elements are taken, %z - array B which is filled)
.macro fill_array(%x, %y, %z)
	la t0 %y
	addi t0 t0 4
	li t1 1
	la t2 %z

	li t3 1
	beq %x t3 single

# Filling with numbers in odd places
loop_fill_odd:
	lw t3 (t0)
	sw t3 (t2)
	
	addi t0 t0 8
    addi t1 t1 2
    addi t2 t2 4
    
    blt t1 %x loop_fill_odd

single:
	la t0 %y
	li t1 0 
	
# Filling with numbers in even places
loop_fill_even:
	lw t3 (t0)
	sw t3 (t2)
	
	addi t0 t0 8
    addi t1 t1 2
    addi t2 t2 4
    
    blt t1 %x loop_fill_even
.end_macro
	

# Array input(%x - array size, %y - input array)
.macro read_array(%x, %y)
	la t0 %y
	li t1 0 
	
loop_read:
	read_int_a0()
	
	sw a0 (t0)
	addi t0 t0 4
    addi t1 t1 1
    
    blt t1 %x loop_read
.end_macro

# Output array(%x - array size, %y - output array)
.macro print_array(%x, %y)
	la t0 %y
	li t1 0
	
loop_print:
	lw t2 (t0)
	print_int(t2)
	space()
	
	addi t0 t0 4
    addi t1 t1 1
    blt t1 %x loop_print
    
.end_macro

# Output a number from register %x
.macro print_int(%x)
	li a7 1
	mv a0 %x
	ecall
.end_macro

# Input a number into register %x
.macro read_int(%x)
   push(a0)
   li a7 5
   ecall
   mv %x a0
   pop(a0)
.end_macro

# Input a number into register a0
.macro read_int_a0()
   li a7 5
   ecall
.end_macro

# Print the string %x
.macro print_str(%x)
   .data
str:
   .asciz %x
   .text
   push (a0)
   li a7 4
   la a0 str
   ecall
   pop	(a0)
   .end_macro

# Print the symbol %x
.macro print_char(%x)
   li a7 11
   li a0 %x
   ecall
.end_macro

# Go to new line
.macro newline
	print_char('\n')
.end_macro

# Output space
.macro space
	print_char(' ')
.end_macro

# End the program
.macro exit
    li a7 10
    ecall
.end_macro

# Storing the value in register %x on the stack
.macro push(%x)
	addi sp sp -4
	sw %x (sp)
.end_macro

# Free the stack and store the removed value in register %x
.macro pop(%x)
	lw %x (sp)
	addi sp sp 4
.end_macro
	
