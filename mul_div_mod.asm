$text:
#align 32
$divu:
addu $sp,$sp,-8
sw $23,0#($sp)
sw $30,4#($sp)
la $30,1
move $23,$0
b L$3
L$2:
sll $5,$5,1
sll $30,$30,1
L$3:
bgeu $5,$4,L$6
beq $30,$0,L$6
and $15,$5,0x80000000
beq $15,$0,L$2
L$6:
b L$8
L$7:
bltu $4,$5,L$10
subu $4,$4,$5
or $23,$23,$30
L$10:
srl $30,$30,1
srl $5,$5,1
L$8:
bne $30,$0,L$7
move $2,$23
L$1:
lw $23,0#($sp)
lw $30,4#($sp)
addu $sp,$sp,8
j $31
#align 32
$remu:
addu $sp,$sp,-8
sw $23,0#($sp)
sw $30,4#($sp)
la $30,1
move $23,$0
b L$17
L$16:
sll $5,$5,1
sll $30,$30,1
L$17:
bgeu $5,$4,L$20
beq $30,$0,L$20
and $15,$5,0x80000000
beq $15,$0,L$16
L$20:
b L$22
L$21:
bltu $4,$5,L$24
subu $4,$4,$5
or $23,$23,$30
L$24:
srl $30,$30,1
srl $5,$5,1
L$22:
bne $30,$0,L$21
move $2,$4
L$15:
lw $23,0#($sp)
lw $30,4#($sp)
addu $sp,$sp,8
j $31
#align 32
$div:
addu $sp,$sp,-16
sw $21,0#($sp)
sw $22,4#($sp)
sw $23,8#($sp)
sw $30,12#($sp)
move $22,$0
move $23,$0
la $30,1
bge $4,$0,L$30
negu $4,$4
bne $22,$0,L$33
la $21,1
b L$34
L$33:
move $21,$0
L$34:
move $22,$21
L$30:
bge $5,$0,L$41
negu $5,$5
bne $22,$0,L$38
la $21,1
b L$39
L$38:
move $21,$0
L$39:
move $22,$21
b L$41
L$40:
sll $5,$5,1
sll $30,$30,1
L$41:
bge $5,$4,L$44
beq $30,$0,L$44
and $24,$5,0x80000000
beq $24,$0,L$40
L$44:
b L$46
L$45:
blt $4,$5,L$48
subu $4,$4,$5
or $24,$23,$30
move $23,$24
L$48:
srl $30,$30,1
sra $5,$5,1
L$46:
bne $30,$0,L$45
beq $22,$0,L$50
negu $23,$23
L$50:
move $2,$23
L$29:
lw $21,0#($sp)
lw $22,4#($sp)
lw $23,8#($sp)
lw $30,12#($sp)
addu $sp,$sp,16
j $31
#align 32
$rem:
addu $sp,$sp,-16
sw $23,0#($sp)
sw $30,4#($sp)
sw $0,-4+16#($sp)
move $23,$0
la $30,1
bge $4,$0,L$55
negu $4,$4
la $24,1
sw $24,-4+16#($sp)
L$55:
bge $5,$0,L$60
negu $5,$5
b L$60
L$59:
sll $5,$5,1
sll $30,$30,1
L$60:
bge $5,$4,L$63
beq $30,$0,L$63
and $24,$5,0x80000000
beq $24,$0,L$59
L$63:
b L$65
L$64:
blt $4,$5,L$67
subu $4,$4,$5
or $24,$23,$30
move $23,$24
L$67:
srl $30,$30,1
sra $5,$5,1
L$65:
bne $30,$0,L$64
lw $24,-4+16#($sp)
beq $24,$0,L$69
negu $4,$4
L$69:
move $2,$4
L$54:
lw $23,0#($sp)
lw $30,4#($sp)
addu $sp,$sp,16
j $31
#align 32
$mul:
addu $sp,$sp,-8
sw $30,0#($sp)
move $30,$0
b L$75
L$74:
and $24,$4,1
beq $24,$0,L$77
addu $30,$30,$5
L$77:
srl $4,$4,1
sll $5,$5,1
L$75:
bne $4,$0,L$74
move $2,$30
L$73:
lw $30,0#($sp)
addu $sp,$sp,8
j $31

