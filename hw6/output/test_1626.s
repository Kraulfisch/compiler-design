	.data
	.globl	_str_arr6899
_str_arr6899:
	.asciz	"hello"
	.text
	.globl	neg
neg:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%rdi, (%rdx)
	movq	(%rdx), %rdx
	movq	$0, %rax
	subq	%rdx, %rax
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
	subq	$16, %rsp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rdi
	pushq	%r9 
	pushq	%rdi
	movq	$48, %rdi
	callq	oat_malloc
	popq	%rdi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	$3, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	$1, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	leaq	_str_arr6899(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %r8 
	movq	%rsi, (%r8 )
	pushq	%r9 
	pushq	%rdi
	pushq	%rdx
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rdx
	popq	%rdi
	popq	%r9 
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	movq	$3, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	-8(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond6914
	.text
_body6913:
	movq	(%rsi), %r11
	movq	(%r9 ), %r8 
	movq	%r11, %rax
	movq	%rax, -16(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rsi
	movq	-16(%rbp), %rdi
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
	movq	%rax, %r8 
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %r8 
	addq	$1, %r8 
	movq	%r8 , (%r9 )
	jmp	_cond6914
	.text
_cond6914:
	movq	(%r9 ), %r8 
	movq	(%r10), %r11
	cmpq	%r11, %r8 
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	_body6913
	jmp	_post6912
	.text
_else6952:
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge6951:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post6912:
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$24, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$32, %rax
	movq	%rax, %rsi
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$40, %rax
	movq	%rax, %rsi
	leaq	neg(%rip), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	%rdx, (%rdi)
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	popq	%rdi
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	cmpq	$0, %rdx
	jne	_then6953
	jmp	_else6952
	.text
_then6953:
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$40, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	pushq	%r15
	movq	%rsi, %r15
	pushq	%rsi
	movq	%rdx, %rdi
	callq	*%r15
	popq	%rsi
	popq	%r15
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	