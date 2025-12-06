	.text
	.globl	f
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$72, %rsp
	movq	%rcx, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -72(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	movq	%rdi, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r8 , %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	16(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	24(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rsi, %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rdx, %rsi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rdx, %rsi
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rdx, %rsi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rdx, %rsi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rdx, %rsi
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rsi, %rdx
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
	pushq	%rdx
	pushq	$-3
	pushq	$-4
	movq	$-5, %r9 
	movq	$5, %r8 
	movq	$4, %rcx
	movq	$3, %rdx
	movq	$2, %rsi
	movq	$1, %rdi
	callq	f
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, %rsi
	movq	%rsi, (%rdx)
	movq	(%rdx), %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_int
	popq	%rdx
	movq	$41, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	