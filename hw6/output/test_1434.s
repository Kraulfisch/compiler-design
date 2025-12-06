	.data
	.globl	white
white:
	.quad	_global_struct6713
	.data
	.globl	_global_struct6713
_global_struct6713:
	.quad	255
	.quad	254
	.quad	253
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$24, %rdi
	callq	oat_malloc
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	$3, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	$5, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$7, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	leaq	white(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	