	.data
	.globl	_str_arr4037
_str_arr4037:
	.asciz	"Correct!"
	.text
	.globl	euclid_division
euclid_division:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r11)
	movq	%rsi, (%r10)
	movq	(%r10), %rdx
	cmpq	$0, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4116
	jmp	_else4115
	.text
_body4131:
	movq	(%r9 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r9 )
	movq	(%r8 ), %rdx
	movq	(%r10), %rsi
	subq	%rsi, %rdx
	movq	%rdx, (%r8 )
	jmp	_cond4132
	.text
_body4157:
	movq	(%r9 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r9 )
	movq	(%r8 ), %rdx
	movq	(%r10), %rsi
	subq	%rsi, %rdx
	movq	%rdx, (%r8 )
	jmp	_cond4158
	.text
_cond4132:
	movq	(%r8 ), %rdx
	movq	(%r10), %rsi
	cmpq	%rsi, %rdx
	setge	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body4131
	jmp	_post4130
	.text
_cond4158:
	movq	(%r8 ), %rdx
	movq	(%r10), %rsi
	cmpq	%rsi, %rdx
	setge	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body4157
	jmp	_post4156
	.text
_else4115:
	jmp	_merge4114
	.text
_else4148:
	movq	(%r9 ), %rdx
	movq	$0, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_else4151:
	jmp	_merge4150
	.text
_merge4114:
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	movq	(%r11), %rdx
	movq	%rdx, (%r8 )
	movq	(%r11), %rdx
	cmpq	$0, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4152
	jmp	_else4151
	.text
_merge4147:
	jmp	_merge4150
	.text
_merge4150:
	jmp	_cond4158
	.text
_post4130:
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4149
	jmp	_else4148
	.text
_post4156:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4116:
	movq	(%r10), %rdx
	movq	$0, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	(%r11), %rsi
	pushq	%rsi
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	euclid_division
	popq	%rsi
	movq	%rax, %rdx
	movq	$0, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4149:
	movq	(%r9 ), %rdx
	movq	$0, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4152:
	movq	(%r11), %rdx
	movq	$0, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, (%r8 )
	jmp	_cond4132
	.text
	.globl	binary_search
binary_search:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	%rdi, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, (%r8 )
	movq	-8(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rsi
	movq	(%r8 ), %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4060
	jmp	_else4059
	.text
_else4059:
	jmp	_merge4058
	.text
_else4082:
	jmp	_merge4081
	.text
_else4099:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge4058:
	movq	(%r10), %rsi
	movq	(%r8 ), %rdx
	addq	%rsi, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	movq	$2, %rsi
	movq	%rdx, %rdi
	callq	euclid_division
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, (%r9 )
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r9 ), %rdx
	movq	%rsi, %rax
	movq	%rax, -32(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rsi
	movq	-32(%rbp), %rdi
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
	movq	(%rdx), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4083
	jmp	_else4082
	.text
_merge4081:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r9 ), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	movq	(%rdx), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4100
	jmp	_else4099
	.text
_merge4098:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4060:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4083:
	movq	(%r9 ), %rdx
	movq	%rdx, %r9 
	subq	$1, %r9 
	movq	(%r8 ), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	pushq	%r9 
	pushq	%rdi
	pushq	%rsi
	movq	%r9 , %rcx
	callq	binary_search
	popq	%rsi
	popq	%rdi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4100:
	movq	(%r10), %rsi
	movq	(%r9 ), %rdx
	movq	%rdx, %r8 
	addq	$1, %r8 
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%rsi, %rcx
	movq	%rdx, %rsi
	movq	%r8 , %rdx
	callq	binary_search
	popq	%rsi
	popq	%rdi
	popq	%r8 
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
	subq	$40, %rsp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	pushq	%r9 
	pushq	%rdi
	pushq	%rdx
	movq	$100, %rdi
	callq	oat_alloc_array
	popq	%rdx
	popq	%rdi
	popq	%r9 
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	movq	$100, %rax
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
	jmp	_cond3988
	.text
_body3987:
	movq	(%rsi), %r11
	movq	(%r9 ), %r8 
	movq	%r11, %rax
	movq	%rax, -24(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rsi
	movq	-24(%rbp), %rdi
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
	jmp	_cond3988
	.text
_body4007:
	movq	(%rdx), %r8 
	movq	(%rdi), %r9 
	movq	%r8 , %rax
	movq	%rax, %rsi
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	%r9 , %rsi
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
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	movq	(%rdi), %r8 
	imulq	$2, %r8 
	addq	$1, %r8 
	movq	%r8 , (%rsi)
	movq	(%rdi), %rsi
	addq	$1, %rsi
	movq	%rsi, (%rdi)
	jmp	_cond4008
	.text
_cond3988:
	movq	(%r9 ), %r8 
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	-16(%rbp), %r8 
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	_body3987
	jmp	_post3986
	.text
_cond4008:
	movq	(%rdi), %rsi
	cmpq	$100, %rsi
	setl	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_body4007
	jmp	_post4006
	.text
_else4041:
	jmp	_merge4040
	.text
_merge4040:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post3986:
	movq	-8(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond4008
	.text
_post4006:
	movq	(%rdx), %rsi
	pushq	%rdx
	movq	$99, %rcx
	movq	$0, %rdx
	movq	%rsi, %rdi
	movq	$80, %rsi
	callq	binary_search
	popq	%rdx
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rdx
	movq	$99, %rcx
	movq	$81, %rsi
	movq	%rdx, %rdi
	movq	$0, %rdx
	callq	binary_search
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	andq	%rsi, %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	orq	%rdi, %rsi
	andq	%rsi, %rdx
	cmpq	$0, %rdx
	jne	_then4042
	jmp	_else4041
	.text
_then4042:
	leaq	_str_arr4037(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	jmp	_merge4040