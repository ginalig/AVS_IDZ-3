	.file	"34.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	f
	.type	f, @function
f:					  		# double f(double x)
	movapd	xmm2, xmm0
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm2
	movapd	xmm1, xmm0
	addsd	xmm0, xmm0
	mulsd	xmm1, xmm2
	addsd	xmm0, xmm1
	subsd	xmm0, xmm2
	subsd	xmm0, QWORD PTR .LC0[rip]
	ret 					# return (x * x * x * x) + 2 * (x * x * x) - x - 1
.LC0:
	.long	0
	.long	1072693248
	.align 8	
	.size	f, .-f
	.section	.rodata.str1.1,"aMS",@progbits,1
