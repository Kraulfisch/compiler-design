	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	$17, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$18, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%rsi), %rsi
	movq	(%rdx), %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	