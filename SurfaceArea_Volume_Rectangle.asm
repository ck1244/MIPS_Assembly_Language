#  Example to compute the volume and surface area
#  of a rectangular

#
#
#	Colin Kelleher
#	117303363	
#
#
# -----------------------------------------------------
#  Text/code Section

.text
.globl    main

main:
#------
#Reading inputs from the user

#Asking user to enter the measurement of side A
li $v0, 4
la $a0, str3
syscall
#Taking in the value of sie A and saving it in 'aSide' for calculation
li $v0, 5
syscall   
sw $v0, aSide    
#Asking user to enter the measurement of side B
li $v0, 4
la $a0, str4
syscall
#Taking in the value of sie B and saving it in 'bSide' for calculation
li $v0, 5
syscall   
sw $v0, bSide
#Asking user to enter the measurement of side C
li $v0, 4
la $a0, str5
syscall
#Taking in the value of sie B and saving it in 'bSide' for calculation
li $v0, 5
syscall   
sw $v0, cSide  

# -----
#  Load variables into registers.
lw   $t0, aSide
lw   $t1, bSide
lw   $t2, cSide
lw   $v1, VAL
# ----
#  Find volume of a rectangular paralllelpiped.
#    volume = aside * bside * cside

mul  $t3, $t0, $t1
mul  $t4, $t3, $t2
sw   $t4, volume
# -----
#  Find surface area of a rectangular parallelepiped.
#    surfaceArea = 2*(aSide*bside+aside*cSide+bSide*cside)
#   <<<<<<<<<< Writer Your Code Here >>>>>>>>>> 

mul $t5,$t0 ,$t1 # multiply aSide and bSide
mul $t6, $t0, $t2 # multiply aSide and cSide
mul $t7, $t1,$t2 # multiply bSide and cSide

add $t8, $t5,$t6 # (aSide * bSide + aSide * cSide and store in $s0)
add $t9, $t8, $t7 # ( (aSide * bSide + aSide * cSide) + bSide * cSide and store in $s1)

mul $s0, $t9,$v1 #multiply $s1 by 2 ie: ((aSide * bSide + aSide * cSide) + bSide * cSide ) * 2

sw $s0, surfaceArea #store value in surfaceArea



#-----
#printing output to screen
lw $t1, volume # load volume into t1
lw $t2, surfaceArea # load surface area into t2

#print string one
li $v0, 4
la $a0, str1
syscall

#printing the surface area measurement
li $v0, 1       
add $a0,$t2,$zero
syscall          

li $v0, 4
la $a0, str2
syscall
#Printing the volume integer
li $v0, 1       
add $a0,$t1,$zero
syscall 
 
# -----
# Done, terminate program.
li $v0, 10       # call code for terminate
syscall          # system call (terminate)

# -----------------------------------------------------
#  Data Declarations
.data

aSide:           .word    4
bSide:           .word    8
cSide:           .word    16
VAL:             .word    2

volume:          .word    0
surfaceArea:     .word    0

str1:		.asciiz  "Surface Area = "
str2:		.asciiz	 " and Volume = "
str3:		.asciiz  "Please enter measurement (cm) of side A >>>"
str4:		.asciiz  "Please enter measurement (cm) of side B >>>"
str5:		.asciiz  "Please enter measurement (cm) of side C >>>"

