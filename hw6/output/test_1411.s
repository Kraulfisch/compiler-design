	.text
	.globl	foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	%rdi, (%r10)
	movq	%rsi, (%r9 )
	movq	%rdx, (%r8 )
	movq	(%r10), %rsi
	movq	(%r9 ), %rdx
	addq	%rsi, %rdx
	movq	%rdx, (%r11)
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r11), %rsi
	movq	-8(%rbp), %rax
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
	subq	$152, %rsp
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, -112(%rbp)
	subq	$8, %rsp
	movq	%rsp, -104(%rbp)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -152(%rbp)
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	subq	$8, %rsp
	movq	%rsp, -80(%rbp)
	subq	$8, %rsp
	movq	%rsp, -72(%rbp)
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, -144(%rbp)
	subq	$8, %rsp
	movq	%rsp, -136(%rbp)
	subq	$8, %rsp
	movq	%rsp, -128(%rbp)
	subq	$8, %rsp
	movq	%rsp, -120(%rbp)
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	_cond2634
	.text
_body2633:
	movq	$0, %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	pushq	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rdx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rdi
	callq	foo
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r11
	movq	%rax, %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-152(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r11), %rsi
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	pushq	%r11
	pushq	%r9 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rdx
	movq	%r9 , %rsi
	movq	-16(%rbp), %rdi
	callq	foo
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r9 
	popq	%r11
	movq	%rax, %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, (%rdi)
	movq	(%rdi), %rsi
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r10
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rdx
	movq	%r9 , %rsi
	movq	%r10, %rdi
	callq	foo
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %r8 
	addq	%r8 , %rsi
	movq	%rsi, (%rdi)
	movq	(%rdi), %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-144(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-136(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %r8 
	addq	%r8 , %rsi
	movq	%rsi, %rax
	movq	-120(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rsi
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	addq	%r8 , %rsi
	movq	%rsi, (%rdx)
	movq	(%r11), %rsi
	addq	$1, %rsi
	movq	%rsi, (%r11)
	jmp	_cond2634
	.text
_cond2634:
	movq	(%r11), %rsi
	cmpq	$10000000, %rsi
	setl	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_body2633
	jmp	_post2632
	.text
_post2632:
	movq	(%rdx), %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_int
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	