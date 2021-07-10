.global _start

.text

_start:
	movq $6,%rbx
	movq $0,%rax
	movq 8(%rsp),%rcx#random address to input base address
	movq %rcx,%r9
	movq 112(%rsp),%rdx#random address to output base address
	movq %rdx,%r10
	#input array
	movq $1,(%rcx)
	movq $4,8(%rcx)
	movq $5,16(%rcx)
	movq $2,24(%rcx)
	movq $10,32(%rcx)
	movq $8,40(%rcx)
	#output array
	movq $-1,(%rdx)
	movq $-1,8(%rdx)
	movq $-1,16(%rdx)
	movq $-1,24(%rdx)
	movq $-1,32(%rdx)
	movq $-1,40(%rdx)
loop:
	cmp $0,%rax
	je zero_case
	movq (%rsp),%r11
	cmp (%r9),%r11
	jge case_gre
	#movq (%rsp),%r11
	movq %r11,(%r10)
	pushq (%r9)
	incq %rax
	addq $8,%r9
	addq $8,%r10
	decq %rbx
	cmp $0,%rbx
	je end
	jmp loop
zero_case:#if No.of elements in the stack is zero.
	pushq (%r9)
	incq %rax
	addq $8,%r9
	addq $8,%r10
	decq %rbx
	cmp $0,%rbx
	je end
	jmp loop
case_gre:# if stack's topmost element is greater than equal to current element in the array.  
	popq %rsi
	decq %rax
	cmp $0,%rax
	je zero_case
	movq (%rsp),%r11
	cmp (%r9),%r11
	jge case_gre
	movq %r11,(%r10)
	pushq (%r9)
	incq %rax
	addq $8,%r9
	addq $8,%r10
	decq %rbx
	cmp $0,%rbx
	je end
	jmp loop

end:
exit:
	subq $32,%r10#r10-8 has address of last element of output array.
	movq (%r10),%r13
	mov $60,%rax
	xor %rdi,%rdi
	syscall
