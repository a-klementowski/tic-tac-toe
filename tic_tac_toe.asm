.data
field: .asciiz "Choose field\n"
enter: .asciiz"\n"
rounds: .asciiz "How many rounds?\n"
winX: .asciiz "The computer won\n"
winO: .asciiz "The player won\n"
endO: .asciiz "Player:\n"
endX: .asciiz "Computer:\n"
.text
li $v0, 4
la $a0, rounds
syscall

li $v0, 5
syscall

move $s1, $v0

start:
li $s7, 0
beq $s6, $s1, end
addi $s6, $s6, 1


li $t1, 95
li $t2, 95
li $t3, 95
li $t4, 95
li $t5, 95
li $t6, 95
li $t7, 95
li $t8, 95
li $t9, 95

loop:
j checkCrossWin
loop1:
jal print

li $v0, 4
la $a0, field
syscall

li $v0, 5
syscall

li $s0, 79

beq $v0, 1, field1
beq $v0, 2, field2
beq $v0, 3, field3
beq $v0, 4, field4
beq $v0, 5, field5
beq $v0, 6, field6
beq $v0, 7, field7
beq $v0, 8, field8
beq $v0, 9, field9

field1:
la $t1, ($s0)
j computer
field2:
la $t2, ($s0)
j computer
field3:
la $t3, ($s0)
j computer
field4:
la $t4, ($s0)
j computer
field5:
la $t5, ($s0)
j computer
field6:
la $t6, ($s0)
j computer
field7:
la $t7, ($s0)
j computer
field8:
la $t8, ($s0)
j computer
field9:
la $t9, ($s0)
j computer

computer:
li $s0, 88

j checkCircleWin
computer1:
j checkComputerMove
computer2:
li $v0, 42
li $a1, 9
syscall

move $t0, $a0
addi $t0, $t0, 1


beq $t0, 1, field1a
beq $t0, 2, field2a
beq $t0, 3, field3a
beq $t0, 4, field4a
beq $t0, 5, field5a
beq $t0, 6, field6a
beq $t0, 7, field7a
beq $t0, 8, field8a
beq $t0, 9, field9a

field1a:
beq $t1, 79, computer2
beq $t1, 88, computer2
la $t1, ($s0)
j loop
field2a:
beq $t2, 79, computer2
beq $t2, 88, computer2
la $t2, ($s0)
j loop
field3a:
beq $t3, 79, computer2
beq $t3, 88, computer2
la $t3, ($s0)
j loop
field4a:
beq $t4, 79, computer2
beq $t4, 88, computer2
la $t4, ($s0)
j loop
field5a:
beq $t5, 79, computer2
beq $t5, 88, computer2
la $t5, ($s0)
j loop
field6a:
beq $t6, 79, computer2
beq $t6, 88, computer2
la $t6, ($s0)
j loop
field7a:
beq $t7, 79, computer2
beq $t7, 88, computer2
la $t7, ($s0)
j loop
field8a:
beq $t8, 79, computer2
beq $t8, 88, computer2
la $t8, ($s0)
j loop
field9a:
beq $t9, 79, computer2
beq $t9, 88, computer2
la $t9, ($s0)
j loop

print:
li $v0, 11
la $a0, ($t1)
syscall
la $a0, ($t2)
syscall
la $a0, ($t3)
syscall

li $v0, 4
la $a0, enter
syscall

li $v0, 11
la $a0, ($t4)
syscall
la $a0, ($t5)
syscall
la $a0, ($t6)
syscall

li $v0, 4
la $a0, enter
syscall

li $v0, 11
la $a0, ($t7)
syscall
la $a0, ($t8)
syscall
la $a0, ($t9)
syscall

li $v0, 4
la $a0, enter
syscall

jr $ra

checkCircleWin:
#Check if "O" won:
add $s3, $t1, $t2
add $s3, $s3, $t3
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t4, $t5
add $s3, $s3, $t6
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t7, $t8
add $s3, $s3, $t9
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t1, $t4
add $s3, $s3, $t7
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t2, $t5
add $s3, $s3, $t8
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t3, $t6
add $s3, $s3, $t9
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t1, $t5
add $s3, $s3, $t9
beq $s3, 237, circleWin
li $s3, 0

add $s3, $t3, $t5
add $s3, $s3, $t7
beq $s3, 237, circleWin
li $s3, 0

addi $s7, $s7, 1
beq $s7, 5, end

j computer1

