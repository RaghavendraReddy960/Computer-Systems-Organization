.global _start
.text
_start:
movq $30, %rbx #A=30
movq $3, %rcx  #B=8 
jmp L4

L1:
cmp $0, %r8
je L3

L2:
movq %r8, %r10
movq %r9, %rax
movq $0, %rdx
divq %r8
movq %rdx, %r8
movq %r10, %r9
jmp L1

L3:
movq %r9, %r11
jmp L5

L4:
movq %rbx, %r8
movq %rcx, %r9
jmp L1

L5:
cmp $1, %r11
je L7

L6:
movq %rbx, %rax
movq $0, %rdx
divq %r11
movq %rax, %rbx
movq %rbx, %r8
movq %rcx, %r9
jmp L1

L7:
movq %rbx, %r8  #ans
movq $0, %r9
movq $10, %r10

L8:
movq $0, %rdx
movq %r8, %rax
divq %r10
addq %rdx, %r9
movq %rax, %r8
cmp $0, %r8
jne L8

movq %r9, %rdx
exit:

movq $60, %rax
syscall


