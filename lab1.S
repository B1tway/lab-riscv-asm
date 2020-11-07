.data
N:
.word 4
M:
.word 2
matrix:
.word -1, -1, -1, 0
.word 2, 2, 2, 2
result:
.word 0

.text

main:
lw a2, N # load N
lw a3, M # load M 
la a4, matrix # load matrix_pointer 
la a5, result # load result_pointer 
call sum
sw a0, 0(a5) # save return_value to result 
call print
call exit
sum:
li t1, 0 # init sum
add t2, x0, a2 # init n counter
add t3, x0, a3 # init m counter
add t4, x0, a4 # init matrix_current pointer
cycle:
lw t5, 0(t4) #current value
bltz t5, next_value # if(0 < t5) sum += current
add t1, t1, t5
next_value: # decrement n counter and move the poiner to next value 
addi t2, t2, -1 
addi t4, t4, 4
bgez t2, cycle # if (0 >= n counter) если n >= 0, то мы находимся в той же строке - все хорошо   
addi t3, t3, -1
add t2, x0, a2
bgez t3, cycle # if (0 >= m counter) 
add a0, x0, t1 # return value = result 
ret
print:
li a0, 1                    # stdout 
lw a1, 0(a5)				# print_int ecall
ecall
ret

exit:
addi a0, x0, 10
ecall