checkCrossWin:
#Check if "X" won:
add $s3, $t1, $t2
add $s3, $s3, $t3
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t4, $t5
add $s3, $s3, $t6
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t7, $t8
add $s3, $s3, $t9
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t1, $t4
add $s3, $s3, $t7
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t2, $t5
add $s3, $s3, $t8
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t3, $t6
add $s3, $s3, $t9
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t1, $t5
add $s3, $s3, $t9
beq $s3, 264, crossWin
li $s3, 0

add $s3, $t3, $t5
add $s3, $s3, $t7
beq $s3, 264, crossWin
li $s3, 0

j loop1

circleWin:
li $v0, 4
la $a0, winO
syscall
addi $s4, $s4, 1
j start

crossWin:
li $v0, 4
la $a0, winX
syscall
addi $s5, $s5, 1
j start

checkComputerMove:

#Check if computer can win
li $s3, 0
add $s3, $t1, $t2
beq $s3, 176, field3a

li $s3, 0
add $s3, $t1, $t3
beq $s3, 176, field2a

li $s3, 0
add $s3, $t2, $t3
beq $s3, 176, field1a

li $s3, 0
add $s3, $t5, $t6
beq $s3, 176, field4a

li $s3, 0
add $s3, $t4, $t6
beq $s3, 176, field5a

li $s3, 0
add $s3, $t4, $t5
beq $s3, 176, field6a

li $s3, 0
add $s3, $t8, $t9
beq $s3, 176, field7a

li $s3, 0
add $s3, $t7, $t9
beq $s3, 176, field8a

li $s3, 0
add $s3, $t7, $t8
beq $s3, 176, field9a

li $s3, 0
add $s3, $t1, $t4
beq $s3, 176, field7a

li $s3, 0
add $s3, $t1, $t7
beq $s3, 176, field4a

li $s3, 0
add $s3, $t7, $t4
beq $s3, 176, field1a

li $s3, 0
add $s3, $t2, $t5
beq $s3, 176, field8a

li $s3, 0
add $s3, $t2, $t8
beq $s3, 176, field5a

li $s3, 0
add $s3, $t5, $t8
beq $s3, 176, field2a

li $s3, 0
add $s3, $t3, $t6
beq $s3, 176, field9a

li $s3, 0
add $s3, $t3, $t9
beq $s3, 176, field6a

li $s3, 0
add $s3, $t6, $t9
beq $s3, 176, field3a

li $s3, 0
add $s3, $t1, $t5
beq $s3, 176, field9a

li $s3, 0
add $s3, $t5, $t9
beq $s3, 176, field1a

li $s3, 0
add $s3, $t1, $t9
beq $s3, 176, field5a

#Check if computer can block the player
li $s3, 0
add $s3, $t1, $t2
beq $s3, 158, field3a

li $s3, 0
add $s3, $t1, $t3
beq $s3, 158, field2a

li $s3, 0
add $s3, $t2, $t3
beq $s3, 158, field1a

li $s3, 0
add $s3, $t5, $t6
beq $s3, 158, field4a

li $s3, 0
add $s3, $t4, $t6
beq $s3, 158, field5a

li $s3, 0
add $s3, $t4, $t5
beq $s3, 158, field6a

li $s3, 0
add $s3, $t8, $t9
beq $s3, 158, field7a

li $s3, 0
add $s3, $t7, $t9
beq $s3, 158, field8a

li $s3, 0
add $s3, $t7, $t8
beq $s3, 158, field9a

li $s3, 0
add $s3, $t1, $t4
beq $s3, 158, field7a

li $s3, 0
add $s3, $t1, $t7
beq $s3, 158, field4a

li $s3, 0
add $s3, $t7, $t4
beq $s3, 158, field1a

li $s3, 0
add $s3, $t2, $t5
beq $s3, 158, field8a

li $s3, 0
add $s3, $t2, $t8
beq $s3, 158, field5a

li $s3, 0
add $s3, $t5, $t8
beq $s3, 158, field2a

li $s3, 0
add $s3, $t3, $t6
beq $s3, 158, field9a

li $s3, 0
add $s3, $t3, $t9
beq $s3, 158, field6a

li $s3, 0
add $s3, $t6, $t9
beq $s3, 158, field3a

li $s3, 0
add $s3, $t1, $t5
beq $s3, 158, field9a

li $s3, 0
add $s3, $t5, $t9
beq $s3, 158, field1a

li $s3, 0
add $s3, $t1, $t9
beq $s3, 158, field5a

li $s3, 0

j computer2


end:
li $v0, 4
la $a0, endO
syscall

li $v0, 1
move $a0, $s4
syscall

li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, endX
syscall

li $v0, 1
move $a0, $s5
syscall

li $v0, 10
syscall
