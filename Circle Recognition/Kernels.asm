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
.LCPI1_8:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI1_1:
	.long	6
.LCPI1_2:
	.long	1065353216
.LCPI1_3:
	.long	1
.LCPI1_4:
	.long	2
.LCPI1_5:
	.long	3
.LCPI1_6:
	.long	4
.LCPI1_7:
	.long	5
.LCPI1_9:
	.long	0
	.text
	.globl	build_polinome
	.align	16, 0x90
	.type	build_polinome,@function
build_polinome:
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
	andl	$-32, %esp
	subl	$1856, %esp
.Ltmp16:
	.cfi_offset %esi, -20
.Ltmp17:
	.cfi_offset %edi, -16
.Ltmp18:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	28(%eax), %ecx
	movl	%ecx, 412(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 1004(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 788(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 828(%esp)
	movl	12(%eax), %ecx
	movl	%ecx, 1172(%esp)
	movl	8(%eax), %edi
	movl	%edi, 1000(%esp)
	movl	(%eax), %ebx
	movl	%ebx, 1168(%esp)
	movl	4(%eax), %ecx
	movl	%ecx, 676(%esp)
	movl	36(%eax), %ecx
	movl	%ecx, 1120(%esp)
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	movl	60(%eax), %ecx
	movl	60(%eax), %esi
	movl	%esi, 276(%esp)
	movl	96(%eax), %eax
	movl	%eax, 792(%esp)
	imull	%edx, %ecx
	movl	1004(%esp), %edx
	addl	1120(%esp), %ecx
	movl	%ecx, 28(%esp)
	sarl	$3, %esi
	movl	%esi, 272(%esp)
	je	.LBB1_72
	movl	28(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI1_0, %ymm0, %ymm0
	vpbroadcastd	.LCPI1_1, %ymm1
	vpmulld	%ymm1, %ymm0, %ymm1
	vmovdqa	%ymm1, 608(%esp)
	vmovd	%xmm1, %ecx
	vpextrd	$1, %xmm1, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vmovaps	%ymm1, 224(%esp)
	vmovd	%edx, %xmm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm1, %ymm2, %ymm1
	vpmulld	%ymm1, %ymm0, %ymm3
	vmovdqa	%ymm3, 576(%esp)
	vmovd	%xmm3, %ecx
	vpextrd	$1, %xmm3, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 192(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI1_2, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovaps	%ymm0, 960(%esp)
	vxorps	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm1
	vmovss	%xmm1, 796(%esp)
	vpermps	%ymm0, %ymm2, %ymm0
	vmovaps	%ymm0, 640(%esp)
	xorl	%eax, %eax
	vpbroadcastd	.LCPI1_3, %ymm0
	vmovdqa	%ymm0, 160(%esp)
	vpbroadcastd	.LCPI1_4, %ymm0
	vmovdqa	%ymm0, 128(%esp)
	vpbroadcastd	.LCPI1_5, %ymm0
	vmovdqa	%ymm0, 96(%esp)
	vpbroadcastd	.LCPI1_6, %ymm0
	vmovdqa	%ymm0, 64(%esp)
	vpbroadcastd	.LCPI1_7, %ymm0
	vmovdqa	%ymm0, 32(%esp)
	vmovaps	%ymm3, 544(%esp)
	vmovaps	%ymm3, 512(%esp)
	vmovaps	%ymm3, 480(%esp)
	vmovaps	%ymm3, 448(%esp)
	vmovaps	%ymm3, 416(%esp)
	.align	16, 0x90
.LBB1_2:
	movl	%eax, 408(%esp)
	testl	%edx, %edx
	movl	%edx, %esi
	movl	%ebx, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	jle	.LBB1_3
	.align	16, 0x90
.LBB1_8:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$0, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_8
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %edi
	.align	16, 0x90
.LBB1_10:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_10
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_12:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_12
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_3:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_4:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %ebx
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_116
	.align	16, 0x90
.LBB1_5:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_5
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_7:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_7
	jmp	.LBB1_117
	.align	16, 0x90
.LBB1_116:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_117:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_129
	.align	16, 0x90
.LBB1_118:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_118
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 20(%eax)
	vmovdqa	576(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %esi
	vpextrd	$2, %xmm0, %edi
	vpextrd	$1, %xmm0, %edx
	vmovd	%xmm0, 1120(%esp)
	vpextrd	$3, %xmm1, %eax
	vpextrd	$2, %xmm1, %ecx
	movl	%ecx, 1040(%esp)
	vpextrd	$1, %xmm1, %ebx
	vmovd	%xmm1, %ecx
	shll	$2, %esi
	movl	%esi, 1104(%esp)
	shll	$2, %edi
	movl	%edi, 1088(%esp)
	shll	$2, %edx
	movl	%edx, 1072(%esp)
	shll	$2, 1120(%esp)
	shll	$2, %eax
	movl	%eax, 1056(%esp)
	movl	1040(%esp), %eax
	shll	$2, %eax
	shll	$2, %ebx
	shll	$2, %ecx
	vxorpd	%ymm0, %ymm0, %ymm0
	movl	1004(%esp), %edx
	movl	676(%esp), %esi
	.align	16, 0x90
.LBB1_120:
	movl	1120(%esp), %edi
	vmovss	(%esi,%edi), %xmm1
	movl	1072(%esp), %edi
	vinsertps	$16, (%esi,%edi), %xmm1, %xmm1
	movl	1088(%esp), %edi
	vinsertps	$32, (%esi,%edi), %xmm1, %xmm1
	movl	1104(%esp), %edi
	vinsertps	$48, (%esi,%edi), %xmm1, %xmm1
	vmovss	(%esi,%ecx), %xmm2
	vinsertps	$16, (%esi,%ebx), %xmm2, %xmm2
	vinsertps	$32, (%esi,%eax), %xmm2, %xmm2
	movl	1056(%esp), %edi
	vinsertps	$48, (%esi,%edi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	addl	$4, %esi
	decl	%edx
	jne	.LBB1_120
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	828(%esp), %eax
	vextractps	$3, %xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %edi
	.align	16, 0x90
.LBB1_122:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_122
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 24(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_124:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_124
	jmp	.LBB1_125
	.align	16, 0x90
.LBB1_129:
	movl	1172(%esp), %ecx
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 20(%ecx)
	movl	828(%esp), %eax
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 24(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_125:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 28(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %ebx
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_109
	.align	16, 0x90
.LBB1_126:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_126
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_128:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_128
	jmp	.LBB1_110
	.align	16, 0x90
.LBB1_109:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_110:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 36(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_250
	.align	16, 0x90
.LBB1_111:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_111
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_113:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_113
	jmp	.LBB1_114
	.align	16, 0x90
.LBB1_250:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_114:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	vmovss	%xmm0, 44(%ecx)
	testl	%ebx, %ebx
	jle	.LBB1_115
	vmovdqa	544(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %edx
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1120(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1104(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1088(%esp)
	vmovd	%xmm0, %eax
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1072(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1056(%esp)
	vpextrd	$2, %xmm1, %eax
	movl	%ebx, %esi
	movl	1168(%esp), %ebx
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1040(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%edx,%eax,4), %eax
	movl	%eax, 1036(%esp)
	vmovd	%xmm1, %ecx
	leal	(%edx,%ecx,4), %ecx
	xorl	%edx, %edx
	vxorpd	%ymm0, %ymm0, %ymm0
	xorl	%edi, %edi
	.align	16, 0x90
.LBB1_14:
	movl	1072(%esp), %eax
	vmovss	(%eax,%edx), %xmm1
	movl	1088(%esp), %eax
	vinsertps	$16, (%eax,%edx), %xmm1, %xmm1
	movl	1104(%esp), %eax
	vinsertps	$32, (%eax,%edx), %xmm1, %xmm1
	movl	1120(%esp), %eax
	vinsertps	$48, (%eax,%edx), %xmm1, %xmm1
	vmovss	(%ecx,%edx), %xmm2
	movl	1036(%esp), %eax
	vinsertps	$16, (%eax,%edx), %xmm2, %xmm2
	movl	1040(%esp), %eax
	vinsertps	$32, (%eax,%edx), %xmm2, %xmm2
	movl	1056(%esp), %eax
	vinsertps	$48, (%eax,%edx), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	vbroadcastss	(%ebx,%edx), %ymm1
	vfmadd213ps	%ymm0, %ymm2, %ymm1
	addl	$4, %edx
	adcl	$0, %edi
	decl	%esi
	vmovaps	%ymm1, %ymm0
	jne	.LBB1_14
	vmovaps	640(%esp), %ymm0
	vmulps	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	828(%esp), %eax
	vextractps	$3, %xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_16:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_16
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 48(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_18:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_18
	jmp	.LBB1_19
	.align	16, 0x90
.LBB1_115:
	movl	828(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	%xmm0, 48(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_19:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 52(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	1168(%esp), %edi
	jle	.LBB1_102
	.align	16, 0x90
.LBB1_20:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_20
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 56(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_22:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_22
	jmp	.LBB1_103
	.align	16, 0x90
.LBB1_102:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 56(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_103:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 60(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_249
	.align	16, 0x90
.LBB1_104:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_104
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 64(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_106:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_106
	jmp	.LBB1_107
	.align	16, 0x90
.LBB1_249:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 64(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_107:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	vmovss	%xmm0, 68(%ecx)
	testl	%ebx, %ebx
	jle	.LBB1_108
	vmovdqa	512(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1104(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1088(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1072(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1056(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1040(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1036(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1008(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 928(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	%ebx, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_24:
	vmovapd	%ymm1, 1120(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	1056(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	1072(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	1088(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	1104(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	928(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	1008(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	1036(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	1040(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	1120(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB1_24
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	828(%esp), %eax
	vextractps	$3, %xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	1168(%esp), %edi
	.align	16, 0x90
.LBB1_26:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_26
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 72(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_28:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_28
	jmp	.LBB1_29
	.align	16, 0x90
.LBB1_108:
	movl	828(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 8(%eax)
	vmovss	%xmm0, 72(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_29:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 76(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_95
	.align	16, 0x90
.LBB1_30:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_30
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_32:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_32
	jmp	.LBB1_96
	.align	16, 0x90
.LBB1_95:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_96:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 84(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_248
	.align	16, 0x90
.LBB1_97:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_97
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_99:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$8, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_99
	jmp	.LBB1_100
	.align	16, 0x90
.LBB1_248:
	movl	1172(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_100:
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	vmovss	%xmm0, 92(%ecx)
	movl	%ebx, %edx
	testl	%edx, %edx
	jle	.LBB1_101
	vmovdqa	480(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1104(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1088(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1072(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1056(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1040(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1036(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1008(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 928(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	%edx, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_34:
	vmovapd	%ymm1, 1120(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	1056(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	1072(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	1088(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	1104(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	928(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	1008(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	1036(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	1040(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	1120(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB1_34
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	828(%esp), %eax
	vextractps	$3, %xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %eax
	movl	%eax, %edi
	movl	%eax, %ebx
	.align	16, 0x90
.LBB1_36:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_36
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 96(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_38:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_38
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 100(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_40:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_40
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 104(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_42:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_42
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 108(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_44:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_44
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 112(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_46:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$9, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_46
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	movl	1004(%esp), %edx
	jmp	.LBB1_48
	.align	16, 0x90
.LBB1_101:
	movl	828(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vmovss	%xmm0, 96(%ecx)
	vmovss	%xmm0, 100(%ecx)
	vmovss	%xmm0, 104(%ecx)
	vmovss	%xmm0, 108(%ecx)
	vmovss	%xmm0, 112(%ecx)
.LBB1_48:
	vmovss	%xmm0, 116(%ecx)
	testl	%edx, %edx
	jle	.LBB1_49
	vmovdqa	448(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1104(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1088(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1072(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1056(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1040(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1036(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1008(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 928(%esp)
	xorl	%edi, %edi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	%edx, %ebx
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_81:
	vmovapd	%ymm1, 1120(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	1056(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	movl	1072(%esp), %eax
	vinsertps	$16, (%eax,%edi), %xmm1, %xmm1
	movl	1088(%esp), %eax
	vinsertps	$32, (%eax,%edi), %xmm1, %xmm1
	movl	1104(%esp), %eax
	vinsertps	$48, (%eax,%edi), %xmm1, %xmm1
	movl	928(%esp), %eax
	vmovss	(%eax,%edi), %xmm2
	movl	1008(%esp), %eax
	vinsertps	$16, (%eax,%edi), %xmm2, %xmm2
	movl	1036(%esp), %eax
	vinsertps	$32, (%eax,%edi), %xmm2, %xmm2
	movl	1040(%esp), %eax
	vinsertps	$48, (%eax,%edi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	1120(%esp), %ymm1, %ymm0
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%ymm0, %ymm1
	jne	.LBB1_81
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	828(%esp), %eax
	vextractps	$3, %xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %eax
	movl	%eax, %edi
	movl	%eax, %ebx
	.align	16, 0x90
.LBB1_83:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_83
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 120(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_85:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_85
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 124(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_87:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_87
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 128(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_89:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_89
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 132(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_91:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%edi), %xmm0
	movl	$9, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_91
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 136(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_93:
	vmovss	%xmm1, 1120(%esp)
	vmovss	(%esi), %xmm0
	movl	$10, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	1120(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_93
	vmovaps	960(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	movl	1004(%esp), %edx
	jmp	.LBB1_50
	.align	16, 0x90
.LBB1_49:
	movl	828(%esp), %eax
	vmovss	796(%esp), %xmm0
	vmovss	%xmm0, 16(%eax)
	vmovss	%xmm0, 120(%ecx)
	vmovss	%xmm0, 124(%ecx)
	vmovss	%xmm0, 128(%ecx)
	vmovss	%xmm0, 132(%ecx)
	vmovss	%xmm0, 136(%ecx)
.LBB1_50:
	vmovss	%xmm0, 140(%ecx)
	vxorps	%ymm0, %ymm0, %ymm0
	testl	%edx, %edx
	movl	1168(%esp), %edx
	jle	.LBB1_53
	vmovdqa	416(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1104(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1088(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1072(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1056(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1040(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1036(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 1008(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 928(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	1004(%esp), %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_52:
	vmovapd	%ymm1, 1120(%esp)
	vmovss	(%edx,%esi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	1168(%esp), %edx
	movl	1056(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	1072(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	1088(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	1104(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	928(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	1008(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	1036(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	1040(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	1120(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB1_52
.LBB1_53:
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	828(%esp), %eax
	vextractps	$3, %xmm0, 20(%eax)
	movl	788(%esp), %edi
	movl	$0, (%edi)
	movl	$1, 4(%edi)
	movl	$2, 8(%edi)
	movl	$3, 12(%edi)
	movl	$4, 16(%edi)
	movl	$5, 20(%edi)
	movl	$6, 24(%edi)
	movl	$2147483647, %eax
	vmovd	%eax, %xmm7
	vmovapd	%xmm7, 1088(%esp)
	movl	1172(%esp), %ebx
	vmovss	(%ebx), %xmm1
	vmovss	24(%ebx), %xmm5
	vandpd	%xmm7, %xmm1, %xmm0
	vmaxss	.LCPI1_9, %xmm0, %xmm0
	vandpd	%xmm7, %xmm5, %xmm2
	vucomiss	%xmm0, %xmm2
	seta	%al
	movzbl	%al, %eax
	vmaxss	%xmm0, %xmm2, %xmm2
	vmovss	48(%ebx), %xmm0
	vmovapd	%xmm0, 1120(%esp)
	vandpd	%xmm7, %xmm0, %xmm3
	vucomiss	%xmm2, %xmm3
	movl	$2, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm2, %xmm3, %xmm2
	vmovss	72(%ebx), %xmm3
	vandpd	%xmm7, %xmm3, %xmm4
	vucomiss	%xmm2, %xmm4
	movl	$3, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm2, %xmm4, %xmm4
	vmovss	96(%ebx), %xmm2
	vandpd	%xmm7, %xmm2, %xmm6
	vucomiss	%xmm4, %xmm6
	movl	$4, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm4, %xmm6, %xmm6
	vmovss	120(%ebx), %xmm0
	vandpd	%xmm7, %xmm0, %xmm7
	vucomiss	%xmm6, %xmm7
	movl	$5, %ecx
	cmoval	%ecx, %eax
	testl	%eax, %eax
	movl	412(%esp), %esi
	je	.LBB1_55
	movl	(%edi,%eax,4), %ecx
	movl	%ecx, (%edi)
	movl	$0, (%edi,%eax,4)
	vmovss	(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, (%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	4(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 4(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	8(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 8(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	12(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 12(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	16(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 16(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	20(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 20(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	120(%ebx), %xmm0
	vmovss	96(%ebx), %xmm2
	vmovss	72(%ebx), %xmm3
	vmovss	48(%ebx), %xmm1
	vmovaps	%xmm1, 1120(%esp)
	vmovss	(%ebx), %xmm1
	vmovss	24(%ebx), %xmm5
.LBB1_55:
	vmovapd	%xmm1, 1104(%esp)
	vmovapd	%xmm3, 1040(%esp)
	vmovapd	%xmm2, 1056(%esp)
	vmovapd	%xmm0, 1072(%esp)
	vdivss	%xmm1, %xmm5, %xmm5
	vmovss	%xmm5, 24(%ebx)
	vmovss	4(%ebx), %xmm4
	vmovaps	%xmm4, %xmm6
	vmovaps	%xmm4, %xmm3
	vfnmadd213ss	28(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 28(%ebx)
	vmovss	8(%ebx), %xmm2
	vmovaps	%xmm2, %xmm6
	vfnmadd213ss	32(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 32(%ebx)
	vmovss	12(%ebx), %xmm0
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	36(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 36(%ebx)
	vmovss	16(%ebx), %xmm4
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	40(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 40(%ebx)
	vmovss	20(%ebx), %xmm7
	vmovss	44(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm5
	vmovss	%xmm5, 44(%ebx)
	vmovaps	1120(%esp), %xmm5
	vdivss	%xmm1, %xmm5, %xmm5
	vmovss	%xmm5, 48(%ebx)
	vmovaps	%xmm3, %xmm6
	vfnmadd213ss	52(%ebx), %xmm5, %xmm6
	vmovaps	%xmm6, 736(%esp)
	vmovss	%xmm6, 52(%ebx)
	vmovaps	%xmm2, %xmm6
	vfnmadd213ss	56(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 56(%ebx)
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	60(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 60(%ebx)
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	64(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 64(%ebx)
	vmovss	68(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm5
	vmovss	%xmm5, 68(%ebx)
	vmovapd	%xmm1, %xmm5
	vmovaps	1040(%esp), %xmm1
	vdivss	%xmm5, %xmm1, %xmm1
	vmovss	%xmm1, 72(%ebx)
	vmovaps	%xmm3, %xmm5
	vfnmadd213ss	76(%ebx), %xmm1, %xmm3
	vmovaps	%xmm3, 1120(%esp)
	vmovss	%xmm3, 76(%ebx)
	vmovaps	%xmm2, %xmm3
	vfnmadd213ss	80(%ebx), %xmm1, %xmm3
	vmovss	%xmm3, 764(%esp)
	vmovss	%xmm3, 80(%ebx)
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	84(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 800(%esp)
	vmovss	%xmm6, 84(%ebx)
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	88(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 848(%esp)
	vmovss	%xmm6, 88(%ebx)
	vmovss	92(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm1
	vmovss	%xmm1, 1036(%esp)
	vmovss	%xmm1, 92(%ebx)
	vmovaps	1056(%esp), %xmm1
	vdivss	1104(%esp), %xmm1, %xmm1
	vmovss	%xmm1, 96(%ebx)
	vmovaps	%xmm5, %xmm3
	vfnmadd213ss	100(%ebx), %xmm1, %xmm3
	vmovaps	%xmm3, 768(%esp)
	vmovss	%xmm3, 100(%ebx)
	vmovaps	%xmm2, %xmm6
	vfnmadd213ss	104(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 832(%esp)
	vmovss	%xmm6, 104(%ebx)
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	108(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 876(%esp)
	vmovss	%xmm6, 108(%ebx)
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	112(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 880(%esp)
	vmovss	%xmm6, 112(%ebx)
	vmovss	116(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm1
	vmovss	%xmm1, 896(%esp)
	vmovss	%xmm1, 116(%ebx)
	vmovaps	1072(%esp), %xmm1
	vdivss	1104(%esp), %xmm1, %xmm1
	vmovss	%xmm1, 120(%ebx)
	vfnmadd213ss	124(%ebx), %xmm1, %xmm5
	vmovaps	%xmm5, 912(%esp)
	vmovss	%xmm5, 124(%ebx)
	vmovaps	%xmm5, %xmm6
	vfnmadd213ss	128(%ebx), %xmm1, %xmm2
	vmovss	%xmm2, 1008(%esp)
	vmovss	%xmm2, 128(%ebx)
	vmovaps	736(%esp), %xmm2
	vfnmadd213ss	132(%ebx), %xmm1, %xmm0
	vmovss	%xmm0, 1040(%esp)
	vmovss	%xmm0, 132(%ebx)
	vfnmadd213ss	136(%ebx), %xmm1, %xmm4
	vmovss	%xmm4, 1056(%esp)
	vmovss	%xmm4, 136(%ebx)
	vfnmadd213ss	140(%ebx), %xmm1, %xmm7
	vmovss	%xmm7, 928(%esp)
	vmovss	%xmm7, 140(%ebx)
	vmovss	28(%ebx), %xmm5
	vmovaps	1088(%esp), %xmm0
	vandps	%xmm0, %xmm5, %xmm1
	vmaxss	.LCPI1_9, %xmm1, %xmm1
	vandps	%xmm0, %xmm2, %xmm4
	vucomiss	%xmm1, %xmm4
	seta	%al
	movzbl	%al, %eax
	incl	%eax
	vmaxss	%xmm1, %xmm4, %xmm1
	vmovaps	1120(%esp), %xmm4
	vandps	%xmm0, %xmm4, %xmm4
	vucomiss	%xmm1, %xmm4
	movl	$3, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm1, %xmm4, %xmm1
	vandps	%xmm0, %xmm3, %xmm4
	vucomiss	%xmm1, %xmm4
	movl	$4, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm1, %xmm4, %xmm1
	vandps	%xmm0, %xmm6, %xmm4
	vucomiss	%xmm1, %xmm4
	movl	$5, %ecx
	cmoval	%ecx, %eax
	cmpl	$1, %eax
	je	.LBB1_57
	movl	(%edi,%eax,4), %ecx
	movl	4(%edi), %edx
	movl	%ecx, 4(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	24(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 24(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	28(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 28(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	32(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 32(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	36(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 36(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	40(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 40(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	44(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 44(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm0
	vmovss	%xmm0, 928(%esp)
	vmovss	136(%ebx), %xmm0
	vmovss	%xmm0, 1056(%esp)
	vmovss	132(%ebx), %xmm0
	vmovss	%xmm0, 1040(%esp)
	vmovss	128(%ebx), %xmm0
	vmovss	%xmm0, 1008(%esp)
	vmovss	124(%ebx), %xmm0
	vmovaps	%xmm0, 912(%esp)
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 896(%esp)
	vmovss	112(%ebx), %xmm0
	vmovss	%xmm0, 880(%esp)
	vmovss	108(%ebx), %xmm0
	vmovss	%xmm0, 876(%esp)
	vmovss	104(%ebx), %xmm0
	vmovss	%xmm0, 832(%esp)
	vmovss	100(%ebx), %xmm0
	vmovaps	%xmm0, 768(%esp)
	vmovss	92(%ebx), %xmm0
	vmovss	%xmm0, 1036(%esp)
	vmovss	88(%ebx), %xmm0
	vmovss	%xmm0, 848(%esp)
	vmovss	84(%ebx), %xmm0
	vmovss	%xmm0, 800(%esp)
	vmovss	80(%ebx), %xmm0
	vmovss	%xmm0, 764(%esp)
	vmovss	28(%ebx), %xmm5
	vmovss	52(%ebx), %xmm2
.LBB1_57:
	vmovaps	%xmm5, 720(%esp)
	vdivss	%xmm5, %xmm2, %xmm3
	vmovss	%xmm3, 52(%ebx)
	vmovss	32(%ebx), %xmm6
	vmovaps	%xmm6, %xmm7
	vfnmadd213ss	56(%ebx), %xmm3, %xmm7
	vmovss	%xmm7, 56(%ebx)
	vmovaps	%xmm5, %xmm4
	vmovss	36(%ebx), %xmm5
	vmovaps	%xmm5, %xmm0
	vfnmadd213ss	60(%ebx), %xmm3, %xmm0
	vmovaps	%xmm0, 1104(%esp)
	vmovss	%xmm0, 60(%ebx)
	vmovss	40(%ebx), %xmm2
	vmovaps	%xmm2, %xmm0
	vfnmadd213ss	64(%ebx), %xmm3, %xmm0
	vmovss	%xmm0, 1072(%esp)
	vmovss	%xmm0, 64(%ebx)
	vmovss	44(%ebx), %xmm1
	vmovss	68(%ebx), %xmm0
	vfnmadd213ss	%xmm0, %xmm1, %xmm3
	vmovss	%xmm3, 1120(%esp)
	vmovss	%xmm3, 68(%ebx)
	vmovss	76(%ebx), %xmm0
	vdivss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm0, 76(%ebx)
	vmovaps	%xmm6, %xmm3
	vfnmadd213ss	764(%esp), %xmm0, %xmm3
	vmovaps	%xmm3, 736(%esp)
	vmovss	%xmm3, 80(%ebx)
	vmovaps	%xmm5, %xmm3
	vfnmadd213ss	800(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 800(%esp)
	vmovss	%xmm3, 84(%ebx)
	vmovaps	%xmm2, %xmm3
	vfnmadd213ss	848(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 764(%esp)
	vmovss	%xmm3, 88(%ebx)
	vfnmadd213ss	1036(%esp), %xmm1, %xmm0
	vmovss	%xmm0, 848(%esp)
	vmovss	%xmm0, 92(%ebx)
	vmovaps	768(%esp), %xmm0
	vdivss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm0, 100(%ebx)
	vmovaps	%xmm6, %xmm4
	vfnmadd213ss	832(%esp), %xmm0, %xmm4
	vmovaps	%xmm4, 832(%esp)
	vmovss	%xmm4, 104(%ebx)
	vmovaps	%xmm5, %xmm3
	vfnmadd213ss	876(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 876(%esp)
	vmovss	%xmm3, 108(%ebx)
	vmovaps	%xmm2, %xmm3
	vfnmadd213ss	880(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 880(%esp)
	vmovss	%xmm3, 112(%ebx)
	vfnmadd213ss	896(%esp), %xmm1, %xmm0
	vmovss	%xmm0, 896(%esp)
	vmovss	%xmm0, 116(%ebx)
	vmovaps	912(%esp), %xmm0
	vdivss	720(%esp), %xmm0, %xmm0
	vmovss	%xmm0, 124(%ebx)
	vfnmadd213ss	1008(%esp), %xmm0, %xmm6
	vmovaps	%xmm6, 1008(%esp)
	vmovss	%xmm6, 128(%ebx)
	vfnmadd213ss	1040(%esp), %xmm0, %xmm5
	vmovss	%xmm5, 1036(%esp)
	vmovss	%xmm5, 132(%ebx)
	vfnmadd213ss	1056(%esp), %xmm0, %xmm2
	vmovss	%xmm2, 1040(%esp)
	vmovss	%xmm2, 136(%ebx)
	vfnmadd213ss	928(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 1056(%esp)
	vmovss	%xmm1, 140(%ebx)
	vmovaps	1088(%esp), %xmm5
	vandps	%xmm5, %xmm7, %xmm0
	vmaxss	.LCPI1_9, %xmm0, %xmm0
	vmovaps	736(%esp), %xmm1
	vandps	%xmm5, %xmm1, %xmm2
	vucomiss	%xmm0, %xmm2
	seta	%al
	movzbl	%al, %eax
	orl	$2, %eax
	vmaxss	%xmm0, %xmm2, %xmm0
	vmovaps	%xmm1, %xmm2
	vandps	%xmm5, %xmm4, %xmm1
	vucomiss	%xmm0, %xmm1
	movl	$4, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm0, %xmm1, %xmm0
	vandps	%xmm5, %xmm6, %xmm1
	vmovss	764(%esp), %xmm3
	vucomiss	%xmm0, %xmm1
	vmovss	800(%esp), %xmm0
	vmovss	1072(%esp), %xmm1
	movl	$5, %ecx
	cmoval	%ecx, %eax
	cmpl	$2, %eax
	je	.LBB1_59
	movl	(%edi,%eax,4), %ecx
	movl	8(%edi), %edx
	movl	%ecx, 8(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	48(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 48(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	52(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 52(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	56(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 56(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	60(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 60(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	64(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 64(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	68(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 68(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm0
	vmovss	%xmm0, 1056(%esp)
	vmovss	136(%ebx), %xmm0
	vmovss	%xmm0, 1040(%esp)
	vmovss	132(%ebx), %xmm0
	vmovss	%xmm0, 1036(%esp)
	vmovss	128(%ebx), %xmm0
	vmovaps	%xmm0, 1008(%esp)
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 896(%esp)
	vmovss	112(%ebx), %xmm0
	vmovss	%xmm0, 880(%esp)
	vmovss	108(%ebx), %xmm0
	vmovss	%xmm0, 876(%esp)
	vmovss	104(%ebx), %xmm0
	vmovaps	%xmm0, 832(%esp)
	vmovss	68(%ebx), %xmm0
	vmovss	%xmm0, 1120(%esp)
	vmovss	92(%ebx), %xmm0
	vmovss	%xmm0, 848(%esp)
	vmovss	64(%ebx), %xmm1
	vmovss	88(%ebx), %xmm3
	vmovss	56(%ebx), %xmm7
	vmovss	60(%ebx), %xmm0
	vmovaps	%xmm0, 1104(%esp)
	vmovss	84(%ebx), %xmm0
	vmovss	80(%ebx), %xmm2
.LBB1_59:
	vmovaps	%xmm7, 1072(%esp)
	vdivss	%xmm7, %xmm2, %xmm2
	vmovss	%xmm2, 80(%ebx)
	vmovaps	1104(%esp), %xmm6
	vmovaps	%xmm6, %xmm5
	vfnmadd213ss	%xmm0, %xmm2, %xmm5
	vmovss	%xmm5, 84(%ebx)
	vmovaps	%xmm1, %xmm0
	vfnmadd213ss	%xmm3, %xmm2, %xmm0
	vmovaps	%xmm0, 912(%esp)
	vmovss	%xmm0, 88(%ebx)
	vmovss	1120(%esp), %xmm0
	vfnmadd213ss	848(%esp), %xmm0, %xmm2
	vmovss	%xmm2, 92(%ebx)
	vmovaps	832(%esp), %xmm3
	vdivss	%xmm7, %xmm3, %xmm3
	vmovss	%xmm3, 104(%ebx)
	vmovaps	%xmm6, %xmm4
	vfnmadd213ss	876(%esp), %xmm3, %xmm4
	vmovss	%xmm4, 108(%ebx)
	vmovaps	%xmm1, %xmm7
	vfnmadd213ss	880(%esp), %xmm3, %xmm7
	vmovss	%xmm7, 112(%ebx)
	vfnmadd213ss	896(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 928(%esp)
	vmovss	%xmm3, 116(%ebx)
	vmovaps	1008(%esp), %xmm3
	vdivss	1072(%esp), %xmm3, %xmm3
	vmovss	%xmm3, 128(%ebx)
	vfnmadd213ss	1036(%esp), %xmm3, %xmm6
	vmovaps	%xmm6, 1104(%esp)
	vmovss	%xmm6, 132(%ebx)
	vfnmadd213ss	1040(%esp), %xmm3, %xmm1
	vmovss	%xmm1, 1072(%esp)
	vmovss	%xmm1, 136(%ebx)
	vfnmadd213ss	1056(%esp), %xmm3, %xmm0
	vmovss	%xmm0, 1120(%esp)
	vmovss	%xmm0, 140(%ebx)
	vmovaps	%xmm5, %xmm0
	vmovaps	%xmm4, %xmm5
	vmovaps	1088(%esp), %xmm4
	vandps	%xmm4, %xmm0, %xmm1
	vmaxss	.LCPI1_9, %xmm1, %xmm3
	vandps	%xmm4, %xmm5, %xmm1
	vucomiss	%xmm3, %xmm1
	seta	%al
	movzbl	%al, %eax
	addl	$3, %eax
	vmaxss	%xmm3, %xmm1, %xmm1
	vandps	%xmm4, %xmm6, %xmm3
	vucomiss	%xmm1, %xmm3
	vmovaps	912(%esp), %xmm1
	movl	$5, %ecx
	cmoval	%ecx, %eax
	cmpl	$3, %eax
	je	.LBB1_61
	movl	(%edi,%eax,4), %ecx
	movl	12(%edi), %edx
	movl	%ecx, 12(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	72(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 72(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	76(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 76(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	80(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 80(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	84(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 84(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	88(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 88(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	92(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 92(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm0
	vmovss	%xmm0, 1120(%esp)
	vmovss	136(%ebx), %xmm0
	vmovss	%xmm0, 1072(%esp)
	vmovss	132(%ebx), %xmm0
	vmovaps	%xmm0, 1104(%esp)
	vmovss	92(%ebx), %xmm2
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 928(%esp)
	vmovss	84(%ebx), %xmm0
	vmovss	88(%ebx), %xmm1
	vmovss	112(%ebx), %xmm7
	vmovss	108(%ebx), %xmm5
.LBB1_61:
	vdivss	%xmm0, %xmm5, %xmm3
	vmovaps	%xmm1, %xmm5
	vfnmadd213ss	%xmm7, %xmm3, %xmm5
	vmovaps	1088(%esp), %xmm6
	vmovaps	%xmm1, %xmm7
	vandps	%xmm6, %xmm5, %xmm1
	vmaxss	.LCPI1_9, %xmm1, %xmm4
	vmovaps	1104(%esp), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vfnmadd213ss	1072(%esp), %xmm0, %xmm7
	vandps	%xmm6, %xmm7, %xmm1
	vucomiss	%xmm4, %xmm1
	seta	%al
	vucomiss	%xmm4, %xmm1
	vmovaps	%xmm7, %xmm1
	vmovss	%xmm3, 108(%ebx)
	vmovss	%xmm5, 112(%ebx)
	vfnmadd213ss	928(%esp), %xmm2, %xmm3
	vmovss	%xmm3, 116(%ebx)
	vmovss	%xmm0, 132(%ebx)
	vmovss	%xmm1, 136(%ebx)
	vfnmadd213ss	1120(%esp), %xmm0, %xmm2
	vmovss	%xmm2, 140(%ebx)
	jbe	.LBB1_63
	movzbl	%al, %eax
	orl	$4, %eax
	movl	(%edi,%eax,4), %ecx
	movl	16(%edi), %edx
	movl	%ecx, 16(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	96(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 96(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	100(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 100(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	104(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 104(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	108(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 108(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	112(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 112(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 116(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm2
	vmovss	112(%ebx), %xmm5
	vmovss	116(%ebx), %xmm3
	vmovss	136(%ebx), %xmm1
.LBB1_63:
	vdivss	%xmm5, %xmm1, %xmm0
	vmovss	%xmm0, 136(%ebx)
	vfnmadd213ss	%xmm2, %xmm0, %xmm3
	vmovss	%xmm3, 140(%ebx)
	movl	(%edi), %eax
	movl	828(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm0
	vmovapd	608(%esp), %ymm7
	vmovd	%xmm7, %eax
	movl	%eax, 1036(%esp)
	movl	1000(%esp), %esi
	vmovss	%xmm0, (%esi,%eax,4)
	vpextrd	$1, %xmm7, %eax
	movl	%eax, 1040(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	vpextrd	$2, %xmm7, %eax
	movl	%eax, 1120(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	vpextrd	$3, %xmm7, %eax
	movl	%eax, 1008(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	vextractf128	$1, %ymm7, %xmm1
	vmovd	%xmm1, %eax
	movl	%eax, 1104(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	vpextrd	$1, %xmm1, %eax
	movl	%eax, 1088(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	vpextrd	$2, %xmm1, %eax
	movl	%eax, 1072(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	vpextrd	$3, %xmm1, %eax
	movl	%eax, 1056(%esp)
	vmovss	%xmm0, (%esi,%eax,4)
	movl	4(%edi), %eax
	vmovss	(%ecx,%eax,4), %xmm1
	vorpd	160(%esp), %ymm7, %ymm2
	vmovd	%xmm2, %eax
	movl	%eax, 716(%esp)
	vmovss	%xmm1, (%esi,%eax,4)
	vpextrd	$1, %xmm2, %eax
	movl	%eax, 720(%esp)
	vmovss	%xmm1, (%esi,%eax,4)
	vpextrd	$2, %xmm2, %eax
	movl	%eax, 736(%esp)
	vmovss	%xmm1, (%esi,%eax,4)
	vpextrd	$3, %xmm2, %eax
	movl	%eax, 764(%esp)
	vmovss	%xmm1, (%esi,%eax,4)
	vextractf128	$1, %ymm2, %xmm2
	vmovd	%xmm2, %eax
	movl	%eax, 768(%esp)
	vmovss	%xmm1, (%esi,%eax,4)
	vpextrd	$1, %xmm2, %ecx
	movl	%ecx, 680(%esp)
	vmovss	%xmm1, (%esi,%ecx,4)
	vpextrd	$2, %xmm2, %edi
	movl	%edi, 684(%esp)
	vmovss	%xmm1, (%esi,%edi,4)
	vpextrd	$3, %xmm2, %eax
	movl	%eax, 688(%esp)
	vmovss	%xmm1, (%esi,%eax,4)
	movl	1104(%esp), %edx
	vmovss	(%esi,%edx,4), %xmm2
	movl	1088(%esp), %edx
	vinsertps	$16, (%esi,%edx,4), %xmm2, %xmm2
	movl	1072(%esp), %edx
	vinsertps	$32, (%esi,%edx,4), %xmm2, %xmm2
	movl	1056(%esp), %edx
	vinsertps	$48, (%esi,%edx,4), %xmm2, %xmm2
	movl	1036(%esp), %edx
	vmovss	(%esi,%edx,4), %xmm3
	movl	1040(%esp), %edx
	vinsertps	$16, (%esi,%edx,4), %xmm3, %xmm3
	movl	1120(%esp), %edx
	vinsertps	$32, (%esi,%edx,4), %xmm3, %xmm3
	movl	1008(%esp), %edx
	vinsertps	$48, (%esi,%edx,4), %xmm3, %xmm3
	vinsertf128	$1, %xmm2, %ymm3, %ymm2
	vxorps	%ymm4, %ymm4, %ymm4
	vpermps	%ymm1, %ymm4, %ymm3
	vbroadcastss	24(%ebx), %ymm1
	vfnmadd213ps	%ymm3, %ymm2, %ymm1
	movl	716(%esp), %ebx
	vmovss	%xmm1, (%esi,%ebx,4)
	movl	720(%esp), %ebx
	vextractps	$1, %xmm1, (%esi,%ebx,4)
	movl	736(%esp), %ebx
	vextractps	$2, %xmm1, (%esi,%ebx,4)
	movl	764(%esp), %ebx
	vextractps	$3, %xmm1, (%esi,%ebx,4)
	vextractf128	$1, %ymm1, %xmm2
	movl	768(%esp), %ebx
	vmovss	%xmm2, (%esi,%ebx,4)
	vextractps	$1, %xmm2, (%esi,%ecx,4)
	vextractps	$2, %xmm2, (%esi,%edi,4)
	vextractps	$3, %xmm2, (%esi,%eax,4)
	movl	788(%esp), %eax
	movl	8(%eax), %eax
	movl	828(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm2
	movl	1036(%esp), %eax
	vmovss	%xmm2, 8(%esi,%eax,4)
	movl	1040(%esp), %eax
	vmovss	%xmm2, 8(%esi,%eax,4)
	movl	1120(%esp), %eax
	vmovss	%xmm2, 8(%esi,%eax,4)
	movl	%edx, %ecx
	vmovss	%xmm2, 8(%esi,%ecx,4)
	movl	1104(%esp), %edi
	vmovss	%xmm2, 8(%esi,%edi,4)
	movl	1088(%esp), %ebx
	vmovss	%xmm2, 8(%esi,%ebx,4)
	movl	1072(%esp), %eax
	vmovss	%xmm2, 8(%esi,%eax,4)
	movl	1056(%esp), %edx
	vmovss	%xmm2, 8(%esi,%edx,4)
	leal	(%esi,%edx,4), %edx
	leal	(%esi,%eax,4), %eax
	movl	%eax, 928(%esp)
	leal	(%esi,%ebx,4), %eax
	movl	%eax, 912(%esp)
	leal	(%esi,%edi,4), %eax
	movl	%eax, 896(%esp)
	leal	(%esi,%ecx,4), %eax
	movl	%eax, 880(%esp)
	movl	1120(%esp), %eax
	leal	(%esi,%eax,4), %eax
	movl	%eax, 876(%esp)
	movl	1040(%esp), %eax
	leal	(%esi,%eax,4), %eax
	movl	%eax, 848(%esp)
	movl	1036(%esp), %eax
	leal	(%esi,%eax,4), %eax
	movl	%eax, 832(%esp)
	vpermps	%ymm2, %ymm4, %ymm3
	vpaddd	128(%esp), %ymm7, %ymm2
	vextracti128	$1, %ymm2, %xmm4
	vpextrd	$3, %xmm4, %eax
	movl	%eax, 308(%esp)
	vpextrd	$2, %xmm4, %eax
	movl	%eax, 304(%esp)
	vpextrd	$1, %xmm4, %eax
	movl	%eax, 300(%esp)
	vmovd	%xmm4, 296(%esp)
	vpextrd	$3, %xmm2, %eax
	movl	%eax, 292(%esp)
	vpextrd	$2, %xmm2, %eax
	movl	%eax, 288(%esp)
	vpextrd	$1, %xmm2, %eax
	movl	%eax, 284(%esp)
	vmovd	%xmm2, 280(%esp)
	xorl	%edi, %edi
	movl	$8, %ecx
	xorl	%eax, %eax
	.align	16, 0x90
.LBB1_64:
	movl	896(%esp), %ebx
	vmovss	(%ebx,%edi), %xmm2
	movl	912(%esp), %ebx
	vinsertps	$16, (%ebx,%edi), %xmm2, %xmm2
	movl	928(%esp), %ebx
	vinsertps	$32, (%ebx,%edi), %xmm2, %xmm2
	vinsertps	$48, (%edx,%edi), %xmm2, %xmm2
	movl	832(%esp), %ebx
	vmovss	(%ebx,%edi), %xmm4
	movl	848(%esp), %ebx
	vinsertps	$16, (%ebx,%edi), %xmm4, %xmm4
	movl	876(%esp), %ebx
	vinsertps	$32, (%ebx,%edi), %xmm4, %xmm4
	movl	880(%esp), %ebx
	vinsertps	$48, (%ebx,%edi), %xmm4, %xmm4
	vinsertf128	$1, %xmm2, %ymm4, %ymm4
	movl	1172(%esp), %ebx
	vbroadcastss	48(%ebx,%edi), %ymm2
	vfnmadd213ps	%ymm3, %ymm4, %ymm2
	movl	%esi, %ebx
	movl	%edx, %esi
	movl	1036(%esp), %edx
	vmovss	%xmm2, 8(%ebx,%edx,4)
	movl	%esi, %edx
	movl	1040(%esp), %esi
	vextractps	$1, %xmm2, 8(%ebx,%esi,4)
	movl	1120(%esp), %esi
	vextractps	$2, %xmm2, 8(%ebx,%esi,4)
	movl	1008(%esp), %esi
	vextractps	$3, %xmm2, 8(%ebx,%esi,4)
	vextractf128	$1, %ymm2, %xmm3
	movl	1104(%esp), %esi
	vmovss	%xmm3, 8(%ebx,%esi,4)
	movl	1088(%esp), %esi
	vextractps	$1, %xmm3, 8(%ebx,%esi,4)
	movl	1072(%esp), %esi
	vextractps	$2, %xmm3, 8(%ebx,%esi,4)
	movl	1056(%esp), %esi
	vextractps	$3, %xmm3, 8(%ebx,%esi,4)
	movl	%ebx, %esi
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %ecx
	vmovaps	%ymm2, %ymm3
	jne	.LBB1_64
	movl	788(%esp), %eax
	movl	12(%eax), %eax
	movl	828(%esp), %edi
	vmovss	(%edi,%eax,4), %xmm3
	movl	1036(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1040(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1120(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1008(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1104(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1088(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1072(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	movl	1056(%esp), %eax
	vmovss	%xmm3, 12(%esi,%eax,4)
	vxorps	%ymm4, %ymm4, %ymm4
	vpermps	%ymm3, %ymm4, %ymm4
	vpaddd	96(%esp), %ymm7, %ymm3
	vextracti128	$1, %ymm3, %xmm5
	vpextrd	$3, %xmm5, %eax
	movl	%eax, 344(%esp)
	vpextrd	$2, %xmm5, %eax
	movl	%eax, 336(%esp)
	vpextrd	$1, %xmm5, %eax
	movl	%eax, 332(%esp)
	vmovd	%xmm5, 328(%esp)
	vpextrd	$3, %xmm3, %eax
	movl	%eax, 324(%esp)
	vpextrd	$2, %xmm3, %eax
	movl	%eax, 320(%esp)
	vpextrd	$1, %xmm3, %eax
	movl	%eax, 316(%esp)
	vmovd	%xmm3, 312(%esp)
	xorl	%edi, %edi
	movl	$12, %ebx
	xorl	%eax, %eax
	movl	%edx, 800(%esp)
	.align	16, 0x90
.LBB1_66:
	movl	896(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm3
	movl	912(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm3, %xmm3
	movl	928(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm3, %xmm3
	movl	800(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm3, %xmm3
	movl	832(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm5
	movl	848(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm5, %xmm5
	movl	876(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm5, %xmm5
	movl	880(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm5, %xmm5
	vinsertf128	$1, %xmm3, %ymm5, %ymm5
	movl	1172(%esp), %ecx
	vbroadcastss	72(%ecx,%edi), %ymm3
	vfnmadd213ps	%ymm4, %ymm5, %ymm3
	movl	%esi, %ecx
	movl	1036(%esp), %edx
	vmovss	%xmm3, 12(%ecx,%edx,4)
	movl	1040(%esp), %esi
	vextractps	$1, %xmm3, 12(%ecx,%esi,4)
	movl	1120(%esp), %esi
	vextractps	$2, %xmm3, 12(%ecx,%esi,4)
	movl	1008(%esp), %esi
	vextractps	$3, %xmm3, 12(%ecx,%esi,4)
	vextractf128	$1, %ymm3, %xmm4
	movl	1104(%esp), %esi
	vmovss	%xmm4, 12(%ecx,%esi,4)
	movl	1088(%esp), %esi
	vextractps	$1, %xmm4, 12(%ecx,%esi,4)
	movl	1072(%esp), %esi
	vextractps	$2, %xmm4, 12(%ecx,%esi,4)
	movl	1056(%esp), %esi
	vextractps	$3, %xmm4, 12(%ecx,%esi,4)
	movl	%ecx, %esi
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %ebx
	vmovaps	%ymm3, %ymm4
	jne	.LBB1_66
	movl	788(%esp), %eax
	movl	16(%eax), %eax
	movl	828(%esp), %edi
	vmovss	(%edi,%eax,4), %xmm4
	movl	1036(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1040(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1120(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1008(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1104(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1088(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1072(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	movl	1056(%esp), %eax
	vmovss	%xmm4, 16(%esi,%eax,4)
	vxorps	%ymm5, %ymm5, %ymm5
	vpermps	%ymm4, %ymm5, %ymm5
	vpaddd	64(%esp), %ymm7, %ymm4
	vextracti128	$1, %ymm4, %xmm6
	vpextrd	$3, %xmm6, %eax
	movl	%eax, 384(%esp)
	vpextrd	$2, %xmm6, %eax
	movl	%eax, 376(%esp)
	vpextrd	$1, %xmm6, %eax
	movl	%eax, 368(%esp)
	vmovd	%xmm6, 360(%esp)
	vpextrd	$3, %xmm4, %eax
	movl	%eax, 356(%esp)
	vpextrd	$2, %xmm4, %eax
	movl	%eax, 352(%esp)
	vpextrd	$1, %xmm4, %eax
	movl	%eax, 348(%esp)
	vmovd	%xmm4, 340(%esp)
	xorl	%edi, %edi
	movl	$16, %ebx
	xorl	%eax, %eax
	movl	1172(%esp), %ecx
	.align	16, 0x90
.LBB1_68:
	movl	896(%esp), %edx
	vmovss	(%edx,%edi), %xmm4
	movl	912(%esp), %edx
	vinsertps	$16, (%edx,%edi), %xmm4, %xmm4
	movl	928(%esp), %edx
	vinsertps	$32, (%edx,%edi), %xmm4, %xmm4
	movl	800(%esp), %edx
	vinsertps	$48, (%edx,%edi), %xmm4, %xmm4
	movl	832(%esp), %edx
	vmovss	(%edx,%edi), %xmm6
	movl	848(%esp), %edx
	vinsertps	$16, (%edx,%edi), %xmm6, %xmm6
	movl	876(%esp), %edx
	vinsertps	$32, (%edx,%edi), %xmm6, %xmm6
	movl	880(%esp), %edx
	vinsertps	$48, (%edx,%edi), %xmm6, %xmm6
	vinsertf128	$1, %xmm4, %ymm6, %ymm6
	vbroadcastss	96(%ecx,%edi), %ymm4
	vfnmadd213ps	%ymm5, %ymm6, %ymm4
	movl	%ecx, %edx
	movl	%esi, %ecx
	movl	1036(%esp), %esi
	vmovss	%xmm4, 16(%ecx,%esi,4)
	movl	1040(%esp), %esi
	vextractps	$1, %xmm4, 16(%ecx,%esi,4)
	movl	1120(%esp), %esi
	vextractps	$2, %xmm4, 16(%ecx,%esi,4)
	movl	1008(%esp), %esi
	vextractps	$3, %xmm4, 16(%ecx,%esi,4)
	vextractf128	$1, %ymm4, %xmm5
	movl	1104(%esp), %esi
	vmovss	%xmm5, 16(%ecx,%esi,4)
	movl	1088(%esp), %esi
	vextractps	$1, %xmm5, 16(%ecx,%esi,4)
	movl	1072(%esp), %esi
	vextractps	$2, %xmm5, 16(%ecx,%esi,4)
	movl	1056(%esp), %esi
	vextractps	$3, %xmm5, 16(%ecx,%esi,4)
	movl	%ecx, %esi
	movl	%edx, %ecx
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %ebx
	vmovaps	%ymm4, %ymm5
	jne	.LBB1_68
	movl	788(%esp), %eax
	movl	20(%eax), %eax
	movl	828(%esp), %edi
	vmovss	(%edi,%eax,4), %xmm5
	movl	1036(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1040(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1120(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1008(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1104(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1088(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1072(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	movl	1056(%esp), %eax
	vmovss	%xmm5, 20(%esi,%eax,4)
	vxorps	%ymm6, %ymm6, %ymm6
	vpermps	%ymm5, %ymm6, %ymm6
	vpaddd	32(%esp), %ymm7, %ymm5
	vextracti128	$1, %ymm5, %xmm7
	vpextrd	$3, %xmm7, %eax
	movl	%eax, 404(%esp)
	vpextrd	$2, %xmm7, %eax
	movl	%eax, 400(%esp)
	vpextrd	$1, %xmm7, %eax
	movl	%eax, 396(%esp)
	vmovd	%xmm7, 392(%esp)
	vpextrd	$3, %xmm5, %eax
	movl	%eax, 388(%esp)
	vpextrd	$2, %xmm5, %eax
	movl	%eax, 380(%esp)
	vpextrd	$1, %xmm5, %eax
	movl	%eax, 372(%esp)
	vmovd	%xmm5, 364(%esp)
	xorl	%edi, %edi
	movl	$20, %ebx
	xorl	%eax, %eax
	.align	16, 0x90
.LBB1_70:
	movl	896(%esp), %edx
	vmovss	(%edx,%edi), %xmm5
	movl	912(%esp), %edx
	vinsertps	$16, (%edx,%edi), %xmm5, %xmm5
	movl	928(%esp), %edx
	vinsertps	$32, (%edx,%edi), %xmm5, %xmm5
	movl	800(%esp), %edx
	vinsertps	$48, (%edx,%edi), %xmm5, %xmm5
	movl	832(%esp), %edx
	vmovss	(%edx,%edi), %xmm7
	movl	848(%esp), %edx
	vinsertps	$16, (%edx,%edi), %xmm7, %xmm7
	movl	876(%esp), %edx
	vinsertps	$32, (%edx,%edi), %xmm7, %xmm7
	movl	880(%esp), %edx
	vinsertps	$48, (%edx,%edi), %xmm7, %xmm7
	vinsertf128	$1, %xmm5, %ymm7, %ymm7
	vbroadcastss	120(%ecx,%edi), %ymm5
	vfnmadd213ps	%ymm6, %ymm7, %ymm5
	movl	%ecx, %edx
	movl	%esi, %ecx
	movl	1036(%esp), %esi
	vmovss	%xmm5, 20(%ecx,%esi,4)
	movl	1040(%esp), %esi
	vextractps	$1, %xmm5, 20(%ecx,%esi,4)
	movl	1120(%esp), %esi
	vextractps	$2, %xmm5, 20(%ecx,%esi,4)
	movl	1008(%esp), %esi
	vextractps	$3, %xmm5, 20(%ecx,%esi,4)
	vextractf128	$1, %ymm5, %xmm6
	movl	1104(%esp), %esi
	vmovss	%xmm6, 20(%ecx,%esi,4)
	movl	1088(%esp), %esi
	vextractps	$1, %xmm6, 20(%ecx,%esi,4)
	movl	1072(%esp), %esi
	vextractps	$2, %xmm6, 20(%ecx,%esi,4)
	movl	1056(%esp), %esi
	vextractps	$3, %xmm6, 20(%ecx,%esi,4)
	movl	%ecx, %esi
	movl	%edx, %ecx
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %ebx
	vmovaps	%ymm5, %ymm6
	jne	.LBB1_70
	vmovss	(%ecx), %xmm6
	vfnmadd213ss	%xmm0, %xmm6, %xmm0
	movl	1036(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	%eax, %edx
	movl	1040(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	%eax, %ebx
	movl	1120(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1008(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1104(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1088(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1072(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1056(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	vxorps	%ymm6, %ymm6, %ymm6
	vpermps	%ymm0, %ymm6, %ymm0
	vbroadcastss	4(%ecx), %ymm6
	vfnmadd213ps	%ymm0, %ymm6, %ymm1
	movl	%edx, %edi
	vmovss	%xmm1, (%esi,%edi,4)
	vextractps	$1, %xmm1, (%esi,%ebx,4)
	movl	1120(%esp), %edx
	vextractps	$2, %xmm1, (%esi,%edx,4)
	movl	1008(%esp), %ebx
	vextractps	$3, %xmm1, (%esi,%ebx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	1104(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1088(%esp), %eax
	vextractps	$1, %xmm0, (%esi,%eax,4)
	movl	1072(%esp), %eax
	vextractps	$2, %xmm0, (%esi,%eax,4)
	movl	1056(%esp), %eax
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vbroadcastss	8(%ecx), %ymm0
	vfnmadd213ps	%ymm1, %ymm0, %ymm2
	vmovss	%xmm2, (%esi,%edi,4)
	movl	1040(%esp), %eax
	vextractps	$1, %xmm2, (%esi,%eax,4)
	vextractps	$2, %xmm2, (%esi,%edx,4)
	vextractps	$3, %xmm2, (%esi,%ebx,4)
	vextractf128	$1, %ymm2, %xmm0
	movl	1104(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	1088(%esp), %edi
	vextractps	$1, %xmm0, (%esi,%edi,4)
	movl	1072(%esp), %eax
	vextractps	$2, %xmm0, (%esi,%eax,4)
	movl	1056(%esp), %eax
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vbroadcastss	12(%ecx), %ymm0
	vfnmadd213ps	%ymm2, %ymm0, %ymm3
	movl	1036(%esp), %edx
	vmovss	%xmm3, (%esi,%edx,4)
	movl	1040(%esp), %edx
	vextractps	$1, %xmm3, (%esi,%edx,4)
	movl	1120(%esp), %ebx
	vextractps	$2, %xmm3, (%esi,%ebx,4)
	movl	1008(%esp), %ebx
	vextractps	$3, %xmm3, (%esi,%ebx,4)
	vextractf128	$1, %ymm3, %xmm0
	movl	1104(%esp), %ebx
	vmovss	%xmm0, (%esi,%ebx,4)
	vextractps	$1, %xmm0, (%esi,%edi,4)
	movl	1072(%esp), %ebx
	vextractps	$2, %xmm0, (%esi,%ebx,4)
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vbroadcastss	16(%ecx), %ymm0
	vfnmadd213ps	%ymm3, %ymm0, %ymm4
	movl	1036(%esp), %edi
	vmovss	%xmm4, (%esi,%edi,4)
	vextractps	$1, %xmm4, (%esi,%edx,4)
	movl	1120(%esp), %edx
	vextractps	$2, %xmm4, (%esi,%edx,4)
	movl	1008(%esp), %edx
	vextractps	$3, %xmm4, (%esi,%edx,4)
	vextractf128	$1, %ymm4, %xmm0
	movl	1104(%esp), %edx
	vmovss	%xmm0, (%esi,%edx,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm0, (%esi,%edx,4)
	vextractps	$2, %xmm0, (%esi,%ebx,4)
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vbroadcastss	20(%ecx), %ymm0
	vfnmadd213ps	%ymm4, %ymm0, %ymm5
	vmovss	%xmm5, (%esi,%edi,4)
	movl	1040(%esp), %edi
	vextractps	$1, %xmm5, (%esi,%edi,4)
	movl	1120(%esp), %ebx
	vextractps	$2, %xmm5, (%esi,%ebx,4)
	movl	1008(%esp), %edx
	vextractps	$3, %xmm5, (%esi,%edx,4)
	vextractf128	$1, %ymm5, %xmm0
	movl	1104(%esp), %edx
	vmovss	%xmm0, (%esi,%edx,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm0, (%esi,%edx,4)
	movl	1072(%esp), %edx
	vextractps	$2, %xmm0, (%esi,%edx,4)
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vbroadcastss	(%ecx), %ymm0
	vdivps	%ymm0, %ymm5, %ymm0
	movl	1036(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	vextractps	$1, %xmm0, (%esi,%edi,4)
	vextractps	$2, %xmm0, (%esi,%ebx,4)
	movl	1008(%esp), %ecx
	vextractps	$3, %xmm0, (%esi,%ecx,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 912(%esp)
	movl	1104(%esp), %edx
	vmovss	%xmm1, (%esi,%edx,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm1, (%esi,%edx,4)
	movl	1072(%esp), %edx
	vextractps	$2, %xmm1, (%esi,%edx,4)
	movl	1056(%esp), %edx
	vextractps	$3, %xmm1, (%esi,%edx,4)
	movl	%eax, 1176(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1180(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	792(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, %edi
	leal	1176(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	1040(%esp), %eax
	movl	%eax, 1188(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1192(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1188(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	1120(%esp), %eax
	movl	%eax, 1200(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1204(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1200(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	1008(%esp), %eax
	movl	%eax, 1212(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1216(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1212(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	1104(%esp), %eax
	movl	%eax, 1224(%esp)
	vmovaps	912(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1228(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1224(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	1088(%esp), %eax
	movl	%eax, 1236(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1240(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1236(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	1072(%esp), %eax
	movl	%eax, 1248(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1252(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1248(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	1056(%esp), %eax
	movl	%eax, 1260(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1264(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1260(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	768(%esp), %eax
	vmovss	(%esi,%eax,4), %xmm0
	movl	680(%esp), %eax
	vinsertps	$16, (%esi,%eax,4), %xmm0, %xmm0
	movl	684(%esp), %eax
	vinsertps	$32, (%esi,%eax,4), %xmm0, %xmm0
	movl	688(%esp), %eax
	vinsertps	$48, (%esi,%eax,4), %xmm0, %xmm0
	movl	716(%esp), %eax
	vmovss	(%esi,%eax,4), %xmm1
	movl	%eax, %ebx
	movl	720(%esp), %eax
	vinsertps	$16, (%esi,%eax,4), %xmm1, %xmm1
	movl	%eax, %edx
	movl	736(%esp), %eax
	vinsertps	$32, (%esi,%eax,4), %xmm1, %xmm1
	movl	%eax, %ecx
	movl	764(%esp), %eax
	vinsertps	$48, (%esi,%eax,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	1172(%esp), %edi
	vbroadcastss	28(%edi), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, (%esi,%ebx,4)
	vextractps	$1, %xmm0, (%esi,%edx,4)
	vextractps	$2, %xmm0, (%esi,%ecx,4)
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	768(%esp), %eax
	vmovss	%xmm1, (%esi,%eax,4)
	movl	680(%esp), %eax
	vextractps	$1, %xmm1, (%esi,%eax,4)
	movl	684(%esp), %eax
	vextractps	$2, %xmm1, (%esi,%eax,4)
	movl	688(%esp), %eax
	vextractps	$3, %xmm1, (%esi,%eax,4)
	movl	1104(%esp), %ecx
	vmovss	8(%esi,%ecx,4), %xmm1
	movl	1088(%esp), %edx
	vinsertps	$16, 8(%esi,%edx,4), %xmm1, %xmm1
	movl	1072(%esp), %eax
	vinsertps	$32, 8(%esi,%eax,4), %xmm1, %xmm1
	movl	1056(%esp), %eax
	vinsertps	$48, 8(%esi,%eax,4), %xmm1, %xmm1
	movl	1036(%esp), %eax
	vmovss	8(%esi,%eax,4), %xmm2
	movl	1040(%esp), %eax
	vinsertps	$16, 8(%esi,%eax,4), %xmm2, %xmm2
	movl	1120(%esp), %ebx
	vinsertps	$32, 8(%esi,%ebx,4), %xmm2, %xmm2
	movl	1008(%esp), %ebx
	vinsertps	$48, 8(%esi,%ebx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	vbroadcastss	32(%edi), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	movl	716(%esp), %edi
	vmovss	%xmm1, (%esi,%edi,4)
	movl	720(%esp), %edi
	vextractps	$1, %xmm1, (%esi,%edi,4)
	movl	736(%esp), %edi
	vextractps	$2, %xmm1, (%esi,%edi,4)
	movl	764(%esp), %edi
	vextractps	$3, %xmm1, (%esi,%edi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	768(%esp), %edi
	vmovss	%xmm0, (%esi,%edi,4)
	movl	680(%esp), %edi
	vextractps	$1, %xmm0, (%esi,%edi,4)
	movl	684(%esp), %edi
	vextractps	$2, %xmm0, (%esi,%edi,4)
	movl	688(%esp), %edi
	vextractps	$3, %xmm0, (%esi,%edi,4)
	vmovss	12(%esi,%ecx,4), %xmm0
	vinsertps	$16, 12(%esi,%edx,4), %xmm0, %xmm0
	movl	1072(%esp), %edx
	vinsertps	$32, 12(%esi,%edx,4), %xmm0, %xmm0
	movl	1056(%esp), %ecx
	vinsertps	$48, 12(%esi,%ecx,4), %xmm0, %xmm0
	movl	1036(%esp), %edi
	vmovss	12(%esi,%edi,4), %xmm2
	vinsertps	$16, 12(%esi,%eax,4), %xmm2, %xmm2
	movl	1120(%esp), %eax
	vinsertps	$32, 12(%esi,%eax,4), %xmm2, %xmm2
	vinsertps	$48, 12(%esi,%ebx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	1172(%esp), %edi
	vbroadcastss	36(%edi), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	movl	716(%esp), %edi
	vmovss	%xmm0, (%esi,%edi,4)
	movl	720(%esp), %edi
	vextractps	$1, %xmm0, (%esi,%edi,4)
	movl	736(%esp), %edi
	vextractps	$2, %xmm0, (%esi,%edi,4)
	movl	764(%esp), %edi
	vextractps	$3, %xmm0, (%esi,%edi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	768(%esp), %edi
	vmovss	%xmm1, (%esi,%edi,4)
	movl	680(%esp), %edi
	vextractps	$1, %xmm1, (%esi,%edi,4)
	movl	684(%esp), %edi
	vextractps	$2, %xmm1, (%esi,%edi,4)
	movl	688(%esp), %edi
	vextractps	$3, %xmm1, (%esi,%edi,4)
	movl	1104(%esp), %ebx
	vmovss	16(%esi,%ebx,4), %xmm1
	movl	1088(%esp), %edi
	vinsertps	$16, 16(%esi,%edi,4), %xmm1, %xmm1
	vinsertps	$32, 16(%esi,%edx,4), %xmm1, %xmm1
	vinsertps	$48, 16(%esi,%ecx,4), %xmm1, %xmm1
	movl	1036(%esp), %ecx
	vmovss	16(%esi,%ecx,4), %xmm2
	movl	1040(%esp), %edi
	vinsertps	$16, 16(%esi,%edi,4), %xmm2, %xmm2
	vinsertps	$32, 16(%esi,%eax,4), %xmm2, %xmm2
	movl	1008(%esp), %edx
	vinsertps	$48, 16(%esi,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	1172(%esp), %eax
	vbroadcastss	40(%eax), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	movl	716(%esp), %eax
	vmovss	%xmm1, (%esi,%eax,4)
	movl	720(%esp), %eax
	vextractps	$1, %xmm1, (%esi,%eax,4)
	movl	736(%esp), %eax
	vextractps	$2, %xmm1, (%esi,%eax,4)
	movl	764(%esp), %eax
	vextractps	$3, %xmm1, (%esi,%eax,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	768(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	680(%esp), %eax
	vextractps	$1, %xmm0, (%esi,%eax,4)
	movl	684(%esp), %eax
	vextractps	$2, %xmm0, (%esi,%eax,4)
	movl	688(%esp), %eax
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vmovss	20(%esi,%ebx,4), %xmm0
	movl	1088(%esp), %eax
	vinsertps	$16, 20(%esi,%eax,4), %xmm0, %xmm0
	movl	1072(%esp), %eax
	vinsertps	$32, 20(%esi,%eax,4), %xmm0, %xmm0
	movl	1056(%esp), %eax
	vinsertps	$48, 20(%esi,%eax,4), %xmm0, %xmm0
	vmovss	20(%esi,%ecx,4), %xmm2
	vinsertps	$16, 20(%esi,%edi,4), %xmm2, %xmm2
	movl	1120(%esp), %eax
	vinsertps	$32, 20(%esi,%eax,4), %xmm2, %xmm2
	vinsertps	$48, 20(%esi,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	1172(%esp), %ecx
	vbroadcastss	44(%ecx), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	movl	716(%esp), %eax
	vmovss	%xmm0, (%esi,%eax,4)
	movl	720(%esp), %eax
	vextractps	$1, %xmm0, (%esi,%eax,4)
	movl	736(%esp), %eax
	vextractps	$2, %xmm0, (%esi,%eax,4)
	movl	764(%esp), %eax
	vextractps	$3, %xmm0, (%esi,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	768(%esp), %edx
	vmovss	%xmm1, (%esi,%edx,4)
	movl	680(%esp), %eax
	vextractps	$1, %xmm1, (%esi,%eax,4)
	movl	684(%esp), %ebx
	vextractps	$2, %xmm1, (%esi,%ebx,4)
	movl	688(%esp), %edi
	vextractps	$3, %xmm1, (%esi,%edi,4)
	vbroadcastss	48(%ecx), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	movl	716(%esp), %ecx
	vmovss	%xmm0, (%esi,%ecx,4)
	movl	720(%esp), %ecx
	vextractps	$1, %xmm0, (%esi,%ecx,4)
	movl	736(%esp), %ecx
	vextractps	$2, %xmm0, (%esi,%ecx,4)
	movl	764(%esp), %ecx
	vextractps	$3, %xmm0, (%esi,%ecx,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 912(%esp)
	vmovss	%xmm1, (%esi,%edx,4)
	vextractps	$1, %xmm1, (%esi,%eax,4)
	vextractps	$2, %xmm1, (%esi,%ebx,4)
	vextractps	$3, %xmm1, (%esi,%edi,4)
	movl	716(%esp), %eax
	movl	%eax, 1272(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1276(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	792(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1272(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	720(%esp), %eax
	movl	%eax, 1284(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1288(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1284(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	736(%esp), %eax
	movl	%eax, 1296(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1300(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1296(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	764(%esp), %eax
	movl	%eax, 1308(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1312(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1308(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	768(%esp), %eax
	movl	%eax, 1320(%esp)
	vmovaps	912(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1324(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1320(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	680(%esp), %eax
	movl	%eax, 1332(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1336(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1332(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	684(%esp), %eax
	movl	%eax, 1344(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1348(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1344(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	688(%esp), %eax
	movl	%eax, 1356(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1360(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, %eax
	movl	%eax, 8(%esp)
	leal	1356(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	1104(%esp), %eax
	vmovss	8(%esi,%eax,4), %xmm0
	movl	1088(%esp), %eax
	vinsertps	$16, 8(%esi,%eax,4), %xmm0, %xmm0
	movl	1072(%esp), %eax
	vinsertps	$32, 8(%esi,%eax,4), %xmm0, %xmm0
	movl	1056(%esp), %eax
	vinsertps	$48, 8(%esi,%eax,4), %xmm0, %xmm0
	movl	1036(%esp), %edi
	vmovss	8(%esi,%edi,4), %xmm1
	movl	1040(%esp), %ecx
	vinsertps	$16, 8(%esi,%ecx,4), %xmm1, %xmm1
	movl	1120(%esp), %edx
	vinsertps	$32, 8(%esi,%edx,4), %xmm1, %xmm1
	movl	1008(%esp), %eax
	vinsertps	$48, 8(%esi,%eax,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	1172(%esp), %ebx
	vbroadcastss	56(%ebx), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 8(%esi,%edi,4)
	vextractps	$1, %xmm0, 8(%esi,%ecx,4)
	vextractps	$2, %xmm0, 8(%esi,%edx,4)
	vextractps	$3, %xmm0, 8(%esi,%eax,4)
	movl	%eax, %edi
	vextractf128	$1, %ymm0, %xmm1
	movl	1104(%esp), %eax
	vmovss	%xmm1, 8(%esi,%eax,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm1, 8(%esi,%edx,4)
	movl	1072(%esp), %ecx
	vextractps	$2, %xmm1, 8(%esi,%ecx,4)
	movl	1056(%esp), %ebx
	vextractps	$3, %xmm1, 8(%esi,%ebx,4)
	vmovss	12(%esi,%eax,4), %xmm1
	vinsertps	$16, 12(%esi,%edx,4), %xmm1, %xmm1
	vinsertps	$32, 12(%esi,%ecx,4), %xmm1, %xmm1
	vinsertps	$48, 12(%esi,%ebx,4), %xmm1, %xmm1
	movl	1036(%esp), %ecx
	vmovss	12(%esi,%ecx,4), %xmm2
	movl	1040(%esp), %edx
	vinsertps	$16, 12(%esi,%edx,4), %xmm2, %xmm2
	movl	1120(%esp), %ebx
	vinsertps	$32, 12(%esi,%ebx,4), %xmm2, %xmm2
	vinsertps	$48, 12(%esi,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	1172(%esp), %eax
	vbroadcastss	60(%eax), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 8(%esi,%ecx,4)
	vextractps	$1, %xmm1, 8(%esi,%edx,4)
	vextractps	$2, %xmm1, 8(%esi,%ebx,4)
	vextractps	$3, %xmm1, 8(%esi,%edi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	1104(%esp), %ebx
	vmovss	%xmm0, 8(%esi,%ebx,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm0, 8(%esi,%edx,4)
	movl	1072(%esp), %edi
	vextractps	$2, %xmm0, 8(%esi,%edi,4)
	movl	1056(%esp), %ecx
	vextractps	$3, %xmm0, 8(%esi,%ecx,4)
	vmovss	16(%esi,%ebx,4), %xmm0
	vinsertps	$16, 16(%esi,%edx,4), %xmm0, %xmm0
	vinsertps	$32, 16(%esi,%edi,4), %xmm0, %xmm0
	vinsertps	$48, 16(%esi,%ecx,4), %xmm0, %xmm0
	movl	1036(%esp), %edx
	vmovss	16(%esi,%edx,4), %xmm2
	movl	1040(%esp), %ecx
	vinsertps	$16, 16(%esi,%ecx,4), %xmm2, %xmm2
	movl	1120(%esp), %edi
	vinsertps	$32, 16(%esi,%edi,4), %xmm2, %xmm2
	movl	1008(%esp), %ebx
	vinsertps	$48, 16(%esi,%ebx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	vbroadcastss	64(%eax), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	vmovss	%xmm0, 8(%esi,%edx,4)
	vextractps	$1, %xmm0, 8(%esi,%ecx,4)
	vextractps	$2, %xmm0, 8(%esi,%edi,4)
	movl	%ebx, %edi
	vextractps	$3, %xmm0, 8(%esi,%edi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	1104(%esp), %ebx
	vmovss	%xmm1, 8(%esi,%ebx,4)
	movl	1088(%esp), %ecx
	vextractps	$1, %xmm1, 8(%esi,%ecx,4)
	movl	1072(%esp), %edx
	vextractps	$2, %xmm1, 8(%esi,%edx,4)
	movl	1056(%esp), %eax
	vextractps	$3, %xmm1, 8(%esi,%eax,4)
	vmovss	20(%esi,%ebx,4), %xmm1
	vinsertps	$16, 20(%esi,%ecx,4), %xmm1, %xmm1
	vinsertps	$32, 20(%esi,%edx,4), %xmm1, %xmm1
	vinsertps	$48, 20(%esi,%eax,4), %xmm1, %xmm1
	movl	1036(%esp), %ebx
	vmovss	20(%esi,%ebx,4), %xmm2
	movl	1040(%esp), %ecx
	vinsertps	$16, 20(%esi,%ecx,4), %xmm2, %xmm2
	movl	1120(%esp), %edx
	vinsertps	$32, 20(%esi,%edx,4), %xmm2, %xmm2
	vinsertps	$48, 20(%esi,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	1172(%esp), %eax
	vbroadcastss	68(%eax), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 8(%esi,%ebx,4)
	vextractps	$1, %xmm1, 8(%esi,%ecx,4)
	vextractps	$2, %xmm1, 8(%esi,%edx,4)
	vextractps	$3, %xmm1, 8(%esi,%edi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	1104(%esp), %edi
	vmovss	%xmm0, 8(%esi,%edi,4)
	movl	1088(%esp), %ebx
	vextractps	$1, %xmm0, 8(%esi,%ebx,4)
	movl	1072(%esp), %ecx
	vextractps	$2, %xmm0, 8(%esi,%ecx,4)
	movl	1056(%esp), %edx
	vextractps	$3, %xmm0, 8(%esi,%edx,4)
	vbroadcastss	152(%eax), %ymm0
	vdivps	%ymm0, %ymm1, %ymm0
	movl	1036(%esp), %eax
	vmovss	%xmm0, 8(%esi,%eax,4)
	movl	1040(%esp), %eax
	vextractps	$1, %xmm0, 8(%esi,%eax,4)
	movl	1120(%esp), %eax
	vextractps	$2, %xmm0, 8(%esi,%eax,4)
	movl	1008(%esp), %eax
	vextractps	$3, %xmm0, 8(%esi,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 912(%esp)
	vmovss	%xmm1, 8(%esi,%edi,4)
	vextractps	$1, %xmm1, 8(%esi,%ebx,4)
	vextractps	$2, %xmm1, 8(%esi,%ecx,4)
	vextractps	$3, %xmm1, 8(%esi,%edx,4)
	movl	280(%esp), %eax
	movl	%eax, 1368(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1372(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	792(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	1368(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	284(%esp), %eax
	movl	%eax, 1380(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1384(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1380(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	288(%esp), %eax
	movl	%eax, 1392(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1396(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1392(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	292(%esp), %eax
	movl	%eax, 1404(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1408(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1404(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	296(%esp), %eax
	movl	%eax, 1416(%esp)
	vmovaps	912(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1420(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1416(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	300(%esp), %eax
	movl	%eax, 1428(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1432(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1428(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	304(%esp), %eax
	movl	%eax, 1440(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1444(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1440(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	308(%esp), %eax
	movl	%eax, 1452(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1456(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1452(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	1104(%esp), %eax
	vmovss	12(%esi,%eax,4), %xmm0
	movl	1088(%esp), %eax
	vinsertps	$16, 12(%esi,%eax,4), %xmm0, %xmm0
	movl	1072(%esp), %eax
	vinsertps	$32, 12(%esi,%eax,4), %xmm0, %xmm0
	movl	1056(%esp), %eax
	vinsertps	$48, 12(%esi,%eax,4), %xmm0, %xmm0
	movl	1036(%esp), %edi
	vmovss	12(%esi,%edi,4), %xmm1
	movl	1040(%esp), %ecx
	vinsertps	$16, 12(%esi,%ecx,4), %xmm1, %xmm1
	movl	1120(%esp), %edx
	vinsertps	$32, 12(%esi,%edx,4), %xmm1, %xmm1
	movl	1008(%esp), %ebx
	vinsertps	$48, 12(%esi,%ebx,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	1172(%esp), %eax
	vbroadcastss	84(%eax), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 12(%esi,%edi,4)
	vextractps	$1, %xmm0, 12(%esi,%ecx,4)
	vextractps	$2, %xmm0, 12(%esi,%edx,4)
	vextractps	$3, %xmm0, 12(%esi,%ebx,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	1104(%esp), %ecx
	vmovss	%xmm1, 12(%esi,%ecx,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm1, 12(%esi,%edx,4)
	movl	1072(%esp), %edi
	vextractps	$2, %xmm1, 12(%esi,%edi,4)
	movl	1056(%esp), %eax
	vextractps	$3, %xmm1, 12(%esi,%eax,4)
	vmovss	16(%esi,%ecx,4), %xmm1
	vinsertps	$16, 16(%esi,%edx,4), %xmm1, %xmm1
	vinsertps	$32, 16(%esi,%edi,4), %xmm1, %xmm1
	vinsertps	$48, 16(%esi,%eax,4), %xmm1, %xmm1
	movl	1036(%esp), %ebx
	vmovss	16(%esi,%ebx,4), %xmm2
	movl	1040(%esp), %eax
	vinsertps	$16, 16(%esi,%eax,4), %xmm2, %xmm2
	movl	1120(%esp), %edx
	vinsertps	$32, 16(%esi,%edx,4), %xmm2, %xmm2
	movl	1008(%esp), %ecx
	vinsertps	$48, 16(%esi,%ecx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	1172(%esp), %edi
	vbroadcastss	88(%edi), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 12(%esi,%ebx,4)
	movl	%ebx, %edi
	vextractps	$1, %xmm1, 12(%esi,%eax,4)
	vextractps	$2, %xmm1, 12(%esi,%edx,4)
	vextractps	$3, %xmm1, 12(%esi,%ecx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	1104(%esp), %ecx
	vmovss	%xmm0, 12(%esi,%ecx,4)
	movl	1088(%esp), %ebx
	vextractps	$1, %xmm0, 12(%esi,%ebx,4)
	movl	1072(%esp), %eax
	vextractps	$2, %xmm0, 12(%esi,%eax,4)
	movl	1056(%esp), %edx
	vextractps	$3, %xmm0, 12(%esi,%edx,4)
	vmovss	20(%esi,%ecx,4), %xmm0
	vinsertps	$16, 20(%esi,%ebx,4), %xmm0, %xmm0
	vinsertps	$32, 20(%esi,%eax,4), %xmm0, %xmm0
	vinsertps	$48, 20(%esi,%edx,4), %xmm0, %xmm0
	movl	%edi, %edx
	vmovss	20(%esi,%edx,4), %xmm2
	movl	1040(%esp), %ecx
	vinsertps	$16, 20(%esi,%ecx,4), %xmm2, %xmm2
	movl	1120(%esp), %ebx
	vinsertps	$32, 20(%esi,%ebx,4), %xmm2, %xmm2
	movl	1008(%esp), %edi
	vinsertps	$48, 20(%esi,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	1172(%esp), %eax
	vbroadcastss	92(%eax), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	vmovss	%xmm0, 12(%esi,%edx,4)
	vextractps	$1, %xmm0, 12(%esi,%ecx,4)
	vextractps	$2, %xmm0, 12(%esi,%ebx,4)
	vextractps	$3, %xmm0, 12(%esi,%edi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	1104(%esp), %ebx
	vmovss	%xmm1, 12(%esi,%ebx,4)
	movl	1088(%esp), %ecx
	vextractps	$1, %xmm1, 12(%esi,%ecx,4)
	movl	1072(%esp), %edi
	vextractps	$2, %xmm1, 12(%esi,%edi,4)
	movl	1056(%esp), %edx
	vextractps	$3, %xmm1, 12(%esi,%edx,4)
	vbroadcastss	84(%eax), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	movl	1036(%esp), %eax
	vmovss	%xmm0, 12(%esi,%eax,4)
	movl	1040(%esp), %eax
	vextractps	$1, %xmm0, 12(%esi,%eax,4)
	movl	1120(%esp), %eax
	vextractps	$2, %xmm0, 12(%esi,%eax,4)
	movl	1008(%esp), %eax
	vextractps	$3, %xmm0, 12(%esi,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 912(%esp)
	vmovss	%xmm1, 12(%esi,%ebx,4)
	vextractps	$1, %xmm1, 12(%esi,%ecx,4)
	vextractps	$2, %xmm1, 12(%esi,%edi,4)
	movl	1056(%esp), %eax
	vextractps	$3, %xmm1, 12(%esi,%eax,4)
	movl	312(%esp), %eax
	movl	%eax, 1464(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1468(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	792(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	1464(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	316(%esp), %eax
	movl	%eax, 1476(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1480(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1476(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	320(%esp), %eax
	movl	%eax, 1488(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1492(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1488(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	324(%esp), %eax
	movl	%eax, 1500(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1504(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1500(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	328(%esp), %eax
	movl	%eax, 1512(%esp)
	vmovaps	912(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1516(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1512(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	332(%esp), %eax
	movl	%eax, 1524(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1528(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1524(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	336(%esp), %eax
	movl	%eax, 1536(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1540(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1536(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	344(%esp), %eax
	movl	%eax, 1548(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1552(%esp)
	movl	%edi, %eax
	movl	%eax, 12(%esp)
	movl	%ebx, %eax
	movl	%eax, 8(%esp)
	leal	1548(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	1104(%esp), %eax
	vmovss	16(%esi,%eax,4), %xmm0
	movl	1088(%esp), %eax
	vinsertps	$16, 16(%esi,%eax,4), %xmm0, %xmm0
	movl	1072(%esp), %eax
	vinsertps	$32, 16(%esi,%eax,4), %xmm0, %xmm0
	movl	1056(%esp), %eax
	vinsertps	$48, 16(%esi,%eax,4), %xmm0, %xmm0
	movl	1036(%esp), %edi
	vmovss	16(%esi,%edi,4), %xmm1
	movl	1040(%esp), %eax
	vinsertps	$16, 16(%esi,%eax,4), %xmm1, %xmm1
	movl	1120(%esp), %ecx
	vinsertps	$32, 16(%esi,%ecx,4), %xmm1, %xmm1
	movl	1008(%esp), %edx
	vinsertps	$48, 16(%esi,%edx,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	1172(%esp), %ebx
	vbroadcastss	112(%ebx), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 16(%esi,%edi,4)
	vextractps	$1, %xmm0, 16(%esi,%eax,4)
	movl	%eax, %edi
	vextractps	$2, %xmm0, 16(%esi,%ecx,4)
	vextractps	$3, %xmm0, 16(%esi,%edx,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	1104(%esp), %eax
	vmovss	%xmm1, 16(%esi,%eax,4)
	movl	1088(%esp), %ecx
	vextractps	$1, %xmm1, 16(%esi,%ecx,4)
	movl	1072(%esp), %edx
	vextractps	$2, %xmm1, 16(%esi,%edx,4)
	movl	1056(%esp), %ebx
	vextractps	$3, %xmm1, 16(%esi,%ebx,4)
	vmovss	20(%esi,%eax,4), %xmm1
	vinsertps	$16, 20(%esi,%ecx,4), %xmm1, %xmm1
	vinsertps	$32, 20(%esi,%edx,4), %xmm1, %xmm1
	vinsertps	$48, 20(%esi,%ebx,4), %xmm1, %xmm1
	movl	1036(%esp), %eax
	vmovss	20(%esi,%eax,4), %xmm2
	vinsertps	$16, 20(%esi,%edi,4), %xmm2, %xmm2
	movl	1120(%esp), %ecx
	vinsertps	$32, 20(%esi,%ecx,4), %xmm2, %xmm2
	movl	1008(%esp), %edx
	vinsertps	$48, 20(%esi,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	1172(%esp), %ebx
	vbroadcastss	116(%ebx), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 16(%esi,%eax,4)
	vextractps	$1, %xmm1, 16(%esi,%edi,4)
	vextractps	$2, %xmm1, 16(%esi,%ecx,4)
	vextractps	$3, %xmm1, 16(%esi,%edx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	1104(%esp), %edi
	vmovss	%xmm0, 16(%esi,%edi,4)
	movl	1088(%esp), %edx
	vextractps	$1, %xmm0, 16(%esi,%edx,4)
	movl	1072(%esp), %ecx
	vextractps	$2, %xmm0, 16(%esi,%ecx,4)
	movl	1056(%esp), %eax
	vextractps	$3, %xmm0, 16(%esi,%eax,4)
	vbroadcastss	112(%ebx), %ymm0
	vdivps	%ymm0, %ymm1, %ymm0
	movl	1036(%esp), %ebx
	vmovss	%xmm0, 16(%esi,%ebx,4)
	movl	1040(%esp), %ebx
	vextractps	$1, %xmm0, 16(%esi,%ebx,4)
	movl	1120(%esp), %ebx
	vextractps	$2, %xmm0, 16(%esi,%ebx,4)
	movl	1008(%esp), %ebx
	vextractps	$3, %xmm0, 16(%esi,%ebx,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 912(%esp)
	vmovss	%xmm1, 16(%esi,%edi,4)
	vextractps	$1, %xmm1, 16(%esi,%edx,4)
	vextractps	$2, %xmm1, 16(%esi,%ecx,4)
	vextractps	$3, %xmm1, 16(%esi,%eax,4)
	movl	340(%esp), %eax
	movl	%eax, 1560(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1564(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	792(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	1560(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	348(%esp), %eax
	movl	%eax, 1572(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1576(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1572(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	352(%esp), %eax
	movl	%eax, 1584(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1588(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1584(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	356(%esp), %eax
	movl	%eax, 1596(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1600(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1596(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	360(%esp), %eax
	movl	%eax, 1608(%esp)
	vmovaps	912(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 928(%esp)
	vmovlpd	%xmm0, 1612(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1608(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	368(%esp), %eax
	movl	%eax, 1620(%esp)
	vmovapd	928(%esp), %ymm0
	vmovhpd	%xmm0, 1624(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1620(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	376(%esp), %eax
	movl	%eax, 1632(%esp)
	vmovapd	928(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 928(%esp)
	vmovlpd	%xmm0, 1636(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1632(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	384(%esp), %eax
	movl	%eax, 1644(%esp)
	vmovapd	928(%esp), %xmm0
	vmovhpd	%xmm0, 1648(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1644(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	1104(%esp), %eax
	vmovss	20(%esi,%eax,4), %xmm0
	movl	1088(%esp), %eax
	vinsertps	$16, 20(%esi,%eax,4), %xmm0, %xmm0
	movl	1072(%esp), %eax
	vinsertps	$32, 20(%esi,%eax,4), %xmm0, %xmm0
	movl	1056(%esp), %eax
	vinsertps	$48, 20(%esi,%eax,4), %xmm0, %xmm0
	movl	1036(%esp), %ebx
	vmovss	20(%esi,%ebx,4), %xmm1
	movl	1040(%esp), %eax
	vinsertps	$16, 20(%esi,%eax,4), %xmm1, %xmm1
	movl	1120(%esp), %ecx
	vinsertps	$32, 20(%esi,%ecx,4), %xmm1, %xmm1
	movl	1008(%esp), %edx
	vinsertps	$48, 20(%esi,%edx,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	1172(%esp), %edi
	vbroadcastss	140(%edi), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 20(%esi,%ebx,4)
	vextractps	$1, %xmm0, 20(%esi,%eax,4)
	vextractps	$2, %xmm0, 20(%esi,%ecx,4)
	vextractps	$3, %xmm0, 20(%esi,%edx,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	1104(%esp), %eax
	vmovss	%xmm1, 20(%esi,%eax,4)
	movl	1088(%esp), %ecx
	vextractps	$1, %xmm1, 20(%esi,%ecx,4)
	movl	1072(%esp), %edx
	vextractps	$2, %xmm1, 20(%esi,%edx,4)
	movl	1056(%esp), %edi
	vextractps	$3, %xmm1, 20(%esi,%edi,4)
	movl	1172(%esp), %ebx
	vbroadcastss	164(%ebx), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	movl	1036(%esp), %ebx
	vmovss	%xmm0, 20(%esi,%ebx,4)
	movl	1040(%esp), %ebx
	vextractps	$1, %xmm0, 20(%esi,%ebx,4)
	movl	1120(%esp), %ebx
	vextractps	$2, %xmm0, 20(%esi,%ebx,4)
	movl	1008(%esp), %ebx
	vextractps	$3, %xmm0, 20(%esi,%ebx,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 1040(%esp)
	vmovss	%xmm1, 20(%esi,%eax,4)
	vextractps	$1, %xmm1, 20(%esi,%ecx,4)
	vextractps	$2, %xmm1, 20(%esi,%edx,4)
	vextractps	$3, %xmm1, 20(%esi,%edi,4)
	movl	364(%esp), %eax
	movl	%eax, 1656(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 1120(%esp)
	vmovlpd	%xmm0, 1660(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	792(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	1656(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	372(%esp), %eax
	movl	%eax, 1668(%esp)
	vmovapd	1120(%esp), %ymm0
	vmovhpd	%xmm0, 1672(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1668(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	380(%esp), %eax
	movl	%eax, 1680(%esp)
	vmovapd	1120(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 1120(%esp)
	vmovlpd	%xmm0, 1684(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1680(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	388(%esp), %eax
	movl	%eax, 1692(%esp)
	vmovapd	1120(%esp), %xmm0
	vmovhpd	%xmm0, 1696(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1692(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	392(%esp), %eax
	movl	%eax, 1704(%esp)
	vmovaps	1040(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 1120(%esp)
	vmovlpd	%xmm0, 1708(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1704(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	396(%esp), %eax
	movl	%eax, 1716(%esp)
	vmovapd	1120(%esp), %ymm0
	vmovhpd	%xmm0, 1720(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1716(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	400(%esp), %eax
	movl	%eax, 1728(%esp)
	vmovapd	1120(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 1120(%esp)
	vmovlpd	%xmm0, 1732(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1728(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	404(%esp), %eax
	movl	%eax, 1740(%esp)
	vmovapd	1120(%esp), %xmm0
	vmovhpd	%xmm0, 1744(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1740(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1752(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1753(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1754(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1755(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1756(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1757(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1758(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1759(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovdqa	608(%esp), %ymm0
	vpaddd	224(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 608(%esp)
	vmovdqa	192(%esp), %ymm1
	vmovdqa	416(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 416(%esp)
	vmovdqa	448(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 448(%esp)
	vmovdqa	480(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 480(%esp)
	vmovdqa	512(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 512(%esp)
	vmovdqa	544(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 544(%esp)
	vmovdqa	576(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 576(%esp)
	vzeroupper
	calll	opencl_printf
	movl	408(%esp), %eax
	incl	%eax
	cmpl	272(%esp), %eax
	movl	1004(%esp), %edx
	movl	%esi, %edi
	movl	1168(%esp), %ebx
	jne	.LBB1_2
.LBB1_72:
	movl	276(%esp), %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %eax
	je	.LBB1_207
	movl	%ecx, %eax
	subl	%eax, 276(%esp)
	movl	28(%esp), %ecx
	addl	%ecx, %eax
	movl	%eax, 912(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI1_2, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, 1120(%esp)
	vxorps	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 1072(%esp)
	movl	272(%esp), %eax
	leal	(%ecx,%eax,8), %ecx
	imull	$6, %ecx, %eax
	leal	(%edi,%eax,4), %esi
	imull	%edx, %ecx
	movl	%ecx, 576(%esp)
	movl	676(%esp), %eax
	leal	(%eax,%ecx,4), %edi
	leal	(,%ecx,4), %ecx
	movl	%ecx, 928(%esp)
	movl	%edx, %ecx
	negl	%ecx
	movl	%ecx, 544(%esp)
	leal	(,%edx,4), %ecx
	movl	%ecx, 512(%esp)
	movl	%edx, %ecx
	andl	$1, %ecx
	movl	%ecx, 480(%esp)
	xorl	%ecx, %ecx
	movl	%eax, 1036(%esp)
	movl	%esi, %eax
	.align	16, 0x90
.LBB1_74:
	movl	%ecx, 680(%esp)
	movl	%edi, 1056(%esp)
	movl	%eax, 1104(%esp)
	testl	%edx, %edx
	movl	%edx, %esi
	movl	%ebx, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	jle	.LBB1_75
	.align	16, 0x90
.LBB1_144:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$0, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_144
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %edi
	.align	16, 0x90
.LBB1_146:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_146
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_148:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_148
	jmp	.LBB1_76
	.align	16, 0x90
.LBB1_75:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_76:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %ebx
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_244
	.align	16, 0x90
.LBB1_77:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_77
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_79:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_79
	jmp	.LBB1_245
	.align	16, 0x90
.LBB1_244:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_245:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_247
	.align	16, 0x90
.LBB1_246:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_246
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 20(%eax)
	cmpl	$0, 480(%esp)
	jne	.LBB1_132
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	jmp	.LBB1_133
	.align	16, 0x90
.LBB1_247:
	movl	1172(%esp), %ecx
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 20(%ecx)
	movl	828(%esp), %eax
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 24(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.LBB1_140
	.align	16, 0x90
.LBB1_132:
	movl	912(%esp), %eax
	imull	%ebx, %eax
	movl	676(%esp), %ecx
	vxorps	%xmm0, %xmm0, %xmm0
	vaddss	(%ecx,%eax,4), %xmm0, %xmm0
	movl	$1, %ecx
.LBB1_133:
	cmpl	$2, %ebx
	movl	1168(%esp), %edi
	jb	.LBB1_136
	movl	544(%esp), %eax
	leal	(%eax,%ecx), %eax
	movl	1036(%esp), %edx
	leal	(%edx,%ecx,4), %ecx
	movl	576(%esp), %edx
	.align	16, 0x90
.LBB1_135:
	vaddss	(%ecx,%edx,4), %xmm0, %xmm0
	vaddss	4(%ecx,%edx,4), %xmm0, %xmm0
	addl	$2, %edx
	addl	$2, %eax
	jne	.LBB1_135
.LBB1_136:
	vmovss	1120(%esp), %xmm1
	vmulss	%xmm0, %xmm1, %xmm0
	movl	828(%esp), %eax
	vmovss	%xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	.align	16, 0x90
.LBB1_137:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_137
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 24(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_139:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_139
.LBB1_140:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 28(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_237
	.align	16, 0x90
.LBB1_141:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_141
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_143:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_143
	jmp	.LBB1_238
	.align	16, 0x90
.LBB1_237:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_238:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 36(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_253
	.align	16, 0x90
.LBB1_239:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_239
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_241:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_241
	jmp	.LBB1_242
	.align	16, 0x90
.LBB1_253:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_242:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	vmovss	%xmm0, 44(%ecx)
	testl	%ebx, %ebx
	jle	.LBB1_243
	movl	928(%esp), %eax
	movl	1036(%esp), %ecx
	leal	(%ecx,%eax), %eax
	xorl	%ecx, %ecx
	vxorps	%xmm0, %xmm0, %xmm0
	movl	%ebx, %edx
	xorl	%esi, %esi
	movl	1168(%esp), %edi
	.align	16, 0x90
.LBB1_150:
	vmovss	(%edi,%ecx), %xmm2
	vmovss	(%eax,%ecx), %xmm1
	vfmadd213ss	%xmm0, %xmm2, %xmm1
	addl	$4, %ecx
	adcl	$0, %esi
	decl	%edx
	vmovaps	%xmm1, %xmm0
	jne	.LBB1_150
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	828(%esp), %eax
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	.align	16, 0x90
.LBB1_152:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_152
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 48(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_154:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_154
	jmp	.LBB1_155
	.align	16, 0x90
.LBB1_243:
	movl	828(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	%xmm0, 48(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_155:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 52(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_230
	.align	16, 0x90
.LBB1_156:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_156
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 56(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_158:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_158
	jmp	.LBB1_231
	.align	16, 0x90
.LBB1_230:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 56(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_231:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 60(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_252
	.align	16, 0x90
.LBB1_232:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_232
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 64(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_234:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_234
	jmp	.LBB1_235
	.align	16, 0x90
.LBB1_252:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 64(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_235:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	vmovss	%xmm0, 68(%ecx)
	testl	%ebx, %ebx
	jle	.LBB1_236
	movl	928(%esp), %eax
	movl	1036(%esp), %ecx
	leal	(%ecx,%eax), %eax
	movl	%eax, 1040(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_160:
	vmovss	%xmm0, 1088(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	1040(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	1088(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%xmm1, %xmm0
	jne	.LBB1_160
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	828(%esp), %eax
	vmovss	%xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	1168(%esp), %edi
	.align	16, 0x90
.LBB1_162:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_162
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 72(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_164:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_164
	jmp	.LBB1_165
	.align	16, 0x90
.LBB1_236:
	movl	828(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 8(%eax)
	vmovss	%xmm0, 72(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_165:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 76(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_223
	.align	16, 0x90
.LBB1_166:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_166
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_168:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_168
	jmp	.LBB1_224
	.align	16, 0x90
.LBB1_223:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_224:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 84(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	1168(%esp), %edi
	jle	.LBB1_251
	.align	16, 0x90
.LBB1_225:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_225
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1168(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_227:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$8, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_227
	jmp	.LBB1_228
	.align	16, 0x90
.LBB1_251:
	movl	1172(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB1_228:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	vmovss	%xmm0, 92(%ecx)
	testl	%ebx, %ebx
	jle	.LBB1_229
	movl	928(%esp), %eax
	movl	1036(%esp), %ecx
	leal	(%ecx,%eax), %eax
	movl	%eax, 1040(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_170:
	vmovss	%xmm0, 1088(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	1040(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	1088(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%xmm1, %xmm0
	jne	.LBB1_170
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	828(%esp), %eax
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %eax
	movl	%eax, %edi
	movl	%eax, %ebx
	.align	16, 0x90
.LBB1_172:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_172
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 96(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_174:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_174
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 100(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_176:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_176
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 104(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_178:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_178
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 108(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_180:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_180
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 112(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_182:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$9, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_182
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	movl	1004(%esp), %ebx
	jmp	.LBB1_184
	.align	16, 0x90
.LBB1_229:
	movl	828(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vmovss	%xmm0, 96(%ecx)
	vmovss	%xmm0, 100(%ecx)
	vmovss	%xmm0, 104(%ecx)
	vmovss	%xmm0, 108(%ecx)
	vmovss	%xmm0, 112(%ecx)
.LBB1_184:
	vmovss	%xmm0, 116(%ecx)
	testl	%ebx, %ebx
	jle	.LBB1_185
	movl	928(%esp), %eax
	movl	1036(%esp), %ecx
	leal	(%ecx,%eax), %eax
	movl	%eax, 1040(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_209:
	vmovss	%xmm0, 1088(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	1040(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	1088(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%xmm1, %xmm0
	jne	.LBB1_209
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	828(%esp), %eax
	vmovss	%xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	1168(%esp), %eax
	movl	%eax, %edi
	movl	%eax, %ebx
	.align	16, 0x90
.LBB1_211:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_211
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 120(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_213:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_213
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 124(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_215:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_215
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 128(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_217:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_217
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 132(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	1004(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB1_219:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%edi), %xmm0
	movl	$9, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB1_219
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %eax
	vmovss	%xmm0, 136(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	1004(%esp), %edi
	.align	16, 0x90
.LBB1_221:
	vmovss	%xmm1, 1088(%esp)
	vmovss	(%esi), %xmm0
	movl	$10, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	1088(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB1_221
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	1172(%esp), %ecx
	movl	1004(%esp), %ebx
	jmp	.LBB1_186
	.align	16, 0x90
.LBB1_185:
	movl	828(%esp), %eax
	vmovss	1072(%esp), %xmm0
	vmovss	%xmm0, 16(%eax)
	vmovss	%xmm0, 120(%ecx)
	vmovss	%xmm0, 124(%ecx)
	vmovss	%xmm0, 128(%ecx)
	vmovss	%xmm0, 132(%ecx)
	vmovss	%xmm0, 136(%ecx)
.LBB1_186:
	vmovss	%xmm0, 140(%ecx)
	xorl	%esi, %esi
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	$0, %edi
	jle	.LBB1_188
	.align	16, 0x90
.LBB1_187:
	vmovss	%xmm1, 1088(%esp)
	movl	1168(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	1056(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	1088(%esp), %xmm0, %xmm1
	addl	$4, %esi
	adcl	$0, %edi
	decl	%ebx
	jne	.LBB1_187
.LBB1_188:
	vmovss	1120(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	828(%esp), %eax
	vmovss	%xmm0, 20(%eax)
	movl	788(%esp), %edx
	movl	$0, (%edx)
	movl	$1, 4(%edx)
	movl	$2, 8(%edx)
	movl	$3, 12(%edx)
	movl	$4, 16(%edx)
	movl	$5, 20(%edx)
	movl	$6, 24(%edx)
	movl	$2147483647, %eax
	vmovd	%eax, %xmm7
	vmovapd	%xmm7, 1008(%esp)
	movl	1172(%esp), %ebx
	vmovss	(%ebx), %xmm1
	vmovss	24(%ebx), %xmm5
	vandpd	%xmm7, %xmm1, %xmm0
	vmaxss	.LCPI1_9, %xmm0, %xmm0
	vandpd	%xmm7, %xmm5, %xmm2
	vucomiss	%xmm0, %xmm2
	seta	%al
	movzbl	%al, %eax
	vmaxss	%xmm0, %xmm2, %xmm2
	vmovss	48(%ebx), %xmm0
	vmovapd	%xmm0, 1088(%esp)
	vandpd	%xmm7, %xmm0, %xmm3
	vucomiss	%xmm2, %xmm3
	movl	$2, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm2, %xmm3, %xmm2
	vmovss	72(%ebx), %xmm3
	vandpd	%xmm7, %xmm3, %xmm4
	vucomiss	%xmm2, %xmm4
	movl	$3, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm2, %xmm4, %xmm4
	vmovss	96(%ebx), %xmm2
	vandpd	%xmm7, %xmm2, %xmm6
	vucomiss	%xmm4, %xmm6
	movl	$4, %edi
	cmoval	%edi, %eax
	vmaxss	%xmm4, %xmm6, %xmm6
	vmovss	120(%ebx), %xmm0
	vandpd	%xmm7, %xmm0, %xmm7
	vucomiss	%xmm6, %xmm7
	movl	$5, %ecx
	cmoval	%ecx, %eax
	testl	%eax, %eax
	movl	412(%esp), %esi
	je	.LBB1_190
	movl	(%edx,%eax,4), %ecx
	movl	%ecx, (%edx)
	movl	$0, (%edx,%eax,4)
	vmovss	(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, (%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	4(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 4(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	8(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 8(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	12(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 12(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	16(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 16(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	20(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 20(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	120(%ebx), %xmm0
	vmovss	96(%ebx), %xmm2
	vmovss	72(%ebx), %xmm3
	vmovss	48(%ebx), %xmm1
	vmovaps	%xmm1, 1088(%esp)
	vmovss	(%ebx), %xmm1
	vmovss	24(%ebx), %xmm5
.LBB1_190:
	vmovapd	%xmm1, 1040(%esp)
	vmovapd	%xmm3, 880(%esp)
	vmovapd	%xmm2, 896(%esp)
	vmovapd	%xmm0, 960(%esp)
	vdivss	%xmm1, %xmm5, %xmm5
	vmovss	%xmm5, 24(%ebx)
	vmovss	4(%ebx), %xmm4
	vmovaps	%xmm4, %xmm6
	vmovaps	%xmm4, %xmm3
	vfnmadd213ss	28(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 28(%ebx)
	vmovss	8(%ebx), %xmm2
	vmovaps	%xmm2, %xmm6
	vfnmadd213ss	32(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 32(%ebx)
	vmovss	12(%ebx), %xmm0
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	36(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 36(%ebx)
	vmovss	16(%ebx), %xmm4
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	40(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 40(%ebx)
	vmovss	20(%ebx), %xmm7
	vmovss	44(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm5
	vmovss	%xmm5, 44(%ebx)
	vmovaps	1088(%esp), %xmm5
	vdivss	%xmm1, %xmm5, %xmm5
	vmovss	%xmm5, 48(%ebx)
	vmovaps	%xmm3, %xmm6
	vfnmadd213ss	52(%ebx), %xmm5, %xmm6
	vmovaps	%xmm6, 640(%esp)
	vmovss	%xmm6, 52(%ebx)
	vmovaps	%xmm2, %xmm6
	vfnmadd213ss	56(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 56(%ebx)
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	60(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 60(%ebx)
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	64(%ebx), %xmm5, %xmm6
	vmovss	%xmm6, 64(%ebx)
	vmovss	68(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm5
	vmovss	%xmm5, 68(%ebx)
	vmovapd	%xmm1, %xmm5
	vmovaps	880(%esp), %xmm1
	vdivss	%xmm5, %xmm1, %xmm1
	vmovss	%xmm1, 72(%ebx)
	vmovaps	%xmm3, %xmm5
	vfnmadd213ss	76(%ebx), %xmm1, %xmm3
	vmovaps	%xmm3, 1088(%esp)
	vmovss	%xmm3, 76(%ebx)
	vmovaps	%xmm2, %xmm3
	vfnmadd213ss	80(%ebx), %xmm1, %xmm3
	vmovss	%xmm3, 684(%esp)
	vmovss	%xmm3, 80(%ebx)
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	84(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 716(%esp)
	vmovss	%xmm6, 84(%ebx)
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	88(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 736(%esp)
	vmovss	%xmm6, 88(%ebx)
	vmovss	92(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm1
	vmovss	%xmm1, 876(%esp)
	vmovss	%xmm1, 92(%ebx)
	vmovaps	896(%esp), %xmm1
	vdivss	1040(%esp), %xmm1, %xmm1
	vmovss	%xmm1, 96(%ebx)
	vmovaps	%xmm5, %xmm3
	vfnmadd213ss	100(%ebx), %xmm1, %xmm3
	vmovaps	%xmm3, 688(%esp)
	vmovss	%xmm3, 100(%ebx)
	vmovaps	%xmm2, %xmm6
	vfnmadd213ss	104(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 720(%esp)
	vmovss	%xmm6, 104(%ebx)
	vmovaps	%xmm0, %xmm6
	vfnmadd213ss	108(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 764(%esp)
	vmovss	%xmm6, 108(%ebx)
	vmovaps	%xmm4, %xmm6
	vfnmadd213ss	112(%ebx), %xmm1, %xmm6
	vmovss	%xmm6, 768(%esp)
	vmovss	%xmm6, 112(%ebx)
	vmovss	116(%ebx), %xmm6
	vfnmadd213ss	%xmm6, %xmm7, %xmm1
	vmovss	%xmm1, 796(%esp)
	vmovss	%xmm1, 116(%ebx)
	vmovaps	960(%esp), %xmm1
	vdivss	1040(%esp), %xmm1, %xmm1
	vmovss	%xmm1, 120(%ebx)
	vfnmadd213ss	124(%ebx), %xmm1, %xmm5
	vmovaps	%xmm5, 800(%esp)
	vmovss	%xmm5, 124(%ebx)
	vmovaps	%xmm5, %xmm6
	vfnmadd213ss	128(%ebx), %xmm1, %xmm2
	vmovss	%xmm2, 848(%esp)
	vmovss	%xmm2, 128(%ebx)
	vmovaps	640(%esp), %xmm2
	vfnmadd213ss	132(%ebx), %xmm1, %xmm0
	vmovss	%xmm0, 880(%esp)
	vmovss	%xmm0, 132(%ebx)
	vfnmadd213ss	136(%ebx), %xmm1, %xmm4
	vmovss	%xmm4, 896(%esp)
	vmovss	%xmm4, 136(%ebx)
	vfnmadd213ss	140(%ebx), %xmm1, %xmm7
	vmovss	%xmm7, 832(%esp)
	vmovss	%xmm7, 140(%ebx)
	vmovss	28(%ebx), %xmm5
	vmovaps	1008(%esp), %xmm0
	vandps	%xmm0, %xmm5, %xmm1
	vmaxss	.LCPI1_9, %xmm1, %xmm1
	vandps	%xmm0, %xmm2, %xmm4
	vucomiss	%xmm1, %xmm4
	seta	%al
	movzbl	%al, %eax
	incl	%eax
	vmaxss	%xmm1, %xmm4, %xmm1
	vmovaps	1088(%esp), %xmm4
	vandps	%xmm0, %xmm4, %xmm4
	vucomiss	%xmm1, %xmm4
	movl	$3, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm1, %xmm4, %xmm1
	vandps	%xmm0, %xmm3, %xmm4
	vucomiss	%xmm1, %xmm4
	cmoval	%edi, %eax
	vmaxss	%xmm1, %xmm4, %xmm1
	vandps	%xmm0, %xmm6, %xmm4
	vucomiss	%xmm1, %xmm4
	movl	$5, %ecx
	cmoval	%ecx, %eax
	cmpl	$1, %eax
	je	.LBB1_192
	movl	(%edx,%eax,4), %ecx
	movl	4(%edx), %edi
	movl	%ecx, 4(%edx)
	movl	%edi, (%edx,%eax,4)
	vmovss	24(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 24(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	28(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 28(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	32(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 32(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	36(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 36(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	40(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 40(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	44(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 44(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm0
	vmovss	%xmm0, 832(%esp)
	vmovss	136(%ebx), %xmm0
	vmovss	%xmm0, 896(%esp)
	vmovss	132(%ebx), %xmm0
	vmovss	%xmm0, 880(%esp)
	vmovss	128(%ebx), %xmm0
	vmovss	%xmm0, 848(%esp)
	vmovss	124(%ebx), %xmm0
	vmovaps	%xmm0, 800(%esp)
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 796(%esp)
	vmovss	112(%ebx), %xmm0
	vmovss	%xmm0, 768(%esp)
	vmovss	108(%ebx), %xmm0
	vmovss	%xmm0, 764(%esp)
	vmovss	104(%ebx), %xmm0
	vmovss	%xmm0, 720(%esp)
	vmovss	100(%ebx), %xmm0
	vmovaps	%xmm0, 688(%esp)
	vmovss	92(%ebx), %xmm0
	vmovss	%xmm0, 876(%esp)
	vmovss	88(%ebx), %xmm0
	vmovss	%xmm0, 736(%esp)
	vmovss	84(%ebx), %xmm0
	vmovss	%xmm0, 716(%esp)
	vmovss	80(%ebx), %xmm0
	vmovss	%xmm0, 684(%esp)
	vmovss	28(%ebx), %xmm5
	vmovss	52(%ebx), %xmm2
.LBB1_192:
	vmovaps	%xmm5, 608(%esp)
	vdivss	%xmm5, %xmm2, %xmm3
	vmovss	%xmm3, 52(%ebx)
	vmovss	32(%ebx), %xmm6
	vmovaps	%xmm6, %xmm7
	vfnmadd213ss	56(%ebx), %xmm3, %xmm7
	vmovss	%xmm7, 56(%ebx)
	vmovaps	%xmm5, %xmm4
	vmovss	36(%ebx), %xmm5
	vmovaps	%xmm5, %xmm0
	vfnmadd213ss	60(%ebx), %xmm3, %xmm0
	vmovaps	%xmm0, 1040(%esp)
	vmovss	%xmm0, 60(%ebx)
	vmovss	40(%ebx), %xmm2
	vmovaps	%xmm2, %xmm0
	vfnmadd213ss	64(%ebx), %xmm3, %xmm0
	vmovss	%xmm0, 960(%esp)
	vmovss	%xmm0, 64(%ebx)
	vmovss	44(%ebx), %xmm1
	vmovss	68(%ebx), %xmm0
	vfnmadd213ss	%xmm0, %xmm1, %xmm3
	vmovss	%xmm3, 1088(%esp)
	vmovss	%xmm3, 68(%ebx)
	vmovss	76(%ebx), %xmm0
	vdivss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm0, 76(%ebx)
	vmovaps	%xmm6, %xmm3
	vfnmadd213ss	684(%esp), %xmm0, %xmm3
	vmovaps	%xmm3, 640(%esp)
	vmovss	%xmm3, 80(%ebx)
	vmovaps	%xmm5, %xmm3
	vfnmadd213ss	716(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 716(%esp)
	vmovss	%xmm3, 84(%ebx)
	vmovaps	%xmm2, %xmm3
	vfnmadd213ss	736(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 684(%esp)
	vmovss	%xmm3, 88(%ebx)
	vfnmadd213ss	876(%esp), %xmm1, %xmm0
	vmovss	%xmm0, 736(%esp)
	vmovss	%xmm0, 92(%ebx)
	vmovaps	688(%esp), %xmm0
	vdivss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm0, 100(%ebx)
	vmovaps	%xmm6, %xmm4
	vfnmadd213ss	720(%esp), %xmm0, %xmm4
	vmovaps	%xmm4, 720(%esp)
	vmovss	%xmm4, 104(%ebx)
	vmovaps	%xmm5, %xmm3
	vfnmadd213ss	764(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 764(%esp)
	vmovss	%xmm3, 108(%ebx)
	vmovaps	%xmm2, %xmm3
	vfnmadd213ss	768(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 768(%esp)
	vmovss	%xmm3, 112(%ebx)
	vfnmadd213ss	796(%esp), %xmm1, %xmm0
	vmovss	%xmm0, 796(%esp)
	vmovss	%xmm0, 116(%ebx)
	vmovaps	800(%esp), %xmm0
	vdivss	608(%esp), %xmm0, %xmm0
	vmovss	%xmm0, 124(%ebx)
	vfnmadd213ss	848(%esp), %xmm0, %xmm6
	vmovaps	%xmm6, 848(%esp)
	vmovss	%xmm6, 128(%ebx)
	vfnmadd213ss	880(%esp), %xmm0, %xmm5
	vmovss	%xmm5, 876(%esp)
	vmovss	%xmm5, 132(%ebx)
	vfnmadd213ss	896(%esp), %xmm0, %xmm2
	vmovss	%xmm2, 880(%esp)
	vmovss	%xmm2, 136(%ebx)
	vfnmadd213ss	832(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 896(%esp)
	vmovss	%xmm1, 140(%ebx)
	vmovaps	1008(%esp), %xmm5
	vandps	%xmm5, %xmm7, %xmm0
	vmaxss	.LCPI1_9, %xmm0, %xmm0
	vmovaps	640(%esp), %xmm1
	vandps	%xmm5, %xmm1, %xmm2
	vucomiss	%xmm0, %xmm2
	seta	%al
	movzbl	%al, %eax
	orl	$2, %eax
	vmaxss	%xmm0, %xmm2, %xmm0
	vmovaps	%xmm1, %xmm2
	vandps	%xmm5, %xmm4, %xmm1
	vucomiss	%xmm0, %xmm1
	movl	$4, %ecx
	cmoval	%ecx, %eax
	vmaxss	%xmm0, %xmm1, %xmm0
	vandps	%xmm5, %xmm6, %xmm1
	vmovss	684(%esp), %xmm3
	vucomiss	%xmm0, %xmm1
	vmovss	716(%esp), %xmm0
	vmovss	960(%esp), %xmm1
	movl	$5, %ecx
	cmoval	%ecx, %eax
	cmpl	$2, %eax
	movl	%edx, %edi
	je	.LBB1_194
	movl	(%edi,%eax,4), %ecx
	movl	8(%edi), %edx
	movl	%ecx, 8(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	48(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 48(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	52(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 52(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	56(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 56(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	60(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 60(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	64(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 64(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	68(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 68(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm0
	vmovss	%xmm0, 896(%esp)
	vmovss	136(%ebx), %xmm0
	vmovss	%xmm0, 880(%esp)
	vmovss	132(%ebx), %xmm0
	vmovss	%xmm0, 876(%esp)
	vmovss	128(%ebx), %xmm0
	vmovaps	%xmm0, 848(%esp)
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 796(%esp)
	vmovss	112(%ebx), %xmm0
	vmovss	%xmm0, 768(%esp)
	vmovss	108(%ebx), %xmm0
	vmovss	%xmm0, 764(%esp)
	vmovss	104(%ebx), %xmm0
	vmovaps	%xmm0, 720(%esp)
	vmovss	68(%ebx), %xmm0
	vmovss	%xmm0, 1088(%esp)
	vmovss	92(%ebx), %xmm0
	vmovss	%xmm0, 736(%esp)
	vmovss	64(%ebx), %xmm1
	vmovss	88(%ebx), %xmm3
	vmovss	56(%ebx), %xmm7
	vmovss	60(%ebx), %xmm0
	vmovaps	%xmm0, 1040(%esp)
	vmovss	84(%ebx), %xmm0
	vmovss	80(%ebx), %xmm2
.LBB1_194:
	vmovaps	%xmm7, 960(%esp)
	vdivss	%xmm7, %xmm2, %xmm2
	vmovss	%xmm2, 80(%ebx)
	vmovaps	1040(%esp), %xmm6
	vmovaps	%xmm6, %xmm5
	vfnmadd213ss	%xmm0, %xmm2, %xmm5
	vmovss	%xmm5, 84(%ebx)
	vmovaps	%xmm1, %xmm0
	vfnmadd213ss	%xmm3, %xmm2, %xmm0
	vmovaps	%xmm0, 800(%esp)
	vmovss	%xmm0, 88(%ebx)
	vmovss	1088(%esp), %xmm0
	vfnmadd213ss	736(%esp), %xmm0, %xmm2
	vmovss	%xmm2, 92(%ebx)
	vmovaps	720(%esp), %xmm3
	vdivss	%xmm7, %xmm3, %xmm3
	vmovss	%xmm3, 104(%ebx)
	vmovaps	%xmm6, %xmm4
	vfnmadd213ss	764(%esp), %xmm3, %xmm4
	vmovss	%xmm4, 108(%ebx)
	vmovaps	%xmm1, %xmm7
	vfnmadd213ss	768(%esp), %xmm3, %xmm7
	vmovss	%xmm7, 112(%ebx)
	vfnmadd213ss	796(%esp), %xmm0, %xmm3
	vmovss	%xmm3, 832(%esp)
	vmovss	%xmm3, 116(%ebx)
	vmovaps	848(%esp), %xmm3
	vdivss	960(%esp), %xmm3, %xmm3
	vmovss	%xmm3, 128(%ebx)
	vfnmadd213ss	876(%esp), %xmm3, %xmm6
	vmovaps	%xmm6, 1040(%esp)
	vmovss	%xmm6, 132(%ebx)
	vfnmadd213ss	880(%esp), %xmm3, %xmm1
	vmovss	%xmm1, 960(%esp)
	vmovss	%xmm1, 136(%ebx)
	vfnmadd213ss	896(%esp), %xmm3, %xmm0
	vmovss	%xmm0, 1088(%esp)
	vmovss	%xmm0, 140(%ebx)
	vmovaps	%xmm5, %xmm0
	vmovaps	%xmm4, %xmm5
	vmovaps	1008(%esp), %xmm4
	vandps	%xmm4, %xmm0, %xmm1
	vmaxss	.LCPI1_9, %xmm1, %xmm3
	vandps	%xmm4, %xmm5, %xmm1
	vucomiss	%xmm3, %xmm1
	seta	%al
	movzbl	%al, %eax
	addl	$3, %eax
	vmaxss	%xmm3, %xmm1, %xmm1
	vandps	%xmm4, %xmm6, %xmm3
	vucomiss	%xmm1, %xmm3
	vmovaps	800(%esp), %xmm1
	movl	$5, %ecx
	cmoval	%ecx, %eax
	cmpl	$3, %eax
	je	.LBB1_196
	movl	(%edi,%eax,4), %ecx
	movl	12(%edi), %edx
	movl	%ecx, 12(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	72(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 72(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	76(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 76(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	80(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 80(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	84(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 84(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	88(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 88(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	92(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 92(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm0
	vmovss	%xmm0, 1088(%esp)
	vmovss	136(%ebx), %xmm0
	vmovss	%xmm0, 960(%esp)
	vmovss	132(%ebx), %xmm0
	vmovaps	%xmm0, 1040(%esp)
	vmovss	92(%ebx), %xmm2
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 832(%esp)
	vmovss	84(%ebx), %xmm0
	vmovss	88(%ebx), %xmm1
	vmovss	112(%ebx), %xmm7
	vmovss	108(%ebx), %xmm5
.LBB1_196:
	vdivss	%xmm0, %xmm5, %xmm3
	vmovaps	%xmm1, %xmm5
	vfnmadd213ss	%xmm7, %xmm3, %xmm5
	vmovaps	1008(%esp), %xmm6
	vmovaps	%xmm1, %xmm7
	vandps	%xmm6, %xmm5, %xmm1
	vmaxss	.LCPI1_9, %xmm1, %xmm4
	vmovaps	1040(%esp), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vfnmadd213ss	960(%esp), %xmm0, %xmm7
	vandps	%xmm6, %xmm7, %xmm1
	vucomiss	%xmm4, %xmm1
	seta	%al
	vucomiss	%xmm4, %xmm1
	vmovaps	%xmm7, %xmm1
	vmovss	%xmm3, 108(%ebx)
	vmovss	%xmm5, 112(%ebx)
	vfnmadd213ss	832(%esp), %xmm2, %xmm3
	vmovss	%xmm3, 116(%ebx)
	vmovss	%xmm0, 132(%ebx)
	vmovss	%xmm1, 136(%ebx)
	vfnmadd213ss	1088(%esp), %xmm0, %xmm2
	vmovss	%xmm2, 140(%ebx)
	jbe	.LBB1_198
	movzbl	%al, %eax
	orl	$4, %eax
	movl	(%edi,%eax,4), %ecx
	movl	16(%edi), %edx
	movl	%ecx, 16(%edi)
	movl	%edx, (%edi,%eax,4)
	vmovss	96(%ebx), %xmm0
	vmovss	%xmm0, (%esi)
	imull	$6, %eax, %eax
	vmovss	(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 96(%ebx)
	vmovss	(%esi), %xmm0
	vmovss	%xmm0, (%ebx,%eax,4)
	vmovss	100(%ebx), %xmm0
	vmovss	%xmm0, 4(%esi)
	vmovss	4(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 100(%ebx)
	vmovss	4(%esi), %xmm0
	vmovss	%xmm0, 4(%ebx,%eax,4)
	vmovss	104(%ebx), %xmm0
	vmovss	%xmm0, 8(%esi)
	vmovss	8(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 104(%ebx)
	vmovss	8(%esi), %xmm0
	vmovss	%xmm0, 8(%ebx,%eax,4)
	vmovss	108(%ebx), %xmm0
	vmovss	%xmm0, 12(%esi)
	vmovss	12(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 108(%ebx)
	vmovss	12(%esi), %xmm0
	vmovss	%xmm0, 12(%ebx,%eax,4)
	vmovss	112(%ebx), %xmm0
	vmovss	%xmm0, 16(%esi)
	vmovss	16(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 112(%ebx)
	vmovss	16(%esi), %xmm0
	vmovss	%xmm0, 16(%ebx,%eax,4)
	vmovss	116(%ebx), %xmm0
	vmovss	%xmm0, 20(%esi)
	vmovss	20(%ebx,%eax,4), %xmm0
	vmovss	%xmm0, 116(%ebx)
	vmovss	20(%esi), %xmm0
	vmovss	%xmm0, 20(%ebx,%eax,4)
	vmovss	140(%ebx), %xmm2
	vmovss	112(%ebx), %xmm5
	vmovss	116(%ebx), %xmm3
	vmovss	136(%ebx), %xmm1
.LBB1_198:
	vdivss	%xmm5, %xmm1, %xmm0
	vmovss	%xmm0, 136(%ebx)
	vfnmadd213ss	%xmm2, %xmm0, %xmm3
	vmovss	%xmm3, 140(%ebx)
	movl	(%edi), %eax
	movl	828(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm0
	imull	$6, 912(%esp), %esi
	movl	%edi, %edx
	movl	1000(%esp), %edi
	vmovss	%xmm0, (%edi,%esi,4)
	movl	4(%edx), %eax
	vmovss	(%ecx,%eax,4), %xmm2
	vmovss	%xmm2, 4(%edi,%esi,4)
	vmovss	24(%ebx), %xmm1
	vfnmadd213ss	%xmm2, %xmm0, %xmm1
	vmovss	%xmm1, 4(%edi,%esi,4)
	movl	8(%edx), %eax
	vmovss	(%ecx,%eax,4), %xmm3
	vmovss	%xmm3, 8(%edi,%esi,4)
	leal	2(%esi), %eax
	movl	%eax, 1088(%esp)
	leal	1(%esi), %eax
	movl	%eax, 960(%esp)
	xorl	%eax, %eax
	movl	$2, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB1_199:
	vmovss	48(%ebx,%eax), %xmm4
	movl	1104(%esp), %edi
	vmovss	(%edi,%eax), %xmm2
	vfnmadd213ss	%xmm3, %xmm4, %xmm2
	movl	1000(%esp), %edi
	vmovss	%xmm2, 8(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm2, %xmm3
	jne	.LBB1_199
	movl	788(%esp), %eax
	movl	12(%eax), %eax
	movl	828(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm4
	movl	1000(%esp), %eax
	vmovss	%xmm4, 12(%eax,%esi,4)
	leal	3(%esi), %eax
	movl	%eax, 1040(%esp)
	xorl	%eax, %eax
	movl	$3, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB1_201:
	vmovss	72(%ebx,%eax), %xmm5
	movl	1104(%esp), %edi
	vmovss	(%edi,%eax), %xmm3
	vfnmadd213ss	%xmm4, %xmm5, %xmm3
	movl	1000(%esp), %edi
	vmovss	%xmm3, 12(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm3, %xmm4
	jne	.LBB1_201
	movl	788(%esp), %eax
	movl	16(%eax), %eax
	movl	828(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm5
	movl	1000(%esp), %eax
	vmovss	%xmm5, 16(%eax,%esi,4)
	leal	4(%esi), %eax
	movl	%eax, 1008(%esp)
	xorl	%eax, %eax
	movl	$4, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB1_203:
	vmovss	96(%ebx,%eax), %xmm6
	movl	1104(%esp), %edi
	vmovss	(%edi,%eax), %xmm4
	vfnmadd213ss	%xmm5, %xmm6, %xmm4
	movl	1000(%esp), %edi
	vmovss	%xmm4, 16(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm4, %xmm5
	jne	.LBB1_203
	movl	788(%esp), %eax
	movl	20(%eax), %eax
	movl	828(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm6
	movl	1000(%esp), %eax
	vmovss	%xmm6, 20(%eax,%esi,4)
	leal	5(%esi), %eax
	movl	%eax, 896(%esp)
	xorl	%eax, %eax
	movl	$5, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB1_205:
	vmovss	120(%ebx,%eax), %xmm7
	movl	1104(%esp), %edi
	vmovss	(%edi,%eax), %xmm5
	vfnmadd213ss	%xmm6, %xmm7, %xmm5
	movl	1000(%esp), %edi
	vmovss	%xmm5, 20(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm5, %xmm6
	jne	.LBB1_205
	vmovss	(%ebx), %xmm6
	vfnmadd213ss	%xmm0, %xmm6, %xmm0
	movl	1000(%esp), %edi
	vmovss	%xmm0, (%edi,%esi,4)
	vmovss	4(%ebx), %xmm6
	vfnmadd213ss	%xmm0, %xmm6, %xmm1
	vmovss	%xmm1, (%edi,%esi,4)
	vmovss	8(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm0, %xmm2
	vmovss	%xmm2, (%edi,%esi,4)
	vmovss	12(%ebx), %xmm0
	vfnmadd213ss	%xmm2, %xmm0, %xmm3
	vmovss	%xmm3, (%edi,%esi,4)
	vmovss	16(%ebx), %xmm0
	vfnmadd213ss	%xmm3, %xmm0, %xmm4
	vmovss	%xmm4, (%edi,%esi,4)
	vmovss	20(%ebx), %xmm0
	vfnmadd213ss	%xmm4, %xmm0, %xmm5
	vmovss	%xmm5, (%edi,%esi,4)
	vdivss	(%ebx), %xmm5, %xmm0
	vmovss	%xmm0, (%edi,%esi,4)
	movl	%esi, 1760(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1764(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	792(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1760(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	960(%esp), %eax
	vmovss	(%edi,%eax,4), %xmm1
	vmovss	28(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, (%edi,%eax,4)
	vmovss	8(%edi,%esi,4), %xmm2
	vmovss	32(%ebx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	vmovss	%xmm1, (%edi,%eax,4)
	vmovss	12(%edi,%esi,4), %xmm2
	vmovss	36(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	vmovss	%xmm0, (%edi,%eax,4)
	vmovss	16(%edi,%esi,4), %xmm2
	vmovss	40(%ebx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	vmovss	%xmm1, (%edi,%eax,4)
	vmovss	20(%edi,%esi,4), %xmm2
	vmovss	44(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	vmovss	%xmm0, (%edi,%eax,4)
	vdivss	48(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, (%edi,%eax,4)
	movl	%eax, 1772(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1776(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	792(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1772(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	vmovss	8(%edi,%esi,4), %xmm1
	vmovss	56(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, 8(%edi,%esi,4)
	vmovss	12(%edi,%esi,4), %xmm2
	vmovss	60(%ebx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	vmovss	%xmm1, 8(%edi,%esi,4)
	vmovss	16(%edi,%esi,4), %xmm2
	vmovss	64(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	vmovss	%xmm0, 8(%edi,%esi,4)
	vmovss	20(%edi,%esi,4), %xmm2
	vmovss	68(%ebx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	vmovss	%xmm1, 8(%edi,%esi,4)
	vdivss	152(%ebx), %xmm1, %xmm0
	vmovss	%xmm0, 8(%edi,%esi,4)
	movl	1088(%esp), %eax
	movl	%eax, 1784(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1788(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	792(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1784(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	vmovss	12(%edi,%esi,4), %xmm1
	vmovss	84(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, 12(%edi,%esi,4)
	vmovss	16(%edi,%esi,4), %xmm2
	vmovss	88(%ebx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	vmovss	%xmm1, 12(%edi,%esi,4)
	vmovss	20(%edi,%esi,4), %xmm2
	vmovss	92(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	vmovss	%xmm0, 12(%edi,%esi,4)
	vdivss	84(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, 12(%edi,%esi,4)
	movl	1040(%esp), %eax
	movl	%eax, 1796(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1800(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	792(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1796(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	vmovss	16(%edi,%esi,4), %xmm1
	vmovss	112(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, 16(%edi,%esi,4)
	vmovss	20(%edi,%esi,4), %xmm2
	vmovss	116(%ebx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	vmovss	%xmm1, 16(%edi,%esi,4)
	vdivss	112(%ebx), %xmm1, %xmm0
	vmovss	%xmm0, 16(%edi,%esi,4)
	movl	1008(%esp), %eax
	movl	%eax, 1808(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1812(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	792(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1808(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	vmovss	20(%edi,%esi,4), %xmm1
	vmovss	140(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, 20(%edi,%esi,4)
	vdivss	164(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, 20(%edi,%esi,4)
	movl	896(%esp), %eax
	movl	%eax, 1820(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1824(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	792(%esp), %esi
	movl	%esi, 8(%esp)
	leal	1820(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1835(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	movl	1056(%esp), %edi
	movl	512(%esp), %eax
	addl	%eax, %edi
	addl	%eax, 1036(%esp)
	calll	opencl_printf
	movl	1104(%esp), %eax
	addl	$24, %eax
	incl	912(%esp)
	movl	680(%esp), %ecx
	incl	%ecx
	cmpl	276(%esp), %ecx
	movl	1168(%esp), %ebx
	movl	1004(%esp), %edx
	jne	.LBB1_74
.LBB1_207:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp19:
	.size	build_polinome, .Ltmp19-build_polinome
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI2_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
.LCPI2_2:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_1:
	.long	1065353216
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_3:
	.zero	16
	.text
	.globl	build_polinome_square_root
	.align	16, 0x90
	.type	build_polinome_square_root,@function
build_polinome_square_root:
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
	andl	$-32, %esp
	subl	$1248, %esp
.Ltmp26:
	.cfi_offset %esi, -20
.Ltmp27:
	.cfi_offset %edi, -16
.Ltmp28:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	64(%eax), %edx
	movl	%edx, 148(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %ecx
	imull	%edx, %ecx
	addl	40(%eax), %ecx
	movl	%ecx, 36(%esp)
	movl	32(%eax), %edi
	movl	%edi, 784(%esp)
	movl	28(%eax), %ecx
	movl	%ecx, 772(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 732(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 352(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 316(%esp)
	movl	12(%eax), %ecx
	movl	%ecx, 780(%esp)
	movl	8(%eax), %ecx
	movl	%ecx, 308(%esp)
	movl	(%eax), %ecx
	movl	%ecx, 728(%esp)
	movl	4(%eax), %ecx
	movl	%ecx, 144(%esp)
	movl	100(%eax), %eax
	movl	%eax, 776(%esp)
	sarl	$3, %edx
	movl	%edx, 140(%esp)
	je	.LBB2_43
	vmovd	%edi, %xmm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm1
	movl	36(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI2_0, %ymm0, %ymm0
	vpmulld	%ymm1, %ymm0, %ymm3
	vmovdqa	%ymm3, 608(%esp)
	vmovd	%xmm3, %ecx
	vpextrd	$1, %xmm3, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vmovaps	%ymm1, 96(%esp)
	movl	732(%esp), %edx
	vmovd	%edx, %xmm1
	vpermd	%ymm1, %ymm2, %ymm1
	vpmulld	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%esp)
	vmovd	%xmm0, %ecx
	vpextrd	$1, %xmm0, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 64(%esp)
	movl	308(%esp), %eax
	leal	(%eax,%edi,4), %eax
	movl	%eax, 60(%esp)
	leal	(,%edi,4), %esi
	movl	%esi, 664(%esp)
	movl	$-4, %eax
	subl	%esi, %eax
	movl	%eax, 292(%esp)
	leal	-1(%edi), %ecx
	movl	%ecx, 304(%esp)
	movl	%edi, %eax
	imull	%ecx, %eax
	movl	772(%esp), %ecx
	leal	-4(%ecx,%eax,4), %eax
	movl	%eax, 56(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI2_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovaps	%ymm0, 320(%esp)
	vpermps	%ymm0, %ymm2, %ymm0
	vmovaps	%ymm0, 256(%esp)
	leal	8(%ecx), %eax
	movl	%eax, 52(%esp)
	leal	4(,%edi,4), %eax
	movl	%eax, 252(%esp)
	leal	8(,%edi,4), %eax
	movl	%eax, 48(%esp)
	leal	4(%ecx), %eax
	movl	%eax, 44(%esp)
	leal	-2(%edi), %eax
	movl	%eax, 156(%esp)
	movl	%edi, %eax
	imull	%eax, %eax
	movl	%eax, 40(%esp)
	sarl	$31, %esi
	movl	%esi, 792(%esp)
	xorl	%eax, %eax
	vmovaps	%ymm3, 160(%esp)
	.align	16, 0x90
.LBB2_2:
	movl	%eax, 152(%esp)
	testl	%edi, %edi
	jle	.LBB2_12
	vmovdqa	192(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	144(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 672(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 668(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 592(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 544(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 512(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 496(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 492(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 488(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB2_4:
	movl	%eax, 788(%esp)
	imull	%edi, %eax
	movl	%eax, 736(%esp)
	movl	$0, 796(%esp)
	.align	16, 0x90
.LBB2_5:
	vxorpd	%xmm1, %xmm1, %xmm1
	cmpl	$0, 732(%esp)
	jle	.LBB2_8
	movl	788(%esp), %eax
	movl	796(%esp), %ecx
	leal	(%ecx,%eax), %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	728(%esp), %esi
	movl	732(%esp), %edi
	.align	16, 0x90
.LBB2_7:
	vmovss	%xmm1, 800(%esp)
	vmovss	(%esi), %xmm0
	movl	%ebx, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	800(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB2_7
.LBB2_8:
	vmovaps	320(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	736(%esp), %eax
	movl	796(%esp), %edx
	leal	(%edx,%eax), %eax
	movl	780(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	incl	%edx
	movl	%edx, 796(%esp)
	cmpl	784(%esp), %edx
	jne	.LBB2_5
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	732(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %edi
	movl	$0, %ebx
	jle	.LBB2_11
	.align	16, 0x90
.LBB2_10:
	vmovapd	%ymm1, 800(%esp)
	movl	728(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	788(%esp), %eax
	movl	%eax, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	592(%esp), %edx
	movl	668(%esp), %ecx
	movl	544(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vinsertps	$16, (%edx,%esi), %xmm1, %xmm1
	movl	512(%esp), %edx
	vinsertps	$32, (%ecx,%esi), %xmm1, %xmm1
	movl	672(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	488(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	492(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	496(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	vinsertps	$48, (%edx,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	800(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB2_10
.LBB2_11:
	vmovaps	256(%esp), %ymm0
	vmulps	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	316(%esp), %eax
	movl	788(%esp), %ecx
	vextractps	$3, %xmm0, (%eax,%ecx,4)
	incl	%ecx
	movl	784(%esp), %edi
	cmpl	%edi, %ecx
	movl	%ecx, %eax
	jne	.LBB2_4
.LBB2_12:
	movl	780(%esp), %eax
	vmovss	(%eax), %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	772(%esp), %ecx
	vmovss	%xmm0, (%ecx)
	movl	$2, %eax
	cmpl	$1, %edi
	movl	352(%esp), %edx
	jg	.LBB2_13
	movl	316(%esp), %eax
	vmovss	(%eax), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	%eax, (%edx)
	vmovdqa	160(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	vpextrd	$2, %xmm0, %ebx
	vpextrd	$1, %xmm0, %esi
	movl	%esi, 464(%esp)
	vmovd	%xmm0, 468(%esp)
	vpextrd	$3, %xmm1, %esi
	movl	%esi, 472(%esp)
	vpextrd	$2, %xmm1, %esi
	movl	%esi, 476(%esp)
	vpextrd	$1, %xmm1, %edi
	vmovd	%xmm1, %esi
	vmovaps	%ymm1, 384(%esp)
	jmp	.LBB2_37
	.align	16, 0x90
.LBB2_14:
	incl	%eax
	vmovss	(%ecx), %xmm0
.LBB2_13:
	movl	780(%esp), %edx
	vmovss	-4(%edx,%eax,4), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -4(%ecx,%eax,4)
	cmpl	%eax, %edi
	jne	.LBB2_14
	vmovapd	608(%esp), %ymm0
	vmovd	%xmm0, %eax
	movl	%eax, 484(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 384(%esp)
	vpextrd	$1, %xmm0, %eax
	movl	%eax, 480(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 380(%esp)
	vpextrd	$2, %xmm0, %eax
	movl	%eax, 476(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 376(%esp)
	vpextrd	$3, %xmm0, %eax
	movl	%eax, 472(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 372(%esp)
	vextractf128	$1, %ymm0, %xmm0
	vmovd	%xmm0, %eax
	movl	%eax, 468(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 368(%esp)
	vpextrd	$1, %xmm0, %eax
	movl	%eax, 464(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 364(%esp)
	vpextrd	$2, %xmm0, %eax
	movl	%eax, 488(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 360(%esp)
	vpextrd	$3, %xmm0, %eax
	movl	%eax, 460(%esp)
	leal	8(%ecx,%eax,4), %eax
	movl	%eax, 356(%esp)
	movl	$1, 312(%esp)
	xorl	%eax, %eax
	movl	$3, 300(%esp)
	movl	52(%esp), %ecx
	movl	%ecx, 296(%esp)
	movl	48(%esp), %ecx
	movl	%ecx, 492(%esp)
	movl	44(%esp), %edx
	.align	16, 0x90
.LBB2_16:
	movl	%edx, 788(%esp)
	movl	%eax, 796(%esp)
	movl	312(%esp), %ecx
	movl	%ecx, %eax
	imull	%edi, %eax
	movl	%eax, 432(%esp)
	leal	(%eax,%ecx), %edx
	movl	%edx, 668(%esp)
	movl	780(%esp), %eax
	vmovss	(%eax,%edx,4), %xmm0
	leal	-1(%ecx), %eax
	movl	%eax, 800(%esp)
	testl	%eax, %eax
	jle	.LBB2_17
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	796(%esp), %ebx
	movl	788(%esp), %eax
	.align	16, 0x90
.LBB2_19:
	movl	%esi, %edi
	addl	664(%esp), %edi
	adcl	792(%esp), %ecx
	vmovss	(%eax,%esi), %xmm1
	vfnmadd213ss	%xmm0, %xmm1, %xmm1
	incl	%edx
	cmpl	%edx, %ebx
	movl	%edi, %esi
	vmovaps	%xmm1, %xmm0
	jne	.LBB2_19
	jmp	.LBB2_20
	.align	16, 0x90
.LBB2_17:
	vmovaps	%xmm0, %xmm1
	movl	796(%esp), %ebx
	movl	788(%esp), %eax
.LBB2_20:
	movl	%eax, 788(%esp)
	movl	%ebx, 796(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm1, %xmm0, %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	772(%esp), %ecx
	movl	668(%esp), %eax
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	312(%esp), %eax
	incl	%eax
	movl	%eax, 312(%esp)
	movl	784(%esp), %edi
	cmpl	%edi, %eax
	jge	.LBB2_29
	cmpl	$0, 800(%esp)
	movl	296(%esp), %eax
	movl	312(%esp), %edx
	jg	.LBB2_27
	xorl	%esi, %esi
	movl	300(%esp), %ebx
	jmp	.LBB2_23
	.align	16, 0x90
.LBB2_24:
	movl	668(%esp), %eax
	movl	772(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm0
	incl	%ebx
	addl	$4, %esi
.LBB2_23:
	movl	%ebx, 672(%esp)
	movl	492(%esp), %eax
	leal	(%eax,%esi), %eax
	movl	780(%esp), %edx
	vmovss	(%edx,%eax), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%ecx,%eax)
	movl	364(%esp), %eax
	leal	(%eax,%esi), %eax
	movl	368(%esp), %ecx
	leal	(%ecx,%esi), %ecx
	movl	796(%esp), %edx
	vmovss	(%ecx,%edx,4), %xmm0
	vinsertps	$16, (%eax,%edx,4), %xmm0, %xmm0
	vmovaps	%xmm0, 592(%esp)
	movl	380(%esp), %eax
	leal	(%eax,%esi), %eax
	movl	384(%esp), %ecx
	leal	(%ecx,%esi), %ecx
	vmovss	(%ecx,%edx,4), %xmm0
	vinsertps	$16, (%eax,%edx,4), %xmm0, %xmm0
	movl	356(%esp), %eax
	leal	(%eax,%esi), %eax
	vmovss	(%eax,%edx,4), %xmm1
	vmovaps	%xmm1, 544(%esp)
	movl	360(%esp), %eax
	leal	(%eax,%esi), %eax
	vmovss	(%eax,%edx,4), %xmm1
	vmovaps	%xmm1, 512(%esp)
	movl	372(%esp), %eax
	leal	(%eax,%esi), %eax
	vmovss	(%eax,%edx,4), %xmm1
	movl	376(%esp), %eax
	leal	(%eax,%esi), %eax
	vmovss	(%eax,%edx,4), %xmm2
	leal	-1(%ebx), %eax
	vmovd	%eax, %xmm3
	vbroadcastss	%xmm3, %ymm3
	vpaddd	608(%esp), %ymm3, %ymm3
	vmovdqa	%ymm3, 800(%esp)
	vmovd	%xmm3, 928(%esp)
	vinsertps	$32, %xmm2, %xmm0, %xmm0
	vinsertps	$48, %xmm1, %xmm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 736(%esp)
	vmovlpd	%xmm0, 932(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	776(%esp), %edi
	movl	%edi, 8(%esp)
	leal	928(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	800(%esp), %ymm0
	vpextrd	$1, %xmm0, 940(%esp)
	vmovapd	736(%esp), %ymm0
	vmovhpd	%xmm0, 944(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	940(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	800(%esp), %ymm0
	vpextrd	$2, %xmm0, 952(%esp)
	vmovapd	736(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 736(%esp)
	vmovlpd	%xmm0, 956(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	952(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	800(%esp), %ymm0
	vpextrd	$3, %xmm0, 964(%esp)
	vmovapd	736(%esp), %xmm1
	vmovhpd	%xmm1, 968(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	964(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vextracti128	$1, %ymm0, 800(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	800(%esp), %xmm0
	vmovd	%xmm0, 976(%esp)
	vmovaps	592(%esp), %xmm0
	vmovaps	512(%esp), %xmm1
	vinsertps	$32, %xmm1, %xmm0, %xmm0
	vmovaps	544(%esp), %xmm1
	vinsertps	$48, %xmm1, %xmm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 736(%esp)
	vmovlpd	%xmm0, 980(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	976(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	800(%esp), %xmm0
	vpextrd	$1, %xmm0, 988(%esp)
	vmovapd	736(%esp), %ymm0
	vmovhpd	%xmm0, 992(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	988(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	800(%esp), %xmm0
	vpextrd	$2, %xmm0, 1000(%esp)
	vmovapd	736(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 736(%esp)
	vmovlpd	%xmm0, 1004(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1000(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	800(%esp), %xmm0
	vpextrd	$3, %xmm0, 1012(%esp)
	vmovapd	736(%esp), %xmm0
	vmovhpd	%xmm0, 1016(%esp)
	movl	%ebx, 12(%esp)
	movl	672(%esp), %ebx
	movl	%edi, 8(%esp)
	leal	1012(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	calll	opencl_printf
	movl	784(%esp), %edi
	cmpl	%ebx, %edi
	jne	.LBB2_24
	jmp	.LBB2_29
	.align	16, 0x90
.LBB2_27:
	movl	%eax, 800(%esp)
	movl	%edx, 592(%esp)
	movl	432(%esp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, 736(%esp)
	movl	780(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm1
	vmovd	%edx, %xmm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	movl	664(%esp), %esi
	.align	16, 0x90
.LBB2_25:
	movl	788(%esp), %edi
	vmovss	(%edi,%ebx), %xmm3
	movl	800(%esp), %edi
	vmovss	(%edi,%ecx), %xmm2
	vfnmadd213ss	%xmm1, %xmm3, %xmm2
	addl	%esi, %ecx
	adcl	792(%esp), %edx
	addl	%esi, %ebx
	incl	%eax
	cmpl	%eax, 796(%esp)
	vmovdqa	%xmm2, %xmm1
	jne	.LBB2_25
	movl	772(%esp), %eax
	movl	668(%esp), %ecx
	vdivss	(%eax,%ecx,4), %xmm2, %xmm1
	movl	736(%esp), %ecx
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	592(%esp), %edi
	leal	(%eax,%edi,4), %eax
	movl	468(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm1
	movl	464(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm1, %xmm1
	vmovaps	%xmm1, 544(%esp)
	movl	484(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm1
	movl	480(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm1, %xmm1
	movl	460(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	vmovaps	%xmm2, 512(%esp)
	movl	488(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	vmovaps	%xmm2, 496(%esp)
	movl	472(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	movl	476(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm3
	vpaddd	608(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 736(%esp)
	vmovd	%xmm0, 832(%esp)
	vinsertps	$32, %xmm3, %xmm1, %xmm0
	vinsertps	$48, %xmm2, %xmm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 672(%esp)
	vmovlpd	%xmm0, 836(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	776(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	832(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	736(%esp), %ymm0
	vpextrd	$1, %xmm0, 844(%esp)
	vmovapd	672(%esp), %ymm0
	vmovhpd	%xmm0, 848(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	844(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	736(%esp), %ymm0
	vpextrd	$2, %xmm0, 856(%esp)
	vmovapd	672(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 672(%esp)
	vmovlpd	%xmm0, 860(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	856(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	736(%esp), %ymm0
	vpextrd	$3, %xmm0, 868(%esp)
	vmovapd	672(%esp), %xmm1
	vmovhpd	%xmm1, 872(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	868(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vextracti128	$1, %ymm0, 736(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	736(%esp), %xmm0
	vmovd	%xmm0, 880(%esp)
	vmovaps	544(%esp), %xmm0
	vmovaps	496(%esp), %xmm1
	vinsertps	$32, %xmm1, %xmm0, %xmm0
	vmovaps	512(%esp), %xmm1
	vinsertps	$48, %xmm1, %xmm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 672(%esp)
	vmovlpd	%xmm0, 884(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	880(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	736(%esp), %xmm0
	vpextrd	$1, %xmm0, 892(%esp)
	vmovapd	672(%esp), %ymm0
	vmovhpd	%xmm0, 896(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	892(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	736(%esp), %xmm0
	vpextrd	$2, %xmm0, 904(%esp)
	vmovapd	672(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 672(%esp)
	vmovlpd	%xmm0, 908(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	904(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	736(%esp), %xmm0
	vpextrd	$3, %xmm0, 916(%esp)
	vmovapd	672(%esp), %xmm0
	vmovhpd	%xmm0, 920(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	916(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	calll	opencl_printf
	movl	%edi, %edx
	movl	800(%esp), %eax
	addl	$4, %eax
	incl	%edx
	movl	784(%esp), %edi
	cmpl	%edi, %edx
	jne	.LBB2_27
	.align	16, 0x90
.LBB2_29:
	movl	492(%esp), %eax
	addl	252(%esp), %eax
	movl	%eax, 492(%esp)
	incl	300(%esp)
	addl	$4, 296(%esp)
	movl	788(%esp), %edx
	addl	$4, %edx
	movl	796(%esp), %eax
	incl	%eax
	cmpl	304(%esp), %eax
	movl	352(%esp), %ecx
	jne	.LBB2_16
	movl	316(%esp), %eax
	vmovss	(%eax), %xmm0
	movl	772(%esp), %eax
	vdivss	(%eax), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	%eax, (%ecx)
	movl	$1, %esi
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB2_31:
	movl	316(%esp), %eax
	vmovss	(%eax,%esi,4), %xmm1
	leal	-1(%esi), %eax
	testl	%eax, %eax
	jle	.LBB2_32
	movl	772(%esp), %eax
	leal	4(%eax,%ecx,4), %eax
	movl	%ecx, 800(%esp)
	movl	352(%esp), %ecx
	xorl	%edx, %edx
	movl	784(%esp), %ebx
	movl	664(%esp), %edi
	.align	16, 0x90
.LBB2_34:
	vcvtsi2ssl	(%ecx), %xmm0, %xmm2
	vmovss	(%eax), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	addl	%edi, %eax
	addl	$4, %ecx
	incl	%edx
	cmpl	%edx, 800(%esp)
	vmovapd	%xmm0, %xmm1
	jne	.LBB2_34
	jmp	.LBB2_35
	.align	16, 0x90
.LBB2_32:
	vmovapd	%xmm1, %xmm0
	movl	784(%esp), %ebx
	movl	%ecx, 800(%esp)
.LBB2_35:
	movl	%esi, %eax
	imull	%ebx, %eax
	addl	%esi, %eax
	movl	772(%esp), %ecx
	vdivss	(%ecx,%eax,4), %xmm0, %xmm0
	vcvttss2si	%xmm0, %ecx
	movl	%ecx, 796(%esp)
	movl	352(%esp), %eax
	movl	%ecx, (%eax,%esi,4)
	movl	%esi, 1024(%esp)
	movl	%ecx, 1028(%esp)
	movl	%ecx, %edi
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1024(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	%esi, 1032(%esp)
	movl	%edi, 1036(%esp)
	movl	%ebx, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1032(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 1040(%esp)
	movl	%edi, 1044(%esp)
	movl	%ebx, 12(%esp)
	movl	776(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1040(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 1048(%esp)
	movl	796(%esp), %eax
	movl	%eax, 1052(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1048(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 1056(%esp)
	movl	796(%esp), %edi
	movl	%edi, 1060(%esp)
	movl	%ebx, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1056(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 1064(%esp)
	movl	%edi, 1068(%esp)
	movl	%ebx, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1064(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 1072(%esp)
	movl	%edi, 1076(%esp)
	movl	%ebx, 12(%esp)
	movl	776(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1072(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 1080(%esp)
	movl	796(%esp), %eax
	movl	%eax, 1084(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1080(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	incl	%esi
	movl	800(%esp), %eax
	incl	%eax
	cmpl	304(%esp), %eax
	movl	%eax, %ecx
	jne	.LBB2_31
	vmovapd	608(%esp), %ymm0
	vmovapd	%ymm0, 384(%esp)
	movl	772(%esp), %ecx
	movl	352(%esp), %edx
	movl	484(%esp), %esi
	movl	480(%esp), %edi
	movl	488(%esp), %ebx
	movl	460(%esp), %eax
.LBB2_37:
	movl	%ebx, 488(%esp)
	movl	%eax, 460(%esp)
	movl	%edi, 480(%esp)
	movl	%esi, 484(%esp)
	movl	%edx, 352(%esp)
	movl	784(%esp), %ebx
	vcvtsi2ssl	-4(%edx,%ebx,4), %xmm0, %xmm0
	movl	%eax, %edx
	movl	40(%esp), %eax
	vdivss	-4(%ecx,%eax,4), %xmm0, %xmm0
	movl	308(%esp), %eax
	movl	304(%esp), %ecx
	leal	(%eax,%ecx,4), %eax
	vmovss	%xmm0, (%eax,%esi,4)
	vmovss	%xmm0, (%eax,%edi,4)
	movl	476(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	472(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	468(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	464(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	488(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	vmovss	%xmm0, (%eax,%edx,4)
	cmpl	$0, 156(%esp)
	js	.LBB2_42
	movl	60(%esp), %eax
	movl	484(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 796(%esp)
	movl	480(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 788(%esp)
	movl	476(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 736(%esp)
	movl	472(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 672(%esp)
	movl	468(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 668(%esp)
	movl	464(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 592(%esp)
	movl	488(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 380(%esp)
	movl	460(%esp), %ecx
	leal	(%eax,%ecx,4), %eax
	movl	%eax, 376(%esp)
	movl	$-1, %edx
	movl	56(%esp), %eax
	movl	156(%esp), %esi
	.align	16, 0x90
.LBB2_39:
	movl	%eax, 800(%esp)
	movl	%esi, 492(%esp)
	movl	%edx, 496(%esp)
	movl	352(%esp), %eax
	vcvtsi2ssl	(%eax,%esi,4), %xmm0, %xmm0
	vbroadcastss	%xmm0, %ymm1
	vmovd	%esi, %xmm0
	leal	1(%esi), %ecx
	xorl	%eax, %eax
	cmpl	%ebx, %ecx
	movl	$0, %ecx
	movl	380(%esp), %esi
	movl	376(%esp), %edi
	jge	.LBB2_41
	.align	16, 0x90
.LBB2_40:
	movl	668(%esp), %ebx
	vmovss	(%ebx,%edx,4), %xmm2
	movl	592(%esp), %ebx
	vinsertps	$16, (%ebx,%edx,4), %xmm2, %xmm2
	vinsertps	$32, (%esi,%edx,4), %xmm2, %xmm2
	vinsertps	$48, (%edi,%edx,4), %xmm2, %xmm2
	movl	796(%esp), %ebx
	vmovss	(%ebx,%edx,4), %xmm3
	movl	788(%esp), %ebx
	vinsertps	$16, (%ebx,%edx,4), %xmm3, %xmm3
	movl	736(%esp), %ebx
	vinsertps	$32, (%ebx,%edx,4), %xmm3, %xmm3
	movl	672(%esp), %ebx
	vinsertps	$48, (%ebx,%edx,4), %xmm3, %xmm3
	vinsertf128	$1, %xmm2, %ymm3, %ymm3
	movl	800(%esp), %ebx
	vbroadcastss	(%ebx,%eax), %ymm2
	vfnmadd213ps	%ymm1, %ymm3, %ymm2
	addl	$4, %eax
	adcl	$0, %ecx
	incl	%edx
	vmovaps	%ymm2, %ymm1
	jne	.LBB2_40
.LBB2_41:
	movl	492(%esp), %esi
	movl	%esi, %ecx
	imull	784(%esp), %ecx
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm0
	movl	308(%esp), %eax
	leal	(%eax,%esi,4), %eax
	addl	%esi, %ecx
	movl	772(%esp), %edx
	vbroadcastss	(%edx,%ecx,4), %ymm2
	vdivps	%ymm2, %ymm1, %ymm1
	movl	484(%esp), %ecx
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	480(%esp), %ecx
	vextractps	$1, %xmm1, (%eax,%ecx,4)
	movl	476(%esp), %ecx
	vextractps	$2, %xmm1, (%eax,%ecx,4)
	movl	472(%esp), %ecx
	vextractps	$3, %xmm1, (%eax,%ecx,4)
	vextractf128	$1, %ymm1, %xmm2
	vmovaps	%xmm2, 432(%esp)
	movl	468(%esp), %ecx
	vmovss	%xmm2, (%eax,%ecx,4)
	movl	464(%esp), %ecx
	vextractps	$1, %xmm2, (%eax,%ecx,4)
	movl	488(%esp), %ecx
	vextractps	$2, %xmm2, (%eax,%ecx,4)
	movl	460(%esp), %ecx
	vextractps	$3, %xmm2, (%eax,%ecx,4)
	vpaddd	384(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 544(%esp)
	vmovd	%xmm0, 1088(%esp)
	vcvtps2pd	%xmm1, %ymm0
	vmovapd	%ymm0, 512(%esp)
	vmovlpd	%xmm0, 1092(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	776(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	1088(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %ymm0
	vpextrd	$1, %xmm0, 1100(%esp)
	vmovapd	512(%esp), %ymm0
	vmovhpd	%xmm0, 1104(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1100(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %ymm0
	vpextrd	$2, %xmm0, 1112(%esp)
	vmovapd	512(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 512(%esp)
	vmovlpd	%xmm0, 1116(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1112(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %ymm0
	vpextrd	$3, %xmm0, 1124(%esp)
	vmovapd	512(%esp), %xmm1
	vmovhpd	%xmm1, 1128(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1124(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vextracti128	$1, %ymm0, 544(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	544(%esp), %xmm0
	vmovd	%xmm0, 1136(%esp)
	vmovaps	432(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 512(%esp)
	vmovlpd	%xmm0, 1140(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1136(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %xmm0
	vpextrd	$1, %xmm0, 1148(%esp)
	vmovapd	512(%esp), %ymm0
	vmovhpd	%xmm0, 1152(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1148(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %xmm0
	vpextrd	$2, %xmm0, 1160(%esp)
	vmovapd	512(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 512(%esp)
	vmovlpd	%xmm0, 1164(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1160(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %xmm0
	vpextrd	$3, %xmm0, 1172(%esp)
	vmovapd	512(%esp), %xmm0
	vmovhpd	%xmm0, 1176(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	784(%esp), %ebx
	leal	1172(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	movl	800(%esp), %edi
	addl	292(%esp), %edi
	calll	opencl_printf
	movl	496(%esp), %edx
	decl	%edx
	testl	%esi, %esi
	leal	-1(%esi), %esi
	movl	%edi, %eax
	jg	.LBB2_39
.LBB2_42:
	vmovdqa	96(%esp), %ymm1
	vmovdqa	160(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 160(%esp)
	vmovdqa	608(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 608(%esp)
	vmovdqa	192(%esp), %ymm0
	vpaddd	64(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%esp)
	movl	152(%esp), %eax
	incl	%eax
	cmpl	140(%esp), %eax
	movl	%ebx, %edi
	jne	.LBB2_2
.LBB2_43:
	movl	148(%esp), %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %eax
	je	.LBB2_85
	subl	%ecx, 148(%esp)
	movl	36(%esp), %esi
	addl	%esi, %ecx
	movl	%ecx, 432(%esp)
	movl	308(%esp), %eax
	leal	(%eax,%edi,4), %eax
	movl	%eax, 368(%esp)
	movl	780(%esp), %eax
	leal	8(%eax,%edi,4), %eax
	movl	%eax, 364(%esp)
	movl	772(%esp), %ecx
	leal	8(%ecx,%edi,4), %eax
	movl	%eax, 360(%esp)
	leal	(,%edi,4), %edx
	movl	%edx, 672(%esp)
	movl	$-4, %eax
	subl	%edx, %eax
	movl	%eax, 464(%esp)
	leal	-1(%edi), %edx
	movl	%edx, 472(%esp)
	movl	%edi, %eax
	imull	%edx, %eax
	leal	-4(%ecx,%eax,4), %eax
	movl	%eax, 356(%esp)
	movl	732(%esp), %edx
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI2_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, 488(%esp)
	movl	140(%esp), %eax
	leal	(%esi,%eax,8), %eax
	movl	%edi, %ebx
	imull	%eax, %ebx
	leal	8(%ecx,%ebx,4), %esi
	movl	%esi, 380(%esp)
	imull	%edx, %eax
	movl	144(%esp), %esi
	leal	(%esi,%eax,4), %esi
	addl	$2, %ebx
	movl	%ebx, 384(%esp)
	leal	8(%ecx), %ebx
	movl	%ebx, 320(%esp)
	leal	4(,%edi,4), %ebx
	movl	%ebx, 460(%esp)
	leal	-3(%edi), %ebx
	movl	%ebx, 312(%esp)
	leal	4(%ecx), %ecx
	movl	%ecx, 304(%esp)
	leal	(,%edx,4), %ecx
	movl	%ecx, 300(%esp)
	leal	-2(%edi), %ecx
	movl	%ecx, 376(%esp)
	movl	%edi, %ecx
	imull	%ecx, %ecx
	movl	%ecx, 296(%esp)
	movl	672(%esp), %ecx
	movl	%esi, %eax
	sarl	$31, %ecx
	movl	%ecx, 796(%esp)
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB2_45:
	movl	%ecx, 372(%esp)
	movl	%eax, 480(%esp)
	testl	%edi, %edi
	movl	$0, %eax
	jle	.LBB2_54
	.align	16, 0x90
.LBB2_46:
	movl	%eax, 788(%esp)
	imull	%edi, %eax
	movl	%eax, 736(%esp)
	movl	$0, 792(%esp)
	.align	16, 0x90
.LBB2_47:
	vxorps	%xmm1, %xmm1, %xmm1
	cmpl	$0, 732(%esp)
	jle	.LBB2_50
	movl	788(%esp), %eax
	movl	792(%esp), %ecx
	leal	(%ecx,%eax), %esi
	vxorps	%xmm1, %xmm1, %xmm1
	movl	728(%esp), %edi
	movl	732(%esp), %ebx
	.align	16, 0x90
.LBB2_49:
	vmovss	%xmm1, 800(%esp)
	vmovss	(%edi), %xmm0
	movl	%esi, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	800(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%ebx
	jne	.LBB2_49
.LBB2_50:
	vmovss	488(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	736(%esp), %eax
	movl	792(%esp), %edx
	leal	(%edx,%eax), %eax
	movl	780(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	incl	%edx
	movl	%edx, 792(%esp)
	cmpl	784(%esp), %edx
	jne	.LBB2_47
	xorl	%edi, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	movl	732(%esp), %eax
	testl	%eax, %eax
	movl	$0, %ebx
	movl	%eax, %esi
	jle	.LBB2_53
	.align	16, 0x90
.LBB2_52:
	vmovss	%xmm1, 800(%esp)
	movl	728(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	788(%esp), %eax
	movl	%eax, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	480(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	800(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	decl	%esi
	jne	.LBB2_52
.LBB2_53:
	vmovss	488(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	316(%esp), %eax
	movl	788(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	incl	%ecx
	movl	784(%esp), %edi
	cmpl	%edi, %ecx
	movl	%ecx, %eax
	jne	.LBB2_46
.LBB2_54:
	movl	780(%esp), %eax
	vmovss	(%eax), %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	772(%esp), %ecx
	vmovss	%xmm0, (%ecx)
	movl	$2, %eax
	cmpl	$1, %edi
	movl	352(%esp), %ebx
	jg	.LBB2_55
	movl	316(%esp), %eax
	vmovss	(%eax), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	%eax, (%ebx)
	movl	432(%esp), %edx
	imull	%edi, %edx
	jmp	.LBB2_79
	.align	16, 0x90
.LBB2_56:
	incl	%eax
	vmovss	(%ecx), %xmm0
.LBB2_55:
	movl	780(%esp), %edx
	vmovss	-4(%edx,%eax,4), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -4(%ecx,%eax,4)
	cmpl	%eax, %edi
	jne	.LBB2_56
	movl	432(%esp), %eax
	imull	%edi, %eax
	movl	%eax, 608(%esp)
	movl	$1, 476(%esp)
	xorl	%eax, %eax
	movl	320(%esp), %ecx
	movl	%ecx, 468(%esp)
	movl	364(%esp), %ecx
	movl	%ecx, 592(%esp)
	movl	360(%esp), %ecx
	movl	%ecx, 544(%esp)
	movl	380(%esp), %ecx
	movl	%ecx, 512(%esp)
	movl	384(%esp), %ecx
	movl	%ecx, 496(%esp)
	movl	312(%esp), %ecx
	movl	%ecx, 492(%esp)
	movl	304(%esp), %ecx
	.align	16, 0x90
.LBB2_58:
	movl	%ecx, 788(%esp)
	movl	%eax, 792(%esp)
	movl	476(%esp), %ecx
	movl	%ecx, %eax
	imull	%edi, %eax
	movl	%eax, 484(%esp)
	leal	(%eax,%ecx), %edx
	movl	%edx, 736(%esp)
	movl	780(%esp), %eax
	vmovss	(%eax,%edx,4), %xmm0
	leal	-1(%ecx), %eax
	movl	%eax, 800(%esp)
	testl	%eax, %eax
	jle	.LBB2_59
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	792(%esp), %ebx
	movl	788(%esp), %eax
	.align	16, 0x90
.LBB2_61:
	movl	%esi, %edi
	addl	672(%esp), %edi
	adcl	796(%esp), %ecx
	vmovss	(%eax,%esi), %xmm1
	vfnmadd213ss	%xmm0, %xmm1, %xmm1
	incl	%edx
	cmpl	%edx, %ebx
	movl	%edi, %esi
	vmovdqa	%xmm1, %xmm0
	jne	.LBB2_61
	jmp	.LBB2_62
	.align	16, 0x90
.LBB2_59:
	vmovdqa	%xmm0, %xmm1
	movl	792(%esp), %ebx
	movl	788(%esp), %eax
.LBB2_62:
	movl	%eax, 788(%esp)
	movl	%ebx, 792(%esp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovss	%xmm1, %xmm0, %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	772(%esp), %ecx
	movl	736(%esp), %eax
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	476(%esp), %eax
	incl	%eax
	movl	%eax, 476(%esp)
	cmpl	784(%esp), %eax
	jge	.LBB2_71
	cmpl	$0, 800(%esp)
	movl	468(%esp), %eax
	movl	476(%esp), %esi
	jg	.LBB2_69
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	jmp	.LBB2_65
	.align	16, 0x90
.LBB2_66:
	movl	772(%esp), %eax
	movl	736(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm0
	addl	$4, %ebx
	adcl	$0, %edi
	incl	%esi
.LBB2_65:
	movl	592(%esp), %eax
	vmovss	(%eax,%ebx), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	movl	544(%esp), %eax
	vmovss	%xmm0, (%eax,%ebx)
	movl	512(%esp), %eax
	vmovss	(%eax,%ebx), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	496(%esp), %eax
	leal	(%eax,%esi), %eax
	movl	%eax, 1196(%esp)
	vmovsd	%xmm0, 1200(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1196(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	cmpl	492(%esp), %esi
	jne	.LBB2_66
	jmp	.LBB2_71
	.align	16, 0x90
.LBB2_69:
	movl	%eax, 800(%esp)
	movl	%esi, 668(%esp)
	movl	484(%esp), %eax
	leal	(%esi,%eax), %ecx
	movl	%ecx, 664(%esp)
	movl	780(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%edi, %edi
	xorl	%eax, %eax
	movl	672(%esp), %esi
	.align	16, 0x90
.LBB2_67:
	movl	788(%esp), %ebx
	vmovss	(%ebx,%edi), %xmm2
	movl	800(%esp), %ebx
	vmovss	(%ebx,%ecx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	addl	%esi, %ecx
	adcl	796(%esp), %edx
	addl	%esi, %edi
	incl	%eax
	cmpl	%eax, 792(%esp)
	vmovdqa	%xmm1, %xmm0
	jne	.LBB2_67
	movl	772(%esp), %ecx
	movl	736(%esp), %eax
	vdivss	(%ecx,%eax,4), %xmm1, %xmm0
	movl	664(%esp), %eax
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	608(%esp), %eax
	movl	668(%esp), %esi
	leal	(%esi,%eax), %eax
	vmovss	(%ecx,%eax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	%eax, 1184(%esp)
	vmovsd	%xmm0, 1188(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1184(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	800(%esp), %eax
	addl	$4, %eax
	incl	%esi
	cmpl	784(%esp), %esi
	jne	.LBB2_69
	.align	16, 0x90
.LBB2_71:
	movl	460(%esp), %eax
	addl	%eax, 592(%esp)
	addl	%eax, 544(%esp)
	addl	$4, 468(%esp)
	addl	$4, 512(%esp)
	incl	496(%esp)
	decl	492(%esp)
	movl	788(%esp), %ecx
	addl	$4, %ecx
	movl	792(%esp), %eax
	incl	%eax
	cmpl	472(%esp), %eax
	movl	784(%esp), %edi
	movl	352(%esp), %ebx
	jne	.LBB2_58
	movl	316(%esp), %eax
	vmovss	(%eax), %xmm0
	movl	772(%esp), %eax
	vdivss	(%eax), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	%eax, (%ebx)
	movl	$1, %esi
	xorl	%edi, %edi
	.align	16, 0x90
.LBB2_73:
	movl	316(%esp), %eax
	vmovss	(%eax,%esi,4), %xmm1
	leal	-1(%esi), %eax
	testl	%eax, %eax
	jle	.LBB2_74
	movl	772(%esp), %eax
	leal	4(%eax,%edi,4), %eax
	movl	%ebx, %ecx
	xorl	%edx, %edx
	movl	672(%esp), %ebx
	.align	16, 0x90
.LBB2_76:
	vcvtsi2ssl	(%ecx), %xmm0, %xmm2
	vmovss	(%eax), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	addl	%ebx, %eax
	addl	$4, %ecx
	incl	%edx
	cmpl	%edx, %edi
	vmovdqa	%xmm0, %xmm1
	jne	.LBB2_76
	jmp	.LBB2_77
	.align	16, 0x90
.LBB2_74:
	vmovdqa	%xmm1, %xmm0
.LBB2_77:
	movl	%esi, %eax
	imull	784(%esp), %eax
	addl	%esi, %eax
	movl	772(%esp), %ecx
	vdivss	(%ecx,%eax,4), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	352(%esp), %ebx
	movl	%eax, (%ebx,%esi,4)
	movl	%esi, 1208(%esp)
	movl	%eax, 1212(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1208(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	vzeroupper
	calll	opencl_printf
	incl	%esi
	incl	%edi
	cmpl	472(%esp), %edi
	jne	.LBB2_73
	movl	772(%esp), %ecx
	movl	784(%esp), %edi
	movl	608(%esp), %edx
.LBB2_79:
	movl	%edx, 608(%esp)
	movl	%ebx, 352(%esp)
	vcvtsi2ssl	-4(%ebx,%edi,4), %xmm0, %xmm0
	movl	296(%esp), %eax
	vdivss	-4(%ecx,%eax,4), %xmm0, %xmm0
	movl	472(%esp), %eax
	leal	(%eax,%edx), %eax
	movl	308(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	cmpl	$0, 376(%esp)
	js	.LBB2_84
	movl	368(%esp), %eax
	movl	608(%esp), %ecx
	leal	(%eax,%ecx,4), %esi
	movl	$-1, %edx
	movl	356(%esp), %edi
	movl	376(%esp), %ebx
	.align	16, 0x90
.LBB2_81:
	movl	%edx, 800(%esp)
	movl	352(%esp), %eax
	vcvtsi2ssl	(%eax,%ebx,4), %xmm0, %xmm0
	leal	1(%ebx), %ecx
	xorl	%eax, %eax
	cmpl	784(%esp), %ecx
	movl	$0, %ecx
	jge	.LBB2_83
	.align	16, 0x90
.LBB2_82:
	vmovss	(%edi,%eax), %xmm2
	vmovss	(%esi,%edx,4), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	addl	$4, %eax
	adcl	$0, %ecx
	incl	%edx
	vmovdqa	%xmm1, %xmm0
	jne	.LBB2_82
.LBB2_83:
	movl	%ebx, %eax
	imull	784(%esp), %eax
	addl	%ebx, %eax
	movl	772(%esp), %ecx
	vdivss	(%ecx,%eax,4), %xmm0, %xmm0
	movl	608(%esp), %eax
	leal	(%ebx,%eax), %eax
	movl	308(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	%eax, 1216(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1220(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	776(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1216(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	addl	464(%esp), %edi
	vzeroupper
	calll	opencl_printf
	movl	800(%esp), %edx
	decl	%edx
	testl	%ebx, %ebx
	leal	-1(%ebx), %ebx
	jg	.LBB2_81
.LBB2_84:
	movl	672(%esp), %eax
	addl	%eax, 380(%esp)
	movl	784(%esp), %edx
	addl	%edx, 384(%esp)
	movl	480(%esp), %eax
	addl	300(%esp), %eax
	incl	432(%esp)
	movl	372(%esp), %ecx
	incl	%ecx
	cmpl	148(%esp), %ecx
	movl	%edx, %edi
	jne	.LBB2_45
.LBB2_85:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp29:
	.size	build_polinome_square_root, .Ltmp29-build_polinome_square_root
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
.LCPI3_2:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI3_1:
	.long	1065353216
	.text
	.globl	build_polinome_unoptimized
	.align	16, 0x90
	.type	build_polinome_unoptimized,@function
build_polinome_unoptimized:
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
	subl	$640, %esp
.Ltmp36:
	.cfi_offset %esi, -20
.Ltmp37:
	.cfi_offset %edi, -16
.Ltmp38:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	%edx, 120(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %ecx
	imull	%edx, %ecx
	addl	36(%eax), %ecx
	movl	%ecx, 20(%esp)
	movl	28(%eax), %esi
	movl	%esi, 372(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 308(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 304(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 368(%esp)
	movl	12(%eax), %ecx
	movl	%ecx, 316(%esp)
	movl	8(%eax), %edi
	movl	%edi, 480(%esp)
	movl	(%eax), %ecx
	movl	%ecx, 464(%esp)
	movl	4(%eax), %ecx
	movl	%ecx, 116(%esp)
	movl	96(%eax), %eax
	movl	%eax, 312(%esp)
	sarl	$3, %edx
	movl	%edx, 112(%esp)
	je	.LBB3_19
	movl	308(%esp), %edx
	vmovd	%edx, %xmm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm1
	movl	20(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI3_0, %ymm0, %ymm0
	vpmulld	%ymm1, %ymm0, %ymm1
	vmovdqa	%ymm1, 128(%esp)
	vmovd	%xmm1, %ecx
	vpextrd	$1, %xmm1, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vmovaps	%ymm1, 64(%esp)
	vmovd	%esi, %xmm1
	vpermd	%ymm1, %ymm2, %ymm1
	vpmulld	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%esp)
	vmovd	%xmm0, %ecx
	vpextrd	$1, %xmm0, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 32(%esp)
	leal	(%edi,%esi,4), %eax
	movl	%eax, 28(%esp)
	leal	(,%esi,4), %eax
	movl	%eax, 220(%esp)
	movl	$-4, %ecx
	subl	%eax, %ecx
	movl	%ecx, 216(%esp)
	movl	%esi, %eax
	imull	%eax, %eax
	movl	316(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 24(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI3_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 160(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB3_2:
	movl	%eax, 124(%esp)
	testl	%esi, %esi
	jle	.LBB3_18
	vmovdqa	128(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	116(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 404(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 400(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 396(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 392(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 388(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 384(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 380(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 376(%esp)
	vmovdqa	224(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	%eax, 412(%esp)
	vpextrd	$2, %xmm0, %eax
	movl	%eax, 492(%esp)
	vpextrd	$1, %xmm0, %eax
	movl	%eax, 488(%esp)
	vmovd	%xmm0, %eax
	movl	%eax, 476(%esp)
	vpextrd	$3, %xmm1, %eax
	movl	%eax, 484(%esp)
	vpextrd	$2, %xmm1, %eax
	movl	%eax, 496(%esp)
	vpextrd	$1, %xmm1, %eax
	movl	%eax, 472(%esp)
	vmovd	%xmm1, 468(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB3_4:
	movl	%eax, 408(%esp)
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	308(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	$0, %edi
	movl	$0, %ebx
	jle	.LBB3_6
	.align	16, 0x90
.LBB3_5:
	vmovapd	%ymm1, 416(%esp)
	movl	464(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	408(%esp), %eax
	movl	%eax, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	392(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	movl	396(%esp), %eax
	vinsertps	$16, (%eax,%edi), %xmm1, %xmm1
	movl	400(%esp), %eax
	vinsertps	$32, (%eax,%edi), %xmm1, %xmm1
	movl	404(%esp), %eax
	vinsertps	$48, (%eax,%edi), %xmm1, %xmm1
	movl	376(%esp), %eax
	vmovss	(%eax,%edi), %xmm2
	movl	380(%esp), %eax
	vinsertps	$16, (%eax,%edi), %xmm2, %xmm2
	movl	384(%esp), %eax
	vinsertps	$32, (%eax,%edi), %xmm2, %xmm2
	movl	388(%esp), %eax
	vinsertps	$48, (%eax,%edi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	416(%esp), %ymm1, %ymm0
	addl	$4, %edi
	adcl	$0, %ebx
	decl	%esi
	vmovaps	%ymm0, %ymm1
	jne	.LBB3_5
.LBB3_6:
	movl	368(%esp), %eax
	movl	408(%esp), %edi
	leal	(%eax,%edi,4), %eax
	vmovaps	160(%esp), %ymm0
	vmulps	%ymm1, %ymm0, %ymm0
	movl	468(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	472(%esp), %ecx
	vextractps	$1, %xmm0, (%eax,%ecx,4)
	movl	496(%esp), %ecx
	vextractps	$2, %xmm0, (%eax,%ecx,4)
	movl	484(%esp), %ecx
	vextractps	$3, %xmm0, (%eax,%ecx,4)
	vextractf128	$1, %ymm0, %xmm0
	movl	476(%esp), %ebx
	vmovss	%xmm0, (%eax,%ebx,4)
	movl	488(%esp), %esi
	vextractps	$1, %xmm0, (%eax,%esi,4)
	movl	492(%esp), %edx
	vextractps	$2, %xmm0, (%eax,%edx,4)
	movl	412(%esp), %ecx
	vextractps	$3, %xmm0, (%eax,%ecx,4)
	incl	%edi
	cmpl	372(%esp), %edi
	movl	%edi, %eax
	jne	.LBB3_4
	movl	480(%esp), %edi
	leal	(%edi,%ecx,4), %eax
	movl	%eax, 404(%esp)
	leal	(%edi,%edx,4), %eax
	movl	%eax, 400(%esp)
	leal	(%edi,%esi,4), %eax
	movl	%eax, 396(%esp)
	leal	(%edi,%ebx,4), %eax
	movl	%eax, 392(%esp)
	movl	484(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 388(%esp)
	movl	496(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 384(%esp)
	movl	472(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 380(%esp)
	movl	468(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 376(%esp)
	xorl	%ecx, %ecx
	movl	316(%esp), %eax
	.align	16, 0x90
.LBB3_8:
	movl	%ecx, %edx
	movl	%edx, 408(%esp)
	movl	%eax, 416(%esp)
	movl	304(%esp), %eax
	movl	(%eax,%edx,4), %eax
	movl	368(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	412(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm0
	movl	492(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	movl	488(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm4
	vmovss	(%eax,%ebx,4), %xmm6
	movl	484(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm1
	movl	496(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm3
	movl	472(%esp), %esi
	vmovss	(%eax,%esi,4), %xmm5
	movl	468(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm7
	leal	(%edi,%edx,4), %edi
	vmovss	%xmm7, (%edi,%ecx,4)
	vmovss	%xmm5, (%edi,%esi,4)
	movl	496(%esp), %eax
	vmovss	%xmm3, (%edi,%eax,4)
	movl	484(%esp), %eax
	vmovss	%xmm1, (%edi,%eax,4)
	vmovss	%xmm6, (%edi,%ebx,4)
	movl	488(%esp), %eax
	vmovss	%xmm4, (%edi,%eax,4)
	movl	492(%esp), %eax
	vmovss	%xmm2, (%edi,%eax,4)
	movl	412(%esp), %eax
	vmovss	%xmm0, (%edi,%eax,4)
	movl	%eax, %esi
	testl	%edx, %edx
	jle	.LBB3_11
	vinsertps	$16, %xmm4, %xmm6, %xmm4
	vinsertps	$32, %xmm2, %xmm4, %xmm2
	vinsertps	$48, %xmm0, %xmm2, %xmm0
	vinsertps	$16, %xmm5, %xmm7, %xmm2
	vinsertps	$32, %xmm3, %xmm2, %xmm2
	vinsertps	$48, %xmm1, %xmm2, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB3_10:
	movl	392(%esp), %edx
	vmovss	(%edx,%ebx), %xmm1
	movl	396(%esp), %edx
	vinsertps	$16, (%edx,%ebx), %xmm1, %xmm1
	movl	400(%esp), %edx
	vinsertps	$32, (%edx,%ebx), %xmm1, %xmm1
	movl	404(%esp), %edx
	vinsertps	$48, (%edx,%ebx), %xmm1, %xmm1
	movl	376(%esp), %edx
	vmovss	(%edx,%ebx), %xmm2
	movl	380(%esp), %edx
	vinsertps	$16, (%edx,%ebx), %xmm2, %xmm2
	movl	384(%esp), %edx
	vinsertps	$32, (%edx,%ebx), %xmm2, %xmm2
	movl	388(%esp), %edx
	vinsertps	$48, (%edx,%ebx), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	%esi, %edx
	movl	416(%esp), %esi
	vbroadcastss	(%esi,%ebx), %ymm1
	movl	%edx, %esi
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	movl	468(%esp), %edx
	vmovss	%xmm1, (%edi,%edx,4)
	movl	472(%esp), %edx
	vextractps	$1, %xmm1, (%edi,%edx,4)
	movl	496(%esp), %edx
	vextractps	$2, %xmm1, (%edi,%edx,4)
	movl	484(%esp), %edx
	vextractps	$3, %xmm1, (%edi,%edx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	476(%esp), %edx
	vmovss	%xmm0, (%edi,%edx,4)
	movl	488(%esp), %edx
	vextractps	$1, %xmm0, (%edi,%edx,4)
	movl	492(%esp), %edx
	vextractps	$2, %xmm0, (%edi,%edx,4)
	vextractps	$3, %xmm0, (%edi,%esi,4)
	addl	$4, %ebx
	adcl	$0, %eax
	incl	%ecx
	movl	408(%esp), %edx
	cmpl	%ecx, %edx
	vmovaps	%ymm1, %ymm0
	jne	.LBB3_10
.LBB3_11:
	movl	416(%esp), %eax
	addl	220(%esp), %eax
	incl	%edx
	cmpl	372(%esp), %edx
	movl	%edx, %ecx
	movl	480(%esp), %edi
	movl	476(%esp), %ebx
	jne	.LBB3_8
	movl	28(%esp), %eax
	movl	468(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 408(%esp)
	movl	472(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 404(%esp)
	movl	496(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 400(%esp)
	movl	484(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 396(%esp)
	leal	(%eax,%ebx,4), %ecx
	movl	%ecx, 392(%esp)
	movl	488(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 388(%esp)
	movl	492(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 384(%esp)
	movl	412(%esp), %ecx
	leal	(%eax,%ecx,4), %eax
	movl	%eax, 380(%esp)
	xorl	%ecx, %ecx
	movl	24(%esp), %eax
	movl	372(%esp), %edx
	.align	16, 0x90
.LBB3_13:
	movl	%eax, 416(%esp)
	leal	-4(%edi,%edx,4), %eax
	leal	-1(%edx), %esi
	movl	%esi, 364(%esp)
	movl	%esi, %ebx
	movl	372(%esp), %edi
	imull	%edi, %ebx
	movl	%ebx, 320(%esp)
	vmovd	%esi, %xmm0
	vxorps	%ymm1, %ymm1, %ymm1
	vpermd	%ymm0, %ymm1, %ymm0
	vpaddd	224(%esp), %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpextrd	$3, %xmm1, %esi
	movl	%esi, 300(%esp)
	vpextrd	$2, %xmm1, %esi
	movl	%esi, 296(%esp)
	vpextrd	$1, %xmm1, %esi
	movl	%esi, 292(%esp)
	vmovd	%xmm1, 288(%esp)
	vpextrd	$3, %xmm0, %esi
	movl	%esi, 284(%esp)
	vpextrd	$2, %xmm0, %esi
	movl	%esi, 280(%esp)
	vpextrd	$1, %xmm0, %esi
	movl	%esi, 276(%esp)
	vmovd	%xmm0, 272(%esp)
	cmpl	%edi, %edx
	jge	.LBB3_14
	movl	476(%esp), %edx
	vmovss	(%eax,%edx,4), %xmm0
	movl	488(%esp), %edx
	vinsertps	$16, (%eax,%edx,4), %xmm0, %xmm0
	movl	492(%esp), %edx
	vinsertps	$32, (%eax,%edx,4), %xmm0, %xmm0
	movl	412(%esp), %edx
	vinsertps	$48, (%eax,%edx,4), %xmm0, %xmm0
	movl	468(%esp), %edx
	vmovss	(%eax,%edx,4), %xmm1
	movl	472(%esp), %edx
	vinsertps	$16, (%eax,%edx,4), %xmm1, %xmm1
	movl	496(%esp), %edx
	vinsertps	$32, (%eax,%edx,4), %xmm1, %xmm1
	movl	484(%esp), %edx
	vinsertps	$48, (%eax,%edx,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	movl	%ecx, %edx
	movl	%ecx, 376(%esp)
	movl	380(%esp), %esi
	.align	16, 0x90
.LBB3_16:
	movl	392(%esp), %ecx
	vmovss	(%ecx,%edx,4), %xmm1
	movl	388(%esp), %ecx
	vinsertps	$16, (%ecx,%edx,4), %xmm1, %xmm1
	movl	384(%esp), %ecx
	vinsertps	$32, (%ecx,%edx,4), %xmm1, %xmm1
	vinsertps	$48, (%esi,%edx,4), %xmm1, %xmm1
	movl	408(%esp), %ecx
	vmovss	(%ecx,%edx,4), %xmm2
	movl	404(%esp), %ecx
	vinsertps	$16, (%ecx,%edx,4), %xmm2, %xmm2
	movl	400(%esp), %ecx
	vinsertps	$32, (%ecx,%edx,4), %xmm2, %xmm2
	movl	396(%esp), %ecx
	vinsertps	$48, (%ecx,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	416(%esp), %ecx
	vbroadcastss	(%ecx,%edi), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	movl	468(%esp), %ecx
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	472(%esp), %ecx
	vextractps	$1, %xmm1, (%eax,%ecx,4)
	movl	496(%esp), %ecx
	vextractps	$2, %xmm1, (%eax,%ecx,4)
	movl	484(%esp), %ecx
	vextractps	$3, %xmm1, (%eax,%ecx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	476(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	488(%esp), %ecx
	vextractps	$1, %xmm0, (%eax,%ecx,4)
	movl	492(%esp), %ecx
	vextractps	$2, %xmm0, (%eax,%ecx,4)
	vpshufd	$3, %xmm0, %xmm2
	movl	412(%esp), %ecx
	vmovss	%xmm2, (%eax,%ecx,4)
	addl	$4, %edi
	adcl	$0, %ebx
	incl	%edx
	vmovaps	%ymm1, %ymm0
	jne	.LBB3_16
	jmp	.LBB3_17
	.align	16, 0x90
.LBB3_14:
	movl	%ecx, 376(%esp)
	movl	412(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	movl	380(%esp), %esi
.LBB3_17:
	movl	%esi, 380(%esp)
	movl	468(%esp), %esi
	movl	472(%esp), %ebx
	movl	484(%esp), %edi
	movl	476(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm0
	movl	488(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm0, %xmm0
	movl	492(%esp), %ecx
	vinsertps	$32, (%eax,%ecx,4), %xmm0, %xmm0
	vinsertps	$48, %xmm2, %xmm0, %xmm0
	vmovss	(%eax,%esi,4), %xmm1
	vinsertps	$16, (%eax,%ebx,4), %xmm1, %xmm1
	movl	496(%esp), %ecx
	vinsertps	$32, (%eax,%ecx,4), %xmm1, %xmm1
	vinsertps	$48, (%eax,%edi,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	movl	320(%esp), %ecx
	addl	364(%esp), %ecx
	movl	316(%esp), %edx
	vbroadcastss	(%edx,%ecx,4), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	vmovss	%xmm0, (%eax,%esi,4)
	vextractps	$1, %xmm0, (%eax,%ebx,4)
	movl	496(%esp), %ecx
	vextractps	$2, %xmm0, (%eax,%ecx,4)
	vextractps	$3, %xmm0, (%eax,%edi,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 256(%esp)
	movl	476(%esp), %ecx
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	488(%esp), %ecx
	vextractps	$1, %xmm1, (%eax,%ecx,4)
	movl	492(%esp), %ecx
	vextractps	$2, %xmm1, (%eax,%ecx,4)
	movl	412(%esp), %ecx
	vextractps	$3, %xmm1, (%eax,%ecx,4)
	movl	272(%esp), %eax
	movl	%eax, 500(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 320(%esp)
	vmovlpd	%xmm0, 504(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	312(%esp), %edi
	movl	%edi, 8(%esp)
	leal	500(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	276(%esp), %eax
	movl	%eax, 512(%esp)
	vmovapd	320(%esp), %ymm0
	vmovhpd	%xmm0, 516(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	512(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	280(%esp), %eax
	movl	%eax, 524(%esp)
	vmovapd	320(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 320(%esp)
	vmovlpd	%xmm0, 528(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	524(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	284(%esp), %eax
	movl	%eax, 536(%esp)
	vmovapd	320(%esp), %xmm0
	vmovhpd	%xmm0, 540(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	536(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	288(%esp), %eax
	movl	%eax, 548(%esp)
	vmovaps	256(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 320(%esp)
	vmovlpd	%xmm0, 552(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	548(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	292(%esp), %eax
	movl	%eax, 560(%esp)
	vmovapd	320(%esp), %ymm0
	vmovhpd	%xmm0, 564(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	560(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	296(%esp), %eax
	movl	%eax, 572(%esp)
	vmovapd	320(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 320(%esp)
	vmovlpd	%xmm0, 576(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	572(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	300(%esp), %eax
	movl	%eax, 584(%esp)
	vmovapd	320(%esp), %xmm0
	vmovhpd	%xmm0, 588(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	584(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	movl	416(%esp), %ebx
	addl	216(%esp), %ebx
	calll	opencl_printf
	movl	376(%esp), %ecx
	decl	%ecx
	movl	364(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %edx
	movl	480(%esp), %edi
	movl	%ebx, %eax
	jg	.LBB3_13
.LBB3_18:
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	312(%esp), %esi
	movl	%esi, 8(%esp)
	leal	596(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	597(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	598(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	599(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	600(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	601(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	602(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%ebx, 12(%esp)
	movl	%esi, 8(%esp)
	leal	603(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	vmovdqa	128(%esp), %ymm0
	vpaddd	64(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 128(%esp)
	vmovdqa	224(%esp), %ymm0
	vpaddd	32(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%esp)
	vzeroupper
	calll	opencl_printf
	movl	124(%esp), %eax
	incl	%eax
	cmpl	112(%esp), %eax
	movl	372(%esp), %esi
	jne	.LBB3_2
.LBB3_19:
	movl	120(%esp), %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %eax
	je	.LBB3_38
	subl	%ecx, 120(%esp)
	movl	20(%esp), %ebx
	addl	%ebx, %ecx
	movl	%ecx, 408(%esp)
	leal	(,%esi,4), %eax
	movl	%eax, 468(%esp)
	movl	$-4, %ecx
	subl	%eax, %ecx
	movl	%ecx, 416(%esp)
	movl	%esi, %eax
	imull	%eax, %eax
	movl	316(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 396(%esp)
	movl	308(%esp), %edx
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI3_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, 412(%esp)
	movl	112(%esp), %ecx
	leal	1(%ebx,%ecx,8), %eax
	imull	%esi, %eax
	movl	%edi, 480(%esp)
	leal	(%edi,%eax,4), %eax
	movl	%eax, 404(%esp)
	leal	(%ebx,%ecx,8), %eax
	movl	%esi, %ecx
	imull	%eax, %ecx
	leal	(%edi,%ecx,4), %ecx
	movl	%ecx, 488(%esp)
	imull	%edx, %eax
	movl	116(%esp), %ecx
	leal	(%ecx,%eax,4), %edi
	leal	(,%edx,4), %eax
	movl	%eax, 392(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB3_21:
	movl	%eax, 400(%esp)
	movl	%edi, 484(%esp)
	testl	%esi, %esi
	jle	.LBB3_37
	movl	408(%esp), %eax
	imull	%esi, %eax
	movl	%eax, 476(%esp)
	xorl	%edx, %edx
	.align	16, 0x90
.LBB3_23:
	movl	%edx, 492(%esp)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	308(%esp), %eax
	testl	%eax, %eax
	movl	$0, %edi
	movl	$0, %ebx
	movl	%eax, %esi
	jle	.LBB3_25
	.align	16, 0x90
.LBB3_24:
	vmovss	%xmm1, 496(%esp)
	movl	464(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	%edx, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	492(%esp), %edx
	movl	484(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	496(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	decl	%esi
	jne	.LBB3_24
.LBB3_25:
	vmovss	412(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	476(%esp), %eax
	leal	(%edx,%eax), %eax
	movl	368(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	incl	%edx
	xorl	%eax, %eax
	movl	372(%esp), %ecx
	cmpl	%ecx, %edx
	jne	.LBB3_23
	movl	316(%esp), %ecx
	.align	16, 0x90
.LBB3_27:
	movl	%ecx, 492(%esp)
	movl	304(%esp), %edx
	movl	(%edx,%eax,4), %edx
	movl	476(%esp), %edi
	addl	%edi, %edx
	movl	368(%esp), %esi
	vmovss	(%esi,%edx,4), %xmm0
	leal	(%eax,%edi), %esi
	movl	%esi, 496(%esp)
	movl	480(%esp), %edx
	vmovss	%xmm0, (%edx,%esi,4)
	testl	%eax, %eax
	movl	488(%esp), %edx
	jle	.LBB3_30
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB3_29:
	vmovss	(%ecx,%esi), %xmm2
	vmovss	(%edx,%esi), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	movl	496(%esp), %ecx
	movl	%eax, %edx
	movl	480(%esp), %eax
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	%edx, %eax
	movl	488(%esp), %edx
	movl	492(%esp), %ecx
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, %eax
	vmovaps	%xmm1, %xmm0
	jne	.LBB3_29
.LBB3_30:
	addl	468(%esp), %ecx
	incl	%eax
	xorl	%ebx, %ebx
	movl	372(%esp), %esi
	cmpl	%esi, %eax
	jne	.LBB3_27
	movl	396(%esp), %edi
	movl	404(%esp), %eax
	movl	%esi, %ecx
	.align	16, 0x90
.LBB3_32:
	movl	%ecx, 472(%esp)
	movl	%ebx, 492(%esp)
	movl	%eax, %ebx
	movl	476(%esp), %eax
	leal	-1(%ecx,%eax), %eax
	movl	480(%esp), %edx
	vmovss	(%edx,%eax,4), %xmm1
	cmpl	%esi, %ecx
	jge	.LBB3_33
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%ebx, 496(%esp)
	.align	16, 0x90
.LBB3_35:
	vmovss	(%edi,%edx), %xmm2
	movl	496(%esp), %ebx
	vmovss	(%ebx,%edx), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	movl	480(%esp), %ebx
	vmovss	%xmm0, (%ebx,%eax,4)
	addl	$4, %edx
	adcl	$0, %esi
	incl	%ecx
	cmpl	492(%esp), %ecx
	vmovaps	%xmm0, %xmm1
	jne	.LBB3_35
	jmp	.LBB3_36
	.align	16, 0x90
.LBB3_33:
	vmovaps	%xmm1, %xmm0
	movl	%ebx, 496(%esp)
.LBB3_36:
	movl	472(%esp), %esi
	decl	%esi
	movl	%esi, %ecx
	movl	372(%esp), %ebx
	imull	%ebx, %ecx
	addl	%esi, %ecx
	movl	316(%esp), %edx
	vdivss	(%edx,%ecx,4), %xmm0, %xmm0
	movl	480(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	%eax, 604(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 608(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	312(%esp), %eax
	movl	%eax, 8(%esp)
	leal	604(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	addl	416(%esp), %edi
	calll	opencl_printf
	movl	%esi, %ecx
	movl	%ebx, %esi
	movl	496(%esp), %eax
	addl	$-4, %eax
	movl	492(%esp), %edx
	incl	%edx
	testl	%ecx, %ecx
	movl	%edx, %ebx
	jg	.LBB3_32
.LBB3_37:
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	312(%esp), %eax
	movl	%eax, 8(%esp)
	leal	619(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	movl	468(%esp), %eax
	addl	%eax, 404(%esp)
	addl	%eax, 488(%esp)
	movl	484(%esp), %edi
	addl	392(%esp), %edi
	calll	opencl_printf
	incl	408(%esp)
	movl	400(%esp), %eax
	incl	%eax
	cmpl	120(%esp), %eax
	jne	.LBB3_21
.LBB3_38:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp39:
	.size	build_polinome_unoptimized, .Ltmp39-build_polinome_unoptimized
	.cfi_endproc

	.globl	Extremums_Newton
	.align	16, 0x90
	.type	Extremums_Newton,@function
Extremums_Newton:
	.cfi_startproc
	pushl	%ebp
.Ltmp43:
	.cfi_def_cfa_offset 8
.Ltmp44:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp45:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-16, %esp
	subl	$208, %esp
.Ltmp46:
	.cfi_offset %esi, -20
.Ltmp47:
	.cfi_offset %edi, -16
.Ltmp48:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	72(%eax), %edx
	movl	%edx, 40(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %edi
	movl	68(%eax), %esi
	movl	%esi, 24(%esp)
	imull	%esi, %edi
	movl	%edi, 12(%esp)
	movl	44(%eax), %esi
	movl	%esi, 8(%esp)
	leal	(%edi,%esi), %esi
	movl	%esi, 52(%esp)
	movl	4(%ecx), %ecx
	imull	%edx, %ecx
	addl	48(%eax), %ecx
	movl	%ecx, 28(%esp)
	vmovss	36(%eax), %xmm0
	vmovss	%xmm0, 72(%esp)
	vmovss	32(%eax), %xmm0
	vmovss	%xmm0, 132(%esp)
	movl	28(%eax), %ecx
	movl	%ecx, 68(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 64(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 168(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 172(%esp)
	movl	8(%eax), %esi
	movl	%esi, 80(%esp)
	movl	(%eax), %esi
	movl	%esi, 84(%esp)
	movl	4(%eax), %eax
	movl	%eax, 136(%esp)
	movl	%edx, %esi
	movl	%eax, %edx
	sarl	$3, %esi
	movl	%esi, 36(%esp)
	je	.LBB4_23
	leal	-1(%edx), %eax
	movl	%eax, 140(%esp)
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	%xmm0, 32(%esp)
	movl	12(%esp), %eax
	movl	8(%esp), %esi
	leal	(%eax,%esi), %eax
	imull	%edx, %eax
	movl	%edx, %esi
	movl	84(%esp), %edx
	leal	(%edx,%eax,4), %edi
	leal	4(%edx,%eax,4), %eax
	movl	%esi, %edx
	leal	-2(%edx), %esi
	movl	%esi, 128(%esp)
	leal	(,%edx,4), %esi
	movl	%esi, 16(%esp)
	xorl	%esi, %esi
	movl	52(%esp), %ebx
	.align	16, 0x90
.LBB4_2:
	movl	%ebx, 48(%esp)
	movl	%esi, 20(%esp)
	movl	%eax, 88(%esp)
	movl	%edi, 92(%esp)
	movl	80(%esp), %eax
	vmovss	(%eax,%ebx,4), %xmm0
	movl	%ebx, %esi
	movl	140(%esp), %eax
	imull	%eax, %esi
	movl	%esi, 44(%esp)
	imull	%edx, %ebx
	addl	%eax, %ebx
	movl	%ebx, 76(%esp)
	xorl	%eax, %eax
	movl	28(%esp), %edx
	.align	16, 0x90
.LBB4_3:
	vmovapd	%xmm0, 176(%esp)
	movl	%edx, 56(%esp)
	movl	%eax, 60(%esp)
	movl	128(%esp), %edx
	testl	%edx, %edx
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm0, %xmm2
	jle	.LBB4_6
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%eax, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB4_5:
	vmovss	%xmm0, 164(%esp)
	leal	1(%eax), %edx
	movl	%edx, 200(%esp)
	vcvtsi2ssl	%edx, %xmm0, %xmm0
	movl	88(%esp), %edx
	vmulss	(%edx,%ebx), %xmm0, %xmm1
	vmovss	%xmm1, (%edi,%ecx)
	vmulss	4(%edi,%ecx), %xmm0, %xmm0
	movl	168(%esp), %edx
	vmovss	%xmm0, (%edx,%ebx)
	vmovss	(%edi,%ecx), %xmm0
	vmovss	%xmm0, 144(%esp)
	movl	%eax, (%esp)
	vmovapd	%xmm2, %xmm0
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovapd	176(%esp), %xmm2
	movl	128(%esp), %edx
	movl	172(%esp), %ecx
	vmovapd	%xmm0, %xmm1
	vmovss	144(%esp), %xmm0
	vfmadd213ss	164(%esp), %xmm0, %xmm1
	addl	$4, %ebx
	adcl	$0, %esi
	addl	$4, %edi
	movl	200(%esp), %eax
	cmpl	%eax, %edx
	vmovapd	%xmm1, %xmm0
	jne	.LBB4_5
.LBB4_6:
	vmovss	%xmm1, 164(%esp)
	movl	%edx, 128(%esp)
	movl	84(%esp), %eax
	vmovss	32(%esp), %xmm0
	movl	76(%esp), %esi
	vmulss	(%eax,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	136(%esp), %eax
	vmovss	%xmm0, -8(%ecx,%eax,4)
	movl	%edx, (%esp)
	vmovapd	%xmm2, %xmm0
	vmovapd	%xmm2, 176(%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	200(%esp), %xmm1
	vfmadd213ss	164(%esp), %xmm1, %xmm0
	cmpl	$0, 140(%esp)
	jle	.LBB4_7
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovapd	%xmm0, %xmm2
	.align	16, 0x90
.LBB4_9:
	vmovss	%xmm2, 144(%esp)
	vmovss	%xmm3, 164(%esp)
	movl	172(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	%ebx, (%esp)
	vmovapd	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	200(%esp), %xmm1
	vfmadd213ss	144(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 200(%esp)
	vmovapd	%xmm1, %xmm2
	movl	168(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	164(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	incl	%ebx
	cmpl	%ebx, 140(%esp)
	vmovapd	%xmm1, %xmm3
	jne	.LBB4_9
	jmp	.LBB4_10
	.align	16, 0x90
.LBB4_7:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovss	%xmm0, 200(%esp)
.LBB4_10:
	vmovss	%xmm1, 164(%esp)
	movl	84(%esp), %eax
	movl	76(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm0
	vmovss	%xmm0, 124(%esp)
	movl	140(%esp), %esi
	movl	%esi, (%esp)
	vmovaps	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovaps	%xmm0, %xmm3
	vmovss	124(%esp), %xmm0
	vfmadd213ss	200(%esp), %xmm0, %xmm3
	movl	$2147483647, %eax
	vmovd	%eax, %xmm0
	vmovapd	%xmm0, 96(%esp)
	vandpd	%xmm0, %xmm3, %xmm0
	jmp	.LBB4_11
	.align	16, 0x90
.LBB4_18:
	vmovapd	%xmm0, 176(%esp)
	vmovss	%xmm1, 164(%esp)
	movl	%eax, (%esp)
	movl	%eax, %esi
	calll	__ocl_svml_s9_pownf1
	vmovapd	%xmm0, %xmm3
	vmovss	124(%esp), %xmm0
	vfmadd213ss	200(%esp), %xmm0, %xmm3
	vandpd	96(%esp), %xmm3, %xmm0
.LBB4_11:
	vucomiss	132(%esp), %xmm0
	jb	.LBB4_12
	vmovss	164(%esp), %xmm1
	vdivss	%xmm1, %xmm3, %xmm0
	vmovaps	176(%esp), %xmm2
	vsubss	%xmm0, %xmm2, %xmm2
	vmovapd	%xmm2, 176(%esp)
	testl	%esi, %esi
	movl	%esi, %eax
	vmovapd	%xmm2, %xmm0
	jle	.LBB4_15
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	vmovapd	%xmm1, %xmm2
	.align	16, 0x90
.LBB4_17:
	vmovapd	%xmm3, 144(%esp)
	vmovss	%xmm2, 164(%esp)
	movl	172(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	%ebx, (%esp)
	vmovaps	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	movl	140(%esp), %eax
	vmovss	200(%esp), %xmm1
	vfmadd213ss	144(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 200(%esp)
	vmovapd	%xmm1, %xmm3
	movl	168(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm1
	vfmadd213ss	164(%esp), %xmm0, %xmm1
	vmovapd	176(%esp), %xmm0
	addl	$4, %edi
	adcl	$0, %esi
	incl	%ebx
	cmpl	%ebx, %eax
	vmovapd	%xmm1, %xmm2
	jne	.LBB4_17
	jmp	.LBB4_18
	.align	16, 0x90
.LBB4_15:
	vmovss	%xmm3, 200(%esp)
	jmp	.LBB4_18
	.align	16, 0x90
.LBB4_12:
	cmpl	$0, 136(%esp)
	jle	.LBB4_13
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB4_20:
	vmovss	%xmm1, 164(%esp)
	movl	92(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	%ebx, (%esp)
	vmovaps	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	200(%esp), %xmm1
	vfmadd213ss	164(%esp), %xmm1, %xmm0
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 136(%esp)
	vmovapd	%xmm0, %xmm1
	jne	.LBB4_20
	jmp	.LBB4_21
	.align	16, 0x90
.LBB4_13:
	vxorpd	%xmm0, %xmm0, %xmm0
.LBB4_21:
	vmovaps	176(%esp), %xmm2
	vbroadcastss	%xmm2, %ymm1
	movl	44(%esp), %eax
	movl	56(%esp), %edx
	leal	(%eax,%edx), %eax
	movl	64(%esp), %ecx
	vmovups	%ymm1, (%ecx,%eax,4)
	vbroadcastss	%xmm0, %ymm0
	movl	68(%esp), %ecx
	vmovups	%ymm0, (%ecx,%eax,4)
	vaddss	72(%esp), %xmm2, %xmm2
	movl	80(%esp), %eax
	movl	48(%esp), %ebx
	vmovss	%xmm2, (%eax,%ebx,4)
	addl	$8, %edx
	movl	60(%esp), %eax
	incl	%eax
	cmpl	36(%esp), %eax
	movl	172(%esp), %ecx
	vmovaps	%xmm2, %xmm0
	jne	.LBB4_3
	movl	92(%esp), %edi
	movl	16(%esp), %edx
	addl	%edx, %edi
	movl	88(%esp), %eax
	addl	%edx, %eax
	incl	%ebx
	movl	20(%esp), %esi
	incl	%esi
	cmpl	24(%esp), %esi
	movl	136(%esp), %edx
	jne	.LBB4_2
.LBB4_23:
	movl	%ecx, 172(%esp)
	movl	40(%esp), %ecx
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpl	%eax, %ecx
	movl	52(%esp), %ecx
	je	.LBB4_46
	subl	%eax, 40(%esp)
	addl	%eax, 28(%esp)
	leal	-1(%edx), %eax
	movl	%eax, 140(%esp)
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	%xmm0, 44(%esp)
	movl	12(%esp), %esi
	addl	8(%esp), %esi
	imull	%edx, %esi
	movl	84(%esp), %eax
	leal	(%eax,%esi,4), %edi
	leal	4(%eax,%esi,4), %eax
	leal	-2(%edx), %esi
	movl	%esi, 128(%esp)
	leal	(,%edx,4), %esi
	movl	%esi, 32(%esp)
	xorl	%esi, %esi
	.align	16, 0x90
.LBB4_25:
	movl	%esi, 36(%esp)
	movl	%eax, 88(%esp)
	movl	%edi, 92(%esp)
	movl	%ecx, 52(%esp)
	movl	80(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm0
	movl	%ecx, %esi
	movl	140(%esp), %eax
	imull	%eax, %esi
	movl	%esi, 48(%esp)
	imull	%edx, %ecx
	addl	%eax, %ecx
	movl	%ecx, 76(%esp)
	xorl	%eax, %eax
	movl	28(%esp), %edx
	.align	16, 0x90
.LBB4_26:
	vmovss	%xmm0, 176(%esp)
	movl	%edx, 56(%esp)
	movl	%eax, 60(%esp)
	movl	128(%esp), %ecx
	testl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	movl	168(%esp), %edx
	vmovaps	%xmm0, %xmm2
	jle	.LBB4_29
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB4_28:
	vmovss	%xmm0, 164(%esp)
	leal	1(%eax), %ecx
	movl	%ecx, 200(%esp)
	vcvtsi2ssl	%ecx, %xmm0, %xmm0
	movl	88(%esp), %ecx
	vmulss	(%ecx,%ebx), %xmm0, %xmm1
	movl	172(%esp), %ecx
	vmovss	%xmm1, (%edi,%ecx)
	vmulss	4(%edi,%ecx), %xmm0, %xmm0
	vmovss	%xmm0, (%edx,%ebx)
	vmovss	(%edi,%ecx), %xmm0
	vmovss	%xmm0, 144(%esp)
	movl	%eax, (%esp)
	vmovaps	%xmm2, %xmm0
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	168(%esp), %edx
	vmovss	176(%esp), %xmm2
	movl	128(%esp), %ecx
	vmovaps	%xmm0, %xmm1
	vmovss	144(%esp), %xmm0
	vfmadd213ss	164(%esp), %xmm0, %xmm1
	addl	$4, %ebx
	adcl	$0, %esi
	addl	$4, %edi
	movl	200(%esp), %eax
	cmpl	%eax, %ecx
	vmovaps	%xmm1, %xmm0
	jne	.LBB4_28
.LBB4_29:
	vmovss	%xmm1, 164(%esp)
	movl	%ecx, 128(%esp)
	movl	84(%esp), %eax
	vmovss	44(%esp), %xmm0
	movl	76(%esp), %edx
	vmulss	(%eax,%edx,4), %xmm0, %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	136(%esp), %eax
	movl	172(%esp), %edx
	vmovss	%xmm0, -8(%edx,%eax,4)
	movl	%ecx, (%esp)
	vmovaps	%xmm2, %xmm0
	vmovss	%xmm2, 176(%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	200(%esp), %xmm1
	vfmadd213ss	164(%esp), %xmm1, %xmm0
	cmpl	$0, 140(%esp)
	jle	.LBB4_30
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovaps	%xmm0, %xmm2
	.align	16, 0x90
.LBB4_32:
	vmovss	%xmm2, 144(%esp)
	vmovss	%xmm3, 164(%esp)
	movl	172(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	%ebx, (%esp)
	vmovss	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	200(%esp), %xmm1
	vfmadd213ss	144(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 200(%esp)
	vmovaps	%xmm1, %xmm2
	movl	168(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	164(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	incl	%ebx
	cmpl	%ebx, 140(%esp)
	vmovapd	%xmm1, %xmm3
	jne	.LBB4_32
	jmp	.LBB4_33
	.align	16, 0x90
.LBB4_30:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovss	%xmm0, 200(%esp)
.LBB4_33:
	vmovss	%xmm1, 164(%esp)
	movl	84(%esp), %eax
	movl	76(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm0
	vmovss	%xmm0, 124(%esp)
	movl	140(%esp), %esi
	movl	%esi, (%esp)
	vmovss	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovaps	%xmm0, %xmm3
	vmovss	124(%esp), %xmm0
	vfmadd213ss	200(%esp), %xmm0, %xmm3
	movl	$2147483647, %eax
	vmovd	%eax, %xmm0
	vmovapd	%xmm0, 96(%esp)
	vandpd	%xmm0, %xmm3, %xmm0
	jmp	.LBB4_34
	.align	16, 0x90
.LBB4_41:
	vmovss	%xmm0, 176(%esp)
	vmovss	%xmm1, 164(%esp)
	movl	%eax, (%esp)
	movl	%eax, %esi
	calll	__ocl_svml_s9_pownf1
	vmovapd	%xmm0, %xmm3
	vmovss	124(%esp), %xmm0
	vfmadd213ss	200(%esp), %xmm0, %xmm3
	vandpd	96(%esp), %xmm3, %xmm0
.LBB4_34:
	vucomiss	132(%esp), %xmm0
	jb	.LBB4_35
	vmovss	164(%esp), %xmm1
	vdivss	%xmm1, %xmm3, %xmm0
	vmovss	176(%esp), %xmm2
	vsubss	%xmm0, %xmm2, %xmm2
	vmovss	%xmm2, 176(%esp)
	testl	%esi, %esi
	movl	%esi, %eax
	vmovapd	%xmm2, %xmm0
	jle	.LBB4_38
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	vmovapd	%xmm1, %xmm2
	.align	16, 0x90
.LBB4_40:
	vmovapd	%xmm3, 144(%esp)
	vmovss	%xmm2, 164(%esp)
	movl	172(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	%ebx, (%esp)
	vmovss	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	movl	140(%esp), %eax
	vmovss	200(%esp), %xmm1
	vfmadd213ss	144(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 200(%esp)
	vmovapd	%xmm1, %xmm3
	movl	168(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm1
	vfmadd213ss	164(%esp), %xmm0, %xmm1
	vmovss	176(%esp), %xmm0
	addl	$4, %edi
	adcl	$0, %esi
	incl	%ebx
	cmpl	%ebx, %eax
	vmovapd	%xmm1, %xmm2
	jne	.LBB4_40
	jmp	.LBB4_41
	.align	16, 0x90
.LBB4_38:
	vmovss	%xmm3, 200(%esp)
	jmp	.LBB4_41
	.align	16, 0x90
.LBB4_35:
	cmpl	$0, 136(%esp)
	jle	.LBB4_36
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB4_43:
	vmovss	%xmm1, 164(%esp)
	movl	92(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	vmovss	%xmm0, 200(%esp)
	movl	%ebx, (%esp)
	vmovss	176(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	200(%esp), %xmm1
	vfmadd213ss	164(%esp), %xmm1, %xmm0
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 136(%esp)
	vmovapd	%xmm0, %xmm1
	jne	.LBB4_43
	jmp	.LBB4_44
	.align	16, 0x90
.LBB4_36:
	vxorpd	%xmm0, %xmm0, %xmm0
.LBB4_44:
	movl	48(%esp), %eax
	movl	56(%esp), %edx
	leal	(%eax,%edx), %eax
	movl	64(%esp), %ecx
	vmovss	176(%esp), %xmm1
	vmovss	%xmm1, (%ecx,%eax,4)
	movl	68(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	vaddss	72(%esp), %xmm1, %xmm1
	movl	52(%esp), %ecx
	movl	80(%esp), %eax
	vmovss	%xmm1, (%eax,%ecx,4)
	incl	%edx
	movl	60(%esp), %eax
	incl	%eax
	cmpl	40(%esp), %eax
	vmovaps	%xmm1, %xmm0
	jne	.LBB4_26
	movl	92(%esp), %edi
	movl	32(%esp), %edx
	addl	%edx, %edi
	movl	88(%esp), %eax
	addl	%edx, %eax
	incl	%ecx
	movl	36(%esp), %esi
	incl	%esi
	cmpl	24(%esp), %esi
	movl	136(%esp), %edx
	jne	.LBB4_25
.LBB4_46:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp49:
	.size	Extremums_Newton, .Ltmp49-Extremums_Newton
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI5_0:
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
.LCPI5_1:
	.long	1056964608
	.text
	.globl	features
	.align	16, 0x90
	.type	features,@function
features:
	.cfi_startproc
	pushl	%ebp
.Ltmp53:
	.cfi_def_cfa_offset 8
.Ltmp54:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp55:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-4, %esp
	subl	$280, %esp
.Ltmp56:
	.cfi_offset %esi, -20
.Ltmp57:
	.cfi_offset %edi, -16
.Ltmp58:
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
	je	.LBB5_9
	movl	64(%esp), %esi
	vmovd	%esi, %xmm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpermd	%ymm0, %ymm1, %ymm0
	movl	60(%esp), %edx
	vmovd	%edx, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vpaddd	.LCPI5_0, %ymm1, %ymm1
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
	vbroadcastss	.LCPI5_1, %ymm2
	.align	16, 0x90
.LBB5_2:
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
	jle	.LBB5_5
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
.LBB5_4:
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
	jne	.LBB5_4
.LBB5_5:
	cmpl	$0, 64(%esp)
	jle	.LBB5_8
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
.LBB5_7:
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
	jl	.LBB5_7
.LBB5_8:
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
	jne	.LBB5_2
.LBB5_9:
	movl	48(%esp), %ecx
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpl	%eax, %ecx
	movl	272(%esp), %edx
	je	.LBB5_17
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
	vmovss	.LCPI5_1, %xmm1
	.align	16, 0x90
.LBB5_11:
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
	jle	.LBB5_13
	.align	16, 0x90
.LBB5_12:
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
	jne	.LBB5_12
.LBB5_13:
	cmpl	$0, 64(%esp)
	movl	224(%esp), %edx
	jle	.LBB5_16
	movl	$4, %ecx
	xorl	%ebx, %ebx
	movl	228(%esp), %eax
	movl	220(%esp), %esi
	movl	%esi, 244(%esp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	.align	16, 0x90
.LBB5_15:
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
	jl	.LBB5_15
.LBB5_16:
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
	jne	.LBB5_11
.LBB5_17:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp59:
	.size	features, .Ltmp59-features
	.cfi_endproc

	.type	.L.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "C[%d] = %f\t"
	.size	.L.str, 12

	.type	.L.str1,@object
.L.str1:
	.asciz	 "\n"
	.size	.L.str1, 2

	.type	.L.str2,@object
.L.str2:
	.asciz	 "S[%d] = %f \t"
	.size	.L.str2, 13

	.type	.L.str3,@object
.L.str3:
	.asciz	 "K[%d] = %f \t"
	.size	.L.str3, 13

	.type	.L.str4,@object
.L.str4:
	.asciz	 "C[%d] = %f \t"
	.size	.L.str4, 13

	.type	float_const_signMask,@object
	.section	.rodata,"a",@progbits
	.globl	float_const_signMask
	.align	4
float_const_signMask:
	.long	2147483647
	.size	float_const_signMask, 4


	.section	".note.GNU-stack","",@progbits
