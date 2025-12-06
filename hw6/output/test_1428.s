	.data
	.globl	meaning_of_life
meaning_of_life:
	.quad	42
	.data
	.globl	kesha_to_fling
kesha_to_fling:
	.quad	1
	.data
	.globl	professor
professor:
	.quad	_str6184
	.data
	.globl	_str6184
_str6184:
	.asciz	"Zdancewic!"
	.data
	.globl	global_arr
global_arr:
	.quad	_global_arr6183
	.data
	.globl	_global_arr6183
_global_arr6183:
	.quad	7
	.quad	1
	.quad	1
	.quad	2
	.quad	3
	.quad	5
	.quad	8
	.quad	13
	.data
	.globl	null_arr
null_arr:
	.quad	0
	.data
	.globl	ideal_341_midterm_score
ideal_341_midterm_score:
	.quad	_global_arr6182
	.data
	.globl	_global_arr6182
_global_arr6182:
	.quad	1
	.quad	100
	.data
	.globl	actual_341_midterm_score
actual_341_midterm_score:
	.quad	_global_arr6181
	.data
	.globl	_global_arr6181
_global_arr6181:
	.quad	1
	.quad	0
	.data
	.globl	_str_arr6151
_str_arr6151:
	.asciz	"Meaning of Life"
	.data
	.globl	_str_arr5678
_str_arr5678:
	.asciz	"My name is Jeff...\n"
	.data
	.globl	_str_arr5729
_str_arr5729:
	.asciz	"Charizard is the BEST Pokemon ever!!!"
	.text
	.globl	four
four:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	leaq	meaning_of_life(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	leaq	global_arr(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	%r8 , %rax
	movq	%rax, %rsi
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	$5, %rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$40, %rax
	movq	%rax, %rsi
	movq	(%rsi), %r8 
	leaq	global_arr(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	movq	%r9 , %rax
	movq	%rax, %rsi
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	$4, %rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, %rsi
	movq	(%rsi), %rsi
	imulq	%r8 , %rsi
	movq	%rdi, %r8 
	subq	%rsi, %r8 
	leaq	global_arr(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdi, %rax
	movq	%rax, %rsi
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	$2, %rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rsi
	movq	(%rsi), %rsi
	addq	%r8 , %rsi
	movq	%rsi, (%rdx)
	movq	(%rdx), %rdx
	addq	$0, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	asian_brother_of_foo_named_fui
asian_brother_of_foo_named_fui:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	leaq	global_arr(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, (%rsi)
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	dfs
dfs:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$72, %rsp
	movq	%rcx, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	subq	$8, %rsp
	movq	%rsp, -72(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	movq	%rdi, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r8 , %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r9 , (%r10)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	cmpq	$0, %rdx
	setge	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then5961
	jmp	_else5960
	.text
_else5954:
	jmp	_merge5953
	.text
_else5957:
	jmp	_merge5956
	.text
_else5960:
	jmp	_merge5959
	.text
_else6013:
	jmp	_merge6012
	.text
_else6016:
	jmp	_merge6015
	.text
_else6019:
	jmp	_merge6018
	.text
_else6071:
	jmp	_merge6070
	.text
_else6074:
	jmp	_merge6073
	.text
_else6077:
	jmp	_merge6076
	.text
_else6130:
	jmp	_merge6129
	.text
_else6133:
	jmp	_merge6132
	.text
_else6136:
	jmp	_merge6135
	.text
_merge5953:
	jmp	_merge5956
	.text
_merge5956:
	jmp	_merge5959
	.text
_merge5959:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6020
	jmp	_else6019
	.text
_merge6012:
	jmp	_merge6015
	.text
_merge6015:
	jmp	_merge6018
	.text
_merge6018:
	movq	(%r10), %rdx
	subq	$1, %rdx
	cmpq	$0, %rdx
	setge	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6078
	jmp	_else6077
	.text
_merge6070:
	jmp	_merge6073
	.text
_merge6073:
	jmp	_merge6076
	.text
_merge6076:
	movq	(%r10), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6137
	jmp	_else6136
	.text
_merge6129:
	jmp	_merge6132
	.text
_merge6132:
	jmp	_merge6135
	.text
_merge6135:
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then5955:
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %r8 
	subq	$1, %r8 
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rcx
	movq	%r9 , %rdi
	movq	-48(%rbp), %r9 
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	jmp	_merge5953
	.text
_then5958:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	subq	$1, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rsi
	subq	$1, %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then5955
	jmp	_else5954
	.text
_then5961:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	subq	$1, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then5958
	jmp	_else5957
	.text
_then6014:
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %r8 
	addq	$1, %r8 
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rcx
	movq	%r9 , %rdi
	movq	-40(%rbp), %r9 
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	jmp	_merge6012
	.text
_then6017:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	addq	$1, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6014
	jmp	_else6013
	.text
_then6020:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	addq	$1, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6017
	jmp	_else6016
	.text
_then6072:
	movq	(%r10), %rdx
	movq	%rdx, %r9 
	subq	$1, %r9 
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rcx
	movq	%rdi, %r8 
	movq	-24(%rbp), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	jmp	_merge6070
	.text
_then6075:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	(%r10), %rdx
	movq	%rdx, %rdi
	subq	$1, %rdi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	movq	(%r10), %rdx
	movq	%rdx, %rdi
	subq	$1, %rdi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6072
	jmp	_else6071
	.text
_then6078:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	(%r10), %rdx
	movq	%rdx, %rdi
	subq	$1, %rdi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6075
	jmp	_else6074
	.text
_then6131:
	movq	(%r10), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r10
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rcx
	movq	%rdi, %r8 
	movq	%r10, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	movq	%r9 , %rdx
	popq	%r9 
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	jmp	_merge6129
	.text
_then6134:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	(%r10), %rdx
	movq	%rdx, %rdi
	addq	$1, %rdi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	movq	(%r10), %rdx
	movq	%rdx, %rdi
	addq	$1, %rdi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6131
	jmp	_else6130
	.text
_then6137:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	(%r10), %rdx
	movq	%rdx, %rdi
	addq	$1, %rdi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
	cmpq	$1, %rdx
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then6134
	jmp	_else6133
	.text
	.globl	connected
connected:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$152, %rsp
	subq	$8, %rsp
	movq	%rsp, -152(%rbp)
	subq	$8, %rsp
	movq	%rsp, -120(%rbp)
	subq	$8, %rsp
	movq	%rsp, -136(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, -112(%rbp)
	subq	$8, %rsp
	movq	%rsp, -128(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, %rax
	movq	-152(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	movq	-120(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	movq	-136(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_alloc_array
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -104(%rbp)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	movq	%rdx, %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	movq	-104(%rbp), %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5772
	.text
_body5771:
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r11), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r11
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
	popq	%r11
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -144(%rbp)
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_alloc_array
	popq	%rdx
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	%rdx, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond5790
	.text
_body5789:
	movq	(%rdx), %rdi
	movq	(%r9 ), %rsi
	movq	%rdi, %rax
	movq	%rax, -80(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-80(%rbp), %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	$0, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond5790
	.text
_body5818:
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond5827
	.text
_body5826:
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r10), %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r8 ), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
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
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then5878
	jmp	_else5877
	.text
_cond5772:
	movq	(%r11), %rdx
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5771
	jmp	_post5770
	.text
_cond5790:
	movq	%r9 , %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-40(%rbp), %rax
	cmpq	-72(%rbp), %rax
	setl	-64(%rbp)
	andq	$1, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	_body5789
	jmp	_post5788
	.text
_cond5819:
	movq	(%r10), %rsi
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5818
	jmp	_post5817
	.text
_cond5827:
	movq	(%r8 ), %rdx
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5826
	jmp	_post5825
	.text
_else5874:
	jmp	_merge5873
	.text
_else5877:
	jmp	_merge5876
	.text
_merge5873:
	jmp	_merge5876
	.text
_merge5876:
	movq	(%r8 ), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r8 )
	jmp	_cond5827
	.text
_post5770:
	movq	-104(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5819
	.text
_post5788:
	movq	-16(%rbp), %rax
	movq	-144(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r11), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r11)
	jmp	_cond5772
	.text
_post5817:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post5825:
	movq	(%r10), %rdx
	addq	$1, %rdx
	movq	%rdx, (%r10)
	jmp	_cond5819
	.text
_then5875:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r8 ), %rdi
	movq	(%r10), %r9 
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r11
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %r8 
	movq	%r11, %rcx
	movq	%rdi, %r9 
	movq	-24(%rbp), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	jmp	_merge5873
	.text
_then5878:
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r10), %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r10
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r10
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r8 ), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
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
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r10), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
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
	popq	%r10
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	(%r8 ), %rsi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r10
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
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then5875
	jmp	_else5874
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$344, %rsp
	subq	$8, %rsp
	movq	%rsp, -320(%rbp)
	subq	$8, %rsp
	movq	%rsp, -312(%rbp)
	subq	$8, %rsp
	movq	%rsp, -304(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -344(%rbp)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -280(%rbp)
	subq	$8, %rsp
	movq	%rsp, -232(%rbp)
	subq	$8, %rsp
	movq	%rsp, -216(%rbp)
	subq	$8, %rsp
	movq	%rsp, -168(%rbp)
	subq	$8, %rsp
	movq	%rsp, -248(%rbp)
	subq	$8, %rsp
	movq	%rsp, -328(%rbp)
	subq	$8, %rsp
	movq	%rsp, -296(%rbp)
	subq	$8, %rsp
	movq	%rsp, -272(%rbp)
	subq	$8, %rsp
	movq	%rsp, -264(%rbp)
	subq	$8, %rsp
	movq	%rsp, -224(%rbp)
	subq	$8, %rsp
	movq	%rsp, -288(%rbp)
	subq	$8, %rsp
	movq	%rsp, -240(%rbp)
	subq	$8, %rsp
	movq	%rsp, -256(%rbp)
	subq	$8, %rsp
	movq	%rsp, -336(%rbp)
	movq	$4, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdi
	pushq	%rdi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	movq	%rdi, %rax
	movq	-320(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdi
	pushq	%rdi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	movq	%rdi, %rax
	movq	-312(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdi
	pushq	%rdi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	pushq	%rdi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	movq	%rdi, %rax
	movq	-304(%rbp), %rcx
	movq	%rax, (%rcx)
	callq	four
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_alloc_array
	popq	%rdx
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, -144(%rbp)
	subq	$8, %rsp
	movq	%rsp, -128(%rbp)
	movq	%rdx, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-144(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5508
	.text
_body5507:
	movq	(%rdi), %r8 
	movq	-64(%rbp), %rax
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
	movq	%rax, -208(%rbp)
	pushq	%rdi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$2, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%r10, (%rsi)
	movq	$0, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5525
	.text
_body5524:
	movq	(%rsi), %r11
	movq	-32(%rbp), %rax
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
	movq	%rax, -200(%rbp)
	leaq	actual_341_midterm_score(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	%r8 , %rax
	movq	%rax, %rdx
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
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	-200(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5525
	.text
_body5560:
	movq	(%rsi), %r8 
	movq	-56(%rbp), %rax
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
	movq	%rax, -192(%rbp)
	pushq	%r9 
	pushq	%rsi
	movq	$6, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$6, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%r10, (%rdx)
	movq	$0, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5578
	.text
_body5577:
	movq	(%rdx), %r11
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%r11, %rax
	movq	%rax, -16(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
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
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	imulq	$0, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdi, %rax
	addq	$1, %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5578
	.text
_body5619:
	movq	(%rdi), %r8 
	movq	-216(%rbp), %rax
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
	movq	%rax, -184(%rbp)
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
	movq	-168(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5637
	.text
_body5636:
	movq	(%rsi), %r11
	movq	-168(%rbp), %rax
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
	movq	%rax, -176(%rbp)
	leaq	ideal_341_midterm_score(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	%r8 , %rax
	movq	%rax, %rdx
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
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r11
	leaq	kesha_to_fling(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	leaq	professor(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rsi
	movq	%rdx, %rdi
	movq	%r11, %rdx
	callq	asian_brother_of_foo_named_fui
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %r8 
	movq	%r8 , %rax
	movq	%rax, %rdx
	pushq	%r10
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
	popq	%r10
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	-176(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-168(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5637
	.text
_cond5508:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5507
	jmp	_post5506
	.text
_cond5525:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%r9 , %rax
	movq	(%rax), %rax
	movq	%rax, -160(%rbp)
	cmpq	-160(%rbp), %rdx
	setl	-112(%rbp)
	andq	$1, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	_body5524
	jmp	_post5523
	.text
_cond5561:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r9 ), %rdi
	cmpq	%rdi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5560
	jmp	_post5559
	.text
_cond5578:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%r8 , %rax
	movq	(%rax), %rax
	movq	%rax, -152(%rbp)
	cmpq	-152(%rbp), %rdi
	setl	-96(%rbp)
	andq	$1, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	_body5577
	jmp	_post5576
	.text
_cond5620:
	movq	-216(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	cmpq	%rsi, %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5619
	jmp	_post5618
	.text
_cond5637:
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	(%r9 ), %r8 
	cmpq	%r8 , %rdx
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5636
	jmp	_post5635
	.text
_else5733:
	jmp	_merge5732
	.text
_merge5732:
	movq	-296(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rsi, %rdx
	movq	-264(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rdx, %rsi
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rsi, %rdx
	movq	-288(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rdx, %rsi
	movq	-240(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rdx, %rsi
	movq	-256(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	-336(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-336(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post5506:
	movq	-144(%rbp), %rax
	movq	-344(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$6, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$6, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	-8(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5561
	.text
_post5523:
	movq	%r10, %rax
	movq	-208(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5508
	.text
_post5559:
	movq	-8(%rbp), %rax
	movq	-280(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$1, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdi
	pushq	%rdi
	movq	$0, %rdi
	callq	oat_alloc_array
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%rsi, (%rdx)
	movq	%rdi, %rax
	movq	-232(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$1, %rdi
	callq	oat_alloc_array
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -136(%rbp)
	subq	$8, %rsp
	movq	%rsp, -120(%rbp)
	movq	$1, %rax
	movq	-120(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-136(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-216(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5620
	.text
_post5576:
	movq	%r10, %rax
	movq	-192(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5561
	.text
_post5618:
	movq	-136(%rbp), %rax
	movq	-248(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-280(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-232(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-328(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-232(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-328(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-248(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	_str_arr5678(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	movq	-320(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$4, %rsi
	movq	%rdx, %rdi
	movq	$4, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-296(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$3, %rsi
	movq	%rdx, %rdi
	movq	$5, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-272(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$3, %rsi
	movq	%rdx, %rdi
	movq	$3, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-264(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-344(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$4, %rsi
	movq	%rdx, %rdi
	movq	$2, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-224(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-280(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$6, %rsi
	movq	%rdx, %rdi
	movq	$6, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-288(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-232(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	movq	$1, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-240(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	$0, %rsi
	movq	%rdx, %rdi
	movq	$0, %rdx
	callq	connected
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-256(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-296(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$3, %rdx
	sete	%sil
	andq	$1, %rsi
	movq	-272(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-264(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$5, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-288(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-240(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-256(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rsi, %rdx
	cmpq	$0, %rdx
	jne	_then5734
	jmp	_else5733
	.text
_post5635:
	movq	%r10, %rax
	movq	-184(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-216(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-216(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5620
	.text
_then5734:
	leaq	_str_arr5729(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	jmp	_merge5732