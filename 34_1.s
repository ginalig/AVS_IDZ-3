	.file	"34.c"
	.intel_syntax noprefix
	.text
	.p2align 4
.LC2:
	.string	"Incorrect input!"
.LC3:
	.string	"r"
.LC4:
	.string	"File not found!"
.LC5:
	.string	"%d"
.LC6:
	.string	"Incorrect accuracy!"
.LC9:
	.string	"w"
.LC10:
	.string	"%lf\n"
.LC11:
	.string	"Iterations count - %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r12 # save registers on stack
	push	rbp 
	push	rbx 
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	cmp	edi, 3 # if (argc != 3)
	je	.L4
	lea	rsi, .LC2[rip]
	mov	edi, 1
	call	__printf_chk@PLT
.L5:
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L23
	add	rsp, 48
	xor	eax, eax
	pop	rbx # pop registers from stack
	pop	rbp
	pop	r12
	ret
.L4:
	mov	rdi, QWORD PTR 8[rsi] 
	mov	rbx, rsi # argv[1]
	lea	rsi, .LC3[rip] # "r"
	call	fopen@PLT # open file
	mov	rdi, rax # fp
	test	rax, rax # if (fp == NULL)
	je	.L24 
	lea	rdx, 36[rsp] # &x
	lea	rsi, .LC5[rip] # "%d"
	xor	eax, eax
	call	__isoc99_fscanf@PLT # if (accuracy > 10 || accuracy < 6)
	mov	edx, DWORD PTR 36[rsp]
	lea	eax, -6[rdx]
	cmp	eax, 4
	ja	.L25
	movsd	xmm6, QWORD PTR .LC0[rip] # a
	movsd	xmm0, QWORD PTR .LC7[rip] # b
	xor	eax, eax # i = 0
	movapd	xmm5, xmm6 # eps
	.p2align 4,,10
	.p2align 3
.L7:
	divsd	xmm5, xmm0 # eps /= 10
	add	eax, 1 # i++
	cmp	edx, eax # if (i < accuracy)
	jne	.L7
	xor	r12d, r12d # iterations_count = 0
	comisd	xmm6, xmm5 # (b - a) < eps
	movapd	xmm3, xmm6 # b
	jbe	.L21
	pxor	xmm8, xmm8
	movsd	xmm7, QWORD PTR .LC8[rip]
	movapd	xmm0, xmm8 # a
	.p2align 4,,10
	.p2align 3
.L12:
	movapd	xmm2, xmm3 # b
	movapd	xmm9, xmm3 # b
	add	r12d, 1 # iterations_count++
	# c = (a + b) / 2
	addsd	xmm2, xmm0 # a
	mulsd	xmm9, xmm3 # b
	mulsd	xmm2, xmm7 # c
	mulsd	xmm9, xmm3
	movapd	xmm4, xmm2
	movapd	xmm1, xmm2
	mulsd	xmm4, xmm2
	mulsd	xmm4, xmm2
	mulsd	xmm1, xmm4
	addsd	xmm4, xmm4
	addsd	xmm1, xmm4
	movapd	xmm4, xmm3
	mulsd	xmm4, xmm9
	addsd	xmm9, xmm9
	subsd	xmm1, xmm2
	addsd	xmm4, xmm9
	subsd	xmm1, xmm6
	subsd	xmm4, xmm3
	subsd	xmm4, xmm6
	
	mulsd	xmm1, xmm4 # if (f(c) * f(b) < 0)
	# b = c
	cmpltsd	xmm1, xmm8
	movapd	xmm4, xmm1
	andpd	xmm3, xmm1
	andnpd	xmm4, xmm2 # c
	andpd	xmm2, xmm1
	andnpd	xmm1, xmm0 # a
	movapd	xmm0, xmm1
	orpd	xmm3, xmm4 # b
	orpd	xmm0, xmm2 # while (b - a > eps)
	movapd	xmm1, xmm3 # b
	subsd	xmm1, xmm0 # b - a
	comisd	xmm1, xmm5 # eps
	ja	.L12
.L8:
	mov	rdi, QWORD PTR 16[rbx] # argv[2]
	lea	rsi, .LC9[rip]
	movsd	QWORD PTR 24[rsp], xmm7
	movsd	QWORD PTR 16[rsp], xmm3 # b
	movsd	QWORD PTR 8[rsp], xmm0 # a
	call	fopen@PLT # open file
	movsd	xmm0, QWORD PTR 8[rsp] # a
	movsd	xmm3, QWORD PTR 16[rsp] # b
	lea	rdx, .LC10[rip]
	movsd	xmm7, QWORD PTR 24[rsp]
	mov	rbp, rax # fp = fopen(argv[2], "w")
	mov	rdi, rax
	mov	esi, 1
	addsd	xmm0, xmm3 # b
	mov	eax, 1
	mulsd	xmm0, xmm7
	call	__fprintf_chk@PLT
	mov	ecx, r12d # iterations_count
	mov	esi, 1
	mov	rdi, rbp
	lea	rdx, .LC11[rip]
	xor	eax, eax
	call	__fprintf_chk@PLT
	jmp	.L5
.L25:
	lea	rsi, .LC6[rip] # "Incorrect accuracy!"
	mov	edi, 1  
	xor	eax, eax 
	call	__printf_chk@PLT # print error
	jmp	.L5
.L24:
	lea	rdi, .LC4[rip] # "File not found!"
	call	puts@PLT
	jmp	.L5
.L21:
	movsd	xmm7, QWORD PTR .LC8[rip] 
	pxor	xmm0, xmm0
	jmp	.L8
.L23:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC7:
	.long	0
	.long	1076101120
	.align 8
.LC8:
	.long	0
	.long	1071644672
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
