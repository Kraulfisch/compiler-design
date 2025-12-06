	.data
	.globl	buf
buf:
	.quad	_global_arr8768
	.data
	.globl	_global_arr8768
_global_arr8768:
	.quad	1
	.quad	0
	.data
	.globl	_str_arr8674
_str_arr8674:
	.asciz	""
	.data
	.globl	_str_arr8645
_str_arr8645:
	.asciz	"TOMATO"
	.data
	.globl	_str_arr8649
_str_arr8649:
	.asciz	"ORATING"
	.text
	.globl	lcs
lcs:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rcx, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
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
	movq	%rdi, (%r9 )
	movq	%rsi, (%r8 )
	movq	%rdx, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	cmpq	$0, %rdx
	setl	%sil
	andq	$1, %rsi
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	setl	%dl
	andq	$1, %rdx
	orq	%rsi, %rdx
	cmpq	$0, %rdx
	jne	_then8678
	jmp	_else8677
	.text
_else8677:
	jmp	_merge8676
	.text
_else8734:
	jmp	_merge8733
	.text
_else8766:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge8676:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	movq	%rdx, %rdi
	callq	array_of_string
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	movq	%rdx, %rdi
	callq	array_of_string
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r9 ), %rdx
	movq	%rsi, %rax
	movq	%rax, -104(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rsi
	movq	-104(%rbp), %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdx, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r8 ), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
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
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then8735
	jmp	_else8734
	.text
_merge8733:
	movq	(%r10), %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	(%r8 ), %rdx
	movq	%rdx, %rsi
	subq	$1, %rsi
	movq	(%r9 ), %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rdi, %rcx
	movq	%rdx, %rdi
	movq	-112(%rbp), %rdx
	callq	lcs
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r8 ), %rdi
	movq	(%r9 ), %r8 
	subq	$1, %r8 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	movq	%r8 , %rdi
	callq	lcs
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rdi
	callq	length_of_string
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rdi
	callq	length_of_string
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then8767
	jmp	_else8766
	.text
_merge8765:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8678:
	leaq	_str_arr8674(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8735:
	movq	(%r10), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r8 ), %rdx
	movq	%rdx, %r8 
	subq	$1, %r8 
	movq	(%r9 ), %rdx
	subq	$1, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rsi, %rcx
	movq	%r8 , %rsi
	pushq	%rdi
	movq	%rdx, %rdi
	popq	%rdx
	callq	lcs
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	buf(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r9 
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%r9 ), %rdi
	movq	%r8 , %rax
	movq	%rax, %rdx
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
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%rsi)
	leaq	buf(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rdi
	callq	string_of_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%rsi
	movq	%rdx, %rdi
	callq	string_cat
	popq	%rsi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8767:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
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
	subq	$8, %rsp
	movq	%rsp, %rdi
	leaq	_str_arr8645(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	%rsi, (%rdx)
	leaq	_str_arr8649(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	%rsi, (%rdi)
	movq	(%rdi), %rsi
	movq	(%rdx), %rdx
	pushq	%rsi
	movq	%rsi, %rcx
	movq	$5, %rdi
	movq	$6, %rsi
	callq	lcs
	popq	%rsi
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	