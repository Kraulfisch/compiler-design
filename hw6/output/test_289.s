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
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	%rdi, (%r10)
	movq	%rsi, (%r9 )
	movq	%rdx, (%r8 )
	movq	(%r10), %rsi
	movq	(%r9 ), %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	addq	%rsi, %rdx
	movq	%rdx, (%r11)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r11), %rdx
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
	subq	$624, %rsp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
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
	movq	%rsp, -80(%rbp)
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	subq	$8, %rsp
	movq	%rsp, -104(%rbp)
	subq	$8, %rsp
	movq	%rsp, -112(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	_cond2634
	.text
_body2633:
	movq	$0, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-120(%rbp), %rax
	addq	-128(%rbp), %rax
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -144(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -152(%rbp)
	movq	-144(%rbp), %rax
	addq	-152(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -168(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	-168(%rbp), %rax
	addq	-176(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -200(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -208(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	-200(%rbp), %rdx
	movq	-208(%rbp), %rsi
	movq	-216(%rbp), %rdi
	callq	foo
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	-192(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -240(%rbp)
	movq	-232(%rbp), %rax
	addq	-240(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -264(%rbp)
	movq	-256(%rbp), %rax
	addq	-264(%rbp), %rax
	movq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -280(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -288(%rbp)
	movq	-280(%rbp), %rax
	addq	-288(%rbp), %rax
	movq	%rax, -296(%rbp)
	movq	-296(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -304(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -312(%rbp)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	movq	-320(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -328(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -336(%rbp)
	movq	-328(%rbp), %rax
	addq	-336(%rbp), %rax
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -352(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -360(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -368(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -376(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	-360(%rbp), %rdx
	movq	-368(%rbp), %rsi
	movq	-376(%rbp), %rdi
	callq	foo
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	-352(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -384(%rbp)
	movq	-384(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -392(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -400(%rbp)
	movq	-392(%rbp), %rax
	addq	-400(%rbp), %rax
	movq	%rax, -408(%rbp)
	movq	-408(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -416(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -424(%rbp)
	movq	-416(%rbp), %rax
	addq	-424(%rbp), %rax
	movq	%rax, -432(%rbp)
	movq	-432(%rbp), %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -440(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -448(%rbp)
	movq	-440(%rbp), %rax
	addq	-448(%rbp), %rax
	movq	%rax, -456(%rbp)
	movq	-456(%rbp), %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -464(%rbp)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -472(%rbp)
	movq	-464(%rbp), %rax
	addq	-472(%rbp), %rax
	movq	%rax, -480(%rbp)
	movq	-480(%rbp), %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -488(%rbp)
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -496(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -504(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -512(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	-496(%rbp), %rdx
	movq	-504(%rbp), %rsi
	movq	-512(%rbp), %rdi
	callq	foo
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	-488(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -520(%rbp)
	movq	-520(%rbp), %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -528(%rbp)
	movq	%rdx, %rax
	addq	-528(%rbp), %rax
	movq	%rax, -536(%rbp)
	movq	-536(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -544(%rbp)
	movq	%rdx, %rax
	addq	-544(%rbp), %rax
	movq	%rax, -552(%rbp)
	movq	-552(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -560(%rbp)
	movq	%rdx, %rax
	addq	-560(%rbp), %rax
	movq	%rax, -568(%rbp)
	movq	-568(%rbp), %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -576(%rbp)
	movq	%rdx, %rax
	addq	-576(%rbp), %rax
	movq	%rax, -584(%rbp)
	movq	-584(%rbp), %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	(%rsi), %rdx
	movq	(%r8 ), %rdi
	movq	%rdx, %rax
	addq	%rdi, %rax
	movq	%rax, -592(%rbp)
	movq	-592(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -600(%rbp)
	movq	-600(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -608(%rbp)
	movq	-608(%rbp), %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	_cond2634
	.text
_cond2634:
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -616(%rbp)
	movq	-616(%rbp), %rax
	cmpq	$10000000, %rax
	setl	-624(%rbp)
	andq	$1, -624(%rbp)
	cmpq	$0, -624(%rbp)
	jne	_body2633
	jmp	_post2632
	.text
_post2632:
	movq	(%rsi), %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_int
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	