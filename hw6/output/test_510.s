	.text
	.globl	id
id:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%rdi, (%rdx)
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	leaq	id(%rip), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rdx
	pushq	%r15
	movq	%rdx, %r15
	movq	$1, %rdi
	callq	*%r15
	popq	%r15
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	