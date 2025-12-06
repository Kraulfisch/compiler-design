	.text
	.globl	binary_gcd
binary_gcd:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	%rdi, (%r8 )
	movq	%rsi, (%r9 )
	movq	(%r8 ), %rsi
	movq	(%r9 ), %rdx
	cmpq	%rdx, %rsi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4931
	jmp	_else4930
	.text
_else4930:
	jmp	_merge4929
	.text
_else4936:
	jmp	_merge4935
	.text
_else4942:
	jmp	_merge4941
	.text
_else4962:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rsi
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdx
	pushq	%rsi
	movq	%rdx, %rdi
	callq	binary_gcd
	popq	%rsi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shlq	%cl, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_else4965:
	jmp	_merge4964
	.text
_else4976:
	jmp	_merge4975
	.text
_else4988:
	jmp	_merge4987
	.text
_merge4929:
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4937
	jmp	_else4936
	.text
_merge4935:
	movq	(%r9 ), %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4943
	jmp	_else4942
	.text
_merge4941:
	movq	(%r8 ), %rdx
	xorq	$-1, %rdx
	andq	$1, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4966
	jmp	_else4965
	.text
_merge4961:
	jmp	_merge4964
	.text
_merge4964:
	movq	(%r9 ), %rdx
	xorq	$-1, %rdx
	andq	$1, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4977
	jmp	_else4976
	.text
_merge4975:
	movq	(%r8 ), %rsi
	movq	(%r9 ), %rdx
	cmpq	%rdx, %rsi
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4989
	jmp	_else4988
	.text
_merge4987:
	movq	(%r8 ), %rdi
	movq	(%r9 ), %rdx
	movq	(%r8 ), %rsi
	subq	%rsi, %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdx
	pushq	%rdi
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	binary_gcd
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4931:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4937:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4943:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4963:
	movq	(%r9 ), %rdx
	movq	(%r8 ), %rsi
	movq	%rsi, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rsi
	pushq	%rsi
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	binary_gcd
	popq	%rsi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4966:
	movq	(%r9 ), %rdx
	andq	$1, %rdx
	cmpq	$1, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4963
	jmp	_else4962
	.text
_then4977:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rsi
	movq	(%r8 ), %rdx
	pushq	%rsi
	movq	%rdx, %rdi
	callq	binary_gcd
	popq	%rsi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4989:
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdi
	movq	(%r9 ), %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdx
	pushq	%rsi
	movq	%rdx, %rdi
	callq	binary_gcd
	popq	%rsi
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
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	$21, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$15, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rdx
	movq	(%rsi), %rsi
	pushq	%rsi
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	binary_gcd
	popq	%rsi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	