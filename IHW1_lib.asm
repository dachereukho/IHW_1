# Ïðîâåðêà êîððåêòíîñòè ââåä¸ííîãî êîëè÷åñòâà ÷èñåë(%x - êîëè÷åñòâî ÷èñåë)
.macro check_n(%x)
	blez %x input_error
	li t0 10
	bgt %x t0 input_error
	j passed
	
input_error:
	print_str("Îøèáêà! Íåêîððåêòíûå âõîäíûå äàííûå")
	exit()
	
passed:
.end_macro

# Çàïîëíåíå ìàññèâà(%x - ðàçìåð ìàññèâîâ, %y - ìàññèâ A, èç êîòîðîãî áåðóòñÿ ýëåìåíòû, %z - ìàññèâ B, êîòîðûé çàïîëíÿåòñÿ)
.macro fill_array(%x, %y, %z)
	la t0 %y
	addi t0 t0 4
	li t1 1
	la t2 %z

# Çàïîëíåíèå ÷èñëàìè, ñòîÿùèìè íà íå÷¸òíûõ ìåñòàõ
loop_fill_odd:
	lw t3 (t0)
	sw t3 (t2)
	
	addi t0 t0 8
    addi t1 t1 2
    addi t2 t2 4
    
    blt t1 %x loop_fill_odd
    
	la t0 %y
	li t1 0 
	
# Çàïîëíåíèå ÷èñëàìè, ñòîÿùèìè íà ÷¸òíûõ ìåñòå
loop_fill_even:
	lw t3 (t0)
	sw t3 (t2)
	
	addi t0 t0 8
    addi t1 t1 2
    addi t2 t2 4
    
    blt t1 %x loop_fill_even
.end_macro
	

# Ââîä ìàññèâà(%x - ðàçìåð ìàññèâà, %y - ìàññèâ äëÿ ââîäà)
.macro read_array(%x, %y)
	la t0 %y
	li t1 0 
	
loop_read:
	print_str("Ââåäèòå ýëåìåíò ìàññèâà: ")
	read_int_a0()
	
	sw a0 (t0)
	addi t0 t0 4
    addi t1 t1 1
    
    blt t1 %x loop_read
.end_macro

# Âûâîä ìàññèâà(%x - ðàçìåð ìàññèâà, %y - âûâîäèìûé ìàññèâ)
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

# Âûâîä ÷èñëà èç ðåãèñòðà %x
.macro print_int(%x)
	li a7 1
	mv a0 %x
	ecall
.end_macro

# Ââîä ÷èñëà â ðåãèñòð %x
.macro read_int(%x)
   push(a0)
   li a7 5
   ecall
   mv %x a0
   pop(a0)
.end_macro

# Ââîä ÷èñëà â ðåãèñòð a0
.macro read_int_a0()
   li a7 5
   ecall
.end_macro

# Âûâîä ñòðîêè %x
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

# Âûâîä ñèìâîëà %x
.macro print_char(%x)
   li a7 11
   li a0 %x
   ecall
.end_macro

# Ïåðåâîä ñòðîêè
.macro newline
	print_char('\n')
.end_macro

# Âûâîä ïðîáåëà
.macro space
	print_char(' ')
.end_macro

# Çàâåðøåíèå ïðîãðàììû
.macro exit
    li a7 10
    ecall
.end_macro

# Ñîõðàíåíèå íà ñòåêå çíà÷åíèÿ â ðåãèñòðå %x
.macro push(%x)
	addi sp sp -4
	sw %x (sp)
.end_macro

# Îñâîáîæäåíèå ñòåêà è ñîõðàíåíèå óáðàííîãî çíà÷åíèÿ â ðåãèñòðå %x
.macro pop(%x)
	lw %x (sp)
	addi sp sp 4
.end_macro
	
