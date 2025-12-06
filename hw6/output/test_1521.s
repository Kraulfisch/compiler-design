	.text
	.globl	baz
baz:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rcx, -8(%rbp)
	addq	%rdi, %rsi
	addq	%rsi, %rdx
	addq	-8(%rbp), %rdx
	addq	%r8 , %rdx
	addq	%r9 , %rdx
	addq	16(%rbp), %rdx
	addq	24(%rbp), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	bar
bar:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rcx, -8(%rbp)
	movq	%rdi, %r10
	addq	%rsi, %r10
	movq	%r10, %rsi
	addq	%rdx, %rsi
	movq	%rsi, %rdi
	addq	-8(%rbp), %rdi
	movq	%rdi, %rdx
	addq	%r8 , %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rdx
	pushq	24(%rbp)
	pushq	16(%rbp)
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%r10, %rdi
	callq	baz
	addq	$16, %rsp
	popq	%rdx
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rsi
	addq	%r9 , %rdx
	addq	16(%rbp), %rdx
	addq	24(%rbp), %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rdi
	pushq	%rdi
	movq	%rdi, %r9 
	movq	%rdi, %r8 
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	movq	%rdi, %rsi
	callq	bar
	addq	$16, %rsp
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$1, %rdi
	callq	foo
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	