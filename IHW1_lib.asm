# Проверка корректности введённого количества чисел(%x - количество чисел)
.macro check_n(%x)
	blez %x input_error
	li t0 10
	bgt %x t0 input_error
	j passed
	
input_error:
	print_str("Ошибка! Некорректные входные данные")
	exit()
		
passed:
.end_macro

# Заполнене массива(%x - размер массивов, %y - массив A, из которого берутся элементы, %z - массив B, который заполняется)
.macro fill_array(%x, %y, %z)
	la t0 %y
	addi t0 t0 4
	li t1 1
	la t2 %z

# Заполнение числами, стоящими на нечётных местах
loop_fill_odd:
	lw t3 (t0)
	sw t3 (t2)
	
	addi t0 t0 8
    addi t1 t1 2
    addi t2 t2 4
    
    blt t1 %x loop_fill_odd
    
	la t0 %y
	li t1 0 
	
# Заполнение числами, стоящими на чётных месте
loop_fill_even:
	lw t3 (t0)
	sw t3 (t2)
	
	addi t0 t0 8
    addi t1 t1 2
    addi t2 t2 4
    
    blt t1 %x loop_fill_even
.end_macro
	

# Ввод массива(%x - размер массива, %y - массив для ввода)
.macro read_array(%x, %y)
	la t0 %y
	li t1 0 
	
loop_read:
	print_str("Введите элемент массива: ")
	read_int_a0()
	
	sw a0 (t0)
	addi t0 t0 4
    addi t1 t1 1
    
    blt t1 %x loop_read
.end_macro

# Вывод массива(%x - размер массива, %y - выводимый массив)
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

# Вывод числа из регистра %x
.macro print_int(%x)
	li a7 1
	mv a0 %x
	ecall
.end_macro

# Ввод числа в регистр %x
.macro read_int(%x)
   push(a0)
   li a7 5
   ecall
   mv %x a0
   pop(a0)
.end_macro

# Ввод числа в регистр a0
.macro read_int_a0()
   li a7 5
   ecall
.end_macro

# Вывод строки %x
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

# Вывод символа %x
.macro print_char(%x)
   li a7 11
   li a0 %x
   ecall
.end_macro

# Перевод строки
.macro newline
	print_char('\n')
.end_macro

# Вывод пробела
.macro space
	print_char(' ')
.end_macro

# Завершение программы
.macro exit
    li a7 10
    ecall
.end_macro

# Сохранение на стеке значения в регистре %x
.macro push(%x)
	addi sp sp -4
	sw %x (sp)
.end_macro

# Освобождение стека и сохранение убранного значения в регистре %x
.macro pop(%x)
	lw %x (sp)
	addi sp sp 4
.end_macro
	
