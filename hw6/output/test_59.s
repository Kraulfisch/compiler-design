	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond40
	.text
_body39:
	movq	(%rsi), %rdx
	addq	$2, %rdx
	movq	%rdx, (%rsi)
	movq	(%rdi), %rdx
	addq	$1, %rdx
	movq	%rdx, (%rdi)
	jmp	_cond40
	.text
_cond40:
	movq	(%rdi), %rdx
	cmpq	$3, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body39
	jmp	_post38
	.text
_post38:
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	