	.data
	.globl	_str_arr4220
_str_arr4220:
	.asciz	"\n"
	.text
	.globl	xor
xor:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r9 )
	movq	%rsi, (%r8 )
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	andq	%rsi, %rdx
	movq	%rdx, %rdi
	xorq	$-1, %rdi
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	orq	%rsi, %rdx
	andq	%rdi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	xor_shift_plus
xor_shift_plus:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%rdi, (%r9 )
	movq	(%r9 ), %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
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
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%r8 )
	movq	(%r9 ), %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
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
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%rsi)
	movq	(%r9 ), %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
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
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	$23, %rcx
	shlq	%cl, %rax
	movq	%rax, %rdi
	movq	(%r8 ), %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	xor
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, (%r8 )
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	$17, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdi
	movq	(%r8 ), %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	xor
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, (%r8 )
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	$26, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdi
	movq	(%rsi), %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	xor
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdi
	movq	(%r8 ), %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	xor
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, (%r8 )
	movq	(%r9 ), %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdi
	movq	(%r8 ), %rdx
	movq	%rdx, (%rdi)
	movq	(%r8 ), %rdi
	movq	(%rsi), %rdx
	addq	%rdi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %r8 
	pushq	%r10
	pushq	%r8 
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r8 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	movq	$2, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-8(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond4184
	.text
_body4183:
	movq	(%rdi), %r11
	movq	(%r10), %r9 
	movq	%r11, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %rsi
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
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r10)
	jmp	_cond4184
	.text
_body4203:
	movq	(%rsi), %rdi
	movq	(%r8 ), %r9 
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %rsi
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
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%r8 ), %rdi
	addq	$1, %rdi
	imulq	$100, %rdi
	movq	%rdi, (%rdx)
	movq	(%r8 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r8 )
	jmp	_cond4204
	.text
_cond4184:
	movq	(%r10), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	-24(%rbp), %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body4183
	jmp	_post4182
	.text
_cond4204:
	movq	(%r8 ), %rdx
	cmpq	$2, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body4203
	jmp	_post4202
	.text
_post4182:
	movq	-8(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond4204
	.text
_post4202:
	movq	(%rsi), %rdx
	pushq	%rsi
	movq	%rdx, %rdi
	callq	xor_shift_plus
	popq	%rsi
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_int
	popq	%rdx
	popq	%rsi
	leaq	_str_arr4220(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	popq	%rsi
	movq	(%rsi), %rdx
	movq	%rdx, %rdi
	callq	xor_shift_plus
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_int
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	