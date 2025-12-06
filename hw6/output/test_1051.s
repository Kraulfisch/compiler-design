	.data
	.globl	lfsr_iterations
lfsr_iterations:
	.quad	5
	.data
	.globl	lfsr_length
lfsr_length:
	.quad	4
	.data
	.globl	lfsr_init_values
lfsr_init_values:
	.quad	_global_arr5170
	.data
	.globl	_global_arr5170
_global_arr5170:
	.quad	4
	.quad	1
	.quad	0
	.quad	1
	.quad	0
	.data
	.globl	_str_arr5148
_str_arr5148:
	.asciz	"T"
	.data
	.globl	_str_arr5150
_str_arr5150:
	.asciz	"F"
	.data
	.globl	_str_arr5113
_str_arr5113:
	.asciz	" "
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
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	movq	%rsi, %rdi
	andq	%rdx, %rdi
	movq	(%r9 ), %rdx
	cmpq	$0, %rdx
	sete	%sil
	andq	$1, %rsi
	movq	(%r8 ), %rdx
	andq	%rsi, %rdx
	orq	%rdi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	string_of_bool
string_of_bool:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%rdi, (%rdx)
	movq	(%rdx), %rdx
	cmpq	$0, %rdx
	jne	_then5154
	jmp	_else5153
	.text
_else5153:
	leaq	_str_arr5150(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge5152:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then5154:
	leaq	_str_arr5148(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	print_lfsr
print_lfsr:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r10
	movq	%rdi, (%r8 )
	movq	%rsi, (%r9 )
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5132
	.text
_body5131:
	movq	(%r8 ), %rsi
	movq	(%r10), %rdi
	movq	%rsi, %rax
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
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	movq	%rdx, %rdi
	callq	string_of_bool
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	(%r10), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r10)
	jmp	_cond5132
	.text
_cond5132:
	movq	(%r10), %rsi
	movq	(%r9 ), %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5131
	jmp	_post5130
	.text
_post5130:
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$40, %rsp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r8 
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_alloc_array
	popq	%rdx
	popq	%rdi
	popq	%r8 
	popq	%r10
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	movq	%rdx, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	-32(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5014
	.text
_body5013:
	movq	(%rsi), %r11
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
	jmp	_cond5014
	.text
_body5034:
	movq	(%rdi), %rsi
	movq	(%r8 ), %r9 
	movq	%rsi, %rax
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
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r9 
	leaq	lfsr_init_values(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r8 ), %r10
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r10, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r10, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%r9 )
	movq	(%r8 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r8 )
	jmp	_cond5035
	.text
_body5057:
	movq	(%rdi), %rsi
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %r8 
	subq	$2, %r8 
	movq	%rsi, %rax
	movq	%rax, %rdx
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
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r8 
	movq	(%rdi), %rsi
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %r9 
	subq	$1, %r9 
	movq	%rsi, %rax
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
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	pushq	%r8 
	pushq	%rdi
	movq	%r8 , %rsi
	movq	%rdx, %rdi
	callq	xor
	popq	%rdi
	popq	%r8 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5084
	.text
_body5083:
	movq	(%rdi), %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	%rsi, %rax
	movq	%rax, %rdx
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
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r8 
	movq	(%rdi), %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %r9 
	subq	$1, %r9 
	movq	%rsi, %rax
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
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%r8 )
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5084
	.text
_cond5014:
	movq	(%r10), %rdx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	cmpq	%r9 , %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5013
	jmp	_post5012
	.text
_cond5035:
	movq	(%r8 ), %rsi
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5034
	jmp	_post5033
	.text
_cond5058:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	lfsr_iterations(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5057
	jmp	_post5056
	.text
_cond5084:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$0, %rdx
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5083
	jmp	_post5082
	.text
_post5012:
	movq	-32(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond5035
	.text
_post5033:
	movq	$0, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5058
	.text
_post5056:
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	lfsr_init_values(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	print_lfsr
	popq	%rdx
	popq	%rsi
	popq	%rdi
	leaq	_str_arr5113(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	popq	%rdi
	leaq	lfsr_length(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%rdi), %rdx
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_lfsr
	popq	%rdx
	popq	%rsi
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post5082:
	movq	(%rdi), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, (%rsi)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5058