	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$12, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	$800, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	(%r8 ), %rdi
	movq	(%rsi), %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	cmpq	$0, %rdx
	setle	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then8224
	jmp	_else8223
	.text
_else8223:
	movq	(%r8 ), %rdi
	movq	(%rsi), %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge8222:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8224:
	movq	(%r8 ), %rdx
	movq	$0, %rdi
	subq	%rdx, %rdi
	movq	(%rsi), %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	