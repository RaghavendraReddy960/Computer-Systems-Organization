.global _start
.text
_start:
movq $100, %rbx  #n value
movq $7, %rcx #k value
movq $1, %r8 #fibonacci initiator starter
movq $2, %r9 #fibonacci second inititor
movq $3, %r11 #sum
movq $1, %r13
cmp $2, %rbx  #comparing for n values less than 2
jz L5
jg L1
jl L6

L6:  #case for n=1
movq $1, %r11
jmp L4

L5:    #case for n=2
movq $3, %rax
movq $0, %rdx
divq %rcx
movq %rdx, %r11
jmp L4

L2: #computing factorial
subq %r13, %r14
imulq %r14, %r15
movq %r15, %rax
movq $0, %rdx
divq %rcx  #doing mod k for every step if iteration sucth that no overflow occurs 
movq %rdx, %r15
cmp $1, %r14
jg L2

L3:
addq %r15, %r11   #adding every factorial value

L1:
movq %r9, %r10 #storing value
addq %r8, %r9
movq %r10, %r8 #r9 contains new fibonacci value, r8 contains r9 value
movq %r9, %r14 #temp
movq %r9, %r15 #temp2
cmp %r9, %rbx
jge L2



L4:   #answer finalisation and storing in %rdx
movq %r11, %rdx
movq %rdx, %rax
movq $0, %rdx
divq %rcx

exit:
movq $60, %rax
syscall 

