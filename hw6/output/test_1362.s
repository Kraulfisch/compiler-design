	.data
	.globl	mat1
mat1:
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.data
	.globl	mat2
mat2:
	.quad	5
	.quad	6
	.quad	7
	.quad	8
	.data
	.globl	mat3
mat3:
	.quad	19
	.quad	22
	.quad	43
	.quad	50
	.data
	.globl	matr
matr:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$10000000, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	loop
	.text
body:
	pushq	%rsi
	leaq	matr(%rip), %rdx
	leaq	mat2(%rip), %rsi
	leaq	mat1(%rip), %rdi
	callq	matmul
	popq	%rsi
	pushq	%rsi
	leaq	matr(%rip), %rsi
	leaq	mat3(%rip), %rdi
	callq	mateq
	popq	%rsi
	movq	%rax, %rdx
	movq	(%rsi), %rdx
	subq	$1, %rdx
	movq	%rdx, (%rsi)
	jmp	loop
	.text
exit:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
loop:
	movq	(%rsi), %rdx
	cmpq	$0, %rdx
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	exit
	jmp	body
	.text
	.globl	matmul
matmul:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$104, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	movq	$0, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	starti
	.text
endi:
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
endj:
	movq	%r11, %r8 
	addq	$1, %r8 
	movq	%r8 , %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	starti
	.text
starti:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r11
	cmpq	$2, %r11
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	theni
	jmp	endi
	.text
startj:
	movq	(%r10), %r8 
	cmpq	$2, %r8 
	setl	%r9b
	andq	$1, %r9 
	cmpq	$0, %r9 
	jne	thenj
	jmp	endj
	.text
theni:
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	startj
	.text
thenj:
	movq	%rdx, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r11, %rax
	imulq	$16, %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -104(%rbp)
	movq	%rdi, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r11, %rax
	imulq	$16, %rax
	addq	%rcx, %rax
	addq	$0, %rax
	movq	%rax, -40(%rbp)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	movq	%rdi, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r11, %rax
	imulq	$16, %rax
	addq	%rcx, %rax
	addq	$8, %rax
	movq	%rax, -88(%rbp)
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-96(%rbp), %rax
	imulq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-80(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	addq	$1, %r8 
	movq	%r8 , (%r10)
	jmp	startj
	.text
	.globl	mateq
mateq:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r11
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$0, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	jmp	starti1
	.text
endi1:
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
endj1:
	movq	%r10, %r8 
	addq	$1, %r8 
	movq	%r8 , (%r11)
	jmp	starti1
	.text
starti1:
	movq	(%r11), %r10
	cmpq	$2, %r10
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	theni1
	jmp	endi1
	.text
startj1:
	movq	(%r9 ), %r8 
	cmpq	$2, %r8 
	setl	-16(%rbp)
	andq	$1, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	thenj1
	jmp	endj1
	.text
theni1:
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	startj1
	.text
thenj1:
	movq	%rdi, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r10, %rax
	imulq	$16, %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	%rsi, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r10, %rax
	imulq	$16, %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	xorq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	orq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	addq	$1, %r8 
	movq	%r8 , (%r9 )
	jmp	startj1