# Lab05 
# Colin Kelleher
# 11730336

# Left to right, Top to Bottom
# Square 1 = Top left = [1,4,3,2]
# Square 2 = Top right = [3,2,4,1]
# Square 3 = Bottom left = [4,1,2,3]
# Square 4 = Bottom right = [2,3,1,4]

.text 

li $v0, 4
la $a0, title
syscall


la $t1, MATRIX	# load the matrix
la $s5, 10
la $t2, 0
la $s7, 16
la $t9, 4


lb $t8, 0($t1)

print:
li $v0, 1       
add $a0,$t8,$zero
syscall
addi $t2,$t2,1
addi $t3,$t3,1
beq $s7,$t2, checkrow1   # if $s0 = $s2, goes to label2
beq $t9,$t3, printbsn   # if $s0 = $s2, goes to label2
jal nextInBoard

printbsn:
li $v0, 4
la $a0, bsn
syscall
la $t3, 0 
jal nextInBoard


nextInBoard:	
addi $t1, $t1, 4
lb $t8, 0($t1)
jal print



checkrow1:
	la $t1, MATRIX	# load the matrix
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	li $v0, 1        
	add $a0,$t9,$zero
	beq $t9, 10, checkrow2
	li $v0, 4
	la $a0, row1
	syscall
	bne $t9, 10, notvalidrow

checkrow2:
	la $t1, 0
	la $t9, 0
	la $t1, MATRIX	# load the matrix
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	move $t9, $t8
	addi $t1, $t1, 16
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	li $v0, 1        
	add $a0,$t9,$zero
	beq $t9, 10, checkrow3
	li $v0, 4
	la $a0, row2
	syscall
	bne $t9, 10, notvalidrow
	
checkrow3:
	la $t1, 0
	la $t9, 0
	la $t1, MATRIX	# load the matrix
	addi $t1, $t1, 32
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	li $v0, 1        
	add $a0,$t9,$zero
	beq $t9, 10, checkrow4
	li $v0, 4
	la $a0, row3
	syscall
	bne $t9, 10, notvalidrow

checkrow4:
	la $t1, 0
	la $t9, 0
	la $t1, MATRIX	# load the matrix
	addi $t1, $t1, 48
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	blt $t8,0, toosmall
	bgt $t8,4,toobig
	add $t9, $t9, $t8
	li $v0, 1        
	add $a0,$t9,$zero
	beq $t9, 10, checkcol1
	li $v0, 4
	la $a0, row4
	syscall
	bne $t9, 10, notvalidrow

checkcol1:
	la $t1, 0
	la $t9, 0
	la $t1, MATRIX	# load the matrix
	lb $t8, 0($t1) #checkcol
	add $t9, $t9, $t8 
	addi $t1, $t1, 16
	lb $t8, 0($t1)
	add $t9, $t9, $t8 
	addi $t1, $t1, 16
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 16
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	li $v0, 1        
	add $a0,$t9,$zero
	beq $t9, 10, checkcol2
	bne $t9, 10, notvalidrow

checkcol2:
	la $t1, 0
	la $t9, 0
	la $t1, MATRIX	# load the matrix
	addi $t1, $t1, 32
	lb $t8, 0($t1) #checkcol
	add $t9, $t9, $t8 #xxx
	addi $t1, $t1, 16
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 16
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	li $v0, 1        
	add $a0,$t9,$zero
	beq $t9, 10, checksquare1
	bne $t9, 10, notvalidrow

checksquare1:
	la $t1, MATRIX	# load the matrix
	lb $t8, 0($t1)
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 8
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	beq $t9, 10, checksquare2
	bne $t9, 10, notvalidrow
	
checksquare2:
	la $t1, MATRIX	# load the matrix
	addi $t1, $t1, 8
	lb $t8, 0($t1)
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	beq $t9, 10, checksquare3
	bne $t9, 10, notvalidrow

checksquare3:
	la $t1, MATRIX	# load the matrix
	addi $t1, $t1, 32
	lb $t8, 0($t1)
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 8
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	beq $t9, 10, checksquare4
	bne $t9, 10, notvalidrow
	
checksquare4:
	la $t1, MATRIX	# load the matrix
	addi $t1, $t1, 40
	lb $t8, 0($t1)
	move $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1,12
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	addi $t1, $t1, 4
	lb $t8, 0($t1)
	add $t9, $t9, $t8
	beq $t9, 10, validrow
	bne $t9, 10, notvalidrow

	
validrow:
	li $v0, 4
	la $a0, valid
	syscall
	jal exit

	
notvalidrow:
	li $v0, 4
	la $a0, notval
	syscall
	jal exit
	
toosmall:
	li $v0, 4
	la $a0, small
	syscall
	jal exit
	
toobig:			
	li $v0, 4
	la $a0, big
	syscall
	jal exit

exit:
				li $v0, 10	# exit gracefully
				syscall
###########   end of your code   #####################

.data 
MATRIX: 		.word 		1   4    3   2
			.word      	3   2    4   1
			.word      	4   1    2   3
			.word      	2   3    1   6
SIZE: 			.word  	4
valid:			.asciiz		"\n\nWell done! :)"
notval:			.asciiz		" NOT VALID"
bsn:			.asciiz 	"\n"
row1: 			.asciiz 	"\nError in row #1 - therefore"
row2: 			.asciiz 	"\nError in row #2 - therefore"
row3: 			.asciiz 	"\nError in row #3 - therefore"
row4: 			.asciiz 	"\nError in row #4 - therefore"
small: 			.asciiz 	"\nValue in Sudoku smaller than 0"
big: 			.asciiz 	"\nValue in Sudoku bigger than 4"
title: 			.asciiz 	"Sudoku Checker\n"
