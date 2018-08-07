	.file	"main"
	.section	.rodata,"a",@progbits
	.align	32
.LCPI0_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI0_1:
	.long	1065353216
	.text
	.globl	build_polinome_double
	.align	16, 0x90
	.type	build_polinome_double,@function
build_polinome_double:
	.cfi_startproc
	pushl	%ebp
.Ltmp3:
	.cfi_def_cfa_offset 8
.Ltmp4:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp5:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-32, %esp
	subl	$448, %esp
.Ltmp6:
	.cfi_offset %esi, -20
.Ltmp7:
	.cfi_offset %edi, -16
.Ltmp8:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	28(%eax), %edi
	movl	%edi, 304(%esp)
	testl	%edi, %edi
	jle	.LBB0_46
	movl	12(%ebp), %ecx
	movl	(%ecx), %edx
	movl	60(%eax), %ecx
	movl	%ecx, 120(%esp)
	imull	%ecx, %edx
	addl	36(%eax), %edx
	movl	%edx, 20(%esp)
	movl	24(%eax), %edx
	movl	%edx, 292(%esp)
	movl	20(%eax), %edx
	movl	%edx, 284(%esp)
	movl	16(%eax), %edx
	movl	%edx, 300(%esp)
	movl	12(%eax), %edx
	movl	%edx, 296(%esp)
	movl	8(%eax), %edx
	movl	%edx, 396(%esp)
	movl	(%eax), %edx
	movl	%edx, 392(%esp)
	movl	4(%eax), %eax
	movl	%eax, 116(%esp)
	sarl	$3, %ecx
	movl	%ecx, 112(%esp)
	je	.LBB0_22
	movl	292(%esp), %edx
	vmovd	%edx, %xmm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpermd	%ymm1, %ymm0, %ymm2
	movl	20(%esp), %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vpaddd	.LCPI0_0, %ymm1, %ymm1
	vpmulld	%ymm2, %ymm1, %ymm3
	vmovd	%xmm3, %ecx
	vpextrd	$1, %xmm3, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm2
	vbroadcastss	%xmm2, %ymm2
	vmovaps	%ymm2, 64(%esp)
	vmovd	%edi, %xmm2
	vpermd	%ymm2, %ymm0, %ymm2
	vpmulld	%ymm2, %ymm1, %ymm4
	vmovd	%xmm4, %ecx
	vpextrd	$1, %xmm4, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vmovaps	%ymm1, 32(%esp)
	movl	396(%esp), %eax
	leal	(%eax,%edi,8), %eax
	movl	%eax, 28(%esp)
	leal	(,%edi,8), %eax
	movl	%eax, 276(%esp)
	movl	$-8, %ecx
	subl	%eax, %ecx
	movl	%ecx, 272(%esp)
	movl	%edi, %eax
	imull	%eax, %eax
	movl	296(%esp), %ecx
	leal	(%ecx,%eax,8), %eax
	movl	%eax, 24(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm1
	vmovss	.LCPI0_1, %xmm2
	vdivss	%xmm1, %xmm2, %xmm1
	vpermps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 224(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 216(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB0_3:
	movl	%eax, 124(%esp)
	vmovaps	%ymm4, 128(%esp)
	vextracti128	$1, %ymm4, %xmm0
	vpextrd	$3, %xmm0, %eax
	vpextrd	$2, %xmm0, %ecx
	vpextrd	$1, %xmm0, %edx
	movl	%edx, 416(%esp)
	vmovd	%xmm0, %esi
	vpextrd	$3, %xmm4, %edi
	vpextrd	$2, %xmm4, %ebx
	vpextrd	$1, %xmm4, %edx
	movl	%edx, 424(%esp)
	vmovd	%xmm4, %edx
	cmpl	$0, 292(%esp)
	jle	.LBB0_8
	movl	%edx, 400(%esp)
	movl	%ebx, 404(%esp)
	movl	%edi, 408(%esp)
	movl	%esi, 412(%esp)
	movl	%ecx, 420(%esp)
	movl	%eax, 348(%esp)
	vextracti128	$1, %ymm3, %xmm0
	vpextrd	$3, %xmm0, %edx
	vpextrd	$2, %xmm0, %eax
	movl	%eax, 336(%esp)
	vpextrd	$1, %xmm0, %eax
	movl	%eax, 344(%esp)
	vmovd	%xmm0, 352(%esp)
	vpextrd	$3, %xmm3, %ecx
	vpextrd	$2, %xmm3, %eax
	vpextrd	$1, %xmm3, %ebx
	vmovd	%xmm3, %edi
	vmovaps	%ymm3, 160(%esp)
	movl	116(%esp), %esi
	leal	(%esi,%edx,4), %edx
	movl	%edx, 340(%esp)
	movl	336(%esp), %edx
	leal	(%esi,%edx,4), %edx
	movl	%edx, 336(%esp)
	movl	344(%esp), %edx
	leal	(%esi,%edx,4), %edx
	movl	%edx, 332(%esp)
	movl	352(%esp), %edx
	leal	(%esi,%edx,4), %edx
	movl	%edx, 328(%esp)
	leal	(%esi,%ecx,4), %ecx
	movl	%ecx, 324(%esp)
	leal	(%esi,%eax,4), %eax
	movl	%eax, 320(%esp)
	leal	(%esi,%ebx,4), %eax
	movl	%eax, 312(%esp)
	leal	(%esi,%edi,4), %eax
	movl	%eax, 308(%esp)
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB0_7:
	movl	%ecx, 344(%esp)
	vxorps	%ymm1, %ymm1, %ymm1
	movl	292(%esp), %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB0_5:
	vmovaps	%ymm1, 352(%esp)
	movl	392(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	%ecx, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	344(%esp), %ecx
	movl	328(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	movl	332(%esp), %eax
	vinsertps	$16, (%eax,%edi), %xmm1, %xmm1
	movl	336(%esp), %eax
	vinsertps	$32, (%eax,%edi), %xmm1, %xmm1
	movl	340(%esp), %eax
	vinsertps	$48, (%eax,%edi), %xmm1, %xmm1
	movl	308(%esp), %eax
	vmovss	(%eax,%edi), %xmm2
	movl	312(%esp), %eax
	vinsertps	$16, (%eax,%edi), %xmm2, %xmm2
	movl	320(%esp), %eax
	vinsertps	$32, (%eax,%edi), %xmm2, %xmm2
	movl	324(%esp), %eax
	vinsertps	$48, (%eax,%edi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	352(%esp), %ymm1, %ymm0
	addl	$4, %edi
	adcl	$0, %ebx
	decl	%esi
	vmovaps	%ymm0, %ymm1
	jne	.LBB0_5
	movl	300(%esp), %eax
	leal	(%eax,%ecx,8), %eax
	vmovaps	224(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vcvtps2pd	%xmm0, %ymm1
	movl	%ecx, %esi
	movl	400(%esp), %ecx
	vmovlpd	%xmm1, (%eax,%ecx,8)
	movl	424(%esp), %ecx
	vmovhpd	%xmm1, (%eax,%ecx,8)
	vextractf128	$1, %ymm1, %xmm1
	movl	404(%esp), %ecx
	vmovlpd	%xmm1, (%eax,%ecx,8)
	movl	408(%esp), %ecx
	vmovhpd	%xmm1, (%eax,%ecx,8)
	vextractf128	$1, %ymm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	movl	412(%esp), %ecx
	vmovlpd	%xmm0, (%eax,%ecx,8)
	movl	416(%esp), %ecx
	vmovhpd	%xmm0, (%eax,%ecx,8)
	vextractf128	$1, %ymm0, %xmm0
	movl	420(%esp), %ecx
	vmovlpd	%xmm0, (%eax,%ecx,8)
	movl	348(%esp), %ecx
	vmovhpd	%xmm0, (%eax,%ecx,8)
	movl	%esi, %ecx
	incl	%ecx
	cmpl	304(%esp), %ecx
	jne	.LBB0_7
	jmp	.LBB0_10
	.align	16, 0x90
.LBB0_8:
	vmovaps	%ymm3, 160(%esp)
	movl	%edi, 408(%esp)
	movl	%esi, %edi
	movl	%ecx, %esi
	movl	%eax, %ecx
	leal	(,%ecx,8), %eax
	movl	%eax, 352(%esp)
	movl	%ecx, 348(%esp)
	leal	(,%esi,8), %eax
	movl	%eax, 344(%esp)
	movl	%esi, 420(%esp)
	movl	416(%esp), %eax
	leal	(,%eax,8), %eax
	movl	%eax, 340(%esp)
	leal	(,%edi,8), %eax
	movl	%eax, 336(%esp)
	movl	%edi, 412(%esp)
	movl	408(%esp), %eax
	leal	(,%eax,8), %eax
	movl	%eax, 332(%esp)
	movl	%ebx, 404(%esp)
	leal	(,%ebx,8), %ebx
	movl	424(%esp), %eax
	leal	(,%eax,8), %eax
	leal	(,%edx,8), %ecx
	movl	%edx, 400(%esp)
	movl	304(%esp), %edx
	movl	300(%esp), %esi
	.align	16, 0x90
.LBB0_9:
	vmovsd	216(%esp), %xmm0
	vmovsd	%xmm0, (%esi,%ecx)
	vmovsd	%xmm0, (%esi,%eax)
	vmovsd	%xmm0, (%esi,%ebx)
	movl	332(%esp), %edi
	vmovsd	%xmm0, (%esi,%edi)
	movl	336(%esp), %edi
	vmovsd	%xmm0, (%esi,%edi)
	movl	340(%esp), %edi
	vmovsd	%xmm0, (%esi,%edi)
	movl	344(%esp), %edi
	vmovsd	%xmm0, (%esi,%edi)
	movl	352(%esp), %edi
	vmovsd	%xmm0, (%esi,%edi)
	addl	$8, %esi
	decl	%edx
	jne	.LBB0_9
.LBB0_10:
	movl	396(%esp), %eax
	movl	348(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 340(%esp)
	movl	420(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 336(%esp)
	movl	416(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 332(%esp)
	movl	412(%esp), %edx
	leal	(%eax,%edx,8), %ecx
	movl	%ecx, 328(%esp)
	movl	408(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 324(%esp)
	movl	404(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 320(%esp)
	movl	424(%esp), %esi
	leal	(%eax,%esi,8), %ecx
	movl	%ecx, 312(%esp)
	movl	400(%esp), %ecx
	leal	(%eax,%ecx,8), %eax
	movl	%eax, 308(%esp)
	xorl	%ecx, %ecx
	movl	296(%esp), %eax
	.align	16, 0x90
.LBB0_11:
	movl	%ecx, %ebx
	movl	%ebx, 344(%esp)
	movl	%eax, 352(%esp)
	movl	284(%esp), %eax
	movl	(%eax,%ebx,4), %eax
	movl	300(%esp), %ecx
	leal	(%ecx,%eax,8), %eax
	movl	348(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm0
	movl	420(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm5
	movl	416(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm4
	vmovsd	(%eax,%edx,8), %xmm7
	movl	408(%esp), %edx
	vmovsd	(%eax,%edx,8), %xmm1
	movl	404(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm3
	vmovsd	(%eax,%esi,8), %xmm2
	movl	400(%esp), %edi
	vmovsd	(%eax,%edi,8), %xmm6
	movl	396(%esp), %eax
	leal	(%eax,%ebx,8), %esi
	vmovsd	%xmm6, (%esi,%edi,8)
	movl	424(%esp), %eax
	vmovsd	%xmm2, (%esi,%eax,8)
	vmovsd	%xmm3, (%esi,%ecx,8)
	vmovsd	%xmm1, (%esi,%edx,8)
	movl	412(%esp), %eax
	vmovsd	%xmm7, (%esi,%eax,8)
	movl	416(%esp), %eax
	vmovsd	%xmm4, (%esi,%eax,8)
	movl	420(%esp), %eax
	vmovsd	%xmm5, (%esi,%eax,8)
	movl	348(%esp), %eax
	vmovsd	%xmm0, (%esi,%eax,8)
	movl	%eax, %edx
	testl	%ebx, %ebx
	jle	.LBB0_14
	vunpcklpd	%xmm0, %xmm5, %xmm0
	vunpcklpd	%xmm4, %xmm7, %xmm4
	vinsertf128	$1, %xmm0, %ymm4, %ymm0
	vunpcklpd	%xmm1, %xmm3, %xmm1
	vunpcklpd	%xmm2, %xmm6, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	xorl	%edi, %edi
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB0_13:
	movl	320(%esp), %ebx
	vmovsd	(%ebx,%edi), %xmm1
	movl	324(%esp), %ebx
	vmovhpd	(%ebx,%edi), %xmm1, %xmm1
	movl	308(%esp), %ebx
	vmovsd	(%ebx,%edi), %xmm3
	movl	312(%esp), %ebx
	vmovhpd	(%ebx,%edi), %xmm3, %xmm3
	vinsertf128	$1, %xmm1, %ymm3, %ymm1
	movl	352(%esp), %ebx
	vbroadcastsd	(%ebx,%edi), %ymm4
	vfnmadd213pd	%ymm2, %ymm4, %ymm1
	movl	336(%esp), %ebx
	vmovsd	(%ebx,%edi), %xmm2
	movl	340(%esp), %ebx
	vmovhpd	(%ebx,%edi), %xmm2, %xmm2
	movl	328(%esp), %ebx
	vmovsd	(%ebx,%edi), %xmm3
	movl	332(%esp), %ebx
	vmovhpd	(%ebx,%edi), %xmm3, %xmm3
	movl	400(%esp), %ebx
	vmovlpd	%xmm1, (%esi,%ebx,8)
	movl	424(%esp), %ebx
	vmovhpd	%xmm1, (%esi,%ebx,8)
	vextractf128	$1, %ymm1, %xmm5
	movl	404(%esp), %ebx
	vmovlpd	%xmm5, (%esi,%ebx,8)
	movl	408(%esp), %ebx
	vmovhpd	%xmm5, (%esi,%ebx,8)
	vinsertf128	$1, %xmm2, %ymm3, %ymm3
	vfnmadd213pd	%ymm0, %ymm4, %ymm3
	movl	412(%esp), %ebx
	vmovlpd	%xmm3, (%esi,%ebx,8)
	movl	416(%esp), %ebx
	vmovhpd	%xmm3, (%esi,%ebx,8)
	vextractf128	$1, %ymm3, %xmm0
	movl	420(%esp), %ebx
	vmovlpd	%xmm0, (%esi,%ebx,8)
	vmovhpd	%xmm0, (%esi,%edx,8)
	addl	$8, %edi
	adcl	$0, %eax
	incl	%ecx
	movl	344(%esp), %ebx
	cmpl	%ecx, %ebx
	vmovapd	%ymm1, %ymm2
	vmovapd	%ymm3, %ymm0
	jne	.LBB0_13
.LBB0_14:
	movl	352(%esp), %eax
	addl	276(%esp), %eax
	incl	%ebx
	cmpl	304(%esp), %ebx
	movl	%ebx, %ecx
	movl	412(%esp), %edx
	movl	424(%esp), %esi
	jne	.LBB0_11
	movl	28(%esp), %eax
	movl	400(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 344(%esp)
	leal	(%eax,%esi,8), %ecx
	movl	%ecx, 340(%esp)
	movl	404(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 336(%esp)
	movl	408(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 332(%esp)
	leal	(%eax,%edx,8), %ecx
	movl	%ecx, 328(%esp)
	movl	416(%esp), %esi
	leal	(%eax,%esi,8), %ecx
	movl	%ecx, 324(%esp)
	movl	420(%esp), %ecx
	leal	(%eax,%ecx,8), %ecx
	movl	%ecx, 320(%esp)
	movl	348(%esp), %ebx
	leal	(%eax,%ebx,8), %eax
	movl	%eax, 312(%esp)
	movl	$0, 288(%esp)
	movl	24(%esp), %eax
	movl	304(%esp), %edx
	movl	%edx, %ecx
	movl	%edx, %edi
	movl	%esi, %edx
	.align	16, 0x90
.LBB0_16:
	movl	%eax, 352(%esp)
	movl	396(%esp), %eax
	leal	-8(%eax,%ecx,8), %eax
	leal	-1(%ecx), %esi
	movl	%esi, 308(%esp)
	imull	%edi, %esi
	movl	%esi, 280(%esp)
	cmpl	%edi, %ecx
	jge	.LBB0_17
	movl	420(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm0
	vmovhpd	(%eax,%ebx,8), %xmm0, %xmm0
	movl	412(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm1
	vmovhpd	(%eax,%edx,8), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	movl	404(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm1
	movl	408(%esp), %ecx
	vmovhpd	(%eax,%ecx,8), %xmm1, %xmm1
	movl	400(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm2
	movl	424(%esp), %ecx
	vmovhpd	(%eax,%ecx,8), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm3
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	movl	288(%esp), %ecx
	movl	312(%esp), %edx
	.align	16, 0x90
.LBB0_19:
	movl	336(%esp), %esi
	vmovsd	(%esi,%ecx,8), %xmm1
	movl	332(%esp), %esi
	vmovhpd	(%esi,%ecx,8), %xmm1, %xmm1
	movl	344(%esp), %esi
	vmovsd	(%esi,%ecx,8), %xmm2
	movl	340(%esp), %esi
	vmovhpd	(%esi,%ecx,8), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	352(%esp), %esi
	vbroadcastsd	(%esi,%edi), %ymm1
	vfnmadd213pd	%ymm3, %ymm1, %ymm2
	movl	320(%esp), %esi
	vmovsd	(%esi,%ecx,8), %xmm3
	vmovhpd	(%edx,%ecx,8), %xmm3, %xmm3
	movl	328(%esp), %esi
	vmovsd	(%esi,%ecx,8), %xmm4
	movl	324(%esp), %esi
	vmovhpd	(%esi,%ecx,8), %xmm4, %xmm4
	movl	400(%esp), %esi
	vmovlpd	%xmm2, (%eax,%esi,8)
	movl	424(%esp), %esi
	vmovhpd	%xmm2, (%eax,%esi,8)
	vextractf128	$1, %ymm2, %xmm5
	movl	404(%esp), %esi
	vmovlpd	%xmm5, (%eax,%esi,8)
	movl	408(%esp), %esi
	vmovhpd	%xmm5, (%eax,%esi,8)
	vinsertf128	$1, %xmm3, %ymm4, %ymm4
	vfnmadd213pd	%ymm0, %ymm1, %ymm4
	movl	412(%esp), %esi
	vmovlpd	%xmm4, (%eax,%esi,8)
	movl	416(%esp), %esi
	vmovhpd	%xmm4, (%eax,%esi,8)
	vextractf128	$1, %ymm4, %xmm0
	movl	420(%esp), %esi
	vmovlpd	%xmm0, (%eax,%esi,8)
	movl	348(%esp), %esi
	vmovhpd	%xmm0, (%eax,%esi,8)
	vunpckhpd	%xmm0, %xmm0, %xmm1
	addl	$8, %edi
	adcl	$0, %ebx
	incl	%ecx
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm4, %ymm0
	jne	.LBB0_19
	jmp	.LBB0_20
	.align	16, 0x90
.LBB0_17:
	vmovsd	(%eax,%ebx,8), %xmm1
	movl	312(%esp), %edx
.LBB0_20:
	movl	%edx, 312(%esp)
	movl	400(%esp), %edi
	movl	404(%esp), %esi
	movl	408(%esp), %ebx
	vmovsd	(%eax,%esi,8), %xmm0
	vmovhpd	(%eax,%ebx,8), %xmm0, %xmm0
	vmovsd	(%eax,%edi,8), %xmm2
	movl	424(%esp), %ecx
	vmovhpd	(%eax,%ecx,8), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	280(%esp), %edx
	addl	308(%esp), %edx
	movl	296(%esp), %ecx
	vbroadcastsd	(%ecx,%edx,8), %ymm0
	vdivpd	%ymm0, %ymm2, %ymm3
	movl	412(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm2
	movl	416(%esp), %edx
	vmovhpd	(%eax,%edx,8), %xmm2, %xmm2
	movl	420(%esp), %edx
	vmovsd	(%eax,%edx,8), %xmm4
	vmovlpd	%xmm3, (%eax,%edi,8)
	movl	424(%esp), %edi
	vmovhpd	%xmm3, (%eax,%edi,8)
	vextractf128	$1, %ymm3, %xmm3
	vmovlpd	%xmm3, (%eax,%esi,8)
	vmovhpd	%xmm3, (%eax,%ebx,8)
	vunpcklpd	%xmm1, %xmm4, %xmm1
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vdivpd	%ymm0, %ymm1, %ymm0
	vmovlpd	%xmm0, (%eax,%ecx,8)
	movl	416(%esp), %edi
	vmovhpd	%xmm0, (%eax,%edi,8)
	vextractf128	$1, %ymm0, %xmm0
	vmovlpd	%xmm0, (%eax,%edx,8)
	movl	348(%esp), %esi
	vmovhpd	%xmm0, (%eax,%esi,8)
	movl	352(%esp), %eax
	addl	272(%esp), %eax
	decl	288(%esp)
	movl	308(%esp), %ecx
	testl	%ecx, %ecx
	movl	%esi, %ebx
	movl	%edi, %edx
	movl	304(%esp), %edi
	jg	.LBB0_16
	vmovdqa	160(%esp), %ymm3
	vpaddd	64(%esp), %ymm3, %ymm3
	vmovdqa	128(%esp), %ymm4
	vpaddd	32(%esp), %ymm4, %ymm4
	movl	124(%esp), %eax
	incl	%eax
	cmpl	112(%esp), %eax
	jne	.LBB0_3
.LBB0_22:
	movl	120(%esp), %eax
	movl	%eax, %ebx
	andl	$-8, %ebx
	cmpl	%ebx, %eax
	movl	396(%esp), %eax
	je	.LBB0_46
	subl	%ebx, 120(%esp)
	movl	20(%esp), %esi
	addl	%esi, %ebx
	movl	%edi, 304(%esp)
	leal	(,%edi,8), %ecx
	movl	%ecx, 352(%esp)
	movl	$-8, %edx
	subl	%ecx, %edx
	movl	%edx, 348(%esp)
	movl	%eax, %edx
	movl	%edi, %eax
	imull	%eax, %eax
	movl	296(%esp), %ecx
	leal	(%ecx,%eax,8), %eax
	movl	%eax, 324(%esp)
	movl	112(%esp), %ecx
	leal	1(%esi,%ecx,8), %eax
	imull	%edi, %eax
	leal	(%edx,%eax,8), %eax
	movl	%eax, 340(%esp)
	leal	(%esi,%ecx,8), %eax
	movl	%edi, %ecx
	imull	%eax, %ecx
	movl	%ecx, 320(%esp)
	leal	(%edx,%ecx,8), %esi
	movl	292(%esp), %ecx
	imull	%ecx, %eax
	movl	116(%esp), %edx
	leal	(%edx,%eax,4), %edx
	leal	1(%ecx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI0_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, 344(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 312(%esp)
	movl	%edi, %eax
	negl	%eax
	movl	%eax, 308(%esp)
	leal	(,%ecx,4), %eax
	movl	%eax, 288(%esp)
	movl	%esi, %ecx
	movl	%edi, %eax
	andl	$1, %eax
	movl	%eax, 280(%esp)
	xorl	%eax, %eax
	movl	300(%esp), %esi
	movl	%esi, 336(%esp)
	.align	16, 0x90
.LBB0_24:
	movl	%eax, 328(%esp)
	movl	%edx, 412(%esp)
	movl	%ecx, 416(%esp)
	movl	%ebx, 332(%esp)
	imull	304(%esp), %ebx
	movl	%ebx, 408(%esp)
	cmpl	$0, 292(%esp)
	movl	$0, %edx
	jle	.LBB0_25
	.align	16, 0x90
.LBB0_40:
	movl	%edx, 420(%esp)
	xorl	%esi, %esi
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ebx, %ebx
	movl	292(%esp), %edi
	.align	16, 0x90
.LBB0_41:
	vmovss	%xmm0, 424(%esp)
	movl	392(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	%edx, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	420(%esp), %edx
	movl	412(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	424(%esp), %xmm0, %xmm1
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovapd	%xmm1, %xmm0
	jne	.LBB0_41
	movl	408(%esp), %eax
	leal	(%edx,%eax), %eax
	vmovss	344(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	300(%esp), %ecx
	vmovsd	%xmm0, (%ecx,%eax,8)
	incl	%edx
	xorl	%eax, %eax
	movl	304(%esp), %ecx
	cmpl	%ecx, %edx
	jne	.LBB0_40
	movl	296(%esp), %ecx
	jmp	.LBB0_31
	.align	16, 0x90
.LBB0_25:
	cmpl	$0, 280(%esp)
	movl	$0, %edx
	vmovsd	312(%esp), %xmm0
	je	.LBB0_27
	movl	300(%esp), %ecx
	movl	408(%esp), %edx
	vmovsd	%xmm0, (%ecx,%edx,8)
	movl	$1, %edx
.LBB0_27:
	cmpl	$2, 304(%esp)
	jb	.LBB0_30
	movl	308(%esp), %ecx
	leal	(%ecx,%edx), %ecx
	movl	336(%esp), %esi
	leal	(%esi,%edx,8), %edx
	movl	320(%esp), %esi
	.align	16, 0x90
.LBB0_29:
	vmovsd	%xmm0, (%edx,%esi,8)
	vmovsd	%xmm0, 8(%edx,%esi,8)
	addl	$2, %esi
	addl	$2, %ecx
	jne	.LBB0_29
.LBB0_30:
	movl	296(%esp), %ecx
	xorl	%eax, %eax
	.align	16, 0x90
.LBB0_31:
	movl	%ecx, 424(%esp)
	movl	284(%esp), %ecx
	movl	(%ecx,%eax,4), %ecx
	movl	408(%esp), %edx
	addl	%edx, %ecx
	movl	300(%esp), %esi
	vmovsd	(%esi,%ecx,8), %xmm0
	leal	(%eax,%edx), %edx
	movl	396(%esp), %ecx
	vmovsd	%xmm0, (%ecx,%edx,8)
	testl	%eax, %eax
	jle	.LBB0_34
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB0_33:
	movl	%eax, %ecx
	movl	%edx, %eax
	movl	424(%esp), %edx
	vmovsd	(%edx,%esi), %xmm2
	movl	%eax, %edx
	movl	416(%esp), %eax
	vmovsd	(%eax,%esi), %xmm1
	movl	%ecx, %eax
	vfnmadd213sd	%xmm0, %xmm2, %xmm1
	movl	396(%esp), %ecx
	vmovsd	%xmm1, (%ecx,%edx,8)
	addl	$8, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, %eax
	vmovapd	%xmm1, %xmm0
	jne	.LBB0_33
.LBB0_34:
	movl	424(%esp), %ecx
	addl	352(%esp), %ecx
	incl	%eax
	cmpl	304(%esp), %eax
	jne	.LBB0_31
	movl	$0, 404(%esp)
	movl	324(%esp), %esi
	movl	340(%esp), %ecx
	movl	304(%esp), %eax
	movl	396(%esp), %ebx
	.align	16, 0x90
.LBB0_36:
	movl	%eax, 400(%esp)
	movl	%ecx, 420(%esp)
	movl	%esi, %edx
	movl	%eax, %edi
	movl	408(%esp), %eax
	leal	-1(%edi,%eax), %esi
	vmovsd	(%ebx,%esi,8), %xmm1
	cmpl	304(%esp), %edi
	jge	.LBB0_37
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%eax, %eax
	movl	%edx, 424(%esp)
	movl	404(%esp), %ecx
	.align	16, 0x90
.LBB0_43:
	movl	424(%esp), %edx
	vmovsd	(%edx,%edi), %xmm2
	movl	420(%esp), %edx
	vmovsd	(%edx,%edi), %xmm0
	vfnmadd213sd	%xmm1, %xmm2, %xmm0
	movl	396(%esp), %edx
	vmovsd	%xmm0, (%edx,%esi,8)
	addl	$8, %edi
	adcl	$0, %eax
	incl	%ebx
	cmpl	%ecx, %ebx
	vmovapd	%xmm0, %xmm1
	jne	.LBB0_43
	jmp	.LBB0_44
	.align	16, 0x90
.LBB0_37:
	vmovapd	%xmm1, %xmm0
	movl	%edx, 424(%esp)
	movl	404(%esp), %ecx
.LBB0_44:
	movl	400(%esp), %edi
	decl	%edi
	movl	%edi, %eax
	imull	304(%esp), %eax
	addl	%edi, %eax
	movl	296(%esp), %ebx
	vdivsd	(%ebx,%eax,8), %xmm0, %xmm0
	movl	%edi, %eax
	movl	396(%esp), %edi
	vmovsd	%xmm0, (%edi,%esi,8)
	movl	424(%esp), %esi
	addl	348(%esp), %esi
	movl	420(%esp), %edx
	addl	$-8, %edx
	incl	%ecx
	movl	%ecx, 404(%esp)
	testl	%eax, %eax
	movl	%edi, %ebx
	movl	%edx, %ecx
	jg	.LBB0_36
	movl	352(%esp), %eax
	addl	%eax, 340(%esp)
	movl	416(%esp), %ecx
	addl	%eax, %ecx
	movl	412(%esp), %edx
	addl	288(%esp), %edx
	addl	%eax, 336(%esp)
	movl	332(%esp), %ebx
	incl	%ebx
	movl	328(%esp), %eax
	incl	%eax
	cmpl	120(%esp), %eax
	jne	.LBB0_24
.LBB0_46:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp9:
	.size	build_polinome_double, .Ltmp9-build_polinome_double
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI1_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI1_1:
	.long	1056964608
	.text
	.globl	features
	.align	16, 0x90
	.type	features,@function
features:
	.cfi_startproc
	pushl	%ebp
.Ltmp13:
	.cfi_def_cfa_offset 8
.Ltmp14:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp15:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-4, %esp
	subl	$280, %esp
.Ltmp16:
	.cfi_offset %esi, -20
.Ltmp17:
	.cfi_offset %edi, -16
.Ltmp18:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	%edx, 48(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %ecx
	imull	%edx, %ecx
	movl	%ecx, 4(%esp)
	movl	32(%eax), %esi
	movl	%esi, (%esp)
	leal	(%ecx,%esi), %ecx
	movl	%ecx, 60(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 276(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 272(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 36(%esp)
	movl	12(%eax), %ecx
	movl	%ecx, 224(%esp)
	movl	8(%eax), %ecx
	movl	%ecx, 64(%esp)
	movl	(%eax), %ecx
	movl	%ecx, 44(%esp)
	movl	4(%eax), %eax
	movl	%eax, 40(%esp)
	sarl	$3, %edx
	movl	%edx, 32(%esp)
	je	.LBB1_9
	movl	64(%esp), %esi
	vmovd	%esi, %xmm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpermd	%ymm0, %ymm1, %ymm0
	movl	60(%esp), %edx
	vmovd	%edx, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vpaddd	.LCPI1_0, %ymm1, %ymm1
	vpmulld	%ymm0, %ymm1, %ymm0
	vmovd	%xmm0, %ecx
	vpextrd	$1, %xmm0, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	movl	%esi, %ecx
	shrl	$31, %ecx
	addl	%esi, %ecx
	addl	%ecx, %ecx
	andl	$-4, %ecx
	movl	44(%esp), %eax
	leal	4(%eax,%ecx), %edi
	movl	%edi, 24(%esp)
	leal	(%eax,%ecx), %eax
	movl	%eax, 20(%esp)
	movl	40(%esp), %eax
	leal	4(%eax,%ecx), %edi
	movl	%edi, 16(%esp)
	addl	%eax, %ecx
	movl	%ecx, 28(%esp)
	leal	1(%esi), %eax
	shrl	$31, %eax
	leal	1(%esi,%eax), %eax
	sarl	%eax
	movl	%eax, 84(%esp)
	movl	276(%esp), %eax
	leal	8(%eax), %eax
	movl	%eax, 12(%esp)
	movl	272(%esp), %eax
	leal	8(%eax), %eax
	movl	%eax, 8(%esp)
	leal	-1(%esi), %eax
	movl	%eax, 212(%esp)
	xorl	%ecx, %ecx
	vbroadcastss	.LCPI1_1, %ymm2
	.align	16, 0x90
.LBB1_2:
	movl	%edx, 52(%esp)
	movl	%ecx, 56(%esp)
	vextracti128	$1, %ymm0, %xmm3
	vpextrd	$3, %xmm3, %ecx
	movl	%ecx, 216(%esp)
	vpextrd	$2, %xmm3, %ecx
	movl	%ecx, 80(%esp)
	vpextrd	$1, %xmm3, %ecx
	movl	%ecx, 76(%esp)
	vmovd	%xmm3, 72(%esp)
	vpextrd	$3, %xmm0, %ecx
	movl	%ecx, 220(%esp)
	vpextrd	$2, %xmm0, %ecx
	movl	%ecx, 232(%esp)
	vpextrd	$1, %xmm0, %ecx
	movl	%ecx, 228(%esp)
	vmovd	%xmm0, 68(%esp)
	testl	%eax, %eax
	jle	.LBB1_5
	movl	272(%esp), %edi
	movl	68(%esp), %edx
	leal	(%edi,%edx,4), %eax
	movl	%eax, 204(%esp)
	movl	228(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 200(%esp)
	movl	232(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 208(%esp)
	movl	220(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 240(%esp)
	movl	72(%esp), %eax
	leal	(%edi,%eax,4), %ebx
	movl	%ebx, 268(%esp)
	movl	76(%esp), %eax
	leal	(%edi,%eax,4), %ebx
	movl	%ebx, 264(%esp)
	movl	80(%esp), %eax
	leal	(%edi,%eax,4), %ebx
	movl	%ebx, 260(%esp)
	movl	216(%esp), %ebx
	leal	(%edi,%ebx,4), %edi
	movl	%edi, 256(%esp)
	movl	276(%esp), %edi
	leal	(%edi,%edx,4), %esi
	movl	%esi, 252(%esp)
	movl	228(%esp), %eax
	leal	(%edi,%eax,4), %ecx
	movl	%ecx, 248(%esp)
	movl	232(%esp), %eax
	leal	(%edi,%eax,4), %ecx
	movl	%ecx, 244(%esp)
	movl	220(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 196(%esp)
	movl	72(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 192(%esp)
	movl	76(%esp), %ecx
	leal	(%edi,%ecx,4), %eax
	movl	%eax, 188(%esp)
	movl	80(%esp), %esi
	leal	(%edi,%esi,4), %eax
	movl	%eax, 184(%esp)
	leal	(%edi,%ebx,4), %eax
	movl	%eax, 236(%esp)
	leal	(,%ebx,4), %eax
	movl	%eax, 180(%esp)
	leal	(,%esi,4), %eax
	movl	%eax, 176(%esp)
	leal	(,%ecx,4), %eax
	movl	%eax, 172(%esp)
	movl	72(%esp), %eax
	leal	(,%eax,4), %eax
	movl	%eax, 168(%esp)
	movl	220(%esp), %eax
	leal	(,%eax,4), %eax
	movl	%eax, 164(%esp)
	movl	232(%esp), %eax
	leal	(,%eax,4), %eax
	movl	%eax, 160(%esp)
	movl	228(%esp), %eax
	leal	(,%eax,4), %eax
	movl	%eax, 156(%esp)
	leal	(,%edx,4), %eax
	movl	%eax, 152(%esp)
	xorl	%edi, %edi
	movl	224(%esp), %ebx
	.align	16, 0x90
.LBB1_4:
	movl	268(%esp), %eax
	vmovss	(%eax,%edi,4), %xmm3
	movl	264(%esp), %eax
	vinsertps	$16, (%eax,%edi,4), %xmm3, %xmm3
	movl	260(%esp), %eax
	vinsertps	$32, (%eax,%edi,4), %xmm3, %xmm3
	movl	256(%esp), %eax
	vinsertps	$48, (%eax,%edi,4), %xmm3, %xmm3
	movl	204(%esp), %ecx
	vmovss	(%ecx,%edi,4), %xmm4
	movl	200(%esp), %edx
	vinsertps	$16, (%edx,%edi,4), %xmm4, %xmm4
	movl	208(%esp), %esi
	vinsertps	$32, (%esi,%edi,4), %xmm4, %xmm4
	movl	240(%esp), %eax
	vinsertps	$48, (%eax,%edi,4), %xmm4, %xmm4
	vinsertf128	$1, %xmm3, %ymm4, %ymm3
	movl	268(%esp), %eax
	vmovss	4(%eax,%edi,4), %xmm4
	movl	264(%esp), %eax
	vinsertps	$16, 4(%eax,%edi,4), %xmm4, %xmm4
	movl	260(%esp), %eax
	vinsertps	$32, 4(%eax,%edi,4), %xmm4, %xmm4
	movl	256(%esp), %eax
	vinsertps	$48, 4(%eax,%edi,4), %xmm4, %xmm4
	vmovss	4(%ecx,%edi,4), %xmm5
	vinsertps	$16, 4(%edx,%edi,4), %xmm5, %xmm5
	vinsertps	$32, 4(%esi,%edi,4), %xmm5, %xmm5
	movl	240(%esp), %eax
	vinsertps	$48, 4(%eax,%edi,4), %xmm5, %xmm5
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	vsubps	%ymm3, %ymm4, %ymm3
	movl	192(%esp), %eax
	vmovss	(%eax,%edi,4), %xmm4
	movl	188(%esp), %ecx
	vinsertps	$16, (%ecx,%edi,4), %xmm4, %xmm4
	movl	184(%esp), %edx
	vinsertps	$32, (%edx,%edi,4), %xmm4, %xmm4
	movl	236(%esp), %esi
	vinsertps	$48, (%esi,%edi,4), %xmm4, %xmm4
	movl	252(%esp), %esi
	vmovss	(%esi,%edi,4), %xmm5
	movl	248(%esp), %esi
	vinsertps	$16, (%esi,%edi,4), %xmm5, %xmm5
	movl	244(%esp), %esi
	vinsertps	$32, (%esi,%edi,4), %xmm5, %xmm5
	movl	196(%esp), %esi
	vinsertps	$48, (%esi,%edi,4), %xmm5, %xmm5
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	vmovss	4(%eax,%edi,4), %xmm5
	vinsertps	$16, 4(%ecx,%edi,4), %xmm5, %xmm5
	vinsertps	$32, 4(%edx,%edi,4), %xmm5, %xmm5
	movl	236(%esp), %eax
	vinsertps	$48, 4(%eax,%edi,4), %xmm5, %xmm5
	movl	252(%esp), %eax
	vmovss	4(%eax,%edi,4), %xmm6
	movl	248(%esp), %eax
	vinsertps	$16, 4(%eax,%edi,4), %xmm6, %xmm6
	movl	244(%esp), %eax
	vinsertps	$32, 4(%eax,%edi,4), %xmm6, %xmm6
	vinsertps	$48, 4(%esi,%edi,4), %xmm6, %xmm6
	vinsertf128	$1, %xmm5, %ymm6, %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm4, %ymm4
	vfmadd213ps	%ymm4, %ymm3, %ymm3
	vsqrtps	%ymm3, %ymm3
	movl	152(%esp), %eax
	vmovss	%xmm3, (%ebx,%eax)
	movl	156(%esp), %eax
	vextractps	$1, %xmm3, (%ebx,%eax)
	movl	160(%esp), %eax
	vextractps	$2, %xmm3, (%ebx,%eax)
	movl	164(%esp), %eax
	vextractps	$3, %xmm3, (%ebx,%eax)
	vextractf128	$1, %ymm3, %xmm3
	movl	168(%esp), %eax
	vmovss	%xmm3, (%ebx,%eax)
	movl	172(%esp), %eax
	vextractps	$1, %xmm3, (%ebx,%eax)
	movl	176(%esp), %eax
	vextractps	$2, %xmm3, (%ebx,%eax)
	movl	180(%esp), %eax
	vextractps	$3, %xmm3, (%ebx,%eax)
	addl	$4, %ebx
	incl	%edi
	cmpl	%edi, 212(%esp)
	jne	.LBB1_4
.LBB1_5:
	cmpl	$0, 64(%esp)
	jle	.LBB1_8
	movl	276(%esp), %eax
	movl	216(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 268(%esp)
	movl	80(%esp), %ebx
	leal	(%eax,%ebx,4), %ecx
	movl	%ecx, 264(%esp)
	movl	76(%esp), %ecx
	leal	(%eax,%ecx,4), %esi
	movl	%esi, 260(%esp)
	movl	72(%esp), %edi
	leal	(%eax,%edi,4), %esi
	movl	%esi, 256(%esp)
	movl	220(%esp), %edx
	leal	(%eax,%edx,4), %esi
	movl	%esi, 252(%esp)
	movl	232(%esp), %edx
	leal	(%eax,%edx,4), %esi
	movl	%esi, 248(%esp)
	movl	228(%esp), %edx
	leal	(%eax,%edx,4), %esi
	movl	%esi, 244(%esp)
	movl	68(%esp), %esi
	leal	(%eax,%esi,4), %eax
	movl	%eax, 240(%esp)
	movl	272(%esp), %eax
	movl	216(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 236(%esp)
	leal	(%eax,%ebx,4), %edx
	movl	%edx, 208(%esp)
	leal	(%eax,%ecx,4), %edx
	movl	%edx, 204(%esp)
	leal	(%eax,%edi,4), %edx
	movl	%edx, 200(%esp)
	movl	220(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 196(%esp)
	movl	232(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 192(%esp)
	movl	228(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 188(%esp)
	leal	(%eax,%esi,4), %eax
	movl	%eax, 184(%esp)
	movl	12(%esp), %eax
	movl	216(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 180(%esp)
	leal	(%eax,%ebx,4), %edx
	movl	%edx, 176(%esp)
	leal	(%eax,%ecx,4), %edx
	movl	%edx, 172(%esp)
	leal	(%eax,%edi,4), %edx
	movl	%edx, 168(%esp)
	movl	220(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 164(%esp)
	movl	232(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 160(%esp)
	movl	228(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 156(%esp)
	leal	(%eax,%esi,4), %eax
	movl	%eax, 152(%esp)
	movl	8(%esp), %eax
	movl	216(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 148(%esp)
	leal	(%eax,%ebx,4), %edx
	movl	%edx, 144(%esp)
	leal	(%eax,%ecx,4), %edx
	movl	%edx, 140(%esp)
	leal	(%eax,%edi,4), %edx
	movl	%edx, 136(%esp)
	movl	220(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 132(%esp)
	movl	232(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 128(%esp)
	movl	228(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 124(%esp)
	leal	(%eax,%esi,4), %eax
	movl	%eax, 120(%esp)
	movl	36(%esp), %eax
	movl	216(%esp), %edx
	leal	(%eax,%edx,4), %edx
	movl	%edx, 116(%esp)
	leal	(%eax,%ebx,4), %edx
	movl	%edx, 112(%esp)
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 108(%esp)
	leal	(%eax,%edi,4), %ecx
	movl	%ecx, 104(%esp)
	movl	224(%esp), %edi
	movl	220(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 100(%esp)
	movl	232(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 96(%esp)
	movl	228(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 92(%esp)
	leal	(%eax,%esi,4), %eax
	movl	%eax, 88(%esp)
	xorl	%eax, %eax
	movl	$4, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_7:
	movl	200(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm3
	movl	204(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm3, %xmm3
	movl	208(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm3, %xmm3
	movl	236(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm3, %xmm3
	movl	184(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm4
	movl	188(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm4, %xmm4
	movl	192(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm4, %xmm4
	movl	196(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm4, %xmm4
	vinsertf128	$1, %xmm3, %ymm4, %ymm3
	movl	136(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm4
	movl	140(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm4, %xmm4
	movl	144(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm4, %xmm4
	movl	148(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm4, %xmm4
	movl	120(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm5
	movl	124(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm5, %xmm5
	movl	128(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm5, %xmm5
	movl	132(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm5, %xmm5
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	vsubps	%ymm3, %ymm4, %ymm3
	movl	256(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm4
	movl	260(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm4, %xmm4
	movl	264(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm4, %xmm4
	movl	268(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm4, %xmm4
	movl	240(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm5
	movl	244(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm5, %xmm5
	movl	248(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm5, %xmm5
	movl	252(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm5, %xmm5
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	movl	168(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm5
	movl	172(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm5, %xmm5
	movl	176(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm5, %xmm5
	movl	180(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm5, %xmm5
	movl	152(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm6
	movl	156(%esp), %ebx
	vinsertps	$16, (%ebx,%eax), %xmm6, %xmm6
	movl	160(%esp), %ebx
	vinsertps	$32, (%ebx,%eax), %xmm6, %xmm6
	movl	164(%esp), %ebx
	vinsertps	$48, (%ebx,%eax), %xmm6, %xmm6
	vinsertf128	$1, %xmm5, %ymm6, %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm4, %ymm4
	vfmadd213ps	%ymm4, %ymm3, %ymm3
	vsqrtps	%ymm3, %ymm3
	vmovss	-4(%ecx,%edi), %xmm4
	vmovss	(%ecx,%edi), %xmm5
	vmulss	%xmm5, %xmm5, %xmm6
	vmovaps	%xmm4, %xmm7
	vfmadd213ss	%xmm6, %xmm7, %xmm7
	vbroadcastss	%xmm7, %ymm6
	vfnmadd213ps	%ymm6, %ymm3, %ymm3
	vaddss	%xmm4, %xmm4, %xmm4
	vmulss	%xmm5, %xmm4, %xmm4
	vbroadcastss	%xmm4, %ymm4
	vdivps	%ymm4, %ymm3, %ymm3
	movl	88(%esp), %ebx
	vmovss	%xmm3, (%ebx,%eax)
	movl	92(%esp), %ebx
	vextractps	$1, %xmm3, (%ebx,%eax)
	movl	96(%esp), %ebx
	vextractps	$2, %xmm3, (%ebx,%eax)
	movl	100(%esp), %ebx
	vextractps	$3, %xmm3, (%ebx,%eax)
	vextractf128	$1, %ymm3, %xmm3
	movl	104(%esp), %ebx
	vmovss	%xmm3, (%ebx,%eax)
	movl	108(%esp), %ebx
	vextractps	$1, %xmm3, (%ebx,%eax)
	movl	112(%esp), %ebx
	vextractps	$2, %xmm3, (%ebx,%eax)
	movl	116(%esp), %ebx
	vextractps	$3, %xmm3, (%ebx,%eax)
	addl	$4, %eax
	adcl	$0, %edx
	addl	$4, %ecx
	incl	%esi
	cmpl	84(%esp), %esi
	jl	.LBB1_7
.LBB1_8:
	movl	16(%esp), %eax
	movl	72(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm3
	movl	76(%esp), %edx
	vinsertps	$16, (%eax,%edx,4), %xmm3, %xmm3
	movl	%edx, %esi
	movl	80(%esp), %edx
	vinsertps	$32, (%eax,%edx,4), %xmm3, %xmm3
	movl	%edx, %edi
	movl	216(%esp), %edx
	vinsertps	$48, (%eax,%edx,4), %xmm3, %xmm3
	movl	68(%esp), %edx
	vmovss	(%eax,%edx,4), %xmm4
	movl	%edx, %ebx
	movl	228(%esp), %edx
	vinsertps	$16, (%eax,%edx,4), %xmm4, %xmm4
	movl	232(%esp), %edx
	vinsertps	$32, (%eax,%edx,4), %xmm4, %xmm4
	movl	220(%esp), %edx
	vinsertps	$48, (%eax,%edx,4), %xmm4, %xmm4
	vinsertf128	$1, %xmm3, %ymm4, %ymm3
	movl	28(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm4
	vinsertps	$16, (%eax,%esi,4), %xmm4, %xmm4
	vinsertps	$32, (%eax,%edi,4), %xmm4, %xmm4
	movl	216(%esp), %edi
	vinsertps	$48, (%eax,%edi,4), %xmm4, %xmm4
	vmovss	(%eax,%ebx,4), %xmm5
	movl	228(%esp), %esi
	vinsertps	$16, (%eax,%esi,4), %xmm5, %xmm5
	movl	232(%esp), %ebx
	vinsertps	$32, (%eax,%ebx,4), %xmm5, %xmm5
	vinsertps	$48, (%eax,%edx,4), %xmm5, %xmm5
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	vaddps	%ymm3, %ymm4, %ymm3
	movl	52(%esp), %edx
	movl	276(%esp), %eax
	vmovups	%ymm3, (%eax,%edx,4)
	movl	24(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm3
	movl	76(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm3, %xmm3
	movl	80(%esp), %ecx
	vinsertps	$32, (%eax,%ecx,4), %xmm3, %xmm3
	vinsertps	$48, (%eax,%edi,4), %xmm3, %xmm3
	movl	68(%esp), %ebx
	vmovss	(%eax,%ebx,4), %xmm4
	vinsertps	$16, (%eax,%esi,4), %xmm4, %xmm4
	movl	232(%esp), %esi
	vinsertps	$32, (%eax,%esi,4), %xmm4, %xmm4
	movl	220(%esp), %edi
	vinsertps	$48, (%eax,%edi,4), %xmm4, %xmm4
	vinsertf128	$1, %xmm3, %ymm4, %ymm3
	movl	20(%esp), %eax
	movl	72(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm4
	movl	76(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm4, %xmm4
	movl	80(%esp), %ecx
	vinsertps	$32, (%eax,%ecx,4), %xmm4, %xmm4
	movl	216(%esp), %ecx
	vinsertps	$48, (%eax,%ecx,4), %xmm4, %xmm4
	vmovss	(%eax,%ebx,4), %xmm5
	movl	228(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm5, %xmm5
	vinsertps	$32, (%eax,%esi,4), %xmm5, %xmm5
	vinsertps	$48, (%eax,%edi,4), %xmm5, %xmm5
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	vaddps	%ymm3, %ymm4, %ymm3
	vmulps	%ymm2, %ymm3, %ymm3
	movl	272(%esp), %eax
	vmovups	%ymm3, (%eax,%edx,4)
	vpaddd	%ymm1, %ymm0, %ymm0
	addl	$8, %edx
	movl	56(%esp), %ecx
	incl	%ecx
	cmpl	32(%esp), %ecx
	movl	212(%esp), %eax
	jne	.LBB1_2
.LBB1_9:
	movl	48(%esp), %ecx
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpl	%eax, %ecx
	movl	272(%esp), %edx
	je	.LBB1_17
	subl	%eax, 48(%esp)
	addl	%eax, 60(%esp)
	movl	4(%esp), %eax
	addl	(%esp), %eax
	movl	32(%esp), %ecx
	leal	(%eax,%ecx,8), %eax
	movl	64(%esp), %esi
	imull	%esi, %eax
	leal	2(%eax), %edi
	movl	%edi, %ecx
	sarl	$31, %ecx
	addl	$-2, %edi
	adcl	$-1, %ecx
	shldl	$2, %edi, %ecx
	movl	%ecx, 220(%esp)
	leal	1(%eax), %ebx
	movl	%ebx, %ecx
	sarl	$31, %ecx
	addl	$-1, %ebx
	movl	%ebx, 236(%esp)
	adcl	$-1, %ecx
	shldl	$2, %ebx, %ecx
	movl	%ecx, 232(%esp)
	movl	$1, %ecx
	subl	%esi, %ecx
	movl	%ecx, 212(%esp)
	leal	8(%edx,%eax,4), %ecx
	movl	%ecx, 264(%esp)
	movl	276(%esp), %ebx
	leal	8(%ebx,%eax,4), %ecx
	movl	%ecx, 260(%esp)
	movl	36(%esp), %ecx
	leal	(%ecx,%eax,4), %ecx
	movl	%ecx, 256(%esp)
	leal	4(%edx,%eax,4), %ecx
	movl	%ecx, 252(%esp)
	leal	4(%ebx,%eax,4), %edx
	movl	224(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 248(%esp)
	movl	%esi, %eax
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	movl	%eax, 208(%esp)
	leal	1(%esi), %eax
	shrl	$31, %eax
	leal	1(%esi,%eax), %eax
	sarl	%eax
	movl	%eax, 240(%esp)
	shll	$2, %edi
	movl	%edi, 228(%esp)
	movl	236(%esp), %edi
	shll	$2, %edi
	leal	-1(%esi), %eax
	movl	%eax, 204(%esp)
	leal	(,%esi,4), %eax
	movl	%eax, 200(%esp)
	movl	232(%esp), %esi
	sarl	$31, %eax
	movl	%eax, 196(%esp)
	xorl	%eax, %eax
	vpxor	%xmm0, %xmm0, %xmm0
	vmovss	.LCPI1_1, %xmm1
	.align	16, 0x90
.LBB1_11:
	movl	%edx, 268(%esp)
	movl	%eax, 216(%esp)
	movl	%esi, 232(%esp)
	movl	%edi, 236(%esp)
	cmpl	$0, 204(%esp)
	movl	212(%esp), %eax
	movl	%edi, %ecx
	movl	%esi, %edx
	movl	$0, %esi
	movl	$0, %edi
	jle	.LBB1_13
	.align	16, 0x90
.LBB1_12:
	movl	252(%esp), %ebx
	vmovss	(%ebx,%esi), %xmm2
	movl	272(%esp), %ebx
	vsubss	(%ebx,%ecx), %xmm2, %xmm2
	movl	268(%esp), %ebx
	vmovss	(%ebx,%esi), %xmm3
	movl	276(%esp), %ebx
	vsubss	(%ebx,%ecx), %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vfmadd213ss	%xmm3, %xmm2, %xmm2
	vmovss	%xmm2, %xmm0, %xmm2
	vsqrtps	%xmm2, %xmm2
	movl	248(%esp), %ebx
	vmovss	%xmm2, (%ebx,%esi)
	addl	$4, %ecx
	adcl	$0, %edx
	addl	$4, %esi
	adcl	$0, %edi
	incl	%eax
	jne	.LBB1_12
.LBB1_13:
	cmpl	$0, 64(%esp)
	movl	224(%esp), %edx
	jle	.LBB1_16
	movl	$4, %ecx
	xorl	%ebx, %ebx
	movl	228(%esp), %eax
	movl	220(%esp), %esi
	movl	%esi, 244(%esp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	.align	16, 0x90
.LBB1_15:
	vmovss	-4(%ecx,%edx), %xmm2
	vmovss	(%ecx,%edx), %xmm3
	vmulss	%xmm3, %xmm3, %xmm5
	vmovaps	%xmm2, %xmm4
	vfmadd213ss	%xmm5, %xmm4, %xmm4
	movl	264(%esp), %edx
	vmovss	(%edx,%ebx), %xmm5
	movl	272(%esp), %edx
	vsubss	(%edx,%eax), %xmm5, %xmm5
	movl	260(%esp), %edx
	vmovss	(%edx,%ebx), %xmm6
	movl	276(%esp), %edx
	vsubss	(%edx,%eax), %xmm6, %xmm6
	vmulss	%xmm6, %xmm6, %xmm6
	vfmadd213ss	%xmm6, %xmm5, %xmm5
	vmovss	%xmm5, %xmm0, %xmm5
	vsqrtps	%xmm5, %xmm5
	vfnmadd213ss	%xmm4, %xmm5, %xmm5
	vaddss	%xmm2, %xmm2, %xmm2
	vmulss	%xmm3, %xmm2, %xmm2
	vdivss	%xmm2, %xmm5, %xmm2
	movl	256(%esp), %edx
	vmovss	%xmm2, (%edx,%ebx)
	movl	224(%esp), %edx
	addl	$4, %eax
	adcl	$0, 244(%esp)
	addl	$4, %ebx
	adcl	$0, %esi
	addl	$4, %ecx
	incl	%edi
	cmpl	240(%esp), %edi
	jl	.LBB1_15
.LBB1_16:
	movl	60(%esp), %ecx
	movl	%ecx, %eax
	imull	64(%esp), %eax
	addl	208(%esp), %eax
	movl	40(%esp), %edx
	vmovss	(%edx,%eax,4), %xmm2
	vaddss	4(%edx,%eax,4), %xmm2, %xmm2
	movl	276(%esp), %edx
	vmovss	%xmm2, (%edx,%ecx,4)
	movl	44(%esp), %edx
	vmovss	(%edx,%eax,4), %xmm2
	vaddss	4(%edx,%eax,4), %xmm2, %xmm2
	vmulss	%xmm1, %xmm2, %xmm2
	movl	272(%esp), %eax
	vmovss	%xmm2, (%eax,%ecx,4)
	movl	200(%esp), %eax
	addl	%eax, 228(%esp)
	movl	196(%esp), %edx
	adcl	%edx, 220(%esp)
	movl	236(%esp), %edi
	addl	%eax, %edi
	movl	232(%esp), %esi
	adcl	%edx, %esi
	addl	%eax, 264(%esp)
	addl	%eax, 260(%esp)
	addl	%eax, 256(%esp)
	addl	%eax, 252(%esp)
	movl	268(%esp), %edx
	addl	%eax, %edx
	addl	%eax, 248(%esp)
	incl	%ecx
	movl	%ecx, 60(%esp)
	movl	216(%esp), %eax
	incl	%eax
	cmpl	48(%esp), %eax
	jne	.LBB1_11
.LBB1_17:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp19:
	.size	features, .Ltmp19-features
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.long	2147483648
	.long	2147483648
	.long	2147483648
	.long	2147483648
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_1:
	.long	1065353216
.LCPI2_4:
	.long	1056964608
.LCPI2_6:
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_2:
	.quad	4607182418800017408
.LCPI2_3:
	.quad	4547007122018943789
.LCPI2_5:
	.quad	0
	.text
	.globl	PolinomeRealRoots
	.align	16, 0x90
	.type	PolinomeRealRoots,@function
PolinomeRealRoots:
	.cfi_startproc
	pushl	%ebp
.Ltmp23:
	.cfi_def_cfa_offset 8
.Ltmp24:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp25:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-16, %esp
	subl	$176, %esp
.Ltmp26:
	.cfi_offset %esi, -20
.Ltmp27:
	.cfi_offset %edi, -16
.Ltmp28:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	(%eax), %edi
	movl	%edi, 84(%esp)
	movl	8(%eax), %ebx
	movl	%ebx, 156(%esp)
	movl	%eax, %esi
	leal	1(%ebx), %ecx
	imull	%ebx, %ecx
	movl	%ecx, %edx
	shrl	$31, %edx
	addl	%ecx, %edx
	sarl	%edx
	movl	%edx, 56(%esp)
	movl	%ebx, %eax
	imull	%edx, %eax
	movl	52(%esi), %edx
	movl	%edx, 36(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %ecx
	imull	%edx, %ecx
	movl	28(%esi), %edx
	movl	%edx, 168(%esp)
	leal	(%ecx,%edx), %edx
	movl	%edx, 64(%esp)
	movl	%eax, %esi
	imull	%edx, %esi
	movl	8(%ebp), %ebx
	movl	12(%ebx), %ebx
	movl	%ebx, 60(%esp)
	leal	(%ebx,%esi,4), %esi
	movl	%esi, 96(%esp)
	movl	156(%esp), %esi
	shll	$2, %eax
	movl	%eax, 40(%esp)
	leal	(,%esi,4), %eax
	movl	%eax, 88(%esp)
	movl	$-4, %ebx
	subl	%eax, %ebx
	movl	%ebx, 80(%esp)
	movl	168(%esp), %eax
	leal	1(%ecx,%eax), %ecx
	imull	%esi, %ecx
	leal	-4(%edi,%ecx,4), %ebx
	movl	%esi, %ecx
	imull	%edx, %ecx
	leal	(%edi,%ecx,4), %eax
	movl	%eax, 100(%esp)
	movl	96(%esp), %ecx
	leal	-1(%esi), %edi
	movl	%edi, 68(%esp)
	movl	%edx, %eax
	imull	%edi, %eax
	shll	$2, %eax
	movl	8(%ebp), %edx
	addl	4(%edx), %eax
	movl	%eax, 92(%esp)
	movl	%esi, %eax
	imull	%edi, %eax
	movl	%eax, 52(%esp)
	movl	20(%edx), %eax
	movl	%eax, 168(%esp)
	movl	16(%edx), %eax
	movl	%eax, 160(%esp)
	leal	-4(,%esi,4), %eax
	movl	%eax, 32(%esp)
	leal	(%esi,%esi), %eax
	movl	%eax, 28(%esp)
	movl	60(%esp), %edx
	leal	-12(%edx), %eax
	movl	%eax, 24(%esp)
	movl	%esi, %eax
	imull	%eax, %eax
	movl	%eax, 20(%esp)
	leal	-8(%edx), %eax
	movl	%eax, 16(%esp)
	movl	100(%esp), %edx
	leal	-2(%esi), %eax
	movl	%eax, 48(%esp)
	leal	4(,%esi,4), %eax
	movl	%eax, 76(%esp)
	sarl	$31, %eax
	movl	%eax, 72(%esp)
	xorl	%edi, %edi
	movl	$2147483647, %eax
	vmovd	%eax, %xmm2
	vmovapd	%xmm2, 112(%esp)
	movl	64(%esp), %eax
	vmovsd	.LCPI2_2, %xmm5
	vmovss	.LCPI2_4, %xmm6
.LBB2_1:
	movl	%edi, 44(%esp)
	movl	%ecx, 96(%esp)
	movl	%eax, 64(%esp)
	movl	%eax, %edi
	imull	%esi, %edi
	testl	%esi, %esi
	movl	%esi, %eax
	jle	.LBB2_2
	movl	%edi, %ecx
	imull	56(%esp), %ecx
	movl	%ecx, 104(%esp)
	movl	68(%esp), %ecx
	leal	(%ecx,%edi), %ecx
	movl	%ecx, 144(%esp)
	movl	%edi, 108(%esp)
	xorl	%ecx, %ecx
	movl	%edx, 100(%esp)
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	.align	16, 0x90
.LBB2_4:
	movl	%eax, 148(%esp)
	movl	%edi, 152(%esp)
	movl	%edx, 164(%esp)
	movl	100(%esp), %edx
	vmovss	(%edx,%esi), %xmm0
	movl	144(%esp), %edx
	movl	84(%esp), %edi
	vdivss	(%edi,%edx,4), %xmm0, %xmm0
	movl	152(%esp), %edi
	movl	164(%esp), %edx
	movl	96(%esp), %eax
	vmovss	%xmm0, (%eax,%ecx)
	movl	148(%esp), %eax
	addl	76(%esp), %ecx
	adcl	72(%esp), %edx
	addl	$4, %esi
	adcl	$0, %edi
	decl	%eax
	jne	.LBB2_4
	jmp	.LBB2_5
	.align	16, 0x90
.LBB2_2:
	movl	%edx, 100(%esp)
	movl	%edi, %eax
	movl	%edi, 108(%esp)
	imull	56(%esp), %eax
	movl	%eax, 104(%esp)
.LBB2_5:
	cmpl	$0, 48(%esp)
	jle	.LBB2_10
	movl	52(%esp), %eax
	movl	104(%esp), %edx
	leal	(%eax,%edx), %eax
	movl	24(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	20(%esp), %ecx
	leal	(%ecx,%edx), %ecx
	movl	16(%esp), %edx
	leal	(%edx,%ecx,4), %ecx
	movl	68(%esp), %edx
	movl	48(%esp), %edi
	.align	16, 0x90
.LBB2_7:
	movl	%edi, 164(%esp)
	vcvtsi2ssl	%edx, %xmm0, %xmm0
	xorl	%esi, %esi
	movl	%edi, %edx
	xorl	%edi, %edi
	.align	16, 0x90
.LBB2_8:
	vcvtsi2ssl	%edx, %xmm0, %xmm1
	vmulss	(%ecx,%esi), %xmm1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, (%eax,%esi)
	addl	$-4, %esi
	adcl	$-1, %edi
	decl	%edx
	testl	%edx, %edx
	jg	.LBB2_8
	movl	80(%esp), %edx
	addl	%edx, %eax
	addl	%edx, %ecx
	movl	164(%esp), %edx
	leal	-1(%edx), %esi
	testl	%esi, %esi
	movl	%esi, %edi
	jg	.LBB2_7
.LBB2_10:
	movl	168(%esp), %eax
	movl	108(%esp), %edx
	movl	$1, 4(%eax,%edx,4)
	movl	60(%esp), %eax
	movl	104(%esp), %ecx
	vmovss	4(%eax,%ecx,4), %xmm0
	vxorps	.LCPI2_0, %xmm0, %xmm0
	movl	160(%esp), %eax
	vmovss	%xmm0, 4(%eax,%ecx,4)
	movl	156(%esp), %ecx
	cmpl	$3, %ecx
	jl	.LBB2_22
	movl	28(%esp), %eax
	movl	104(%esp), %edx
	leal	(%eax,%edx), %eax
	movl	60(%esp), %edx
	leal	(%edx,%eax,4), %eax
	movl	$2, %esi
	.align	16, 0x90
.LBB2_12:
	movl	%esi, 144(%esp)
	movl	%eax, 140(%esp)
	movl	%esi, %edx
	imull	%ecx, %edx
	addl	104(%esp), %edx
	movl	%edx, 152(%esp)
	xorl	%ecx, %ecx
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	xorl	%edx, %edx
	.align	16, 0x90
.LBB2_13:
	movl	%ecx, %esi
	addl	$4, %esi
	adcl	$0, %eax
	movl	140(%esp), %edi
	vmovss	(%edi,%ecx), %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vmaxss	%xmm0, %xmm1, %xmm0
	incl	%edx
	cmpl	%edx, 144(%esp)
	movl	%esi, %ecx
	jne	.LBB2_13
	movl	108(%esp), %eax
	movl	144(%esp), %ecx
	leal	(%ecx,%eax), %ecx
	movl	%ecx, 164(%esp)
	movl	168(%esp), %eax
	movl	$0, (%eax,%ecx,4)
	movl	-4(%eax,%ecx,4), %esi
	testl	%esi, %esi
	js	.LBB2_36
	vaddss	.LCPI2_1, %xmm0, %xmm0
	vmovss	%xmm0, 136(%esp)
	movl	144(%esp), %eax
	leal	-1(%eax), %eax
	imull	156(%esp), %eax
	addl	104(%esp), %eax
	movl	%eax, 132(%esp)
	vxorps	.LCPI2_0, %xmm0, %xmm0
	vmovss	%xmm0, 128(%esp)
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB2_16:
	movl	%ecx, 148(%esp)
	testl	%ecx, %ecx
	vmovss	128(%esp), %xmm0
	je	.LBB2_18
	vmovapd	%xmm1, %xmm0
.LBB2_18:
	vmovapd	%xmm0, %xmm1
	xorl	%ecx, %ecx
	movl	156(%esp), %eax
	testl	%eax, %eax
	movl	$0, %edx
	vmovapd	%xmm5, %xmm3
	jle	.LBB2_27
	.align	16, 0x90
.LBB2_19:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	%xmm3, %xmm3, %xmm0
	vmovss	(%ebx,%ecx), %xmm2
	vfmadd213ss	%xmm2, %xmm1, %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm0, %xmm0, %xmm3
	addl	$-4, %ecx
	adcl	$-1, %edx
	decl	%eax
	testl	%eax, %eax
	jg	.LBB2_19
	vmovsd	.LCPI2_3, %xmm0
	vucomisd	%xmm3, %xmm0
	jae	.LBB2_21
.LBB2_27:
	vucomisd	.LCPI2_5, %xmm3
	movl	$-1, %ecx
	movl	$1, %eax
	cmoval	%eax, %ecx
	movl	148(%esp), %edx
	cmpl	%esi, %edx
	vmovss	136(%esp), %xmm2
	je	.LBB2_29
	movl	132(%esp), %eax
	leal	(%eax,%edx), %eax
	movl	160(%esp), %edx
	vmovss	(%edx,%eax,4), %xmm2
.LBB2_29:
	xorl	%esi, %esi
	movl	156(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %edx
	movl	$0, %eax
	vmovapd	%xmm5, %xmm0
	jle	.LBB2_33
	.align	16, 0x90
.LBB2_30:
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	(%ebx,%esi), %xmm4
	vfmadd213ss	%xmm4, %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	addl	$-4, %esi
	adcl	$-1, %eax
	decl	%edx
	testl	%edx, %edx
	jg	.LBB2_30
	vmovsd	.LCPI2_3, %xmm4
	vucomisd	%xmm0, %xmm4
	jae	.LBB2_32
.LBB2_33:
	vxorpd	%xmm4, %xmm4, %xmm4
	vucomisd	%xmm4, %xmm0
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$-1, %eax
	movl	$1, %edx
	cmoval	%edx, %eax
	cmpl	%eax, %ecx
	jne	.LBB2_37
	movl	168(%esp), %eax
	movl	164(%esp), %ecx
	jmp	.LBB2_35
	.align	16, 0x90
.LBB2_37:
	vucomisd	%xmm0, %xmm3
	vmovapd	%xmm1, %xmm3
	ja	.LBB2_39
	vmovapd	%xmm2, %xmm3
.LBB2_39:
	movl	156(%esp), %esi
	ja	.LBB2_41
	vmovapd	%xmm1, %xmm2
.LBB2_41:
	vaddss	%xmm3, %xmm2, %xmm0
	vmulss	%xmm6, %xmm0, %xmm0
	vucomiss	%xmm2, %xmm0
	jne	.LBB2_42
	jnp	.LBB2_47
.LBB2_42:
	vucomiss	%xmm3, %xmm0
	jne	.LBB2_43
	jnp	.LBB2_47
.LBB2_43:
	testl	%esi, %esi
	jg	.LBB2_55
	vmovapd	%xmm0, %xmm3
	.align	16, 0x90
.LBB2_45:
	vaddss	%xmm3, %xmm2, %xmm0
	vmulss	%xmm6, %xmm0, %xmm0
	vucomiss	%xmm2, %xmm0
	jne	.LBB2_46
	jnp	.LBB2_47
.LBB2_46:
	vucomiss	%xmm3, %xmm0
	vmovapd	%xmm0, %xmm3
	jne	.LBB2_45
	jp	.LBB2_45
	jmp	.LBB2_47
	.align	16, 0x90
.LBB2_21:
	addl	152(%esp), %edi
	movl	160(%esp), %eax
	vmovss	%xmm1, (%eax,%edi,4)
	jmp	.LBB2_48
.LBB2_32:
	addl	152(%esp), %edi
	movl	160(%esp), %eax
	vmovss	%xmm2, (%eax,%edi,4)
	jmp	.LBB2_48
	.align	16, 0x90
.LBB2_53:
	vaddss	%xmm3, %xmm4, %xmm0
	vmulss	%xmm6, %xmm0, %xmm0
	vucomiss	%xmm4, %xmm0
	jne	.LBB2_54
	jnp	.LBB2_47
.LBB2_54:
	vucomiss	%xmm3, %xmm0
	vmovapd	%xmm4, %xmm2
	jne	.LBB2_55
	jnp	.LBB2_47
.LBB2_55:
	vmovapd	%xmm0, %xmm4
	xorl	%ecx, %ecx
	movl	%esi, %eax
	xorl	%edx, %edx
	vmovapd	%xmm5, %xmm0
	.align	16, 0x90
.LBB2_56:
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsd2ss	%xmm0, %xmm0, %xmm7
	vmovss	(%ebx,%ecx), %xmm0
	vfmadd213ss	%xmm0, %xmm1, %xmm7
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm7, %xmm7, %xmm0
	addl	$-4, %ecx
	adcl	$-1, %edx
	decl	%eax
	testl	%eax, %eax
	jg	.LBB2_56
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm7, %xmm0
	ja	.LBB2_51
	vmovapd	%xmm4, %xmm3
.LBB2_51:
	ja	.LBB2_53
	vmovapd	%xmm2, %xmm4
	jmp	.LBB2_53
	.align	16, 0x90
.LBB2_47:
	addl	152(%esp), %edi
	movl	160(%esp), %eax
	vmovss	%xmm0, (%eax,%edi,4)
.LBB2_48:
	movl	168(%esp), %eax
	movl	164(%esp), %ecx
	movl	(%eax,%ecx,4), %edi
	incl	%edi
	movl	%edi, (%eax,%ecx,4)
.LBB2_35:
	movl	-4(%eax,%ecx,4), %esi
	movl	148(%esp), %ecx
	cmpl	%esi, %ecx
	leal	1(%ecx), %ecx
	vmovapd	112(%esp), %xmm2
	jl	.LBB2_16
.LBB2_36:
	movl	%eax, 168(%esp)
	movl	140(%esp), %eax
	addl	88(%esp), %eax
	movl	144(%esp), %esi
	incl	%esi
	movl	156(%esp), %ecx
	cmpl	%ecx, %esi
	movl	108(%esp), %edx
	jne	.LBB2_12
.LBB2_22:
	addl	68(%esp), %edx
	movl	%edx, 108(%esp)
	movl	168(%esp), %eax
	cmpl	$0, (%eax,%edx,4)
	movl	92(%esp), %edi
	jle	.LBB2_25
	movl	104(%esp), %edx
	addl	52(%esp), %edx
	movl	160(%esp), %ecx
	leal	(%ecx,%edx,4), %eax
	movl	%eax, 164(%esp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	.align	16, 0x90
.LBB2_24:
	movl	164(%esp), %eax
	vmovss	(%eax,%ecx), %xmm0
	vmovss	%xmm0, (%edi,%ecx)
	addl	$4, %ecx
	adcl	$0, %edx
	incl	%esi
	movl	108(%esp), %eax
	movl	168(%esp), %edi
	cmpl	(%edi,%eax,4), %esi
	movl	92(%esp), %edi
	jl	.LBB2_24
.LBB2_25:
	addl	32(%esp), %edi
	movl	%edi, 92(%esp)
	movl	88(%esp), %eax
	addl	%eax, %ebx
	movl	100(%esp), %edx
	addl	%eax, %edx
	movl	96(%esp), %ecx
	addl	40(%esp), %ecx
	movl	64(%esp), %eax
	incl	%eax
	movl	44(%esp), %edi
	incl	%edi
	cmpl	36(%esp), %edi
	movl	156(%esp), %esi
	jne	.LBB2_1
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp29:
	.size	PolinomeRealRoots, .Ltmp29-PolinomeRealRoots
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI3_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
.LCPI3_3:
	.long	0
	.long	2
	.long	4
	.long	6
	.long	0
	.long	0
	.long	0
	.long	0
.LCPI3_7:
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	12
	.byte	13
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	12
	.byte	13
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
.LCPI3_9:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
.LCPI3_13:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI3_1:
	.long	2147483647
.LCPI3_6:
	.long	1
.LCPI3_8:
	.long	1056964608
.LCPI3_11:
	.long	1090519040
.LCPI3_12:
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_2:
	.quad	4576918229304087675
.LCPI3_10:
	.quad	4591870180066957722
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_4:
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	0
	.byte	128
	.byte	4
	.byte	128
	.byte	8
	.byte	128
	.byte	12
	.byte	128
.LCPI3_5:
	.byte	0
	.byte	128
	.byte	4
	.byte	128
	.byte	8
	.byte	128
	.byte	12
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.byte	128
	.text
	.globl	PolinomeFindRoots
	.align	16, 0x90
	.type	PolinomeFindRoots,@function
PolinomeFindRoots:
	.cfi_startproc
	pushl	%ebp
.Ltmp33:
	.cfi_def_cfa_offset 8
.Ltmp34:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp35:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-32, %esp
	subl	$2144, %esp
.Ltmp36:
	.cfi_offset %esi, -20
.Ltmp37:
	.cfi_offset %edi, -16
.Ltmp38:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	%edx, 380(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %edi
	movl	52(%eax), %esi
	movl	%esi, 188(%esp)
	imull	%esi, %edi
	movl	%edi, 124(%esp)
	movl	28(%eax), %esi
	movl	%esi, 120(%esp)
	leal	(%edi,%esi), %esi
	movl	%esi, 888(%esp)
	movl	4(%ecx), %ecx
	imull	%edx, %ecx
	addl	32(%eax), %ecx
	movl	%ecx, 180(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 988(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 1340(%esp)
	vmovss	12(%eax), %xmm0
	vmovaps	%xmm0, 688(%esp)
	vmovss	8(%eax), %xmm0
	vmovaps	%xmm0, 352(%esp)
	movl	(%eax), %ecx
	movl	%ecx, 116(%esp)
	movl	4(%eax), %ecx
	movl	%ecx, 1564(%esp)
	movl	88(%eax), %eax
	movl	%eax, 1336(%esp)
	sarl	$3, %edx
	movl	%edx, 348(%esp)
	je	.LBB3_29
	movl	$-1, %eax
	xorl	%esi, %esi
	testl	%ecx, %ecx
	movl	%ecx, %edx
	movl	$0, %ecx
	cmovlel	%eax, %ecx
	vmovd	%ecx, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 288(%esp)
	cmovlel	%esi, %eax
	movl	$0, 184(%esp)
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 256(%esp)
	movl	124(%esp), %eax
	movl	120(%esp), %ecx
	leal	(%eax,%ecx), %eax
	movl	%edx, %ecx
	imull	%eax, %ecx
	movl	116(%esp), %esi
	leal	(%esi,%ecx,4), %edi
	leal	-1(%edx), %ecx
	imull	%eax, %ecx
	leal	(%esi,%ecx,4), %esi
	movl	%edx, %ecx
	movl	%edi, %edx
	leal	-4(,%ecx,4), %eax
	movl	%eax, 176(%esp)
	leal	(,%ecx,4), %eax
	movl	%eax, 172(%esp)
	vbroadcastss	688(%esp), %ymm0
	vmovaps	%ymm0, 640(%esp)
	vbroadcastss	352(%esp), %ymm0
	vmovaps	%ymm0, 224(%esp)
	movl	180(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI3_0, %ymm0, %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 128(%esp)
	vpxor	%ymm6, %ymm6, %ymm6
	vpbroadcastd	.LCPI3_1, %ymm0
	vmovdqa	%ymm0, 608(%esp)
	vbroadcastsd	.LCPI3_2, %ymm0
	vmovapd	%ymm0, 576(%esp)
	vbroadcastss	.LCPI3_11, %ymm0
	vmovaps	%ymm0, 192(%esp)
	movl	888(%esp), %eax
	.align	16, 0x90
.LBB3_2:
	movl	%esi, 984(%esp)
	movl	%eax, 892(%esp)
	movl	%edx, 1500(%esp)
	movl	%eax, %edx
	imull	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, 828(%esp)
	xorl	%eax, %eax
	vmovaps	128(%esp), %ymm0
	.align	16, 0x90
.LBB3_3:
	vmovaps	%ymm0, 512(%esp)
	movl	%eax, 572(%esp)
	vmovaps	640(%esp), %ymm2
	vfmadd213ps	224(%esp), %ymm0, %ymm2
	vmovaps	%ymm2, 1088(%esp)
	testl	%ecx, %ecx
	jle	.LBB3_4
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorps	%ymm0, %ymm0, %ymm0
	.align	16, 0x90
.LBB3_6:
	vmovaps	%ymm0, 1568(%esp)
	vmovd	%ebx, %xmm0
	vpermd	%ymm0, %ymm6, %ymm1
	vmovaps	%ymm2, %ymm0
	calll	__ocl_svml_s9_pownf8
	vmovaps	1088(%esp), %ymm2
	vpxor	%ymm6, %ymm6, %ymm6
	movl	1564(%esp), %ecx
	movl	984(%esp), %eax
	vbroadcastss	(%eax,%esi), %ymm1
	vfmadd213ps	1568(%esp), %ymm0, %ymm1
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, %ecx
	vmovaps	%ymm1, %ymm0
	jne	.LBB3_6
	jmp	.LBB3_7
	.align	16, 0x90
.LBB3_4:
	vxorps	%ymm1, %ymm1, %ymm1
.LBB3_7:
	vmovaps	%ymm2, 1088(%esp)
	vmovaps	%ymm1, 832(%esp)
	vandps	608(%esp), %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vcvtps2pd	%xmm1, %ymm1
	vmovapd	576(%esp), %ymm2
	vcmpltpd	%ymm2, %ymm1, %ymm1
	vmovdqa	.LCPI3_3, %ymm3
	vpermd	%ymm1, %ymm3, %ymm1
	vmovdqa	%ymm1, 768(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vcmpltpd	%ymm2, %ymm0, %ymm0
	vpermd	%ymm0, %ymm3, %ymm0
	vmovdqa	%ymm0, 736(%esp)
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 480(%esp)
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqa	%ymm0, 1504(%esp)
	vptest	%ymm0, %ymm0
	je	.LBB3_8
	vmovaps	1088(%esp), %ymm0
	vaddps	640(%esp), %ymm0, %ymm2
	vmovaps	%ymm2, 1056(%esp)
	testl	%ecx, %ecx
	vpxor	%ymm1, %ymm1, %ymm1
	jle	.LBB3_37
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorps	%ymm0, %ymm0, %ymm0
	.align	16, 0x90
.LBB3_36:
	vmovaps	%ymm0, 1568(%esp)
	vmovd	%ebx, %xmm0
	vpermd	%ymm0, %ymm6, %ymm1
	vmovaps	%ymm2, %ymm0
	calll	__ocl_svml_s9_pownf8
	movl	1500(%esp), %eax
	vmovaps	1056(%esp), %ymm2
	vpxor	%ymm6, %ymm6, %ymm6
	movl	1564(%esp), %ecx
	vbroadcastss	(%eax,%esi), %ymm1
	vfmadd213ps	1568(%esp), %ymm0, %ymm1
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, %ecx
	vmovaps	%ymm1, %ymm0
	jne	.LBB3_36
.LBB3_37:
	vmovaps	%ymm2, 1056(%esp)
	vpbroadcastd	.LCPI3_6, %ymm0
	vmovdqa	%ymm0, 1024(%esp)
	vpand	608(%esp), %ymm1, %ymm2
	vcvtps2pd	%xmm2, %ymm0
	vmovapd	576(%esp), %ymm3
	vcmpltpd	%ymm3, %ymm0, %ymm0
	vmovdqa	.LCPI3_3, %ymm4
	vpermd	%ymm0, %ymm4, %ymm0
	vextracti128	$1, %ymm2, %xmm2
	vcvtps2pd	%xmm2, %ymm2
	vcmpltpd	%ymm3, %ymm2, %ymm2
	vpermd	%ymm2, %ymm4, %ymm2
	vinserti128	$1, %xmm2, %ymm0, %ymm3
	vmovdqa	736(%esp), %ymm4
	vpshufb	.LCPI3_5, %xmm4, %xmm4
	vmovdqa	768(%esp), %ymm5
	vpshufb	.LCPI3_4, %xmm5, %xmm5
	vpor	%xmm5, %xmm4, %xmm4
	vpmovzxwd	%xmm4, %ymm4
	vpslld	$31, %ymm4, %ymm4
	vblendvps	%ymm4, %ymm6, %ymm3, %ymm5
	vptest	%ymm5, %ymm5
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	je	.LBB3_56
	vextracti128	$1, %ymm1, %xmm4
	vpshufd	$3, %xmm4, %xmm3
	movl	988(%esp), %eax
	movl	892(%esp), %ecx
	movl	(%eax,%ecx,4), %eax
	addl	828(%esp), %eax
	vptest	%ymm7, %ymm5
	jb	.LBB3_54
	vpand	1024(%esp), %ymm5, %ymm5
	vpcmpeqd	%ymm6, %ymm5, %ymm5
	vpxor	%ymm7, %ymm5, %ymm5
	vpshufb	.LCPI3_7, %ymm5, %ymm5
	vpermq	$8, %ymm5, %ymm5
	vpextrb	$6, %xmm5, %ecx
	movl	%ecx, 1568(%esp)
	vpextrb	$4, %xmm5, %ecx
	vpextrb	$2, %xmm5, %edx
	vpextrb	$0, %xmm5, %ebx
	testb	$1, %bl
	je	.LBB3_41
	movl	1340(%esp), %esi
	vmovss	%xmm1, (%esi,%eax,4)
.LBB3_41:
	vpextrb	$8, %xmm5, %esi
	testb	$1, %dl
	je	.LBB3_43
	vpshufd	$1, %xmm1, %xmm6
	movl	1340(%esp), %edx
	vmovss	%xmm6, (%edx,%eax,4)
.LBB3_43:
	vpextrb	$10, %xmm5, %edi
	testb	$1, %cl
	je	.LBB3_45
	vmovhlps	%xmm1, %xmm1, %xmm6
	movl	1340(%esp), %ecx
	vmovss	%xmm6, (%ecx,%eax,4)
.LBB3_45:
	vpextrb	$12, %xmm5, %ecx
	movl	1568(%esp), %edx
	testb	$1, %dl
	je	.LBB3_47
	vpshufd	$3, %xmm1, %xmm6
	movl	1340(%esp), %edx
	vmovss	%xmm6, (%edx,%eax,4)
.LBB3_47:
	vpextrb	$14, %xmm5, %edx
	movl	%esi, %ebx
	testb	$1, %bl
	je	.LBB3_49
	movl	1340(%esp), %esi
	vmovss	%xmm4, (%esi,%eax,4)
.LBB3_49:
	movl	%edi, %ebx
	testb	$1, %bl
	vxorps	%ymm6, %ymm6, %ymm6
	je	.LBB3_51
	vpshufd	$1, %xmm4, %xmm5
	movl	1340(%esp), %esi
	vmovss	%xmm5, (%esi,%eax,4)
.LBB3_51:
	testb	$1, %cl
	je	.LBB3_53
	vmovhlps	%xmm4, %xmm4, %xmm4
	movl	1340(%esp), %ecx
	vmovss	%xmm4, (%ecx,%eax,4)
.LBB3_53:
	testb	$1, %dl
	je	.LBB3_55
.LBB3_54:
	movl	1340(%esp), %ecx
	vmovss	%xmm3, (%ecx,%eax,4)
.LBB3_55:
	movl	988(%esp), %eax
	movl	892(%esp), %ecx
	incl	(%eax,%ecx,4)
	movl	1564(%esp), %ecx
.LBB3_56:
	vpshufb	.LCPI3_4, %xmm2, %xmm2
	vpshufb	.LCPI3_5, %xmm0, %xmm0
	vpor	%xmm2, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %ymm0
	vpslld	$31, %ymm0, %ymm0
	vmovaps	1504(%esp), %ymm2
	vblendvps	%ymm0, %ymm6, %ymm2, %ymm2
	vptest	%ymm2, %ymm2
	je	.LBB3_8
	vxorps	%ymm0, %ymm0, %ymm0
	vcmpnltps	832(%esp), %ymm0, %ymm0
	vmovaps	1024(%esp), %ymm4
	vorps	%ymm4, %ymm0, %ymm0
	vmovaps	%ymm2, 1440(%esp)
	vandps	%ymm4, %ymm2, %ymm2
	vpcmpeqd	%ymm6, %ymm2, %ymm2
	vpxor	%ymm7, %ymm2, %ymm2
	vmovdqa	.LCPI3_7, %ymm3
	vpshufb	%ymm3, %ymm2, %ymm2
	vpermq	$8, %ymm2, %ymm2
	vmovdqa	%ymm2, 1504(%esp)
	vpextrb	$6, %xmm2, %eax
	movl	%eax, 1376(%esp)
	vpextrb	$4, %xmm2, %esi
	vpextrb	$2, %xmm2, %ebx
	vpextrb	$0, %xmm2, %eax
	vcmpnltps	%ymm1, %ymm6, %ymm1
	vorps	%ymm4, %ymm1, %ymm1
	vpcmpeqd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 1408(%esp)
	vpshufb	%ymm3, %ymm0, %ymm0
	vpermq	$8, %ymm0, %ymm0
	testb	$1, %al
	movl	1336(%esp), %edi
	je	.LBB3_59
	vpextrb	$0, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1656(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1656(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vmovdqa	%ymm0, 1568(%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	1568(%esp), %ymm0
.LBB3_59:
	vmovdqa	1504(%esp), %ymm1
	vpextrb	$8, %xmm1, %eax
	movl	%eax, 1344(%esp)
	testb	$1, %bl
	je	.LBB3_61
	vpextrb	$2, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1660(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1660(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vmovdqa	%ymm0, 1568(%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	1568(%esp), %ymm0
.LBB3_61:
	vmovdqa	1504(%esp), %ymm1
	vpextrb	$10, %xmm1, %eax
	movl	%eax, 1280(%esp)
	movl	%esi, %eax
	testb	$1, %al
	je	.LBB3_63
	vpextrb	$4, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1664(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1664(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vmovdqa	%ymm0, 1568(%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	1568(%esp), %ymm0
.LBB3_63:
	vmovdqa	%ymm0, 1568(%esp)
	vmovdqa	1504(%esp), %ymm0
	vpextrb	$12, %xmm0, %esi
	movl	1376(%esp), %eax
	testb	$1, %al
	je	.LBB3_65
	vmovdqa	1568(%esp), %ymm0
	vpextrb	$6, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1668(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1668(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_65:
	vmovdqa	1504(%esp), %ymm0
	vpextrb	$14, %xmm0, %ebx
	movl	1344(%esp), %eax
	testb	$1, %al
	vmovdqa	1568(%esp), %ymm0
	je	.LBB3_67
	vpextrb	$8, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1672(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1672(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	1568(%esp), %ymm0
.LBB3_67:
	movl	1280(%esp), %eax
	testb	$1, %al
	je	.LBB3_69
	vpextrb	$10, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1676(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1676(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	1568(%esp), %ymm0
.LBB3_69:
	movl	%esi, %eax
	testb	$1, %al
	je	.LBB3_71
	vpextrb	$12, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1680(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1680(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	1568(%esp), %ymm0
.LBB3_71:
	testb	$1, %bl
	je	.LBB3_73
	vpextrb	$14, %xmm0, %eax
	andl	$1, %eax
	movl	%eax, 1684(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1684(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_73:
	vmovdqa	1408(%esp), %ymm0
	vpandn	1440(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 704(%esp)
	vptest	%ymm0, %ymm0
	movl	1564(%esp), %ecx
	vpxor	%ymm6, %ymm6, %ymm6
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	je	.LBB3_8
	vmovaps	1056(%esp), %ymm3
	vsubps	1088(%esp), %ymm3, %ymm0
	vbroadcastss	.LCPI3_8, %ymm1
	vmovaps	%ymm1, 928(%esp)
	vmulps	%ymm1, %ymm0, %ymm4
	vmovaps	%ymm4, 992(%esp)
	vxorps	%ymm0, %ymm0, %ymm0
	testl	%ecx, %ecx
	jle	.LBB3_75
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%edi, %edi
	vxorps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm1, 1504(%esp)
	.align	16, 0x90
.LBB3_136:
	vmovaps	%ymm0, 1568(%esp)
	vmovd	%edi, %xmm0
	vpermd	%ymm0, %ymm6, %ymm1
	vmovaps	%ymm4, %ymm0
	calll	__ocl_svml_s9_pownf8
	vmovaps	992(%esp), %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	movl	1564(%esp), %eax
	movl	1500(%esp), %ecx
	vbroadcastss	(%ecx,%ebx), %ymm1
	vmulps	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vcvtps2pd	%xmm1, %ymm1
	vmovapd	1504(%esp), %ymm2
	vaddpd	%ymm1, %ymm2, %ymm2
	vmovapd	%ymm2, 1504(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	1568(%esp), %ymm1
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovapd	%ymm1, 1568(%esp)
	vmovaps	1568(%esp), %ymm0
	addl	$4, %ebx
	adcl	$0, %esi
	incl	%edi
	cmpl	%edi, %eax
	jne	.LBB3_136
	movl	1336(%esp), %esi
	movl	16(%ebp), %edi
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	vmovaps	1056(%esp), %ymm3
	jmp	.LBB3_77
.LBB3_75:
	vxorps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm1, 1504(%esp)
	movl	1336(%esp), %esi
	movl	16(%ebp), %edi
.LBB3_77:
	vmovaps	.LCPI3_9, %ymm1
	vandps	%ymm1, %ymm0, %ymm0
	vbroadcastsd	.LCPI3_10, %ymm5
	vmovapd	%ymm5, 896(%esp)
	vcmpnlepd	%ymm0, %ymm5, %ymm0
	vmovdqa	.LCPI3_3, %ymm2
	vpermd	%ymm0, %ymm2, %ymm0
	vmovdqa	%ymm0, 448(%esp)
	vpshufb	.LCPI3_5, %xmm0, %xmm0
	vmovdqa	%xmm0, 1568(%esp)
	vmovaps	1504(%esp), %ymm0
	vandps	%ymm1, %ymm0, %ymm1
	vcmpnlepd	%ymm1, %ymm5, %ymm1
	vpermd	%ymm1, %ymm2, %ymm1
	vmovdqa	%ymm1, 416(%esp)
	vpshufb	.LCPI3_4, %xmm1, %xmm1
	vmovdqa	1568(%esp), %xmm0
	vpor	%xmm1, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %ymm0
	vpslld	$31, %ymm0, %ymm0
	vmovaps	704(%esp), %ymm1
	vblendvps	%ymm0, %ymm6, %ymm1, %ymm0
	vptest	%ymm0, %ymm0
	je	.LBB3_98
	vmovaps	%ymm4, 992(%esp)
	vpand	256(%esp), %ymm0, %ymm1
	vmovaps	%ymm0, 384(%esp)
	vptest	%ymm1, %ymm1
	vmovaps	%ymm0, 1280(%esp)
	vmovaps	%ymm3, 1376(%esp)
	vmovaps	%ymm3, 1056(%esp)
	vmovaps	1088(%esp), %ymm0
	vmovaps	%ymm0, 1344(%esp)
	je	.LBB3_79
	.align	16, 0x90
.LBB3_133:
	vmovdqa	%ymm1, 1248(%esp)
	vmovaps	1376(%esp), %ymm2
	vmovaps	1344(%esp), %ymm3
	vsubps	%ymm3, %ymm2, %ymm0
	vmulps	928(%esp), %ymm0, %ymm5
	vmovaps	%ymm5, 1440(%esp)
	vxorps	%ymm4, %ymm4, %ymm4
	vcmpltps	%ymm5, %ymm4, %ymm0
	vblendvps	%ymm0, %ymm5, %ymm2, %ymm2
	vmovaps	%ymm2, 1376(%esp)
	vcmpltps	%ymm4, %ymm5, %ymm0
	vblendvps	%ymm0, %ymm5, %ymm3, %ymm3
	vmovaps	%ymm3, 1344(%esp)
	vpand	1024(%esp), %ymm1, %ymm0
	vpcmpeqd	%ymm4, %ymm0, %ymm0
	vpxor	%ymm7, %ymm0, %ymm0
	vmovaps	1280(%esp), %ymm1
	vblendvps	%ymm0, %ymm5, %ymm1, %ymm1
	vmovaps	%ymm1, 1280(%esp)
	vpshufb	.LCPI3_7, %ymm0, %ymm0
	vpermq	$8, %ymm0, %ymm0
	vpextrb	$14, %xmm0, %eax
	movl	%eax, 1216(%esp)
	vpextrb	$12, %xmm0, %eax
	movl	%eax, 1200(%esp)
	vpextrb	$10, %xmm0, %eax
	movl	%eax, 1196(%esp)
	vpextrb	$8, %xmm0, %eax
	movl	%eax, 1192(%esp)
	vpextrb	$6, %xmm0, %eax
	movl	%eax, 1188(%esp)
	vpextrb	$4, %xmm0, %eax
	movl	%eax, 1168(%esp)
	vpextrb	$2, %xmm0, %eax
	movl	%eax, 1152(%esp)
	vpextrb	$0, %xmm0, %eax
	movl	%eax, 1408(%esp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorps	%ymm1, %ymm1, %ymm1
	.align	16, 0x90
.LBB3_134:
	vmovaps	%ymm1, 1568(%esp)
	vmovaps	%ymm4, 1504(%esp)
	vmovd	%ebx, %xmm0
	vxorps	%ymm1, %ymm1, %ymm1
	vpermd	%ymm0, %ymm1, %ymm1
	vmovaps	1440(%esp), %ymm0
	calll	__ocl_svml_s9_pownf8
	vmovapd	1504(%esp), %ymm4
	movl	1500(%esp), %eax
	vbroadcastss	(%eax,%esi), %ymm1
	vmulps	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vcvtps2pd	%xmm1, %ymm1
	vmovapd	1568(%esp), %ymm2
	vaddpd	%ymm1, %ymm2, %ymm2
	vmovapd	%ymm2, 1568(%esp)
	vmovaps	1568(%esp), %ymm1
	vcvtps2pd	%xmm0, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm4
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 1564(%esp)
	jne	.LBB3_134
	vmovaps	1376(%esp), %ymm0
	vcvtps2pd	%xmm0, %ymm1
	vmovapd	1344(%esp), %ymm0
	vcvtps2pd	%xmm0, %ymm2
	movl	1408(%esp), %eax
	testb	$1, %al
	movl	1336(%esp), %esi
	movl	16(%ebp), %edi
	je	.LBB3_118
	vmovlpd	%xmm2, 1688(%esp)
	vmovlpd	%xmm1, 1696(%esp)
	vmovlpd	%xmm4, 1704(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%ymm4, 1504(%esp)
	vmovapd	%ymm1, 1440(%esp)
	vmovapd	%ymm2, 1408(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1408(%esp), %ymm2
	vmovapd	1440(%esp), %ymm1
	vmovapd	1504(%esp), %ymm4
.LBB3_118:
	movl	1152(%esp), %eax
	testb	$1, %al
	je	.LBB3_120
	vunpckhpd	%xmm4, %xmm4, %xmm0
	vmovapd	%ymm1, 1440(%esp)
	vmovapd	1440(%esp), %ymm1
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmovapd	%ymm2, 1408(%esp)
	vmovapd	1408(%esp), %ymm2
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, 1712(%esp)
	vmovsd	%xmm1, 1720(%esp)
	vmovsd	%xmm0, 1728(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1712(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%ymm4, 1504(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1408(%esp), %ymm2
	vmovapd	1440(%esp), %ymm1
	vmovapd	1504(%esp), %ymm4
.LBB3_120:
	vmovapd	%ymm4, 1504(%esp)
	vmovaps	1376(%esp), %ymm0
	vextractf128	$1, %ymm0, 1152(%esp)
	vmovaps	1344(%esp), %ymm0
	vextractf128	$1, %ymm0, 1136(%esp)
	vextractf128	$1, %ymm4, %xmm3
	vextractf128	$1, %ymm1, %xmm1
	vextractf128	$1, %ymm2, %xmm2
	movl	1168(%esp), %eax
	testb	$1, %al
	je	.LBB3_122
	vmovsd	%xmm2, 1736(%esp)
	vmovsd	%xmm1, 1744(%esp)
	vmovsd	%xmm3, 1752(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1736(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%xmm3, 1440(%esp)
	vmovapd	%xmm2, 1408(%esp)
	vmovapd	%xmm1, 1168(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1168(%esp), %xmm1
	vmovapd	1408(%esp), %xmm2
	vmovapd	1440(%esp), %xmm3
.LBB3_122:
	vmovaps	1152(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovaps	%ymm0, 1408(%esp)
	vmovaps	1136(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 1440(%esp)
	movl	1188(%esp), %eax
	testb	$1, %al
	je	.LBB3_124
	vunpckhpd	%xmm3, %xmm3, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, 1760(%esp)
	vmovsd	%xmm1, 1768(%esp)
	vmovsd	%xmm0, 1776(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1760(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_124:
	movl	1192(%esp), %eax
	testb	$1, %al
	vmovapd	1568(%esp), %ymm0
	je	.LBB3_126
	vmovaps	1440(%esp), %ymm1
	vmovsd	%xmm1, 1784(%esp)
	vmovapd	1408(%esp), %ymm1
	vmovsd	%xmm1, 1792(%esp)
	vmovsd	%xmm0, 1800(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1784(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1568(%esp), %ymm0
.LBB3_126:
	movl	1196(%esp), %eax
	testb	$1, %al
	vmovapd	1440(%esp), %ymm1
	vmovapd	1408(%esp), %ymm2
	je	.LBB3_128
	vmovapd	1568(%esp), %ymm0
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm1
	vmovapd	1440(%esp), %ymm2
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, 1808(%esp)
	vmovsd	%xmm1, 1816(%esp)
	vmovsd	%xmm0, 1824(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1808(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1408(%esp), %ymm2
	vmovapd	1440(%esp), %ymm1
	vmovapd	1568(%esp), %ymm0
.LBB3_128:
	vextractf128	$1, %ymm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vextractf128	$1, %ymm1, %xmm2
	movl	1200(%esp), %eax
	testb	$1, %al
	je	.LBB3_130
	vmovsd	%xmm2, 1832(%esp)
	vmovsd	%xmm3, 1840(%esp)
	vmovsd	%xmm0, 1848(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1832(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%xmm0, 1440(%esp)
	vmovapd	%xmm2, 1408(%esp)
	vmovapd	%xmm3, 1200(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1200(%esp), %xmm3
	vmovapd	1408(%esp), %xmm2
	vmovapd	1440(%esp), %xmm0
.LBB3_130:
	movl	1216(%esp), %eax
	testb	$1, %al
	je	.LBB3_132
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vunpckhpd	%xmm3, %xmm3, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, 1856(%esp)
	vmovsd	%xmm1, 1864(%esp)
	vmovsd	%xmm0, 1872(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1856(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_132:
	vmovapd	.LCPI3_9, %ymm1
	vmovapd	1504(%esp), %ymm0
	vandpd	%ymm1, %ymm0, %ymm0
	vmovapd	896(%esp), %ymm3
	vcmpnlepd	%ymm0, %ymm3, %ymm0
	vmovdqa	.LCPI3_3, %ymm2
	vpermd	%ymm0, %ymm2, %ymm0
	vpshufb	.LCPI3_5, %xmm0, %xmm0
	vmovapd	1568(%esp), %ymm4
	vandpd	%ymm1, %ymm4, %ymm1
	vcmpnlepd	%ymm1, %ymm3, %ymm1
	vpermd	%ymm1, %ymm2, %ymm1
	vpshufb	.LCPI3_4, %xmm1, %xmm1
	vpor	%xmm1, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %ymm0
	vpslld	$31, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vmovaps	1248(%esp), %ymm2
	vblendvps	%ymm0, %ymm1, %ymm2, %ymm2
	vmovaps	%ymm2, %ymm1
	vptest	%ymm1, %ymm1
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	jne	.LBB3_133
.LBB3_79:
	vpcmpeqd	%ymm2, %ymm2, %ymm2
	vmovdqa	384(%esp), %ymm0
	vpand	288(%esp), %ymm0, %ymm0
	vptest	%ymm0, %ymm0
	je	.LBB3_96
	vpand	1024(%esp), %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpcmpeqd	%ymm1, %ymm0, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vpshufb	.LCPI3_7, %ymm0, %ymm0
	vpermq	$8, %ymm0, %ymm0
	vmovdqa	%ymm0, 1568(%esp)
	vpextrb	$6, %xmm0, %eax
	movl	%eax, 1408(%esp)
	vpextrb	$4, %xmm0, %eax
	movl	%eax, 1344(%esp)
	vpextrb	$2, %xmm0, %ebx
	vpextrb	$0, %xmm0, %eax
	vmovaps	992(%esp), %ymm3
	vcmpltps	%ymm3, %ymm1, %ymm0
	vmovaps	1056(%esp), %ymm2
	vblendvps	%ymm0, %ymm3, %ymm2, %ymm0
	vmovaps	%ymm0, 1248(%esp)
	vcvtps2pd	%xmm0, %ymm2
	vcmpltps	%ymm1, %ymm3, %ymm0
	vmovaps	1088(%esp), %ymm1
	vblendvps	%ymm0, %ymm3, %ymm1, %ymm0
	vmovaps	%ymm0, 1216(%esp)
	vcvtps2pd	%xmm0, %ymm1
	testb	$1, %al
	je	.LBB3_82
	vmovlpd	%xmm1, 1880(%esp)
	vmovlpd	%xmm2, 1888(%esp)
	movl	$0, 1900(%esp)
	movl	$0, 1896(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1880(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%ymm2, 1440(%esp)
	vmovapd	%ymm1, 1504(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1504(%esp), %ymm1
	vmovapd	1440(%esp), %ymm2
.LBB3_82:
	vmovdqa	1568(%esp), %ymm0
	vpextrb	$8, %xmm0, %eax
	movl	%eax, 1376(%esp)
	testb	$1, %bl
	je	.LBB3_84
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vmovapd	%ymm1, 1504(%esp)
	vmovapd	1504(%esp), %ymm1
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, 1904(%esp)
	vmovsd	%xmm0, 1912(%esp)
	movl	$0, 1924(%esp)
	movl	$0, 1920(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1904(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%ymm2, 1440(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1504(%esp), %ymm1
	vmovapd	1440(%esp), %ymm2
.LBB3_84:
	vmovaps	1248(%esp), %ymm0
	vextractf128	$1, %ymm0, 1200(%esp)
	vmovaps	1216(%esp), %ymm0
	vextractf128	$1, %ymm0, 1216(%esp)
	vextractf128	$1, %ymm2, %xmm2
	vextractf128	$1, %ymm1, %xmm1
	vmovdqa	1568(%esp), %ymm0
	vpextrb	$10, %xmm0, %eax
	movl	%eax, 1248(%esp)
	movl	1344(%esp), %eax
	testb	$1, %al
	je	.LBB3_86
	vmovsd	%xmm1, 1928(%esp)
	vmovsd	%xmm2, 1936(%esp)
	movl	$0, 1948(%esp)
	movl	$0, 1944(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1928(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%xmm1, 1504(%esp)
	vmovapd	%xmm2, 1440(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1440(%esp), %xmm2
	vmovapd	1504(%esp), %xmm1
.LBB3_86:
	vmovaps	1200(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovaps	%ymm0, 1440(%esp)
	vmovaps	1216(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovaps	%ymm0, 1504(%esp)
	vmovdqa	1568(%esp), %ymm0
	vpextrb	$12, %xmm0, %eax
	movl	%eax, 1344(%esp)
	movl	1408(%esp), %eax
	testb	$1, %al
	je	.LBB3_88
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, 1952(%esp)
	vmovsd	%xmm0, 1960(%esp)
	movl	$0, 1972(%esp)
	movl	$0, 1968(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1952(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_88:
	vmovdqa	1568(%esp), %ymm0
	vpextrb	$14, %xmm0, %ebx
	movl	1376(%esp), %eax
	testb	$1, %al
	je	.LBB3_90
	vmovaps	1504(%esp), %ymm0
	vmovsd	%xmm0, 1976(%esp)
	vmovdqa	1440(%esp), %ymm0
	vmovsd	%xmm0, 1984(%esp)
	movl	$0, 1996(%esp)
	movl	$0, 1992(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1976(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_90:
	movl	1248(%esp), %eax
	testb	$1, %al
	vmovapd	1504(%esp), %ymm0
	vmovapd	1440(%esp), %ymm1
	je	.LBB3_92
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vmovapd	1504(%esp), %ymm1
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, 2000(%esp)
	vmovsd	%xmm0, 2008(%esp)
	movl	$0, 2020(%esp)
	movl	$0, 2016(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	2000(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1440(%esp), %ymm1
	vmovapd	1504(%esp), %ymm0
.LBB3_92:
	vextractf128	$1, %ymm1, %xmm2
	vextractf128	$1, %ymm0, %xmm1
	movl	1344(%esp), %eax
	testb	$1, %al
	je	.LBB3_94
	vmovsd	%xmm1, 2024(%esp)
	vmovsd	%xmm2, 2032(%esp)
	movl	$0, 2044(%esp)
	movl	$0, 2040(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	2024(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovapd	%xmm1, 1568(%esp)
	vmovapd	%xmm2, 1504(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	1504(%esp), %xmm2
	vmovapd	1568(%esp), %xmm1
.LBB3_94:
	testb	$1, %bl
	je	.LBB3_96
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, 2048(%esp)
	vmovsd	%xmm0, 2056(%esp)
	movl	$0, 2068(%esp)
	movl	$0, 2064(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	2048(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
.LBB3_96:
	movl	1564(%esp), %eax
	testl	%eax, %eax
	vxorps	%ymm6, %ymm6, %ymm6
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	vmovaps	992(%esp), %ymm4
	vmovaps	1280(%esp), %ymm2
	jg	.LBB3_98
	vmovaps	%ymm4, %ymm2
.LBB3_98:
	movl	%esi, 1336(%esp)
	movl	988(%esp), %eax
	movl	892(%esp), %ecx
	movl	(%eax,%ecx,4), %eax
	addl	828(%esp), %eax
	vmovdqa	448(%esp), %ymm0
	vpshufb	.LCPI3_5, %xmm0, %xmm0
	vmovdqa	416(%esp), %ymm1
	vpshufb	.LCPI3_4, %xmm1, %xmm1
	vpor	%xmm1, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %ymm0
	vpslld	$31, %ymm0, %ymm0
	vblendvps	%ymm0, %ymm4, %ymm2, %ymm2
	vextractf128	$1, %ymm2, %xmm1
	vpshufd	$3, %xmm1, %xmm0
	vmovdqa	704(%esp), %ymm3
	vptest	%ymm7, %ymm3
	jb	.LBB3_114
	vpand	1024(%esp), %ymm3, %ymm3
	vpcmpeqd	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm3, %ymm3
	vpshufb	.LCPI3_7, %ymm3, %ymm3
	vpermq	$8, %ymm3, %ymm3
	vpextrb	$6, %xmm3, %ecx
	movl	%ecx, 1568(%esp)
	vpextrb	$4, %xmm3, %ecx
	vpextrb	$2, %xmm3, %edx
	vpextrb	$0, %xmm3, %ebx
	testb	$1, %bl
	je	.LBB3_101
	movl	1340(%esp), %esi
	vmovss	%xmm2, (%esi,%eax,4)
.LBB3_101:
	vpextrb	$8, %xmm3, %esi
	testb	$1, %dl
	je	.LBB3_103
	vpshufd	$1, %xmm2, %xmm4
	movl	1340(%esp), %edx
	vmovss	%xmm4, (%edx,%eax,4)
.LBB3_103:
	vpextrb	$10, %xmm3, %edi
	testb	$1, %cl
	je	.LBB3_105
	vmovhlps	%xmm2, %xmm2, %xmm4
	movl	1340(%esp), %ecx
	vmovss	%xmm4, (%ecx,%eax,4)
.LBB3_105:
	vpextrb	$12, %xmm3, %ecx
	movl	1568(%esp), %edx
	testb	$1, %dl
	je	.LBB3_107
	vpshufd	$3, %xmm2, %xmm2
	movl	1340(%esp), %edx
	vmovss	%xmm2, (%edx,%eax,4)
.LBB3_107:
	vpextrb	$14, %xmm3, %edx
	movl	%esi, %ebx
	testb	$1, %bl
	vpcmpeqd	%ymm7, %ymm7, %ymm7
	je	.LBB3_109
	movl	1340(%esp), %esi
	vmovss	%xmm1, (%esi,%eax,4)
.LBB3_109:
	movl	%edi, %ebx
	testb	$1, %bl
	je	.LBB3_111
	vpshufd	$1, %xmm1, %xmm2
	movl	1340(%esp), %esi
	vmovss	%xmm2, (%esi,%eax,4)
.LBB3_111:
	testb	$1, %cl
	je	.LBB3_113
	vmovhlps	%xmm1, %xmm1, %xmm1
	movl	1340(%esp), %ecx
	vmovss	%xmm1, (%ecx,%eax,4)
.LBB3_113:
	testb	$1, %dl
	je	.LBB3_115
.LBB3_114:
	movl	1340(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
.LBB3_115:
	movl	988(%esp), %eax
	movl	892(%esp), %ecx
	incl	(%eax,%ecx,4)
	movl	1564(%esp), %ecx
	.align	16, 0x90
.LBB3_8:
	vmovdqa	480(%esp), %ymm2
	vptest	%ymm2, %ymm2
	movl	1500(%esp), %edx
	je	.LBB3_27
	vmovdqa	832(%esp), %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpshufd	$3, %xmm1, %xmm0
	movl	988(%esp), %eax
	movl	892(%esp), %ecx
	movl	(%eax,%ecx,4), %eax
	addl	828(%esp), %eax
	vptest	%ymm7, %ymm2
	jb	.LBB3_25
	vmovdqa	768(%esp), %ymm2
	vpshufb	.LCPI3_4, %xmm2, %xmm2
	vmovdqa	736(%esp), %ymm3
	vpshufb	.LCPI3_5, %xmm3, %xmm3
	vpor	%xmm2, %xmm3, %xmm2
	vpsllw	$15, %xmm2, %xmm2
	vpsraw	$15, %xmm2, %xmm2
	vpextrb	$6, %xmm2, %ecx
	movl	%ecx, 1568(%esp)
	vpextrb	$4, %xmm2, %ecx
	vpextrb	$2, %xmm2, %edx
	vpextrb	$0, %xmm2, %ebx
	testb	$1, %bl
	vmovdqa	832(%esp), %ymm4
	je	.LBB3_12
	movl	1340(%esp), %esi
	vmovss	%xmm4, (%esi,%eax,4)
.LBB3_12:
	vpextrb	$8, %xmm2, %esi
	testb	$1, %dl
	je	.LBB3_14
	vpshufd	$1, %xmm4, %xmm3
	movl	1340(%esp), %edx
	vmovss	%xmm3, (%edx,%eax,4)
.LBB3_14:
	vpextrb	$10, %xmm2, %edi
	testb	$1, %cl
	je	.LBB3_16
	vmovhlps	%xmm4, %xmm4, %xmm3
	movl	1340(%esp), %ecx
	vmovss	%xmm3, (%ecx,%eax,4)
.LBB3_16:
	vpextrb	$12, %xmm2, %ecx
	movl	1568(%esp), %edx
	testb	$1, %dl
	je	.LBB3_18
	vpshufd	$3, %xmm4, %xmm3
	movl	1340(%esp), %edx
	vmovss	%xmm3, (%edx,%eax,4)
.LBB3_18:
	vpextrb	$14, %xmm2, %edx
	movl	%esi, %ebx
	testb	$1, %bl
	je	.LBB3_20
	movl	1340(%esp), %esi
	vmovss	%xmm1, (%esi,%eax,4)
.LBB3_20:
	movl	%edi, %ebx
	testb	$1, %bl
	je	.LBB3_22
	vpshufd	$1, %xmm1, %xmm2
	movl	1340(%esp), %esi
	vmovss	%xmm2, (%esi,%eax,4)
.LBB3_22:
	testb	$1, %cl
	je	.LBB3_24
	vmovhlps	%xmm1, %xmm1, %xmm1
	movl	1340(%esp), %ecx
	vmovss	%xmm1, (%ecx,%eax,4)
.LBB3_24:
	testb	$1, %dl
	movl	1500(%esp), %edx
	je	.LBB3_26
.LBB3_25:
	movl	1340(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
.LBB3_26:
	movl	988(%esp), %eax
	movl	892(%esp), %ecx
	incl	(%eax,%ecx,4)
	movl	1564(%esp), %ecx
.LBB3_27:
	vmovaps	512(%esp), %ymm0
	vaddps	192(%esp), %ymm0, %ymm0
	movl	572(%esp), %eax
	incl	%eax
	cmpl	348(%esp), %eax
	movl	984(%esp), %esi
	jne	.LBB3_3
	addl	172(%esp), %edx
	addl	176(%esp), %esi
	movl	892(%esp), %edi
	incl	%edi
	movl	184(%esp), %eax
	incl	%eax
	movl	%eax, 184(%esp)
	cmpl	188(%esp), %eax
	movl	%edi, %eax
	jne	.LBB3_2
.LBB3_29:
	movl	%ecx, %edx
	movl	380(%esp), %ecx
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpl	%eax, %ecx
	movl	888(%esp), %ecx
	je	.LBB3_153
	subl	%eax, 380(%esp)
	addl	%eax, 180(%esp)
	movl	124(%esp), %esi
	addl	120(%esp), %esi
	movl	%edx, 1564(%esp)
	movl	%edx, %eax
	imull	%esi, %eax
	movl	116(%esp), %edi
	leal	(%edi,%eax,4), %ebx
	leal	-1(%edx), %eax
	imull	%esi, %eax
	leal	(%edi,%eax,4), %esi
	movl	%ebx, %eax
	leal	-4(,%edx,4), %edi
	movl	%edi, 1196(%esp)
	leal	(,%edx,4), %edx
	movl	%edx, 1192(%esp)
	xorl	%edx, %edx
	.align	16, 0x90
.LBB3_31:
	movl	%esi, 1376(%esp)
	movl	%edx, 1200(%esp)
	movl	%eax, 1500(%esp)
	movl	%ecx, 888(%esp)
	movl	%ecx, %eax
	imull	1564(%esp), %eax
	subl	%ecx, %eax
	movl	%eax, 1344(%esp)
	movl	$0, 1280(%esp)
	movl	180(%esp), %edx
	jmp	.LBB3_32
	.align	16, 0x90
.LBB3_146:
	vucomiss	.LCPI3_12, %xmm1
	movl	$-1, %esi
	movl	$1, %eax
	cmoval	%eax, %esi
	movl	1504(%esp), %edi
	cmpl	%esi, %edi
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 2072(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	1336(%esp), %eax
	movl	%eax, 8(%esp)
	leal	2072(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	cmpl	%esi, %edi
	movl	888(%esp), %ecx
	vmovss	1440(%esp), %xmm0
	vmovss	1408(%esp), %xmm1
	je	.LBB3_151
	vsubss	%xmm0, %xmm1, %xmm0
	vmulss	.LCPI3_8, %xmm0, %xmm0
	movl	1564(%esp), %eax
	testl	%eax, %eax
	jle	.LBB3_148
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	vmovss	%xmm0, 1504(%esp)
	.align	16, 0x90
.LBB3_164:
	vmovsd	%xmm1, 1568(%esp)
	movl	%esi, (%esp)
	vmovss	1504(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovsd	1568(%esp), %xmm1
	movl	1500(%esp), %eax
	vmulss	(%eax,%edi), %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	incl	%esi
	cmpl	%esi, 1564(%esp)
	jne	.LBB3_164
	vmovsd	%xmm1, 1648(%esp)
	movl	1652(%esp), %eax
	movl	$2147483647, %ecx
	andl	%ecx, %eax
	movl	%eax, 1644(%esp)
	movl	1648(%esp), %eax
	movl	%eax, 1640(%esp)
	vmovsd	1640(%esp), %xmm0
	vucomisd	.LCPI3_10, %xmm0
	vmovss	1440(%esp), %xmm1
	jmp	.LBB3_155
.LBB3_148:
	vmovss	%xmm0, 1504(%esp)
	jmp	.LBB3_149
	.align	16, 0x90
.LBB3_162:
	vmovss	1440(%esp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 2076(%esp)
	vmovss	1408(%esp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 2084(%esp)
	vmovsd	%xmm1, 2092(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	1336(%esp), %eax
	movl	%eax, 8(%esp)
	leal	2076(%esp), %eax
	movl	%eax, 4(%esp)
	vmovsd	%xmm1, 1632(%esp)
	movl	$.L.str1, (%esp)
	movl	1636(%esp), %eax
	movl	$2147483647, %ecx
	andl	%ecx, %eax
	movl	%eax, 1628(%esp)
	movl	1632(%esp), %eax
	movl	%eax, 1624(%esp)
	calll	opencl_printf
	vmovss	1440(%esp), %xmm1
	vmovsd	1624(%esp), %xmm0
	vucomisd	.LCPI3_10, %xmm0
.LBB3_155:
	vmovss	1408(%esp), %xmm2
	jb	.LBB3_149
	vsubss	%xmm1, %xmm2, %xmm0
	vmulss	.LCPI3_8, %xmm0, %xmm3
	vucomiss	.LCPI3_12, %xmm3
	vmovaps	%xmm3, %xmm0
	ja	.LBB3_158
	vmovaps	%xmm2, %xmm0
.LBB3_158:
	vmovss	%xmm0, 1408(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm3, %xmm0
	vmovaps	%xmm3, %xmm0
	ja	.LBB3_160
	vmovaps	%xmm1, %xmm0
.LBB3_160:
	vmovss	%xmm0, 1440(%esp)
	xorl	%edi, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	vmovss	%xmm3, 1504(%esp)
	.align	16, 0x90
.LBB3_161:
	vmovsd	%xmm1, 1568(%esp)
	movl	%esi, (%esp)
	vmovss	1504(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovsd	1568(%esp), %xmm1
	movl	1500(%esp), %eax
	vmulss	(%eax,%edi), %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	incl	%esi
	cmpl	%esi, 1564(%esp)
	jne	.LBB3_161
	jmp	.LBB3_162
.LBB3_149:
	movl	888(%esp), %ecx
	movl	988(%esp), %edx
	movl	(%edx,%ecx,4), %eax
	addl	1344(%esp), %eax
	movl	1340(%esp), %esi
	vmovss	1504(%esp), %xmm0
	vmovss	%xmm0, (%esi,%eax,4)
	jmp	.LBB3_150
	.align	16, 0x90
.LBB3_32:
	movl	%edx, 1248(%esp)
	vcvtsi2ssl	%edx, %xmm0, %xmm3
	vmovdqa	688(%esp), %xmm0
	vfmadd213ss	352(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 1440(%esp)
	cmpl	$0, 1564(%esp)
	jle	.LBB3_33
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	vpxor	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB3_138:
	vmovss	%xmm0, 1568(%esp)
	movl	%esi, (%esp)
	vmovaps	%xmm3, %xmm0
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1440(%esp), %xmm3
	movl	1376(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	1568(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	incl	%esi
	cmpl	%esi, 1564(%esp)
	vmovdqa	%xmm1, %xmm0
	jne	.LBB3_138
	jmp	.LBB3_139
	.align	16, 0x90
.LBB3_33:
	vpxor	%xmm1, %xmm1, %xmm1
.LBB3_139:
	movl	$2147483647, %eax
	vmovd	%eax, %xmm0
	vmovapd	%xmm0, 1216(%esp)
	vpand	%xmm0, %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI3_2, %xmm2
	vucomisd	%xmm0, %xmm2
	ja	.LBB3_140
	vaddss	688(%esp), %xmm3, %xmm2
	vmovss	%xmm2, 1408(%esp)
	vmovss	%xmm3, 1440(%esp)
	vpxor	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm1
	movl	$-1, %ecx
	movl	$1, %eax
	cmoval	%eax, %ecx
	movl	%ecx, 1504(%esp)
	cmpl	$0, 1564(%esp)
	jle	.LBB3_142
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	vpxor	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB3_144:
	vmovss	%xmm0, 1568(%esp)
	movl	%esi, (%esp)
	vmovaps	%xmm2, %xmm0
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1408(%esp), %xmm2
	movl	1500(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	1568(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	incl	%esi
	cmpl	%esi, 1564(%esp)
	vmovdqa	%xmm1, %xmm0
	jne	.LBB3_144
	jmp	.LBB3_145
	.align	16, 0x90
.LBB3_142:
	vpxor	%xmm1, %xmm1, %xmm1
.LBB3_145:
	vmovss	%xmm2, 1408(%esp)
	vpand	1216(%esp), %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI3_2, %xmm2
	vucomisd	%xmm0, %xmm2
	jbe	.LBB3_146
.LBB3_140:
	movl	888(%esp), %ecx
	movl	988(%esp), %edx
	movl	(%edx,%ecx,4), %eax
	addl	1344(%esp), %eax
	movl	1340(%esp), %esi
	vmovss	%xmm1, (%esi,%eax,4)
.LBB3_150:
	incl	(%edx,%ecx,4)
.LBB3_151:
	movl	1248(%esp), %edx
	incl	%edx
	movl	1280(%esp), %eax
	incl	%eax
	movl	%eax, 1280(%esp)
	cmpl	380(%esp), %eax
	movl	1500(%esp), %eax
	movl	1376(%esp), %esi
	jne	.LBB3_32
	addl	1192(%esp), %eax
	addl	1196(%esp), %esi
	incl	%ecx
	movl	1200(%esp), %edx
	incl	%edx
	cmpl	188(%esp), %edx
	jne	.LBB3_31
.LBB3_153:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp39:
	.size	PolinomeFindRoots, .Ltmp39-PolinomeFindRoots
	.cfi_endproc

	.type	.L.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%d, "
	.size	.L.str, 5

	.type	.L.str1,@object
.L.str1:
	.asciz	 "[%f, %f, %f]  "
	.size	.L.str1, 15

	.type	float_const_signMask,@object
	.section	.rodata,"a",@progbits
	.globl	float_const_signMask
	.align	4
float_const_signMask:
	.long	2147483647
	.size	float_const_signMask, 4

	.type	double_const_signMask,@object
	.globl	double_const_signMask
	.align	8
double_const_signMask:
	.quad	9223372036854775807
	.size	double_const_signMask, 8


	.section	".note.GNU-stack","",@progbits
