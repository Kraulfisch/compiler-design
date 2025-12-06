	.data
	.globl	node1
node1:
	.quad	node2
	.quad	node3
	.quad	50
	.data
	.globl	node2
node2:
	.quad	node4
	.quad	node5
	.quad	25
	.data
	.globl	node3
node3:
	.quad	node6
	.quad	node7
	.quad	75
	.data
	.globl	node4
node4:
	.quad	node8
	.quad	0
	.quad	10
	.data
	.globl	node5
node5:
	.quad	0
	.quad	0
	.quad	30
	.data
	.globl	node6
node6:
	.quad	0
	.quad	0
	.quad	60
	.data
	.globl	node7
node7:
	.quad	0
	.quad	0
	.quad	80
	.data
	.globl	node8
node8:
	.quad	0
	.quad	0
	.quad	1
	.text
	.globl	contains
contains:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r8 
	cmpq	%rsi, %r8 
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	equal
	jmp	notequal
	.text
equal:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
left:
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	cmpq	$0, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	none
	jmp	left_next
	.text
left_next:
	pushq	%rdi
	pushq	%rsi
	callq	contains
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
none:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
notequal:
	cmpq	%rsi, %r8 
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	left
	jmp	right
	.text
right:
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	cmpq	$0, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	none
	jmp	right_next
	.text
right_next:
	pushq	%rdi
	pushq	%rsi
	callq	contains
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	movq	$50, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	movq	%rax, %r11
	pushq	%r11
	movq	$25, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%r11
	movq	%rax, %r10
	pushq	%r11
	pushq	%r10
	movq	$75, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%r10
	popq	%r11
	movq	%rax, %r9 
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	movq	$10, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %r8 
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	movq	$30, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdi
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	movq	$60, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rsi
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$80, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, -24(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$1, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, -16(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$100, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, -8(%rbp)
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$120, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%rax, %rdx
	addq	%r11, %r10
	addq	%r9 , %r8 
	addq	%rdi, %rsi
	movq	-24(%rbp), %r9 
	addq	-16(%rbp), %r9 
	movq	-8(%rbp), %rdi
	addq	%rdx, %rdi
	addq	%r10, %r8 
	movq	%rsi, %rdx
	addq	%r9 , %rdx
	addq	%r8 , %rdx
	addq	%rdi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	