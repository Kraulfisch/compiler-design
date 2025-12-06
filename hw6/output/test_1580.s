	.text
	.globl	f
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%rdi, (%rdx)
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	g
g:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$56, %rsp
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	movq	%rdi, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r9 
	pushq	%r8 
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -40(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	movq	$3, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1571
	.text
_body1570:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r9 ), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	pushq	%r9 
	pushq	%r8 
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	$3, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%r10, (%rdx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1588
	.text
_body1587:
	movq	(%rdx), %r11
	movq	(%r8 ), %rsi
	movq	%r11, %rax
	movq	%rax, -8(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-8(%rbp), %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r11
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, (%r11)
	movq	(%r8 ), %rsi
	addq	$1, %rsi
	movq	%rsi, (%r8 )
	jmp	_cond1588
	.text
_cond1571:
	movq	(%r9 ), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body1570
	jmp	_post1569
	.text
_cond1588:
	movq	(%r8 ), %rsi
	movq	(%rdi), %r11
	cmpq	%r11, %rsi
	setl	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_body1587
	jmp	_post1586
	.text
_post1569:
	movq	-40(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post1586:
	movq	%r10, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r9 )
	jmp	_cond1571
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$168, %rsp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, -168(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, -152(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -160(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -120(%rbp)
	subq	$8, %rsp
	movq	%rsp, -104(%rbp)
	movq	$3, %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	movq	-120(%rbp), %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond1393
	.text
_body1392:
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r11
	movq	(%r10), %rdi
	movq	%r11, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -144(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	$3, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1410
	.text
_body1409:
	movq	(%rdx), %r11
	movq	(%r8 ), %rdi
	movq	%r11, %rax
	movq	%rax, -72(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	-72(%rbp), %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r11
	movq	(%r8 ), %rdi
	movq	%rdi, (%r11)
	movq	(%r8 ), %rdi
	addq	$1, %rdi
	movq	%rdi, (%r8 )
	jmp	_cond1410
	.text
_body1441:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r9 ), %rdi
	movq	%r8 , %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -136(%rbp)
	pushq	%r9 
	pushq	%rsi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$5, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%r10, (%rdx)
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond1459
	.text
_body1458:
	movq	(%rdx), %r11
	movq	(%rsi), %rdi
	movq	%r11, %rax
	movq	%rax, -64(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	-64(%rbp), %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r11
	movq	%r9 , %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	(%rsi), %rdi
	imulq	-40(%rbp), %rdi
	movq	%rdi, (%r11)
	movq	(%rsi), %rdi
	addq	$1, %rdi
	movq	%rdi, (%rsi)
	jmp	_cond1459
	.text
_body1492:
	movq	(%rdi), %r8 
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%r8 , %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -128(%rbp)
	pushq	%rdi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$3, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%r10, (%rsi)
	movq	$0, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond1510
	.text
_body1509:
	movq	(%rsi), %r11
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	%r11, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r11
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	imulq	%r8 , %rdx
	movq	%rdx, (%r11)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond1510
	.text
_cond1393:
	movq	(%r10), %rdx
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	cmpq	%rdi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body1392
	jmp	_post1391
	.text
_cond1410:
	movq	(%r8 ), %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r11
	cmpq	%r11, %rdi
	setl	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_body1409
	jmp	_post1408
	.text
_cond1442:
	movq	(%r9 ), %rdx
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	cmpq	%rdi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body1441
	jmp	_post1440
	.text
_cond1459:
	movq	(%rsi), %rdi
	movq	(%r8 ), %r11
	cmpq	%r11, %rdi
	setl	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_body1458
	jmp	_post1457
	.text
_cond1493:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body1492
	jmp	_post1491
	.text
_cond1510:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r9 ), %r8 
	cmpq	%r8 , %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body1509
	jmp	_post1508
	.text
_post1391:
	movq	-120(%rbp), %rax
	movq	-168(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r9 
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -112(%rbp)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	movq	$4, %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -80(%rbp)
	movq	-112(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1442
	.text
_post1408:
	movq	-16(%rbp), %rax
	movq	-144(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r10)
	jmp	_cond1393
	.text
_post1440:
	movq	-112(%rbp), %rax
	movq	-152(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	movq	$3, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-56(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond1493
	.text
_post1457:
	movq	%r10, %rax
	movq	-136(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r9 )
	jmp	_cond1442
	.text
_post1491:
	movq	-56(%rbp), %rax
	movq	-160(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$3, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$4, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$2, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	addq	%rdx, %rsi
	movq	-160(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%rsi
	movq	%rdx, %rdi
	callq	f
	popq	%rsi
	movq	%rax, %rdx
	addq	%rdx, %rsi
	pushq	%rsi
	movq	$4, %rdi
	callq	g
	popq	%rsi
	movq	%rax, %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post1508:
	movq	%r10, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond1493