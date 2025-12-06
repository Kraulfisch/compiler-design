	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$352, %rsp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, -344(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, -288(%rbp)
	subq	$8, %rsp
	movq	%rsp, -112(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	subq	$8, %rsp
	movq	%rsp, -328(%rbp)
	subq	$8, %rsp
	movq	%rsp, -280(%rbp)
	subq	$8, %rsp
	movq	%rsp, -248(%rbp)
	subq	$8, %rsp
	movq	%rsp, -336(%rbp)
	subq	$8, %rsp
	movq	%rsp, -272(%rbp)
	subq	$8, %rsp
	movq	%rsp, -352(%rbp)
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
	movq	%rax, -200(%rbp)
	subq	$8, %rsp
	movq	%rsp, -176(%rbp)
	movq	$3, %rax
	movq	-176(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	movq	-200(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond505
	.text
_body504:
	movq	-56(%rbp), %rax
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
	movq	%rax, -320(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	$1, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond522
	.text
_body521:
	movq	(%rdx), %r11
	movq	(%r8 ), %rdi
	movq	%r11, %rax
	movq	%rax, -240(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	-240(%rbp), %rdi
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
	movq	%rax, -104(%rbp)
	movq	$0, %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r8 , %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond522
	.text
_body552:
	movq	-48(%rbp), %rax
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
	movq	%rax, -312(%rbp)
	pushq	%r9 
	pushq	%rsi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$1, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%r10, (%rdx)
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond570
	.text
_body569:
	movq	(%rdx), %r11
	movq	(%rsi), %rdi
	movq	%r11, %rax
	movq	%rax, -232(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	-232(%rbp), %rdi
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
	movq	%rax, -96(%rbp)
	movq	$0, %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond570
	.text
_body600:
	movq	(%rdi), %r8 
	movq	-112(%rbp), %rax
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
	movq	%rax, -304(%rbp)
	pushq	%rdi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$1, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%r10, (%rsi)
	movq	$0, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond618
	.text
_body617:
	movq	(%rsi), %r11
	movq	-64(%rbp), %rax
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
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond618
	.text
_body648:
	movq	(%rsi), %r8 
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
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
	movq	%rax, -264(%rbp)
	pushq	%r9 
	pushq	%rsi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$1, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%r10, (%rdx)
	movq	$0, %rax
	movq	-248(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond666
	.text
_body665:
	movq	(%rdx), %r11
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%r11, %rax
	movq	%rax, -40(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	-40(%rbp), %rdi
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
	movq	%rax, %rdi
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	addq	$1, %rdi
	movq	%rdi, %rax
	movq	-248(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond666
	.text
_body696:
	movq	(%rsi), %r10
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%r10, %rax
	movq	%rax, %rdx
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
	movq	%r10, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdi, (%rdx)
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-272(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond697
	.text
_cond505:
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	movq	-176(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -224(%rbp)
	movq	-120(%rbp), %rax
	cmpq	-224(%rbp), %rax
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body504
	jmp	_post503
	.text
_cond522:
	movq	%r8 , %rax
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -296(%rbp)
	movq	-256(%rbp), %rax
	cmpq	-296(%rbp), %rax
	setl	-152(%rbp)
	andq	$1, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	_body521
	jmp	_post520
	.text
_cond553:
	movq	(%r9 ), %rdx
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	cmpq	%rdi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body552
	jmp	_post551
	.text
_cond570:
	movq	%rsi, %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	%r8 , %rax
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movq	-80(%rbp), %rax
	cmpq	-216(%rbp), %rax
	setl	-136(%rbp)
	andq	$1, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	_body569
	jmp	_post568
	.text
_cond601:
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-160(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body600
	jmp	_post599
	.text
_cond618:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%r9 , %rax
	movq	(%rax), %rax
	movq	%rax, -208(%rbp)
	cmpq	-208(%rbp), %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body617
	jmp	_post616
	.text
_cond649:
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r9 ), %rdi
	cmpq	%rdi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body648
	jmp	_post647
	.text
_cond666:
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%r8 , %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	-32(%rbp), %rdi
	setl	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_body665
	jmp	_post664
	.text
_cond697:
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r8 ), %rdi
	cmpq	%rdi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body696
	jmp	_post695
	.text
_post503:
	movq	-200(%rbp), %rax
	movq	-344(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r9 
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -192(%rbp)
	subq	$8, %rsp
	movq	%rsp, -168(%rbp)
	movq	$3, %rax
	movq	-168(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	movq	-192(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond553
	.text
_post520:
	movq	-24(%rbp), %rax
	movq	-320(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r10)
	jmp	_cond505
	.text
_post551:
	movq	-192(%rbp), %rax
	movq	-288(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -184(%rbp)
	subq	$8, %rsp
	movq	%rsp, -160(%rbp)
	movq	$3, %rax
	movq	-160(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-184(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond601
	.text
_post568:
	movq	%r10, %rax
	movq	-312(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r9 )
	jmp	_cond553
	.text
_post599:
	movq	-184(%rbp), %rax
	movq	-328(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$3, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	-16(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-280(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond649
	.text
_post616:
	movq	%r10, %rax
	movq	-304(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond601
	.text
_post647:
	movq	-16(%rbp), %rax
	movq	-336(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$3, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%r9 , (%rsi)
	movq	$0, %rax
	movq	-272(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond697
	.text
_post664:
	movq	%r10, %rax
	movq	-264(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-280(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond649
	.text
_post695:
	movq	%r9 , %rax
	movq	-352(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-288(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	-352(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, (%rdx)
	movq	-288(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$2, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-288(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-344(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-344(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-328(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-328(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-288(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-288(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-336(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-336(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-328(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-328(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	