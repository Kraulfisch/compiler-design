	.text
	.globl	compute_determinant
compute_determinant:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$704, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, %r8 
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
	movq	%rsp, -64(%rbp)
	subq	$8, %rsp
	movq	%rsp, -72(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	%rdi, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, (%r11)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	$-1, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r11), %rdx
	cmpq	$1, %rdx
	sete	-80(%rbp)
	andq	$1, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	_then4658
	jmp	_else4657
	.text
_body4478:
	movq	(%r11), %rdx
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -96(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	movq	-96(%rbp), %rdi
	callq	oat_alloc_array
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -104(%rbp)
	subq	$8, %rsp
	movq	%rsp, -112(%rbp)
	movq	-96(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-104(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4496
	.text
_body4495:
	movq	%rdi, %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rdx
	movq	-128(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-120(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-128(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -136(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -144(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	movq	-144(%rbp), %rdi
	callq	oat_alloc_array
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -152(%rbp)
	subq	$8, %rsp
	movq	%rsp, -160(%rbp)
	movq	-144(%rbp), %rax
	movq	-160(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	-152(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4514
	.text
_body4513:
	movq	%rsi, %rax
	movq	(%rax), %rax
	movq	%rax, -168(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-176(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-168(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-176(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -184(%rbp)
	movq	$1, %rax
	movq	-184(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4514
	.text
_body4540:
	movq	$0, %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4550
	.text
_body4549:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -208(%rbp)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	-216(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-208(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-216(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -240(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	-240(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-232(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-240(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -248(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	movq	-256(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -264(%rbp)
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	-264(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-264(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -280(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -288(%rbp)
	movq	-280(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	-288(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-280(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-288(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -296(%rbp)
	movq	-296(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -304(%rbp)
	movq	-304(%rbp), %rax
	movq	-248(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -312(%rbp)
	movq	-312(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4550
	.text
_body4588:
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond4598
	.text
_body4597:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -320(%rbp)
	movq	(%r9 ), %rsi
	movq	-320(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-320(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -328(%rbp)
	movq	-328(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -336(%rbp)
	movq	(%r10), %rsi
	movq	-336(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-336(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -344(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -352(%rbp)
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	-352(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-352(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -360(%rbp)
	movq	-360(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -368(%rbp)
	movq	(%r10), %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -376(%rbp)
	movq	-368(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	-376(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-368(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-376(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -384(%rbp)
	movq	-384(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -392(%rbp)
	movq	-392(%rbp), %rax
	movq	-344(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -400(%rbp)
	movq	-400(%rbp), %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond4598
	.text
_cond4479:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -408(%rbp)
	movq	(%r11), %rdx
	movq	-408(%rbp), %rax
	cmpq	%rdx, %rax
	setl	-416(%rbp)
	andq	$1, -416(%rbp)
	cmpq	$0, -416(%rbp)
	jne	_body4478
	jmp	_post4477
	.text
_cond4496:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -424(%rbp)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -432(%rbp)
	movq	-424(%rbp), %rax
	cmpq	-432(%rbp), %rax
	setl	-440(%rbp)
	andq	$1, -440(%rbp)
	cmpq	$0, -440(%rbp)
	jne	_body4495
	jmp	_post4494
	.text
_cond4514:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -448(%rbp)
	movq	-160(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -456(%rbp)
	movq	-448(%rbp), %rax
	cmpq	-456(%rbp), %rax
	setl	-464(%rbp)
	andq	$1, -464(%rbp)
	cmpq	$0, -464(%rbp)
	jne	_body4513
	jmp	_post4512
	.text
_cond4541:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -472(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -480(%rbp)
	movq	-472(%rbp), %rax
	cmpq	-480(%rbp), %rax
	setl	-488(%rbp)
	andq	$1, -488(%rbp)
	cmpq	$0, -488(%rbp)
	jne	_body4540
	jmp	_post4539
	.text
_cond4550:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -496(%rbp)
	movq	(%r11), %rdx
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -504(%rbp)
	movq	-496(%rbp), %rax
	cmpq	-504(%rbp), %rax
	setl	-512(%rbp)
	andq	$1, -512(%rbp)
	cmpq	$0, -512(%rbp)
	jne	_body4549
	jmp	_post4548
	.text
_cond4589:
	movq	(%r10), %rdx
	movq	(%r11), %rsi
	movq	%rsi, %rax
	subq	$1, %rax
	movq	%rax, -520(%rbp)
	cmpq	-520(%rbp), %rdx
	setl	-528(%rbp)
	andq	$1, -528(%rbp)
	cmpq	$0, -528(%rbp)
	jne	_body4588
	jmp	_post4587
	.text
_cond4598:
	movq	(%r9 ), %rdx
	movq	(%r11), %rsi
	movq	%rsi, %rax
	subq	$1, %rax
	movq	%rax, -536(%rbp)
	cmpq	-536(%rbp), %rdx
	setl	-544(%rbp)
	andq	$1, -544(%rbp)
	cmpq	$0, -544(%rbp)
	jne	_body4597
	jmp	_post4596
	.text
_else4657:
	movq	$0, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4479
	.text
_merge4656:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post4477:
	jmp	_merge4656
	.text
_post4494:
	movq	-104(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4541
	.text
_post4512:
	movq	-152(%rbp), %rax
	movq	-136(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -552(%rbp)
	movq	-552(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -560(%rbp)
	movq	-560(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4496
	.text
_post4539:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -568(%rbp)
	movq	-568(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond4589
	.text
_post4548:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -576(%rbp)
	movq	-576(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -584(%rbp)
	movq	-584(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4541
	.text
_post4587:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	imulq	$-1, %rax
	movq	%rax, -592(%rbp)
	movq	-592(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r8 ), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -600(%rbp)
	movq	-600(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-600(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -608(%rbp)
	movq	-608(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -616(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -624(%rbp)
	movq	-616(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-624(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-616(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-624(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -632(%rbp)
	movq	-632(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -640(%rbp)
	movq	%rdi, %rax
	imulq	-640(%rbp), %rax
	movq	%rax, -648(%rbp)
	movq	(%r11), %rdx
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -656(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -664(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	-656(%rbp), %rsi
	movq	-664(%rbp), %rdi
	callq	compute_determinant
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	-648(%rbp), %rax
	imulq	%rdx, %rax
	movq	%rax, -672(%rbp)
	movq	%rsi, %rax
	addq	-672(%rbp), %rax
	movq	%rax, -680(%rbp)
	movq	-680(%rbp), %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -688(%rbp)
	movq	-688(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -696(%rbp)
	movq	-696(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond4479
	.text
_post4596:
	movq	(%r10), %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -704(%rbp)
	movq	-704(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond4589
	.text
_then4658:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%r8 )
	jmp	_merge4656
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdi
	pushq	%rdi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r8 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$20, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$2, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%r8 , (%rdx)
	pushq	%rdi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r8 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$3, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$5, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	%r8 , (%rdx)
	movq	%rdi, (%rsi)
	movq	(%rsi), %rdx
	movq	$2, %rsi
	movq	%rdx, %rdi
	callq	compute_determinant
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	