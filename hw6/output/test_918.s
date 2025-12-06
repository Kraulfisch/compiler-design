	.data
	.globl	i
i:
	.quad	9
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	leaq	i(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, (%rdx)
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	