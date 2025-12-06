	.text
	.globl	fact
fact:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%rsi)
	movq	$1, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond793
	.text
_body792:
	movq	(%r8 ), %rdi
	movq	(%rsi), %rdx
	imulq	%rdi, %rdx
	movq	%rdx, (%r8 )
	movq	(%rsi), %rdx
	subq	$1, %rdx
	movq	%rdx, (%rsi)
	jmp	_cond793
	.text
_cond793:
	movq	(%rsi), %rdx
	cmpq	$0, %rdx
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body792
	jmp	_post791
	.text
_post791:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$5, %rdi
	callq	fact
	movq	%rax, %rdx
	movq	%rdx, %rdi
	callq	string_of_int
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	