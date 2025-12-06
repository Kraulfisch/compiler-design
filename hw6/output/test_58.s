	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond15
	.text
_body14:
	movq	(%rdx), %rsi
	movq	(%rdi), %r8 
	addq	%rsi, %r8 
	movq	(%rdi), %rsi
	imulq	%r8 , %rsi
	movq	%rsi, (%rdx)
	movq	(%rdi), %rsi
	addq	$1, %rsi
	movq	%rsi, (%rdi)
	jmp	_cond15
	.text
_cond15:
	movq	(%rdi), %rsi
	cmpq	$10, %rsi
	setl	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_body14
	jmp	_post13
	.text
_post13:
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	