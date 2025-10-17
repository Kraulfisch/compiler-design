	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, %rax
	movq	%rax, -8(%rbp)
	movq	%rsi, %rax
	movq	%rax, -16(%rbp)
	movq	$7, %rax
	movq	$7, %rcx
	imulq	%rcx, %rax
	movq	%rax, -24(%rbp)
	movq	$42, %rax
	movq	-8(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	movq	$49, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	main.l1
	.text
main.l1:
	movq	$64, %rax
	movq	-32(%rbp), %rcx
	cmpq	%rcx, %rax
	setle	%al
	movq	%rax, %rax
	movq	%rax, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	$0, %rcx
	imulq	$0, %rcx
	addq	%rcx, %rax
	movq	%rax, -80(%rbp)
	movq	-64(%rbp), %rax
	movq	$3, %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-88(%rbp), %rax
	movq	$0, %rcx
	cmpq	%rcx, %rax
	setg	%al
	movq	%rax, %rax
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	cmpq	$0, %rax
	jne	main.l1
	jmp	main.l2
	.text
main.l2:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	