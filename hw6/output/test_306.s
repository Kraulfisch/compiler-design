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
	subq	$120, %rsp
	movq	%rcx, -8(%rbp)
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
	movq	%rsp, %r10
	movq	%rdi, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r8 , %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r9 , (%r10)
	movq	-48(%rbp), %rax
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
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	-32(%rbp), %rax
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
	movq	-40(%rbp), %rax
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
	movq	(%r10), %rdi
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %r9 
	movq	-56(%rbp), %r8 
	movq	-64(%rbp), %rcx
	movq	-72(%rbp), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	jmp	_merge5953
	.text
_then5958:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-48(%rbp), %rax
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	(%r10), %rdi
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -96(%rbp)
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %r9 
	movq	-80(%rbp), %r8 
	movq	-88(%rbp), %rcx
	movq	-96(%rbp), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	jmp	_merge6012
	.text
_then6017:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-48(%rbp), %rax
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-104(%rbp), %r9 
	movq	%rdi, %r8 
	movq	-112(%rbp), %rcx
	movq	-120(%rbp), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	popq	%rdx
	callq	dfs
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	jmp	_merge6070
	.text
_then6075:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-48(%rbp), %rax
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-48(%rbp), %rax
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
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
	subq	$200, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	movq	%rdi, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rsi, (%r9 )
	movq	%rdx, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
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
	movq	%rax, -48(%rbp)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	movq	%rdx, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	movq	-48(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5772
	.text
_body5771:
	movq	-64(%rbp), %rax
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
	movq	%rax, -72(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	%rsi, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -80(%rbp)
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	movq	%rsi, %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	movq	-80(%rbp), %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5790
	.text
_body5789:
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	(%r10), %rsi
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
	movq	%rax, -104(%rbp)
	movq	$0, %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5790
	.text
_body5818:
	movq	$0, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5827
	.text
_body5826:
	movq	(%r8 ), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r9 
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
	popq	%r9 
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
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
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rax
	cmpq	-136(%rbp), %rax
	setl	-144(%rbp)
	andq	$1, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	_body5771
	jmp	_post5770
	.text
_cond5790:
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -152(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -160(%rbp)
	movq	-152(%rbp), %rax
	cmpq	-160(%rbp), %rax
	setl	-168(%rbp)
	andq	$1, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	_body5789
	jmp	_post5788
	.text
_cond5819:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	(%r9 ), %rdx
	cmpq	%rdx, %rsi
	setl	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body5818
	jmp	_post5817
	.text
_cond5827:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
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
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5827
	.text
_post5770:
	movq	-48(%rbp), %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5819
	.text
_post5788:
	movq	-80(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	-176(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	_cond5772
	.text
_post5817:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post5825:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5819
	.text
_then5875:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r10
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -200(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %r9 
	movq	%r10, %r8 
	movq	-192(%rbp), %rcx
	movq	-200(%rbp), %rdi
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
	jmp	_merge5873
	.text
_then5878:
	movq	(%r8 ), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%r9 
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
	popq	%r9 
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
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
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
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
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
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
	subq	$1232, %rsp
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %rsi
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
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	subq	$8, %rsp
	movq	%rsp, -104(%rbp)
	subq	$8, %rsp
	movq	%rsp, -112(%rbp)
	subq	$8, %rsp
	movq	%rsp, -120(%rbp)
	subq	$8, %rsp
	movq	%rsp, -128(%rbp)
	subq	$8, %rsp
	movq	%rsp, -136(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -144(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -152(%rbp)
	movq	$1, %rax
	movq	-152(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -160(%rbp)
	movq	$0, %rax
	movq	-160(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -168(%rbp)
	movq	$1, %rax
	movq	-168(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -176(%rbp)
	movq	$0, %rax
	movq	-176(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -184(%rbp)
	movq	%rdx, %rax
	movq	-184(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -192(%rbp)
	movq	$1, %rax
	movq	-192(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -200(%rbp)
	movq	$1, %rax
	movq	-200(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -208(%rbp)
	movq	$0, %rax
	movq	-208(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -216(%rbp)
	movq	$1, %rax
	movq	-216(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -224(%rbp)
	movq	%rdx, %rax
	movq	-224(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -232(%rbp)
	movq	$1, %rax
	movq	-232(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -240(%rbp)
	movq	$0, %rax
	movq	-240(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -248(%rbp)
	movq	$1, %rax
	movq	-248(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -256(%rbp)
	movq	$1, %rax
	movq	-256(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -264(%rbp)
	movq	%rdx, %rax
	movq	-264(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -272(%rbp)
	movq	$0, %rax
	movq	-272(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -280(%rbp)
	movq	$1, %rax
	movq	-280(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -288(%rbp)
	movq	$1, %rax
	movq	-288(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -296(%rbp)
	movq	$0, %rax
	movq	-296(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -304(%rbp)
	movq	%rdx, %rax
	movq	-304(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -312(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -320(%rbp)
	movq	$0, %rax
	movq	-320(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -328(%rbp)
	movq	$0, %rax
	movq	-328(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -336(%rbp)
	movq	$1, %rax
	movq	-336(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -344(%rbp)
	movq	$0, %rax
	movq	-344(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, -352(%rbp)
	movq	$1, %rax
	movq	-352(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-312(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -360(%rbp)
	movq	%rdx, %rax
	movq	-360(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -368(%rbp)
	movq	$0, %rax
	movq	-368(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -376(%rbp)
	movq	$1, %rax
	movq	-376(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -384(%rbp)
	movq	$1, %rax
	movq	-384(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -392(%rbp)
	movq	$0, %rax
	movq	-392(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, -400(%rbp)
	movq	$1, %rax
	movq	-400(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-312(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -408(%rbp)
	movq	%rdx, %rax
	movq	-408(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$5, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -416(%rbp)
	movq	$1, %rax
	movq	-416(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -424(%rbp)
	movq	$1, %rax
	movq	-424(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -432(%rbp)
	movq	$1, %rax
	movq	-432(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, -440(%rbp)
	movq	$1, %rax
	movq	-440(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$32, %rax
	movq	%rax, -448(%rbp)
	movq	$1, %rax
	movq	-448(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-312(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -456(%rbp)
	movq	%rdx, %rax
	movq	-456(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-312(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -464(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -472(%rbp)
	movq	$1, %rax
	movq	-472(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -480(%rbp)
	movq	$0, %rax
	movq	-480(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -488(%rbp)
	movq	$1, %rax
	movq	-488(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-464(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -496(%rbp)
	movq	%rdx, %rax
	movq	-496(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -504(%rbp)
	movq	$0, %rax
	movq	-504(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -512(%rbp)
	movq	$1, %rax
	movq	-512(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -520(%rbp)
	movq	$0, %rax
	movq	-520(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-464(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -528(%rbp)
	movq	%rdx, %rax
	movq	-528(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -536(%rbp)
	movq	$1, %rax
	movq	-536(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -544(%rbp)
	movq	$0, %rax
	movq	-544(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -552(%rbp)
	movq	$1, %rax
	movq	-552(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-464(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, -560(%rbp)
	movq	%rdx, %rax
	movq	-560(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-464(%rbp), %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	callq	four
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	oat_alloc_array
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %r11
	movq	%r11, %rax
	movq	%rax, -568(%rbp)
	subq	$8, %rsp
	movq	%rsp, -576(%rbp)
	movq	%rdx, %rax
	movq	-576(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -584(%rbp)
	movq	-568(%rbp), %rax
	movq	-584(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5508
	.text
_body5507:
	movq	-584(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -592(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -600(%rbp)
	movq	-592(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-600(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	-592(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-600(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -608(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -616(%rbp)
	subq	$8, %rsp
	movq	%rsp, -624(%rbp)
	movq	$2, %rax
	movq	-624(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	-616(%rbp), %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5525
	.text
_body5524:
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -632(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -640(%rbp)
	movq	-632(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-640(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-632(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-640(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -648(%rbp)
	leaq	actual_341_midterm_score(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -656(%rbp)
	movq	-656(%rbp), %rax
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
	movq	-656(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -664(%rbp)
	movq	-664(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -672(%rbp)
	movq	-672(%rbp), %rax
	movq	-648(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -680(%rbp)
	movq	-680(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -688(%rbp)
	movq	-688(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5525
	.text
_body5560:
	movq	-1104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -696(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -704(%rbp)
	movq	-696(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-704(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	-696(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-704(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -712(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$6, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -720(%rbp)
	subq	$8, %rsp
	movq	%rsp, -728(%rbp)
	movq	$6, %rax
	movq	-728(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	-720(%rbp), %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5578
	.text
_body5577:
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -736(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -744(%rbp)
	movq	-736(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-744(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-736(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-744(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -752(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -760(%rbp)
	movq	-760(%rbp), %rax
	imulq	$0, %rax
	movq	%rax, -768(%rbp)
	movq	-768(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -776(%rbp)
	movq	-776(%rbp), %rax
	movq	-752(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -784(%rbp)
	movq	-784(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -792(%rbp)
	movq	-792(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5578
	.text
_body5619:
	movq	-1168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -800(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -808(%rbp)
	movq	-800(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-808(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	-800(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-808(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -816(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -824(%rbp)
	subq	$8, %rsp
	movq	%rsp, -832(%rbp)
	movq	$1, %rax
	movq	-832(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -840(%rbp)
	movq	-824(%rbp), %rax
	movq	-840(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5637
	.text
_body5636:
	movq	-840(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -848(%rbp)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -856(%rbp)
	movq	-848(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-856(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	-848(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-856(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -864(%rbp)
	leaq	ideal_341_midterm_score(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -872(%rbp)
	movq	-872(%rbp), %rax
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
	movq	-872(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -880(%rbp)
	movq	-880(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -888(%rbp)
	leaq	kesha_to_fling(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -896(%rbp)
	leaq	professor(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -904(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	-888(%rbp), %rdx
	movq	-896(%rbp), %rsi
	movq	-904(%rbp), %rdi
	callq	asian_brother_of_foo_named_fui
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %r11
	movq	%r11, %rax
	movq	%rax, %rdx
	pushq	%r11
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
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -912(%rbp)
	movq	-912(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -920(%rbp)
	movq	-920(%rbp), %rax
	movq	-864(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -928(%rbp)
	movq	-928(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -936(%rbp)
	movq	-936(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5637
	.text
_cond5508:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -944(%rbp)
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -952(%rbp)
	movq	-944(%rbp), %rax
	cmpq	-952(%rbp), %rax
	setl	-960(%rbp)
	andq	$1, -960(%rbp)
	cmpq	$0, -960(%rbp)
	jne	_body5507
	jmp	_post5506
	.text
_cond5525:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -968(%rbp)
	movq	-624(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -976(%rbp)
	movq	-968(%rbp), %rax
	cmpq	-976(%rbp), %rax
	setl	-984(%rbp)
	andq	$1, -984(%rbp)
	cmpq	$0, -984(%rbp)
	jne	_body5524
	jmp	_post5523
	.text
_cond5561:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -992(%rbp)
	movq	-1096(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1000(%rbp)
	movq	-992(%rbp), %rax
	cmpq	-1000(%rbp), %rax
	setl	-1008(%rbp)
	andq	$1, -1008(%rbp)
	cmpq	$0, -1008(%rbp)
	jne	_body5560
	jmp	_post5559
	.text
_cond5578:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1016(%rbp)
	movq	-728(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1024(%rbp)
	movq	-1016(%rbp), %rax
	cmpq	-1024(%rbp), %rax
	setl	-1032(%rbp)
	andq	$1, -1032(%rbp)
	cmpq	$0, -1032(%rbp)
	jne	_body5577
	jmp	_post5576
	.text
_cond5620:
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1040(%rbp)
	movq	-1160(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1048(%rbp)
	movq	-1040(%rbp), %rax
	cmpq	-1048(%rbp), %rax
	setl	-1056(%rbp)
	andq	$1, -1056(%rbp)
	cmpq	$0, -1056(%rbp)
	jne	_body5619
	jmp	_post5618
	.text
_cond5637:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1064(%rbp)
	movq	-832(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1072(%rbp)
	movq	-1064(%rbp), %rax
	cmpq	-1072(%rbp), %rax
	setl	-1080(%rbp)
	andq	$1, -1080(%rbp)
	cmpq	$0, -1080(%rbp)
	jne	_body5636
	jmp	_post5635
	.text
_else5733:
	jmp	_merge5732
	.text
_merge5732:
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rsi, %rdx
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rdx, %rsi
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rsi, %rdx
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	addq	%rdx, %rsi
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rdx, %rsi
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	addq	%rsi, %rdx
	movq	%rdx, (%r10)
	movq	(%r10), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_post5506:
	movq	-568(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$6, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -1088(%rbp)
	subq	$8, %rsp
	movq	%rsp, -1096(%rbp)
	movq	$6, %rax
	movq	-1096(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -1104(%rbp)
	movq	-1088(%rbp), %rax
	movq	-1104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5561
	.text
_post5523:
	movq	-616(%rbp), %rax
	movq	-608(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1112(%rbp)
	movq	-1112(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -1120(%rbp)
	movq	-1120(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5508
	.text
_post5559:
	movq	-1088(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -1128(%rbp)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$0, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -1136(%rbp)
	movq	-1128(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, -1144(%rbp)
	movq	-1136(%rbp), %rax
	movq	-1144(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-1128(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$1, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -1152(%rbp)
	subq	$8, %rsp
	movq	%rsp, -1160(%rbp)
	movq	$1, %rax
	movq	-1160(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -1168(%rbp)
	movq	-1152(%rbp), %rax
	movq	-1168(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5620
	.text
_post5576:
	movq	-720(%rbp), %rax
	movq	-712(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1176(%rbp)
	movq	-1176(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -1184(%rbp)
	movq	-1184(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5561
	.text
_post5618:
	movq	-1152(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1192(%rbp)
	movq	-1192(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1200(%rbp)
	movq	-1200(%rbp), %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1208(%rbp)
	movq	-1208(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	_str_arr5678(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r10
	movq	(%r8 ), %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rsi
	movq	%rdx, %rdi
	movq	$4, %rdx
	callq	connected
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%rdi), %rdx
	pushq	%r10
	pushq	%rsi
	movq	$3, %rsi
	movq	%rdx, %rdi
	movq	$5, %rdx
	callq	connected
	popq	%rsi
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	(%rsi), %rdx
	pushq	%r10
	movq	$3, %rsi
	movq	%rdx, %rdi
	movq	$3, %rdx
	callq	connected
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r10
	movq	$4, %rsi
	movq	%rdx, %rdi
	movq	$2, %rdx
	callq	connected
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-112(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1216(%rbp)
	pushq	%r10
	movq	$6, %rdx
	movq	$6, %rsi
	movq	-1216(%rbp), %rdi
	callq	connected
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-120(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r10
	movq	$1, %rsi
	movq	%rdx, %rdi
	movq	$1, %rdx
	callq	connected
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r10
	movq	$0, %rsi
	movq	%rdx, %rdi
	movq	$0, %rdx
	callq	connected
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	-136(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$3, %rdx
	sete	%sil
	andq	$1, %rsi
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$5, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-120(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	andq	%rdx, %rsi
	movq	-136(%rbp), %rax
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
	movq	-824(%rbp), %rax
	movq	-816(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1224(%rbp)
	movq	-1224(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -1232(%rbp)
	movq	-1232(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond5620
	.text
_then5734:
	leaq	_str_arr5729(%rip), %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	popq	%r10
	jmp	_merge5732