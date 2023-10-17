.include "IHW1_lib.asm"

.data
	arr_A: .space 40
	arr_B: .space 40
	 
.text
main:
	# Register s1 stores the size of the array
	read_int(s1)
	check_n(s1)
	read_array(s1, arr_A)
	fill_array(s1, arr_A, arr_B)
	print_array(s1, arr_B)
	exit()
