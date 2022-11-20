	.file	"34.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, xmm0
	addsd	xmm0, xmm1
	subsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	f, .-f
	.section	.rodata
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
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	pxor	xmm0, xmm0
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -40[rbp], xmm0
	mov	DWORD PTR -64[rbp], 0
	cmp	DWORD PTR -84[rbp], 3
	je	.L4
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L16
.L4:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	jne	.L6
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L16
.L6:
	lea	rdx, -68[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -68[rbp]
	cmp	eax, 10
	jg	.L7
	mov	eax, DWORD PTR -68[rbp]
	cmp	eax, 5
	jg	.L8
.L7:
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L16
.L8:
	mov	DWORD PTR -60[rbp], 0
	jmp	.L9
.L10:
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	add	DWORD PTR -60[rbp], 1
.L9:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -60[rbp], eax
	jl	.L10
	jmp	.L11
.L15:
	movsd	xmm0, QWORD PTR -56[rbp]
	addsd	xmm0, QWORD PTR -48[rbp]
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	call	f
	movsd	QWORD PTR -104[rbp], xmm0
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -104[rbp]
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L19
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -56[rbp], xmm0
	jmp	.L14
.L19:
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
.L14:
	add	DWORD PTR -64[rbp], 1
.L11:
	movsd	xmm0, QWORD PTR -48[rbp]
	subsd	xmm0, QWORD PTR -56[rbp]
	comisd	xmm0, QWORD PTR -40[rbp]
	ja	.L15
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	movsd	xmm0, QWORD PTR -56[rbp]
	addsd	xmm0, QWORD PTR -48[rbp]
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movq	rdx, xmm0
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	edx, DWORD PTR -64[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC11[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 0
.L16:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	ret
	.size	main, .-main
	.section	.rodata
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
	.long	1073741824
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
