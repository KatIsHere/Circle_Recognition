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

	.globl	Extremums_Newton_v2
	.align	16, 0x90
	.type	Extremums_Newton_v2,@function
Extremums_Newton_v2:
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
	andl	$-16, %esp
	subl	$256, %esp
.Ltmp16:
	.cfi_offset %esi, -20
.Ltmp17:
	.cfi_offset %edi, -16
.Ltmp18:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	72(%eax), %edx
	movl	%edx, 60(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %edi
	movl	68(%eax), %esi
	movl	%esi, 40(%esp)
	imull	%esi, %edi
	movl	%edi, 20(%esp)
	movl	44(%eax), %esi
	movl	%esi, 12(%esp)
	leal	(%edi,%esi), %esi
	movl	%esi, 76(%esp)
	movl	4(%ecx), %ecx
	imull	%edx, %ecx
	addl	48(%eax), %ecx
	movl	%ecx, 44(%esp)
	vmovss	36(%eax), %xmm0
	vmovss	%xmm0, 100(%esp)
	vmovss	32(%eax), %xmm0
	vmovss	%xmm0, 168(%esp)
	movl	28(%eax), %ecx
	movl	%ecx, 96(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 92(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 16(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 172(%esp)
	movl	8(%eax), %esi
	movl	%esi, 108(%esp)
	movl	(%eax), %esi
	movl	%esi, 112(%esp)
	movl	4(%eax), %eax
	movl	%eax, 164(%esp)
	sarl	$3, %edx
	movl	%edx, 56(%esp)
	je	.LBB1_22
	movl	20(%esp), %eax
	movl	12(%esp), %edx
	leal	(%eax,%edx), %eax
	movl	%ecx, %edx
	movl	164(%esp), %ebx
	movl	%ebx, %ecx
	imull	%eax, %ecx
	movl	112(%esp), %esi
	leal	(%esi,%ecx,8), %edi
	movl	%edi, 120(%esp)
	leal	8(%esi,%ecx,8), %esi
	leal	-1(%ebx), %edi
	movl	%edi, 184(%esp)
	movl	%eax, %ecx
	imull	%edi, %ecx
	leal	(%edx,%ecx,4), %ecx
	movl	%ecx, 176(%esp)
	movl	%edx, %ecx
	leal	-2(%ebx), %edi
	movl	%edi, 124(%esp)
	imull	%edi, %eax
	movl	16(%esp), %edx
	leal	(%edx,%eax,4), %eax
	movl	%edi, %edx
	leal	(,%ebx,8), %edi
	movl	%edi, 32(%esp)
	leal	-4(,%ebx,4), %edi
	movl	%edi, 28(%esp)
	leal	-8(,%ebx,4), %edi
	movl	%edi, 24(%esp)
	xorl	%edi, %edi
	vcvtsi2sdl	184(%esp), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%esp)
	movl	76(%esp), %ebx
	movl	%ebx, 80(%esp)
	movl	120(%esp), %ebx
	.align	16, 0x90
.LBB1_2:
	movl	%edi, 36(%esp)
	movl	%eax, 180(%esp)
	movl	%esi, 116(%esp)
	movl	%ebx, 120(%esp)
	movl	108(%esp), %eax
	movl	80(%esp), %esi
	vmovss	(%eax,%esi,4), %xmm0
	movl	%esi, %eax
	imull	184(%esp), %eax
	movl	%eax, 104(%esp)
	movl	%esi, %eax
	imull	164(%esp), %eax
	movl	%eax, 64(%esp)
	xorl	%eax, %eax
	movl	44(%esp), %esi
	.align	16, 0x90
.LBB1_3:
	vmovaps	%xmm0, 224(%esp)
	movl	%esi, 84(%esp)
	movl	%eax, 88(%esp)
	testl	%edx, %edx
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	%xmm0, %xmm1
	jle	.LBB1_6
	movl	$4, %esi
	xorl	%edi, %edi
	movl	$0, 152(%esp)
	xorl	%ebx, %ebx
	movl	$0, 128(%esp)
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB1_5:
	vmovss	%xmm0, 192(%esp)
	leal	1(%eax), %edx
	movl	%edx, 216(%esp)
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	movl	%edx, %ecx
	movl	116(%esp), %edx
	vmulsd	(%edx,%ebx), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	176(%esp), %edx
	vmovss	%xmm0, (%edx,%edi)
	vcvtsi2ssl	%ecx, %xmm0, %xmm0
	movl	172(%esp), %ecx
	vmulss	(%esi,%ecx), %xmm0, %xmm0
	movl	180(%esp), %ecx
	vmovss	%xmm0, (%ecx,%edi)
	vmovss	(%edx,%edi), %xmm0
	vmovss	%xmm0, 188(%esp)
	movl	%eax, (%esp)
	vmovaps	%xmm1, %xmm0
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovaps	224(%esp), %xmm1
	movl	124(%esp), %edx
	movl	172(%esp), %ecx
	vmovaps	%xmm0, %xmm2
	vmovss	188(%esp), %xmm0
	vfmadd213ss	192(%esp), %xmm0, %xmm2
	addl	$4, %edi
	adcl	$0, 152(%esp)
	addl	$8, %ebx
	adcl	$0, 128(%esp)
	addl	$4, %esi
	movl	216(%esp), %eax
	cmpl	%eax, %edx
	vmovaps	%xmm2, %xmm0
	jne	.LBB1_5
.LBB1_6:
	vmovss	%xmm2, 192(%esp)
	movl	184(%esp), %esi
	movl	64(%esp), %eax
	leal	(%esi,%eax), %edi
	movl	%edi, 152(%esp)
	movl	112(%esp), %eax
	vmovsd	48(%esp), %xmm0
	vmulsd	(%eax,%edi,8), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	104(%esp), %eax
	leal	(%edx,%eax), %eax
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	164(%esp), %eax
	vmovss	-8(%ecx,%eax,4), %xmm0
	vmovss	%xmm0, 216(%esp)
	movl	%edx, (%esp)
	vmovaps	%xmm1, %xmm0
	vmovaps	%xmm1, 224(%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vfmadd213ss	192(%esp), %xmm1, %xmm0
	testl	%esi, %esi
	jle	.LBB1_7
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	%xmm0, %xmm2
	.align	16, 0x90
.LBB1_9:
	vmovss	%xmm2, 188(%esp)
	vmovss	%xmm3, 192(%esp)
	movl	176(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	vmovss	%xmm0, 216(%esp)
	movl	%ebx, (%esp)
	vmovaps	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vfmadd213ss	188(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 216(%esp)
	vmovaps	%xmm1, %xmm2
	movl	180(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	192(%esp), %xmm0, %xmm1
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 184(%esp)
	vmovaps	%xmm1, %xmm3
	jne	.LBB1_9
	jmp	.LBB1_10
	.align	16, 0x90
.LBB1_7:
	vxorps	%xmm1, %xmm1, %xmm1
	vmovss	%xmm0, 216(%esp)
.LBB1_10:
	vmovss	%xmm1, 188(%esp)
	movl	112(%esp), %eax
	movl	152(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm0
	vmovsd	%xmm0, 152(%esp)
	movl	184(%esp), %esi
	movl	%esi, (%esp)
	vmovaps	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	152(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	movl	$2147483647, %eax
	vmovd	%eax, %xmm2
	vandpd	%xmm2, %xmm3, %xmm0
	vucomiss	168(%esp), %xmm0
	jae	.LBB1_12
	vmovaps	224(%esp), %xmm4
	jmp	.LBB1_17
	.align	16, 0x90
.LBB1_12:
	testl	%esi, %esi
	vmovss	188(%esp), %xmm1
	jle	.LBB1_13
	vmovaps	224(%esp), %xmm4
	vmovapd	%xmm2, %xmm0
	vmovapd	%xmm0, 128(%esp)
	.align	16, 0x90
.LBB1_31:
	vdivss	%xmm1, %xmm3, %xmm0
	vsubss	%xmm0, %xmm4, %xmm4
	vmovaps	%xmm4, 224(%esp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vmovaps	%xmm1, %xmm2
	.align	16, 0x90
.LBB1_15:
	vmovapd	%xmm3, 192(%esp)
	vmovss	%xmm2, 188(%esp)
	movl	176(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	vmovss	%xmm0, 216(%esp)
	movl	%ebx, (%esp)
	vmovaps	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vfmadd213ss	192(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 216(%esp)
	vmovapd	%xmm1, %xmm3
	movl	180(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	188(%esp), %xmm0, %xmm1
	vmovaps	224(%esp), %xmm0
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 184(%esp)
	vmovaps	%xmm1, %xmm2
	jne	.LBB1_15
	movl	184(%esp), %eax
	movl	%eax, (%esp)
	vmovss	%xmm1, 188(%esp)
	calll	__ocl_svml_s9_pownf1
	vmovaps	224(%esp), %xmm4
	vmovss	216(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	152(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vmovss	188(%esp), %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	vmovapd	128(%esp), %xmm0
	vandpd	%xmm0, %xmm3, %xmm0
	vucomiss	168(%esp), %xmm0
	jae	.LBB1_31
	jmp	.LBB1_17
	.align	16, 0x90
.LBB1_13:
	vmovaps	224(%esp), %xmm4
	vmovapd	%xmm2, 128(%esp)
	.align	16, 0x90
.LBB1_14:
	vmovapd	%xmm3, 192(%esp)
	movl	%esi, (%esp)
	vdivss	%xmm1, %xmm3, %xmm0
	vsubss	%xmm0, %xmm4, %xmm4
	vmovaps	%xmm4, 224(%esp)
	vmovaps	%xmm4, %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovaps	224(%esp), %xmm4
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovaps	192(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmovsd	152(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vmovss	188(%esp), %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	vandpd	128(%esp), %xmm3, %xmm0
	vucomiss	168(%esp), %xmm0
	jae	.LBB1_14
.LBB1_17:
	vmovaps	%xmm4, %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	cmpl	$0, 164(%esp)
	jle	.LBB1_20
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vmovaps	%xmm0, 224(%esp)
	.align	16, 0x90
.LBB1_19:
	vmovapd	%xmm2, 192(%esp)
	movl	120(%esp), %eax
	vmovsd	(%eax,%esi), %xmm0
	vmovsd	%xmm0, 216(%esp)
	movl	%ebx, (%esp)
	addl	$8, %esi
	adcl	$0, %edi
	vmovaps	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovaps	192(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	216(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsd2ss	%xmm0, %xmm0, %xmm2
	vmovaps	224(%esp), %xmm0
	incl	%ebx
	cmpl	%ebx, 164(%esp)
	jne	.LBB1_19
.LBB1_20:
	vmovaps	%xmm0, %xmm1
	vbroadcastss	%xmm1, %ymm0
	movl	104(%esp), %eax
	movl	84(%esp), %esi
	leal	(%eax,%esi), %eax
	movl	92(%esp), %ecx
	vmovups	%ymm0, (%ecx,%eax,4)
	vbroadcastss	%xmm2, %ymm0
	movl	96(%esp), %ecx
	vmovups	%ymm0, (%ecx,%eax,4)
	vmovaps	%xmm1, %xmm0
	vaddss	100(%esp), %xmm0, %xmm0
	movl	108(%esp), %eax
	movl	80(%esp), %edi
	vmovss	%xmm0, (%eax,%edi,4)
	addl	$8, %esi
	movl	88(%esp), %eax
	incl	%eax
	cmpl	56(%esp), %eax
	movl	172(%esp), %ecx
	movl	124(%esp), %edx
	jne	.LBB1_3
	movl	120(%esp), %ebx
	movl	32(%esp), %eax
	addl	%eax, %ebx
	movl	116(%esp), %esi
	addl	%eax, %esi
	movl	28(%esp), %eax
	addl	%eax, 176(%esp)
	movl	180(%esp), %eax
	addl	24(%esp), %eax
	incl	%edi
	movl	%edi, 80(%esp)
	movl	36(%esp), %edi
	incl	%edi
	cmpl	40(%esp), %edi
	jne	.LBB1_2
.LBB1_22:
	movl	%ecx, 172(%esp)
	movl	60(%esp), %ecx
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpl	%eax, %ecx
	movl	76(%esp), %ecx
	movl	164(%esp), %edx
	je	.LBB1_46
	subl	%eax, 60(%esp)
	addl	%eax, 44(%esp)
	movl	20(%esp), %edi
	addl	12(%esp), %edi
	movl	%edx, %eax
	imull	%edi, %eax
	movl	112(%esp), %edx
	leal	(%edx,%eax,8), %ebx
	leal	8(%edx,%eax,8), %eax
	movl	%eax, 116(%esp)
	movl	164(%esp), %eax
	leal	-1(%eax), %esi
	movl	%esi, 184(%esp)
	movl	%edi, %eax
	imull	%esi, %eax
	movl	172(%esp), %edx
	leal	(%edx,%eax,4), %eax
	movl	%eax, 176(%esp)
	movl	164(%esp), %edx
	leal	-2(%edx), %eax
	movl	%eax, 124(%esp)
	imull	%eax, %edi
	movl	16(%esp), %eax
	leal	(%eax,%edi,4), %eax
	leal	(,%edx,8), %edi
	movl	%edi, 48(%esp)
	leal	-4(,%edx,4), %edi
	movl	%edi, 36(%esp)
	leal	-8(,%edx,4), %edi
	movl	%edi, 32(%esp)
	xorl	%edi, %edi
	vcvtsi2sdl	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%esp)
	.align	16, 0x90
.LBB1_24:
	movl	%edi, 56(%esp)
	movl	%eax, 180(%esp)
	movl	%ebx, 120(%esp)
	movl	%ecx, 76(%esp)
	movl	108(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm0
	movl	%ecx, %eax
	imull	%esi, %eax
	movl	%eax, 104(%esp)
	imull	%edx, %ecx
	movl	%ecx, 80(%esp)
	xorl	%eax, %eax
	movl	44(%esp), %edx
	.align	16, 0x90
.LBB1_25:
	vmovss	%xmm0, 224(%esp)
	movl	%edx, 84(%esp)
	movl	%eax, 88(%esp)
	movl	124(%esp), %edx
	testl	%edx, %edx
	vxorps	%xmm2, %xmm2, %xmm2
	movl	172(%esp), %ecx
	vmovaps	%xmm0, %xmm1
	jle	.LBB1_28
	movl	$4, %edi
	xorl	%esi, %esi
	movl	$0, 152(%esp)
	xorl	%ebx, %ebx
	movl	$0, 128(%esp)
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB1_27:
	vmovss	%xmm0, 192(%esp)
	leal	1(%eax), %edx
	movl	%edx, 216(%esp)
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	movl	%edx, %ecx
	movl	116(%esp), %edx
	vmulsd	(%edx,%ebx), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	176(%esp), %edx
	vmovss	%xmm0, (%edx,%esi)
	vcvtsi2ssl	%ecx, %xmm0, %xmm0
	movl	172(%esp), %ecx
	vmulss	(%edi,%ecx), %xmm0, %xmm0
	movl	180(%esp), %ecx
	vmovss	%xmm0, (%ecx,%esi)
	vmovss	(%edx,%esi), %xmm0
	vmovss	%xmm0, 188(%esp)
	movl	%eax, (%esp)
	vmovaps	%xmm1, %xmm0
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	224(%esp), %xmm1
	movl	124(%esp), %edx
	movl	172(%esp), %ecx
	vmovaps	%xmm0, %xmm2
	vmovss	188(%esp), %xmm0
	vfmadd213ss	192(%esp), %xmm0, %xmm2
	addl	$4, %esi
	adcl	$0, 152(%esp)
	addl	$8, %ebx
	adcl	$0, 128(%esp)
	addl	$4, %edi
	movl	216(%esp), %eax
	cmpl	%eax, %edx
	vmovaps	%xmm2, %xmm0
	jne	.LBB1_27
.LBB1_28:
	vmovss	%xmm2, 192(%esp)
	movl	184(%esp), %esi
	movl	80(%esp), %eax
	leal	(%esi,%eax), %edi
	movl	%edi, 152(%esp)
	movl	112(%esp), %eax
	vmovsd	64(%esp), %xmm0
	vmulsd	(%eax,%edi,8), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	104(%esp), %eax
	leal	(%edx,%eax), %eax
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	164(%esp), %eax
	vmovss	-8(%ecx,%eax,4), %xmm0
	vmovss	%xmm0, 216(%esp)
	movl	%edx, (%esp)
	vmovaps	%xmm1, %xmm0
	vmovss	%xmm1, 224(%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vfmadd213ss	192(%esp), %xmm1, %xmm0
	testl	%esi, %esi
	jle	.LBB1_29
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovaps	%xmm0, %xmm2
	.align	16, 0x90
.LBB1_33:
	vmovss	%xmm2, 188(%esp)
	vmovss	%xmm3, 192(%esp)
	movl	176(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	vmovss	%xmm0, 216(%esp)
	movl	%ebx, (%esp)
	vmovss	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vfmadd213ss	188(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 216(%esp)
	vmovaps	%xmm1, %xmm2
	movl	180(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	192(%esp), %xmm0, %xmm1
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 184(%esp)
	vmovapd	%xmm1, %xmm3
	jne	.LBB1_33
	jmp	.LBB1_34
	.align	16, 0x90
.LBB1_29:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovss	%xmm0, 216(%esp)
.LBB1_34:
	vmovss	%xmm1, 188(%esp)
	movl	112(%esp), %eax
	movl	152(%esp), %ecx
	vmovsd	(%eax,%ecx,8), %xmm0
	vmovsd	%xmm0, 152(%esp)
	movl	184(%esp), %esi
	movl	%esi, (%esp)
	vmovss	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	152(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	movl	$2147483647, %eax
	vmovd	%eax, %xmm2
	vandpd	%xmm2, %xmm3, %xmm0
	vucomiss	168(%esp), %xmm0
	jae	.LBB1_36
	vmovss	224(%esp), %xmm4
	jmp	.LBB1_41
	.align	16, 0x90
.LBB1_36:
	testl	%esi, %esi
	vmovss	188(%esp), %xmm1
	jle	.LBB1_37
	vmovss	224(%esp), %xmm4
	vmovapd	%xmm2, %xmm0
	vmovapd	%xmm0, 128(%esp)
	.align	16, 0x90
.LBB1_48:
	vdivss	%xmm1, %xmm3, %xmm0
	vsubss	%xmm0, %xmm4, %xmm4
	vmovss	%xmm4, 224(%esp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vmovaps	%xmm1, %xmm2
	.align	16, 0x90
.LBB1_39:
	vmovapd	%xmm3, 192(%esp)
	vmovss	%xmm2, 188(%esp)
	movl	176(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	vmovss	%xmm0, 216(%esp)
	movl	%ebx, (%esp)
	vmovss	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	216(%esp), %xmm1
	vfmadd213ss	192(%esp), %xmm0, %xmm1
	vmovss	%xmm1, 216(%esp)
	vmovapd	%xmm1, %xmm3
	movl	180(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	188(%esp), %xmm0, %xmm1
	vmovss	224(%esp), %xmm0
	addl	$4, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, 184(%esp)
	vmovaps	%xmm1, %xmm2
	jne	.LBB1_39
	movl	184(%esp), %eax
	movl	%eax, (%esp)
	vmovss	%xmm1, 188(%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	224(%esp), %xmm4
	vmovss	216(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	152(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vmovss	188(%esp), %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	vmovapd	128(%esp), %xmm0
	vandpd	%xmm0, %xmm3, %xmm0
	vucomiss	168(%esp), %xmm0
	jae	.LBB1_48
	jmp	.LBB1_41
	.align	16, 0x90
.LBB1_37:
	vmovss	224(%esp), %xmm4
	vmovapd	%xmm2, 128(%esp)
	.align	16, 0x90
.LBB1_38:
	vmovapd	%xmm3, 192(%esp)
	movl	%esi, (%esp)
	vdivss	%xmm1, %xmm3, %xmm0
	vsubss	%xmm0, %xmm4, %xmm4
	vmovss	%xmm4, 224(%esp)
	vmovaps	%xmm4, %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	224(%esp), %xmm4
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovaps	192(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmovsd	152(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vmovss	188(%esp), %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	vandpd	128(%esp), %xmm3, %xmm0
	vucomiss	168(%esp), %xmm0
	jae	.LBB1_38
.LBB1_41:
	vmovaps	%xmm4, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	cmpl	$0, 164(%esp)
	jle	.LBB1_44
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vmovss	%xmm0, 224(%esp)
	.align	16, 0x90
.LBB1_43:
	vmovss	%xmm1, 192(%esp)
	movl	120(%esp), %eax
	vmovsd	(%eax,%esi), %xmm0
	vmovsd	%xmm0, 216(%esp)
	movl	%ebx, (%esp)
	addl	$8, %esi
	adcl	$0, %edi
	vmovss	224(%esp), %xmm0
	calll	__ocl_svml_s9_pownf1
	vmovss	192(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	216(%esp), %xmm2
	vfmadd213sd	%xmm1, %xmm2, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm1
	vmovss	224(%esp), %xmm0
	incl	%ebx
	cmpl	%ebx, 164(%esp)
	jne	.LBB1_43
.LBB1_44:
	movl	104(%esp), %eax
	movl	84(%esp), %edx
	leal	(%eax,%edx), %eax
	movl	92(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	96(%esp), %ecx
	vmovss	%xmm1, (%ecx,%eax,4)
	vaddss	100(%esp), %xmm0, %xmm0
	movl	76(%esp), %ecx
	movl	108(%esp), %eax
	vmovss	%xmm0, (%eax,%ecx,4)
	incl	%edx
	movl	88(%esp), %eax
	incl	%eax
	cmpl	60(%esp), %eax
	jne	.LBB1_25
	movl	120(%esp), %ebx
	movl	48(%esp), %eax
	addl	%eax, %ebx
	addl	%eax, 116(%esp)
	movl	36(%esp), %eax
	addl	%eax, 176(%esp)
	movl	180(%esp), %eax
	addl	32(%esp), %eax
	incl	%ecx
	movl	56(%esp), %edi
	incl	%edi
	cmpl	40(%esp), %edi
	movl	164(%esp), %edx
	movl	184(%esp), %esi
	jne	.LBB1_24
.LBB1_46:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp19:
	.size	Extremums_Newton_v2, .Ltmp19-Extremums_Newton_v2
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	4591870180066957722
	.text
	.globl	Extremums_Newton
	.align	16, 0x90
	.type	Extremums_Newton,@function
Extremums_Newton:
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
	andl	$-8, %esp
	subl	$240, %esp
.Ltmp26:
	.cfi_offset %esi, -20
.Ltmp27:
	.cfi_offset %edi, -16
.Ltmp28:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	68(%eax), %edx
	movl	%edx, 28(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %esi
	imull	%edx, %esi
	addl	44(%eax), %esi
	movl	(%eax), %ecx
	movl	%ecx, 32(%esp)
	movl	4(%eax), %ebx
	movl	%ebx, 120(%esp)
	movl	%eax, %edi
	leal	-1(%ebx), %eax
	movl	%eax, 80(%esp)
	movl	%esi, %ecx
	imull	%eax, %ecx
	movl	16(%edi), %eax
	movl	%eax, 76(%esp)
	leal	(%eax,%ecx,4), %edx
	movl	%edx, 40(%esp)
	movl	%ebx, %edx
	imull	%esi, %edx
	movl	32(%esp), %ebx
	leal	(%ebx,%edx,8), %ebx
	movl	%ebx, 124(%esp)
	movl	32(%esp), %ebx
	leal	8(%ebx,%edx,8), %edx
	movl	%edx, 108(%esp)
	movl	120(%esp), %edx
	leal	4(%eax,%ecx,4), %ebx
	movl	%esi, %eax
	movl	124(%esp), %esi
	leal	-2(%edx), %ecx
	movl	%ecx, 148(%esp)
	movl	%eax, %ecx
	imull	148(%esp), %ecx
	shll	$2, %ecx
	addl	20(%edi), %ecx
	movl	%ecx, 144(%esp)
	vmovss	8(%edi), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	.LCPI2_0, %xmm0, %xmm2
	vmovsd	%xmm2, 112(%esp)
	movl	28(%edi), %ecx
	movl	%ecx, 60(%esp)
	movl	24(%edi), %ecx
	movl	%ecx, 72(%esp)
	leal	(,%edx,8), %ecx
	movl	%ecx, 24(%esp)
	leal	-8(,%edx,4), %ecx
	movl	%ecx, 20(%esp)
	leal	-4(,%edx,4), %ecx
	movl	%ecx, 16(%esp)
	vmovss	36(%edi), %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 48(%esp)
	movl	$0, 36(%esp)
	vcvtsi2sdl	80(%esp), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%esp)
	.align	16, 0x90
.LBB2_1:
	movl	%ebx, 104(%esp)
	movl	%esi, 124(%esp)
	movl	%eax, %ecx
	imull	%edx, %ecx
	movl	%ecx, 96(%esp)
	cmpl	$0, 148(%esp)
	jle	.LBB2_2
	movl	%esi, 124(%esp)
	movl	%eax, %ecx
	movl	%eax, 44(%esp)
	imull	80(%esp), %ecx
	movl	%ecx, 84(%esp)
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%edx, %edx
	movl	40(%esp), %esi
	movl	%ebx, %edi
	xorl	%ebx, %ebx
	movl	$0, 100(%esp)
	xorl	%eax, %eax
	vxorps	%xmm3, %xmm3, %xmm3
	movl	%edi, 104(%esp)
	.align	16, 0x90
.LBB2_4:
	vmovsd	%xmm3, 128(%esp)
	vmovsd	%xmm1, 136(%esp)
	movl	%ecx, 152(%esp)
	movl	%edx, 160(%esp)
	leal	1(%eax), %edi
	vcvtsi2sdl	%edi, %xmm0, %xmm0
	movl	108(%esp), %edx
	vmulsd	(%edx,%ebx), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%esi)
	vcvtsi2ssl	%edi, %xmm0, %xmm0
	movl	104(%esp), %edx
	vmulss	(%edx,%ecx), %xmm0, %xmm0
	movl	144(%esp), %edx
	vmovss	%xmm0, (%edx,%ecx)
	vmovss	(%esi), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, 176(%esp)
	movl	%eax, (%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 168(%esp)
	vmovaps	%xmm2, %xmm0
	calll	__ocl_svml_s9_pown1
	vmovsd	168(%esp), %xmm4
	movl	160(%esp), %edx
	movl	152(%esp), %ecx
	vmovsd	112(%esp), %xmm2
	vfmadd213sd	136(%esp), %xmm0, %xmm4
	vmovsd	176(%esp), %xmm1
	vfmadd213sd	128(%esp), %xmm0, %xmm1
	vmovaps	%xmm1, %xmm0
	addl	$4, %ecx
	adcl	$0, %edx
	addl	$8, %ebx
	adcl	$0, 100(%esp)
	addl	$4, %esi
	cmpl	%edi, 148(%esp)
	movl	%edi, %eax
	vmovaps	%xmm4, %xmm1
	vmovaps	%xmm0, %xmm3
	jne	.LBB2_4
	vmovsd	%xmm0, 176(%esp)
	vmovsd	%xmm4, 168(%esp)
	movl	120(%esp), %edx
	movl	80(%esp), %eax
	movl	124(%esp), %esi
	movl	108(%esp), %ecx
	movl	104(%esp), %ebx
	movl	84(%esp), %edi
	jmp	.LBB2_6
	.align	16, 0x90
.LBB2_2:
	movl	108(%esp), %ecx
	movl	%eax, %edi
	movl	%eax, 44(%esp)
	movl	80(%esp), %eax
	imull	%eax, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 168(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 176(%esp)
.LBB2_6:
	movl	%edi, 84(%esp)
	addl	%eax, 96(%esp)
	movl	32(%esp), %eax
	vmovsd	8(%esp), %xmm0
	movl	96(%esp), %edi
	vmulsd	(%eax,%edi,8), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 160(%esp)
	movl	148(%esp), %eax
	movl	84(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 68(%esp)
	movl	76(%esp), %eax
	vmovss	%xmm0, (%eax,%edi,4)
	cmpl	$0, 80(%esp)
	jle	.LBB2_26
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	vmovaps	%xmm2, %xmm0
	calll	__ocl_svml_s9_pown1
	vmovss	160(%esp), %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm4
	vfmadd213sd	176(%esp), %xmm0, %xmm4
	movl	76(%esp), %eax
	movl	84(%esp), %ecx
	leal	(%eax,%ecx,4), %eax
	movl	%eax, 136(%esp)
	movl	72(%esp), %eax
	leal	(%eax,%ecx,4), %eax
	movl	%eax, 64(%esp)
	xorl	%edi, %edi
	movl	%eax, 96(%esp)
	vmovsd	112(%esp), %xmm3
	.align	16, 0x90
.LBB2_8:
	movl	%edi, 100(%esp)
	vmovsd	%xmm4, 224(%esp)
	movl	228(%esp), %eax
	movl	$2147483647, %edi
	andl	%edi, %eax
	movl	%eax, 220(%esp)
	movl	224(%esp), %eax
	movl	%eax, 216(%esp)
	vmovsd	216(%esp), %xmm0
	vucomisd	.LCPI2_0, %xmm0
	vmovsd	168(%esp), %xmm1
	jb	.LBB2_11
	movl	76(%esp), %eax
	movl	68(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 128(%esp)
	movl	148(%esp), %esi
	testl	%esi, %esi
	jle	.LBB2_10
	.align	16, 0x90
.LBB2_19:
	vdivsd	%xmm1, %xmm4, %xmm0
	vsubsd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, 152(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB2_17:
	vmovsd	%xmm2, 160(%esp)
	vmovsd	%xmm0, 168(%esp)
	movl	136(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 176(%esp)
	movl	%esi, (%esp)
	vmovaps	%xmm3, %xmm0
	calll	__ocl_svml_s9_pown1
	vmovsd	152(%esp), %xmm3
	vmovsd	176(%esp), %xmm1
	vfmadd213sd	160(%esp), %xmm0, %xmm1
	vmovsd	%xmm1, 176(%esp)
	vmovaps	%xmm1, %xmm2
	movl	144(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vfmadd213sd	168(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	incl	%esi
	cmpl	%esi, 148(%esp)
	vmovaps	%xmm1, %xmm0
	jne	.LBB2_17
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	vmovaps	%xmm3, %xmm0
	vmovsd	%xmm1, 168(%esp)
	calll	__ocl_svml_s9_pown1
	vmovsd	152(%esp), %xmm3
	vmovsd	168(%esp), %xmm1
	vmovaps	%xmm0, %xmm4
	vmovsd	128(%esp), %xmm0
	vfmadd213sd	176(%esp), %xmm0, %xmm4
	vmovsd	%xmm4, 192(%esp)
	movl	196(%esp), %eax
	movl	$2147483647, %ecx
	andl	%ecx, %eax
	movl	%eax, 188(%esp)
	movl	192(%esp), %eax
	movl	%eax, 184(%esp)
	vmovsd	184(%esp), %xmm0
	vucomisd	.LCPI2_0, %xmm0
	jae	.LBB2_19
	jmp	.LBB2_11
	.align	16, 0x90
.LBB2_10:
	movl	%esi, (%esp)
	vdivsd	%xmm1, %xmm4, %xmm0
	vsubsd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, 152(%esp)
	vmovaps	%xmm3, %xmm0
	calll	__ocl_svml_s9_pown1
	vmovsd	128(%esp), %xmm2
	vmovsd	152(%esp), %xmm3
	vmovaps	%xmm0, %xmm4
	vxorps	%xmm1, %xmm1, %xmm1
	vfmadd213sd	%xmm1, %xmm2, %xmm4
	vmovsd	%xmm4, 208(%esp)
	movl	212(%esp), %eax
	andl	%edi, %eax
	movl	%eax, 204(%esp)
	movl	208(%esp), %eax
	movl	%eax, 200(%esp)
	vmovsd	200(%esp), %xmm0
	vucomisd	.LCPI2_0, %xmm0
	jae	.LBB2_10
.LBB2_11:
	vmovsd	%xmm1, 168(%esp)
	movl	100(%esp), %edx
	testl	%edx, %edx
	movl	64(%esp), %eax
	movl	%edx, %ecx
	movl	%edx, %edi
	movl	120(%esp), %edx
	vmovsd	.LCPI2_0, %xmm2
	movl	96(%esp), %ebx
	jle	.LBB2_15
	.align	16, 0x90
.LBB2_12:
	vmovss	(%eax), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubsd	%xmm3, %xmm0, %xmm1
	xorl	%ebx, %ebx
	vucomisd	%xmm1, %xmm2
	jbe	.LBB2_14
	vsubsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm0, %xmm2
	seta	%bl
.LBB2_14:
	addl	$4, %eax
	decl	%ecx
	jne	.LBB2_12
.LBB2_15:
	movl	%ebx, 96(%esp)
	testb	$1, %bl
	movl	104(%esp), %ebx
	jne	.LBB2_16
	vmovsd	%xmm4, 128(%esp)
	movl	84(%esp), %eax
	leal	(%edi,%eax), %ecx
	movl	%ecx, 88(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	%xmm3, %xmm3, %xmm0
	movl	72(%esp), %eax
	vmovss	%xmm0, (%eax,%ecx,4)
	vxorps	%xmm0, %xmm0, %xmm0
	testl	%edx, %edx
	vmovsd	112(%esp), %xmm2
	jle	.LBB2_24
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	vmovsd	%xmm3, 152(%esp)
	.align	16, 0x90
.LBB2_22:
	vmovsd	%xmm1, 160(%esp)
	movl	124(%esp), %eax
	vmovsd	(%eax,%esi), %xmm0
	vmovsd	%xmm0, 176(%esp)
	movl	%ebx, (%esp)
	vmovsd	152(%esp), %xmm0
	calll	__ocl_svml_s9_pown1
	movl	120(%esp), %edx
	vmovsd	176(%esp), %xmm1
	vfmadd213sd	160(%esp), %xmm1, %xmm0
	addl	$8, %esi
	adcl	$0, %edi
	incl	%ebx
	cmpl	%ebx, %edx
	vmovaps	%xmm0, %xmm1
	jne	.LBB2_22
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	104(%esp), %ebx
	vmovsd	112(%esp), %xmm2
	movl	100(%esp), %edi
	vmovsd	152(%esp), %xmm3
.LBB2_24:
	movl	60(%esp), %eax
	movl	88(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	incl	%edi
	movl	124(%esp), %esi
	movl	108(%esp), %ecx
	vmovsd	128(%esp), %xmm4
	jmp	.LBB2_25
	.align	16, 0x90
.LBB2_16:
	movl	124(%esp), %esi
	movl	108(%esp), %ecx
	vmovsd	112(%esp), %xmm2
.LBB2_25:
	vmovsd	48(%esp), %xmm0
	vaddsd	%xmm3, %xmm0, %xmm3
	cmpl	80(%esp), %edi
	jl	.LBB2_8
.LBB2_26:
	movl	16(%esp), %edi
	addl	%edi, 40(%esp)
	movl	24(%esp), %eax
	addl	%eax, %esi
	addl	%eax, %ecx
	movl	%ecx, 108(%esp)
	addl	%edi, %ebx
	movl	20(%esp), %eax
	addl	%eax, 144(%esp)
	movl	44(%esp), %eax
	incl	%eax
	movl	36(%esp), %ecx
	incl	%ecx
	movl	%ecx, 36(%esp)
	cmpl	28(%esp), %ecx
	jne	.LBB2_1
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp29:
	.size	Extremums_Newton, .Ltmp29-Extremums_Newton
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
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI3_1:
	.long	1056964608
	.text
	.globl	features
	.align	16, 0x90
	.type	features,@function
features:
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
	andl	$-4, %esp
	subl	$280, %esp
.Ltmp36:
	.cfi_offset %esi, -20
.Ltmp37:
	.cfi_offset %edi, -16
.Ltmp38:
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
	je	.LBB3_9
	movl	64(%esp), %esi
	vmovd	%esi, %xmm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpermd	%ymm0, %ymm1, %ymm0
	movl	60(%esp), %edx
	vmovd	%edx, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vpaddd	.LCPI3_0, %ymm1, %ymm1
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
	vbroadcastss	.LCPI3_1, %ymm2
	.align	16, 0x90
.LBB3_2:
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
	jle	.LBB3_5
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
.LBB3_4:
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
	jne	.LBB3_4
.LBB3_5:
	cmpl	$0, 64(%esp)
	jle	.LBB3_8
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
.LBB3_7:
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
	jl	.LBB3_7
.LBB3_8:
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
	jne	.LBB3_2
.LBB3_9:
	movl	48(%esp), %ecx
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpl	%eax, %ecx
	movl	272(%esp), %edx
	je	.LBB3_17
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
	vmovss	.LCPI3_1, %xmm1
	.align	16, 0x90
.LBB3_11:
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
	jle	.LBB3_13
	.align	16, 0x90
.LBB3_12:
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
	jne	.LBB3_12
.LBB3_13:
	cmpl	$0, 64(%esp)
	movl	224(%esp), %edx
	jle	.LBB3_16
	movl	$4, %ecx
	xorl	%ebx, %ebx
	movl	228(%esp), %eax
	movl	220(%esp), %esi
	movl	%esi, 244(%esp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	.align	16, 0x90
.LBB3_15:
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
	jl	.LBB3_15
.LBB3_16:
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
	jne	.LBB3_11
.LBB3_17:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp39:
	.size	features, .Ltmp39-features
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI4_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
.LCPI4_8:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI4_1:
	.long	6
.LCPI4_2:
	.long	1065353216
.LCPI4_3:
	.long	1
.LCPI4_4:
	.long	2
.LCPI4_5:
	.long	3
.LCPI4_6:
	.long	4
.LCPI4_7:
	.long	5
.LCPI4_9:
	.long	0
	.text
	.globl	build_polinome
	.align	16, 0x90
	.type	build_polinome,@function
build_polinome:
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
	andl	$-32, %esp
	subl	$1632, %esp
.Ltmp46:
	.cfi_offset %esi, -20
.Ltmp47:
	.cfi_offset %edi, -16
.Ltmp48:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	24(%eax), %ecx
	movl	%ecx, 844(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 712(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 728(%esp)
	movl	12(%eax), %ecx
	movl	%ecx, 944(%esp)
	movl	8(%eax), %edi
	movl	%edi, 840(%esp)
	movl	(%eax), %ebx
	movl	%ebx, 948(%esp)
	movl	4(%eax), %ecx
	movl	%ecx, 676(%esp)
	movl	36(%eax), %ecx
	movl	%ecx, 896(%esp)
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	movl	60(%eax), %ecx
	movl	60(%eax), %esi
	movl	%esi, 280(%esp)
	movl	96(%eax), %eax
	movl	%eax, 716(%esp)
	imull	%edx, %ecx
	movl	844(%esp), %edx
	addl	896(%esp), %ecx
	movl	%ecx, 28(%esp)
	sarl	$3, %esi
	movl	%esi, 276(%esp)
	je	.LBB4_70
	movl	28(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI4_0, %ymm0, %ymm0
	vpbroadcastd	.LCPI4_1, %ymm1
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
	vmovss	.LCPI4_2, %xmm1
	vdivss	%xmm0, %xmm1, %xmm1
	vmovaps	%ymm1, 800(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, 720(%esp)
	vpermps	%ymm1, %ymm2, %ymm0
	vmovaps	%ymm0, 640(%esp)
	xorl	%eax, %eax
	vpbroadcastd	.LCPI4_3, %ymm0
	vmovdqa	%ymm0, 160(%esp)
	vpbroadcastd	.LCPI4_4, %ymm0
	vmovdqa	%ymm0, 128(%esp)
	vpbroadcastd	.LCPI4_5, %ymm0
	vmovdqa	%ymm0, 96(%esp)
	vpbroadcastd	.LCPI4_6, %ymm0
	vmovdqa	%ymm0, 64(%esp)
	vpbroadcastd	.LCPI4_7, %ymm0
	vmovdqa	%ymm0, 32(%esp)
	vmovaps	%ymm3, 544(%esp)
	vmovaps	%ymm3, 512(%esp)
	vmovaps	%ymm3, 480(%esp)
	vmovaps	%ymm3, 448(%esp)
	vmovaps	%ymm3, 416(%esp)
	.align	16, 0x90
.LBB4_2:
	movl	%eax, 412(%esp)
	testl	%edx, %edx
	movl	%edx, %esi
	movl	%ebx, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	jle	.LBB4_3
	.align	16, 0x90
.LBB4_8:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$0, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_8
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_10:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_10
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_12:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_12
	jmp	.LBB4_4
	.align	16, 0x90
.LBB4_3:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_4:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	%ebx, %ecx
	movl	%eax, %ebx
	movl	%ecx, %edi
	jle	.LBB4_106
	.align	16, 0x90
.LBB4_5:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_5
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_7:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_7
	jmp	.LBB4_107
	.align	16, 0x90
.LBB4_106:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_107:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %ebx
	movl	%ebx, %edi
	jle	.LBB4_119
	.align	16, 0x90
.LBB4_108:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_108
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 20(%eax)
	vmovdqa	576(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %esi
	vpextrd	$2, %xmm0, %edi
	vpextrd	$1, %xmm0, %ebx
	vmovd	%xmm0, 896(%esp)
	vpextrd	$3, %xmm1, %ecx
	vpextrd	$2, %xmm1, %eax
	movl	%eax, 856(%esp)
	vpextrd	$1, %xmm1, %eax
	vmovd	%xmm1, %edx
	shll	$2, %esi
	movl	%esi, 892(%esp)
	shll	$2, %edi
	movl	%edi, 888(%esp)
	shll	$2, %ebx
	movl	%ebx, 864(%esp)
	shll	$2, 896(%esp)
	shll	$2, %ecx
	movl	%ecx, 860(%esp)
	movl	856(%esp), %ecx
	shll	$2, %ecx
	shll	$2, %eax
	shll	$2, %edx
	vxorpd	%ymm0, %ymm0, %ymm0
	movl	844(%esp), %ebx
	movl	676(%esp), %esi
	.align	16, 0x90
.LBB4_110:
	movl	896(%esp), %edi
	vmovss	(%esi,%edi), %xmm1
	movl	864(%esp), %edi
	vinsertps	$16, (%esi,%edi), %xmm1, %xmm1
	movl	888(%esp), %edi
	vinsertps	$32, (%esi,%edi), %xmm1, %xmm1
	movl	892(%esp), %edi
	vinsertps	$48, (%esi,%edi), %xmm1, %xmm1
	vmovss	(%esi,%edx), %xmm2
	vinsertps	$16, (%esi,%eax), %xmm2, %xmm2
	vinsertps	$32, (%esi,%ecx), %xmm2, %xmm2
	movl	860(%esp), %edi
	vinsertps	$48, (%esi,%edi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	addl	$4, %esi
	decl	%ebx
	jne	.LBB4_110
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	728(%esp), %eax
	vextractps	$3, %xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	948(%esp), %ebx
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_112:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_112
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 24(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_114:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_114
	jmp	.LBB4_115
	.align	16, 0x90
.LBB4_119:
	movl	944(%esp), %ecx
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 20(%ecx)
	movl	728(%esp), %eax
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 24(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_115:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 28(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	%ebx, %ecx
	movl	%eax, %ebx
	movl	%ecx, %edi
	jle	.LBB4_99
	.align	16, 0x90
.LBB4_116:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_116
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_118:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_118
	jmp	.LBB4_100
	.align	16, 0x90
.LBB4_99:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_100:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 36(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_231
	.align	16, 0x90
.LBB4_101:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_101
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_103:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_103
	jmp	.LBB4_104
	.align	16, 0x90
.LBB4_231:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_104:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	vmovss	%xmm0, 44(%ecx)
	testl	%ebx, %ebx
	jle	.LBB4_105
	vmovdqa	544(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %edi
	leal	(%edi,%eax,4), %eax
	movl	%eax, 896(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 892(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 888(%esp)
	vmovd	%xmm0, %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 864(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 860(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%edi,%eax,4), %eax
	movl	%eax, 856(%esp)
	vpextrd	$1, %xmm1, %ecx
	leal	(%edi,%ecx,4), %eax
	movl	%eax, 852(%esp)
	vmovd	%xmm1, %edx
	movl	%ebx, %esi
	movl	948(%esp), %ebx
	leal	(%edi,%edx,4), %eax
	xorl	%edx, %edx
	vxorpd	%ymm0, %ymm0, %ymm0
	xorl	%edi, %edi
	.align	16, 0x90
.LBB4_14:
	movl	864(%esp), %ecx
	vmovss	(%ecx,%edx), %xmm1
	movl	888(%esp), %ecx
	vinsertps	$16, (%ecx,%edx), %xmm1, %xmm1
	movl	892(%esp), %ecx
	vinsertps	$32, (%ecx,%edx), %xmm1, %xmm1
	movl	896(%esp), %ecx
	vinsertps	$48, (%ecx,%edx), %xmm1, %xmm1
	vmovss	(%eax,%edx), %xmm2
	movl	852(%esp), %ecx
	vinsertps	$16, (%ecx,%edx), %xmm2, %xmm2
	movl	856(%esp), %ecx
	vinsertps	$32, (%ecx,%edx), %xmm2, %xmm2
	movl	860(%esp), %ecx
	vinsertps	$48, (%ecx,%edx), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	vbroadcastss	(%ebx,%edx), %ymm1
	vfmadd213ps	%ymm0, %ymm2, %ymm1
	addl	$4, %edx
	adcl	$0, %edi
	decl	%esi
	vmovaps	%ymm1, %ymm0
	jne	.LBB4_14
	vmovaps	640(%esp), %ymm0
	vmulps	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	728(%esp), %eax
	vextractps	$3, %xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_16:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_16
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 48(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_18:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_18
	jmp	.LBB4_19
	.align	16, 0x90
.LBB4_105:
	movl	728(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	%xmm0, 48(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_19:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 52(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	948(%esp), %edi
	jle	.LBB4_92
	.align	16, 0x90
.LBB4_20:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_20
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 56(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_22:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_22
	jmp	.LBB4_93
	.align	16, 0x90
.LBB4_92:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 56(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_93:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 60(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_230
	.align	16, 0x90
.LBB4_94:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_94
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 64(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_96:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_96
	jmp	.LBB4_97
	.align	16, 0x90
.LBB4_230:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 64(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_97:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	vmovss	%xmm0, 68(%ecx)
	testl	%ebx, %ebx
	jle	.LBB4_98
	vmovdqa	512(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 892(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 888(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 864(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 860(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 856(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 852(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 848(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 768(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	%ebx, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB4_24:
	vmovapd	%ymm1, 896(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$2, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	860(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	864(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	888(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	892(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	768(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	848(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	852(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	856(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	896(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB4_24
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	728(%esp), %eax
	vextractps	$3, %xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_26:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_26
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 72(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_28:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_28
	jmp	.LBB4_29
	.align	16, 0x90
.LBB4_98:
	movl	728(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 8(%eax)
	vmovss	%xmm0, 72(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_29:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 76(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_85
	.align	16, 0x90
.LBB4_30:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_30
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_32:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_32
	jmp	.LBB4_86
	.align	16, 0x90
.LBB4_85:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_86:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 84(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_229
	.align	16, 0x90
.LBB4_87:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_87
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_89:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$8, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_89
	jmp	.LBB4_90
	.align	16, 0x90
.LBB4_229:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_90:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	vmovss	%xmm0, 92(%ecx)
	testl	%ebx, %ebx
	jle	.LBB4_91
	vmovdqa	480(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 892(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 888(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 864(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 860(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 856(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 852(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 848(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 768(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	%ebx, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB4_34:
	vmovapd	%ymm1, 896(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$3, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	860(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	864(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	888(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	892(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	768(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	848(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	852(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	856(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	896(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB4_34
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	728(%esp), %eax
	vextractps	$3, %xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_36:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_36
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 96(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_38:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_38
	jmp	.LBB4_39
	.align	16, 0x90
.LBB4_91:
	movl	728(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vmovss	%xmm0, 96(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_39:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 100(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_78
	.align	16, 0x90
.LBB4_40:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_40
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 104(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_42:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_42
	jmp	.LBB4_79
	.align	16, 0x90
.LBB4_78:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 104(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_79:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 108(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_228
	.align	16, 0x90
.LBB4_80:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_80
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 112(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_82:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$9, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_82
	jmp	.LBB4_83
	.align	16, 0x90
.LBB4_228:
	movl	944(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 112(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_83:
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	vmovss	%xmm0, 116(%ecx)
	movl	%ebx, %edx
	testl	%edx, %edx
	jle	.LBB4_84
	vmovdqa	448(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 892(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 888(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 864(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 860(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 856(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 852(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 848(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 768(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	%edx, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB4_44:
	vmovapd	%ymm1, 896(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$4, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	860(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	864(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	888(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	892(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	768(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	848(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	852(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	856(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	896(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB4_44
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	728(%esp), %eax
	vextractps	$3, %xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	948(%esp), %eax
	movl	%eax, %edi
	movl	%eax, %ebx
	.align	16, 0x90
.LBB4_46:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_46
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 120(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_48:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_48
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 124(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_50:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_50
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 128(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_52:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_52
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 132(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_54:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%edi), %xmm0
	movl	$9, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_54
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 136(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_56:
	vmovss	%xmm1, 896(%esp)
	vmovss	(%esi), %xmm0
	movl	$10, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	896(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_56
	vmovaps	800(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	movl	844(%esp), %edx
	jmp	.LBB4_58
	.align	16, 0x90
.LBB4_84:
	movl	948(%esp), %ebx
	movl	728(%esp), %eax
	vmovss	720(%esp), %xmm0
	vmovss	%xmm0, 16(%eax)
	vmovss	%xmm0, 120(%ecx)
	vmovss	%xmm0, 124(%ecx)
	vmovss	%xmm0, 128(%ecx)
	vmovss	%xmm0, 132(%ecx)
	vmovss	%xmm0, 136(%ecx)
.LBB4_58:
	vmovss	%xmm0, 140(%ecx)
	vxorps	%ymm0, %ymm0, %ymm0
	testl	%edx, %edx
	movl	%ebx, %edx
	jle	.LBB4_61
	vmovdqa	416(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	676(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 892(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 888(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 864(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 860(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 856(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 852(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 848(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 768(%esp)
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	844(%esp), %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB4_60:
	vmovapd	%ymm1, 896(%esp)
	vmovss	(%edx,%esi), %xmm0
	movl	$5, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	948(%esp), %edx
	movl	860(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	movl	864(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm1, %xmm1
	movl	888(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm1, %xmm1
	movl	892(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	768(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	848(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	852(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	movl	856(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	896(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB4_60
.LBB4_61:
	vmovaps	640(%esp), %ymm1
	vmulps	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	728(%esp), %edx
	vextractps	$3, %xmm0, 20(%edx)
	movl	712(%esp), %ecx
	movl	(%ecx), %eax
	vmovss	(%edx,%eax,4), %xmm0
	vmovapd	608(%esp), %ymm7
	vmovd	%xmm7, %eax
	movl	%eax, 856(%esp)
	movl	840(%esp), %ebx
	vmovss	%xmm0, (%ebx,%eax,4)
	vpextrd	$1, %xmm7, %eax
	movl	%eax, 852(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	vpextrd	$2, %xmm7, %eax
	movl	%eax, 864(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	vpextrd	$3, %xmm7, %eax
	movl	%eax, 848(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	vextractf128	$1, %ymm7, %xmm1
	vmovd	%xmm1, %eax
	movl	%eax, 896(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	vpextrd	$1, %xmm1, %eax
	movl	%eax, 892(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	vpextrd	$2, %xmm1, %eax
	movl	%eax, 888(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	vpextrd	$3, %xmm1, %eax
	movl	%eax, 860(%esp)
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	4(%ecx), %eax
	vmovss	(%edx,%eax,4), %xmm1
	vorpd	160(%esp), %ymm7, %ymm2
	vmovd	%xmm2, %eax
	movl	%eax, 692(%esp)
	vmovss	%xmm1, (%ebx,%eax,4)
	vpextrd	$1, %xmm2, %eax
	movl	%eax, 696(%esp)
	vmovss	%xmm1, (%ebx,%eax,4)
	vpextrd	$2, %xmm2, %eax
	movl	%eax, 700(%esp)
	vmovss	%xmm1, (%ebx,%eax,4)
	vpextrd	$3, %xmm2, %eax
	movl	%eax, 704(%esp)
	vmovss	%xmm1, (%ebx,%eax,4)
	vextractf128	$1, %ymm2, %xmm2
	vmovd	%xmm2, %eax
	movl	%eax, 708(%esp)
	vmovss	%xmm1, (%ebx,%eax,4)
	vpextrd	$1, %xmm2, %ecx
	movl	%ecx, 680(%esp)
	vmovss	%xmm1, (%ebx,%ecx,4)
	vpextrd	$2, %xmm2, %edi
	movl	%edi, 684(%esp)
	vmovss	%xmm1, (%ebx,%edi,4)
	vpextrd	$3, %xmm2, %eax
	movl	%eax, 688(%esp)
	vmovss	%xmm1, (%ebx,%eax,4)
	movl	896(%esp), %esi
	vmovss	(%ebx,%esi,4), %xmm2
	movl	892(%esp), %esi
	vinsertps	$16, (%ebx,%esi,4), %xmm2, %xmm2
	movl	888(%esp), %esi
	vinsertps	$32, (%ebx,%esi,4), %xmm2, %xmm2
	movl	860(%esp), %esi
	vinsertps	$48, (%ebx,%esi,4), %xmm2, %xmm2
	movl	856(%esp), %esi
	vmovss	(%ebx,%esi,4), %xmm3
	movl	852(%esp), %esi
	vinsertps	$16, (%ebx,%esi,4), %xmm3, %xmm3
	movl	864(%esp), %esi
	vinsertps	$32, (%ebx,%esi,4), %xmm3, %xmm3
	movl	848(%esp), %esi
	vinsertps	$48, (%ebx,%esi,4), %xmm3, %xmm3
	vinsertf128	$1, %xmm2, %ymm3, %ymm2
	vxorps	%ymm4, %ymm4, %ymm4
	vpermps	%ymm1, %ymm4, %ymm3
	movl	944(%esp), %esi
	vbroadcastss	24(%esi), %ymm1
	vfnmadd213ps	%ymm3, %ymm2, %ymm1
	movl	692(%esp), %esi
	vmovss	%xmm1, (%ebx,%esi,4)
	movl	696(%esp), %esi
	vextractps	$1, %xmm1, (%ebx,%esi,4)
	movl	700(%esp), %esi
	vextractps	$2, %xmm1, (%ebx,%esi,4)
	movl	704(%esp), %esi
	vextractps	$3, %xmm1, (%ebx,%esi,4)
	vextractf128	$1, %ymm1, %xmm2
	movl	708(%esp), %esi
	vmovss	%xmm2, (%ebx,%esi,4)
	vextractps	$1, %xmm2, (%ebx,%ecx,4)
	vextractps	$2, %xmm2, (%ebx,%edi,4)
	vextractps	$3, %xmm2, (%ebx,%eax,4)
	movl	712(%esp), %eax
	movl	8(%eax), %eax
	vmovss	(%edx,%eax,4), %xmm2
	movl	856(%esp), %eax
	vmovss	%xmm2, 8(%ebx,%eax,4)
	movl	852(%esp), %eax
	vmovss	%xmm2, 8(%ebx,%eax,4)
	movl	864(%esp), %eax
	vmovss	%xmm2, 8(%ebx,%eax,4)
	movl	848(%esp), %edx
	vmovss	%xmm2, 8(%ebx,%edx,4)
	movl	896(%esp), %esi
	vmovss	%xmm2, 8(%ebx,%esi,4)
	movl	892(%esp), %edi
	vmovss	%xmm2, 8(%ebx,%edi,4)
	movl	888(%esp), %eax
	vmovss	%xmm2, 8(%ebx,%eax,4)
	movl	860(%esp), %ecx
	vmovss	%xmm2, 8(%ebx,%ecx,4)
	leal	(%ebx,%ecx,4), %ecx
	leal	(%ebx,%eax,4), %eax
	movl	%eax, 768(%esp)
	leal	(%ebx,%edi,4), %eax
	movl	%eax, 752(%esp)
	leal	(%ebx,%esi,4), %eax
	movl	%eax, 748(%esp)
	leal	(%ebx,%edx,4), %eax
	movl	%eax, 744(%esp)
	movl	864(%esp), %eax
	leal	(%ebx,%eax,4), %eax
	movl	%eax, 740(%esp)
	movl	852(%esp), %eax
	leal	(%ebx,%eax,4), %eax
	movl	%eax, 736(%esp)
	movl	856(%esp), %eax
	leal	(%ebx,%eax,4), %eax
	movl	%eax, 732(%esp)
	vpermps	%ymm2, %ymm4, %ymm3
	vpaddd	128(%esp), %ymm7, %ymm2
	vextracti128	$1, %ymm2, %xmm4
	vpextrd	$3, %xmm4, %eax
	movl	%eax, 312(%esp)
	vpextrd	$2, %xmm4, %eax
	movl	%eax, 308(%esp)
	vpextrd	$1, %xmm4, %eax
	movl	%eax, 304(%esp)
	vmovd	%xmm4, 300(%esp)
	vpextrd	$3, %xmm2, %eax
	movl	%eax, 296(%esp)
	vpextrd	$2, %xmm2, %eax
	movl	%eax, 292(%esp)
	vpextrd	$1, %xmm2, %eax
	movl	%eax, 288(%esp)
	vmovd	%xmm2, 284(%esp)
	xorl	%edi, %edi
	movl	$8, %esi
	xorl	%eax, %eax
	.align	16, 0x90
.LBB4_62:
	movl	748(%esp), %edx
	vmovss	(%edx,%edi), %xmm2
	movl	752(%esp), %edx
	vinsertps	$16, (%edx,%edi), %xmm2, %xmm2
	movl	768(%esp), %edx
	vinsertps	$32, (%edx,%edi), %xmm2, %xmm2
	vinsertps	$48, (%ecx,%edi), %xmm2, %xmm2
	movl	732(%esp), %edx
	vmovss	(%edx,%edi), %xmm4
	movl	736(%esp), %edx
	vinsertps	$16, (%edx,%edi), %xmm4, %xmm4
	movl	740(%esp), %edx
	vinsertps	$32, (%edx,%edi), %xmm4, %xmm4
	movl	744(%esp), %edx
	vinsertps	$48, (%edx,%edi), %xmm4, %xmm4
	vinsertf128	$1, %xmm2, %ymm4, %ymm4
	movl	944(%esp), %edx
	vbroadcastss	48(%edx,%edi), %ymm2
	vfnmadd213ps	%ymm3, %ymm4, %ymm2
	movl	%ecx, %edx
	movl	856(%esp), %ecx
	vmovss	%xmm2, 8(%ebx,%ecx,4)
	movl	%edx, %ecx
	movl	852(%esp), %edx
	vextractps	$1, %xmm2, 8(%ebx,%edx,4)
	movl	864(%esp), %edx
	vextractps	$2, %xmm2, 8(%ebx,%edx,4)
	movl	848(%esp), %edx
	vextractps	$3, %xmm2, 8(%ebx,%edx,4)
	vextractf128	$1, %ymm2, %xmm3
	movl	896(%esp), %edx
	vmovss	%xmm3, 8(%ebx,%edx,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm3, 8(%ebx,%edx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm3, 8(%ebx,%edx,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm3, 8(%ebx,%edx,4)
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %esi
	vmovaps	%ymm2, %ymm3
	jne	.LBB4_62
	movl	712(%esp), %eax
	movl	12(%eax), %eax
	movl	728(%esp), %esi
	vmovss	(%esi,%eax,4), %xmm3
	movl	856(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	852(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	864(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	848(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	896(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	892(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	888(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	movl	860(%esp), %eax
	vmovss	%xmm3, 12(%ebx,%eax,4)
	vxorps	%ymm4, %ymm4, %ymm4
	vpermps	%ymm3, %ymm4, %ymm4
	vpaddd	96(%esp), %ymm7, %ymm3
	vextracti128	$1, %ymm3, %xmm5
	vpextrd	$3, %xmm5, %eax
	movl	%eax, 348(%esp)
	vpextrd	$2, %xmm5, %eax
	movl	%eax, 340(%esp)
	vpextrd	$1, %xmm5, %eax
	movl	%eax, 336(%esp)
	vmovd	%xmm5, 332(%esp)
	vpextrd	$3, %xmm3, %eax
	movl	%eax, 328(%esp)
	vpextrd	$2, %xmm3, %eax
	movl	%eax, 324(%esp)
	vpextrd	$1, %xmm3, %eax
	movl	%eax, 320(%esp)
	vmovd	%xmm3, 316(%esp)
	xorl	%edi, %edi
	movl	$12, %esi
	xorl	%eax, %eax
	movl	944(%esp), %edx
	movl	%ecx, 724(%esp)
	.align	16, 0x90
.LBB4_64:
	movl	748(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm3
	movl	752(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm3, %xmm3
	movl	768(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm3, %xmm3
	movl	724(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm3, %xmm3
	movl	732(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm5
	movl	736(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm5, %xmm5
	movl	740(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm5, %xmm5
	movl	744(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm5, %xmm5
	vinsertf128	$1, %xmm3, %ymm5, %ymm5
	vbroadcastss	72(%edx,%edi), %ymm3
	vfnmadd213ps	%ymm4, %ymm5, %ymm3
	movl	856(%esp), %ecx
	vmovss	%xmm3, 12(%ebx,%ecx,4)
	movl	%edx, %ecx
	movl	852(%esp), %edx
	vextractps	$1, %xmm3, 12(%ebx,%edx,4)
	movl	864(%esp), %edx
	vextractps	$2, %xmm3, 12(%ebx,%edx,4)
	movl	848(%esp), %edx
	vextractps	$3, %xmm3, 12(%ebx,%edx,4)
	vextractf128	$1, %ymm3, %xmm4
	movl	896(%esp), %edx
	vmovss	%xmm4, 12(%ebx,%edx,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm4, 12(%ebx,%edx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm4, 12(%ebx,%edx,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm4, 12(%ebx,%edx,4)
	movl	%ecx, %edx
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %esi
	vmovaps	%ymm3, %ymm4
	jne	.LBB4_64
	movl	712(%esp), %eax
	movl	16(%eax), %eax
	movl	728(%esp), %esi
	vmovss	(%esi,%eax,4), %xmm4
	movl	856(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	852(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	864(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	848(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	896(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	892(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	888(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	movl	860(%esp), %eax
	vmovss	%xmm4, 16(%ebx,%eax,4)
	vxorps	%ymm5, %ymm5, %ymm5
	vpermps	%ymm4, %ymm5, %ymm5
	vpaddd	64(%esp), %ymm7, %ymm4
	vextracti128	$1, %ymm4, %xmm6
	vpextrd	$3, %xmm6, %eax
	movl	%eax, 388(%esp)
	vpextrd	$2, %xmm6, %eax
	movl	%eax, 380(%esp)
	vpextrd	$1, %xmm6, %eax
	movl	%eax, 372(%esp)
	vmovd	%xmm6, 364(%esp)
	vpextrd	$3, %xmm4, %eax
	movl	%eax, 360(%esp)
	vpextrd	$2, %xmm4, %eax
	movl	%eax, 356(%esp)
	vpextrd	$1, %xmm4, %eax
	movl	%eax, 352(%esp)
	vmovd	%xmm4, 344(%esp)
	xorl	%edi, %edi
	movl	$16, %esi
	xorl	%eax, %eax
	.align	16, 0x90
.LBB4_66:
	movl	748(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm4
	movl	752(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm4, %xmm4
	movl	768(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm4, %xmm4
	movl	724(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm4, %xmm4
	movl	732(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm6
	movl	736(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm6, %xmm6
	movl	740(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm6, %xmm6
	movl	744(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm6, %xmm6
	vinsertf128	$1, %xmm4, %ymm6, %ymm6
	vbroadcastss	96(%edx,%edi), %ymm4
	vfnmadd213ps	%ymm5, %ymm6, %ymm4
	movl	856(%esp), %ecx
	vmovss	%xmm4, 16(%ebx,%ecx,4)
	movl	%edx, %ecx
	movl	852(%esp), %edx
	vextractps	$1, %xmm4, 16(%ebx,%edx,4)
	movl	864(%esp), %edx
	vextractps	$2, %xmm4, 16(%ebx,%edx,4)
	movl	848(%esp), %edx
	vextractps	$3, %xmm4, 16(%ebx,%edx,4)
	vextractf128	$1, %ymm4, %xmm5
	movl	896(%esp), %edx
	vmovss	%xmm5, 16(%ebx,%edx,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm5, 16(%ebx,%edx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm5, 16(%ebx,%edx,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm5, 16(%ebx,%edx,4)
	movl	%ecx, %edx
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %esi
	vmovaps	%ymm4, %ymm5
	jne	.LBB4_66
	movl	712(%esp), %eax
	movl	20(%eax), %eax
	movl	728(%esp), %esi
	vmovss	(%esi,%eax,4), %xmm5
	movl	856(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	852(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	864(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	848(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	896(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	892(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	888(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	movl	860(%esp), %eax
	vmovss	%xmm5, 20(%ebx,%eax,4)
	vxorps	%ymm6, %ymm6, %ymm6
	vpermps	%ymm5, %ymm6, %ymm6
	vpaddd	32(%esp), %ymm7, %ymm5
	vextracti128	$1, %ymm5, %xmm7
	vpextrd	$3, %xmm7, %eax
	movl	%eax, 408(%esp)
	vpextrd	$2, %xmm7, %eax
	movl	%eax, 404(%esp)
	vpextrd	$1, %xmm7, %eax
	movl	%eax, 400(%esp)
	vmovd	%xmm7, 396(%esp)
	vpextrd	$3, %xmm5, %eax
	movl	%eax, 392(%esp)
	vpextrd	$2, %xmm5, %eax
	movl	%eax, 384(%esp)
	vpextrd	$1, %xmm5, %eax
	movl	%eax, 376(%esp)
	vmovd	%xmm5, 368(%esp)
	xorl	%edi, %edi
	movl	$20, %esi
	xorl	%eax, %eax
	.align	16, 0x90
.LBB4_68:
	movl	748(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm5
	movl	752(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm5, %xmm5
	movl	768(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm5, %xmm5
	movl	724(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm5, %xmm5
	movl	732(%esp), %ecx
	vmovss	(%ecx,%edi), %xmm7
	movl	736(%esp), %ecx
	vinsertps	$16, (%ecx,%edi), %xmm7, %xmm7
	movl	740(%esp), %ecx
	vinsertps	$32, (%ecx,%edi), %xmm7, %xmm7
	movl	744(%esp), %ecx
	vinsertps	$48, (%ecx,%edi), %xmm7, %xmm7
	vinsertf128	$1, %xmm5, %ymm7, %ymm7
	vbroadcastss	120(%edx,%edi), %ymm5
	vfnmadd213ps	%ymm6, %ymm7, %ymm5
	movl	856(%esp), %ecx
	vmovss	%xmm5, 20(%ebx,%ecx,4)
	movl	%edx, %ecx
	movl	852(%esp), %edx
	vextractps	$1, %xmm5, 20(%ebx,%edx,4)
	movl	864(%esp), %edx
	vextractps	$2, %xmm5, 20(%ebx,%edx,4)
	movl	848(%esp), %edx
	vextractps	$3, %xmm5, 20(%ebx,%edx,4)
	vextractf128	$1, %ymm5, %xmm6
	movl	896(%esp), %edx
	vmovss	%xmm6, 20(%ebx,%edx,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm6, 20(%ebx,%edx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm6, 20(%ebx,%edx,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm6, 20(%ebx,%edx,4)
	movl	%ecx, %edx
	addl	$4, %edi
	adcl	$0, %eax
	addl	$-4, %esi
	vmovaps	%ymm5, %ymm6
	jne	.LBB4_68
	vmovss	(%edx), %xmm6
	vfnmadd213ss	%xmm0, %xmm6, %xmm0
	movl	856(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	%eax, %ecx
	movl	852(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	%eax, %edi
	movl	864(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	848(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	896(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	892(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	888(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	860(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	vxorps	%ymm6, %ymm6, %ymm6
	vpermps	%ymm0, %ymm6, %ymm0
	vbroadcastss	4(%edx), %ymm6
	vfnmadd213ps	%ymm0, %ymm6, %ymm1
	movl	%ecx, %esi
	vmovss	%xmm1, (%ebx,%esi,4)
	vextractps	$1, %xmm1, (%ebx,%edi,4)
	movl	864(%esp), %ecx
	vextractps	$2, %xmm1, (%ebx,%ecx,4)
	movl	848(%esp), %edi
	vextractps	$3, %xmm1, (%ebx,%edi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	896(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	892(%esp), %eax
	vextractps	$1, %xmm0, (%ebx,%eax,4)
	movl	888(%esp), %eax
	vextractps	$2, %xmm0, (%ebx,%eax,4)
	movl	860(%esp), %eax
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vbroadcastss	8(%edx), %ymm0
	vfnmadd213ps	%ymm1, %ymm0, %ymm2
	vmovss	%xmm2, (%ebx,%esi,4)
	movl	852(%esp), %eax
	vextractps	$1, %xmm2, (%ebx,%eax,4)
	vextractps	$2, %xmm2, (%ebx,%ecx,4)
	vextractps	$3, %xmm2, (%ebx,%edi,4)
	vextractf128	$1, %ymm2, %xmm0
	movl	896(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	892(%esp), %esi
	vextractps	$1, %xmm0, (%ebx,%esi,4)
	movl	888(%esp), %eax
	vextractps	$2, %xmm0, (%ebx,%eax,4)
	movl	860(%esp), %eax
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vbroadcastss	12(%edx), %ymm0
	vfnmadd213ps	%ymm2, %ymm0, %ymm3
	movl	856(%esp), %ecx
	vmovss	%xmm3, (%ebx,%ecx,4)
	movl	852(%esp), %ecx
	vextractps	$1, %xmm3, (%ebx,%ecx,4)
	movl	864(%esp), %edi
	vextractps	$2, %xmm3, (%ebx,%edi,4)
	movl	848(%esp), %edi
	vextractps	$3, %xmm3, (%ebx,%edi,4)
	vextractf128	$1, %ymm3, %xmm0
	movl	896(%esp), %edi
	vmovss	%xmm0, (%ebx,%edi,4)
	vextractps	$1, %xmm0, (%ebx,%esi,4)
	movl	888(%esp), %edi
	vextractps	$2, %xmm0, (%ebx,%edi,4)
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vbroadcastss	16(%edx), %ymm0
	vfnmadd213ps	%ymm3, %ymm0, %ymm4
	movl	856(%esp), %esi
	vmovss	%xmm4, (%ebx,%esi,4)
	vextractps	$1, %xmm4, (%ebx,%ecx,4)
	movl	864(%esp), %ecx
	vextractps	$2, %xmm4, (%ebx,%ecx,4)
	movl	848(%esp), %ecx
	vextractps	$3, %xmm4, (%ebx,%ecx,4)
	vextractf128	$1, %ymm4, %xmm0
	movl	896(%esp), %ecx
	vmovss	%xmm0, (%ebx,%ecx,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm0, (%ebx,%ecx,4)
	vextractps	$2, %xmm0, (%ebx,%edi,4)
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vbroadcastss	20(%edx), %ymm0
	vfnmadd213ps	%ymm4, %ymm0, %ymm5
	vmovss	%xmm5, (%ebx,%esi,4)
	movl	852(%esp), %esi
	vextractps	$1, %xmm5, (%ebx,%esi,4)
	movl	864(%esp), %edi
	vextractps	$2, %xmm5, (%ebx,%edi,4)
	movl	848(%esp), %ecx
	vextractps	$3, %xmm5, (%ebx,%ecx,4)
	vextractf128	$1, %ymm5, %xmm0
	movl	896(%esp), %ecx
	vmovss	%xmm0, (%ebx,%ecx,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm0, (%ebx,%ecx,4)
	movl	888(%esp), %ecx
	vextractps	$2, %xmm0, (%ebx,%ecx,4)
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vbroadcastss	(%edx), %ymm0
	vdivps	%ymm0, %ymm5, %ymm0
	movl	856(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	vextractps	$1, %xmm0, (%ebx,%esi,4)
	vextractps	$2, %xmm0, (%ebx,%edi,4)
	movl	848(%esp), %ecx
	vextractps	$3, %xmm0, (%ebx,%ecx,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 752(%esp)
	movl	896(%esp), %ecx
	vmovss	%xmm1, (%ebx,%ecx,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm1, (%ebx,%ecx,4)
	movl	888(%esp), %ecx
	vextractps	$2, %xmm1, (%ebx,%ecx,4)
	movl	860(%esp), %ecx
	vextractps	$3, %xmm1, (%ebx,%ecx,4)
	movl	%eax, 952(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 956(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	716(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, %esi
	leal	952(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	852(%esp), %eax
	movl	%eax, 964(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 968(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	964(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	864(%esp), %eax
	movl	%eax, 976(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 980(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	976(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	848(%esp), %eax
	movl	%eax, 988(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 992(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	988(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	896(%esp), %eax
	movl	%eax, 1000(%esp)
	vmovaps	752(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1004(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1000(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	892(%esp), %eax
	movl	%eax, 1012(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1016(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1012(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	888(%esp), %eax
	movl	%eax, 1024(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1028(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1024(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	860(%esp), %eax
	movl	%eax, 1036(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1040(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1036(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	708(%esp), %eax
	vmovss	(%ebx,%eax,4), %xmm0
	movl	680(%esp), %eax
	vinsertps	$16, (%ebx,%eax,4), %xmm0, %xmm0
	movl	684(%esp), %eax
	vinsertps	$32, (%ebx,%eax,4), %xmm0, %xmm0
	movl	688(%esp), %eax
	vinsertps	$48, (%ebx,%eax,4), %xmm0, %xmm0
	movl	692(%esp), %eax
	vmovss	(%ebx,%eax,4), %xmm1
	movl	%eax, %edi
	movl	696(%esp), %eax
	vinsertps	$16, (%ebx,%eax,4), %xmm1, %xmm1
	movl	%eax, %edx
	movl	700(%esp), %eax
	vinsertps	$32, (%ebx,%eax,4), %xmm1, %xmm1
	movl	%eax, %ecx
	movl	704(%esp), %eax
	vinsertps	$48, (%ebx,%eax,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	944(%esp), %esi
	vbroadcastss	28(%esi), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, (%ebx,%edi,4)
	vextractps	$1, %xmm0, (%ebx,%edx,4)
	vextractps	$2, %xmm0, (%ebx,%ecx,4)
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	708(%esp), %eax
	vmovss	%xmm1, (%ebx,%eax,4)
	movl	680(%esp), %eax
	vextractps	$1, %xmm1, (%ebx,%eax,4)
	movl	684(%esp), %eax
	vextractps	$2, %xmm1, (%ebx,%eax,4)
	movl	688(%esp), %eax
	vextractps	$3, %xmm1, (%ebx,%eax,4)
	movl	896(%esp), %ecx
	vmovss	8(%ebx,%ecx,4), %xmm1
	movl	892(%esp), %edx
	vinsertps	$16, 8(%ebx,%edx,4), %xmm1, %xmm1
	movl	888(%esp), %eax
	vinsertps	$32, 8(%ebx,%eax,4), %xmm1, %xmm1
	movl	860(%esp), %eax
	vinsertps	$48, 8(%ebx,%eax,4), %xmm1, %xmm1
	movl	856(%esp), %eax
	vmovss	8(%ebx,%eax,4), %xmm2
	movl	852(%esp), %eax
	vinsertps	$16, 8(%ebx,%eax,4), %xmm2, %xmm2
	movl	864(%esp), %edi
	vinsertps	$32, 8(%ebx,%edi,4), %xmm2, %xmm2
	movl	848(%esp), %edi
	vinsertps	$48, 8(%ebx,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	vbroadcastss	32(%esi), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	movl	692(%esp), %esi
	vmovss	%xmm1, (%ebx,%esi,4)
	movl	696(%esp), %esi
	vextractps	$1, %xmm1, (%ebx,%esi,4)
	movl	700(%esp), %esi
	vextractps	$2, %xmm1, (%ebx,%esi,4)
	movl	704(%esp), %esi
	vextractps	$3, %xmm1, (%ebx,%esi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	708(%esp), %esi
	vmovss	%xmm0, (%ebx,%esi,4)
	movl	680(%esp), %esi
	vextractps	$1, %xmm0, (%ebx,%esi,4)
	movl	684(%esp), %esi
	vextractps	$2, %xmm0, (%ebx,%esi,4)
	movl	688(%esp), %esi
	vextractps	$3, %xmm0, (%ebx,%esi,4)
	vmovss	12(%ebx,%ecx,4), %xmm0
	vinsertps	$16, 12(%ebx,%edx,4), %xmm0, %xmm0
	movl	888(%esp), %edx
	vinsertps	$32, 12(%ebx,%edx,4), %xmm0, %xmm0
	movl	860(%esp), %ecx
	vinsertps	$48, 12(%ebx,%ecx,4), %xmm0, %xmm0
	movl	856(%esp), %esi
	vmovss	12(%ebx,%esi,4), %xmm2
	vinsertps	$16, 12(%ebx,%eax,4), %xmm2, %xmm2
	movl	864(%esp), %eax
	vinsertps	$32, 12(%ebx,%eax,4), %xmm2, %xmm2
	vinsertps	$48, 12(%ebx,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	944(%esp), %esi
	vbroadcastss	36(%esi), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	movl	692(%esp), %esi
	vmovss	%xmm0, (%ebx,%esi,4)
	movl	696(%esp), %esi
	vextractps	$1, %xmm0, (%ebx,%esi,4)
	movl	700(%esp), %esi
	vextractps	$2, %xmm0, (%ebx,%esi,4)
	movl	704(%esp), %esi
	vextractps	$3, %xmm0, (%ebx,%esi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	708(%esp), %esi
	vmovss	%xmm1, (%ebx,%esi,4)
	movl	680(%esp), %esi
	vextractps	$1, %xmm1, (%ebx,%esi,4)
	movl	684(%esp), %esi
	vextractps	$2, %xmm1, (%ebx,%esi,4)
	movl	688(%esp), %esi
	vextractps	$3, %xmm1, (%ebx,%esi,4)
	movl	896(%esp), %edi
	vmovss	16(%ebx,%edi,4), %xmm1
	movl	892(%esp), %esi
	vinsertps	$16, 16(%ebx,%esi,4), %xmm1, %xmm1
	vinsertps	$32, 16(%ebx,%edx,4), %xmm1, %xmm1
	vinsertps	$48, 16(%ebx,%ecx,4), %xmm1, %xmm1
	movl	856(%esp), %ecx
	vmovss	16(%ebx,%ecx,4), %xmm2
	movl	852(%esp), %esi
	vinsertps	$16, 16(%ebx,%esi,4), %xmm2, %xmm2
	vinsertps	$32, 16(%ebx,%eax,4), %xmm2, %xmm2
	movl	848(%esp), %edx
	vinsertps	$48, 16(%ebx,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	944(%esp), %eax
	vbroadcastss	40(%eax), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	movl	692(%esp), %eax
	vmovss	%xmm1, (%ebx,%eax,4)
	movl	696(%esp), %eax
	vextractps	$1, %xmm1, (%ebx,%eax,4)
	movl	700(%esp), %eax
	vextractps	$2, %xmm1, (%ebx,%eax,4)
	movl	704(%esp), %eax
	vextractps	$3, %xmm1, (%ebx,%eax,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	708(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	680(%esp), %eax
	vextractps	$1, %xmm0, (%ebx,%eax,4)
	movl	684(%esp), %eax
	vextractps	$2, %xmm0, (%ebx,%eax,4)
	movl	688(%esp), %eax
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vmovss	20(%ebx,%edi,4), %xmm0
	movl	892(%esp), %eax
	vinsertps	$16, 20(%ebx,%eax,4), %xmm0, %xmm0
	movl	888(%esp), %eax
	vinsertps	$32, 20(%ebx,%eax,4), %xmm0, %xmm0
	movl	860(%esp), %eax
	vinsertps	$48, 20(%ebx,%eax,4), %xmm0, %xmm0
	vmovss	20(%ebx,%ecx,4), %xmm2
	vinsertps	$16, 20(%ebx,%esi,4), %xmm2, %xmm2
	movl	864(%esp), %eax
	vinsertps	$32, 20(%ebx,%eax,4), %xmm2, %xmm2
	vinsertps	$48, 20(%ebx,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	944(%esp), %ecx
	vbroadcastss	44(%ecx), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	movl	692(%esp), %eax
	vmovss	%xmm0, (%ebx,%eax,4)
	movl	696(%esp), %eax
	vextractps	$1, %xmm0, (%ebx,%eax,4)
	movl	700(%esp), %eax
	vextractps	$2, %xmm0, (%ebx,%eax,4)
	movl	704(%esp), %eax
	vextractps	$3, %xmm0, (%ebx,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	708(%esp), %edx
	vmovss	%xmm1, (%ebx,%edx,4)
	movl	680(%esp), %eax
	vextractps	$1, %xmm1, (%ebx,%eax,4)
	movl	684(%esp), %esi
	vextractps	$2, %xmm1, (%ebx,%esi,4)
	movl	688(%esp), %edi
	vextractps	$3, %xmm1, (%ebx,%edi,4)
	vbroadcastss	48(%ecx), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	movl	692(%esp), %ecx
	vmovss	%xmm0, (%ebx,%ecx,4)
	movl	696(%esp), %ecx
	vextractps	$1, %xmm0, (%ebx,%ecx,4)
	movl	700(%esp), %ecx
	vextractps	$2, %xmm0, (%ebx,%ecx,4)
	movl	704(%esp), %ecx
	vextractps	$3, %xmm0, (%ebx,%ecx,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 752(%esp)
	vmovss	%xmm1, (%ebx,%edx,4)
	vextractps	$1, %xmm1, (%ebx,%eax,4)
	vextractps	$2, %xmm1, (%ebx,%esi,4)
	vextractps	$3, %xmm1, (%ebx,%edi,4)
	movl	692(%esp), %eax
	movl	%eax, 1048(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1052(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	716(%esp), %esi
	movl	%esi, 8(%esp)
	leal	1048(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	696(%esp), %eax
	movl	%eax, 1060(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1064(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1060(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	700(%esp), %eax
	movl	%eax, 1072(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1076(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1072(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	704(%esp), %eax
	movl	%eax, 1084(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1088(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1084(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	708(%esp), %eax
	movl	%eax, 1096(%esp)
	vmovaps	752(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1100(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1096(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	680(%esp), %eax
	movl	%eax, 1108(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1112(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1108(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	684(%esp), %eax
	movl	%eax, 1120(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1124(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1120(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	688(%esp), %eax
	movl	%eax, 1132(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1136(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, %eax
	movl	%eax, 8(%esp)
	leal	1132(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	896(%esp), %eax
	vmovss	8(%ebx,%eax,4), %xmm0
	movl	892(%esp), %eax
	vinsertps	$16, 8(%ebx,%eax,4), %xmm0, %xmm0
	movl	888(%esp), %eax
	vinsertps	$32, 8(%ebx,%eax,4), %xmm0, %xmm0
	movl	860(%esp), %eax
	vinsertps	$48, 8(%ebx,%eax,4), %xmm0, %xmm0
	movl	856(%esp), %esi
	vmovss	8(%ebx,%esi,4), %xmm1
	movl	852(%esp), %ecx
	vinsertps	$16, 8(%ebx,%ecx,4), %xmm1, %xmm1
	movl	864(%esp), %edx
	vinsertps	$32, 8(%ebx,%edx,4), %xmm1, %xmm1
	movl	848(%esp), %eax
	vinsertps	$48, 8(%ebx,%eax,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	944(%esp), %edi
	vbroadcastss	56(%edi), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 8(%ebx,%esi,4)
	vextractps	$1, %xmm0, 8(%ebx,%ecx,4)
	vextractps	$2, %xmm0, 8(%ebx,%edx,4)
	vextractps	$3, %xmm0, 8(%ebx,%eax,4)
	movl	%eax, %esi
	vextractf128	$1, %ymm0, %xmm1
	movl	896(%esp), %eax
	vmovss	%xmm1, 8(%ebx,%eax,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm1, 8(%ebx,%edx,4)
	movl	888(%esp), %ecx
	vextractps	$2, %xmm1, 8(%ebx,%ecx,4)
	movl	860(%esp), %edi
	vextractps	$3, %xmm1, 8(%ebx,%edi,4)
	vmovss	12(%ebx,%eax,4), %xmm1
	vinsertps	$16, 12(%ebx,%edx,4), %xmm1, %xmm1
	vinsertps	$32, 12(%ebx,%ecx,4), %xmm1, %xmm1
	vinsertps	$48, 12(%ebx,%edi,4), %xmm1, %xmm1
	movl	856(%esp), %ecx
	vmovss	12(%ebx,%ecx,4), %xmm2
	movl	852(%esp), %edx
	vinsertps	$16, 12(%ebx,%edx,4), %xmm2, %xmm2
	movl	864(%esp), %edi
	vinsertps	$32, 12(%ebx,%edi,4), %xmm2, %xmm2
	vinsertps	$48, 12(%ebx,%esi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	944(%esp), %eax
	vbroadcastss	60(%eax), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 8(%ebx,%ecx,4)
	vextractps	$1, %xmm1, 8(%ebx,%edx,4)
	vextractps	$2, %xmm1, 8(%ebx,%edi,4)
	vextractps	$3, %xmm1, 8(%ebx,%esi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	896(%esp), %edi
	vmovss	%xmm0, 8(%ebx,%edi,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm0, 8(%ebx,%edx,4)
	movl	888(%esp), %esi
	vextractps	$2, %xmm0, 8(%ebx,%esi,4)
	movl	860(%esp), %ecx
	vextractps	$3, %xmm0, 8(%ebx,%ecx,4)
	vmovss	16(%ebx,%edi,4), %xmm0
	vinsertps	$16, 16(%ebx,%edx,4), %xmm0, %xmm0
	vinsertps	$32, 16(%ebx,%esi,4), %xmm0, %xmm0
	vinsertps	$48, 16(%ebx,%ecx,4), %xmm0, %xmm0
	movl	856(%esp), %edx
	vmovss	16(%ebx,%edx,4), %xmm2
	movl	852(%esp), %ecx
	vinsertps	$16, 16(%ebx,%ecx,4), %xmm2, %xmm2
	movl	864(%esp), %esi
	vinsertps	$32, 16(%ebx,%esi,4), %xmm2, %xmm2
	movl	848(%esp), %edi
	vinsertps	$48, 16(%ebx,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	vbroadcastss	64(%eax), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	vmovss	%xmm0, 8(%ebx,%edx,4)
	vextractps	$1, %xmm0, 8(%ebx,%ecx,4)
	vextractps	$2, %xmm0, 8(%ebx,%esi,4)
	movl	%edi, %esi
	vextractps	$3, %xmm0, 8(%ebx,%esi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	896(%esp), %edi
	vmovss	%xmm1, 8(%ebx,%edi,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm1, 8(%ebx,%ecx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm1, 8(%ebx,%edx,4)
	movl	860(%esp), %eax
	vextractps	$3, %xmm1, 8(%ebx,%eax,4)
	vmovss	20(%ebx,%edi,4), %xmm1
	vinsertps	$16, 20(%ebx,%ecx,4), %xmm1, %xmm1
	vinsertps	$32, 20(%ebx,%edx,4), %xmm1, %xmm1
	vinsertps	$48, 20(%ebx,%eax,4), %xmm1, %xmm1
	movl	856(%esp), %edi
	vmovss	20(%ebx,%edi,4), %xmm2
	movl	852(%esp), %ecx
	vinsertps	$16, 20(%ebx,%ecx,4), %xmm2, %xmm2
	movl	864(%esp), %edx
	vinsertps	$32, 20(%ebx,%edx,4), %xmm2, %xmm2
	vinsertps	$48, 20(%ebx,%esi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	944(%esp), %eax
	vbroadcastss	68(%eax), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 8(%ebx,%edi,4)
	vextractps	$1, %xmm1, 8(%ebx,%ecx,4)
	vextractps	$2, %xmm1, 8(%ebx,%edx,4)
	vextractps	$3, %xmm1, 8(%ebx,%esi,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	896(%esp), %esi
	vmovss	%xmm0, 8(%ebx,%esi,4)
	movl	892(%esp), %edi
	vextractps	$1, %xmm0, 8(%ebx,%edi,4)
	movl	888(%esp), %ecx
	vextractps	$2, %xmm0, 8(%ebx,%ecx,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm0, 8(%ebx,%edx,4)
	vbroadcastss	152(%eax), %ymm0
	vdivps	%ymm0, %ymm1, %ymm0
	movl	856(%esp), %eax
	vmovss	%xmm0, 8(%ebx,%eax,4)
	movl	852(%esp), %eax
	vextractps	$1, %xmm0, 8(%ebx,%eax,4)
	movl	864(%esp), %eax
	vextractps	$2, %xmm0, 8(%ebx,%eax,4)
	movl	848(%esp), %eax
	vextractps	$3, %xmm0, 8(%ebx,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 752(%esp)
	vmovss	%xmm1, 8(%ebx,%esi,4)
	vextractps	$1, %xmm1, 8(%ebx,%edi,4)
	vextractps	$2, %xmm1, 8(%ebx,%ecx,4)
	vextractps	$3, %xmm1, 8(%ebx,%edx,4)
	movl	284(%esp), %eax
	movl	%eax, 1144(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1148(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	716(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1144(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	288(%esp), %eax
	movl	%eax, 1156(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1160(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1156(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	292(%esp), %eax
	movl	%eax, 1168(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1172(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1168(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	296(%esp), %eax
	movl	%eax, 1180(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1184(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1180(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	300(%esp), %eax
	movl	%eax, 1192(%esp)
	vmovaps	752(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1196(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1192(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	304(%esp), %eax
	movl	%eax, 1204(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1208(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1204(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	308(%esp), %eax
	movl	%eax, 1216(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1220(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1216(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	312(%esp), %eax
	movl	%eax, 1228(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1232(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1228(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	896(%esp), %eax
	vmovss	12(%ebx,%eax,4), %xmm0
	movl	892(%esp), %eax
	vinsertps	$16, 12(%ebx,%eax,4), %xmm0, %xmm0
	movl	888(%esp), %eax
	vinsertps	$32, 12(%ebx,%eax,4), %xmm0, %xmm0
	movl	860(%esp), %eax
	vinsertps	$48, 12(%ebx,%eax,4), %xmm0, %xmm0
	movl	856(%esp), %edi
	vmovss	12(%ebx,%edi,4), %xmm1
	movl	852(%esp), %ecx
	vinsertps	$16, 12(%ebx,%ecx,4), %xmm1, %xmm1
	movl	864(%esp), %edx
	vinsertps	$32, 12(%ebx,%edx,4), %xmm1, %xmm1
	movl	848(%esp), %esi
	vinsertps	$48, 12(%ebx,%esi,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	944(%esp), %eax
	vbroadcastss	84(%eax), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 12(%ebx,%edi,4)
	vextractps	$1, %xmm0, 12(%ebx,%ecx,4)
	vextractps	$2, %xmm0, 12(%ebx,%edx,4)
	vextractps	$3, %xmm0, 12(%ebx,%esi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	896(%esp), %ecx
	vmovss	%xmm1, 12(%ebx,%ecx,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm1, 12(%ebx,%edx,4)
	movl	888(%esp), %edi
	vextractps	$2, %xmm1, 12(%ebx,%edi,4)
	movl	860(%esp), %eax
	vextractps	$3, %xmm1, 12(%ebx,%eax,4)
	vmovss	16(%ebx,%ecx,4), %xmm1
	vinsertps	$16, 16(%ebx,%edx,4), %xmm1, %xmm1
	vinsertps	$32, 16(%ebx,%edi,4), %xmm1, %xmm1
	vinsertps	$48, 16(%ebx,%eax,4), %xmm1, %xmm1
	movl	856(%esp), %eax
	vmovss	16(%ebx,%eax,4), %xmm2
	movl	852(%esp), %edi
	vinsertps	$16, 16(%ebx,%edi,4), %xmm2, %xmm2
	movl	864(%esp), %edx
	vinsertps	$32, 16(%ebx,%edx,4), %xmm2, %xmm2
	movl	%esi, %ecx
	vinsertps	$48, 16(%ebx,%ecx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	944(%esp), %esi
	vbroadcastss	88(%esi), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 12(%ebx,%eax,4)
	vextractps	$1, %xmm1, 12(%ebx,%edi,4)
	vextractps	$2, %xmm1, 12(%ebx,%edx,4)
	movl	%edx, %edi
	vextractps	$3, %xmm1, 12(%ebx,%ecx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	896(%esp), %ecx
	vmovss	%xmm0, 12(%ebx,%ecx,4)
	movl	892(%esp), %esi
	vextractps	$1, %xmm0, 12(%ebx,%esi,4)
	movl	888(%esp), %eax
	vextractps	$2, %xmm0, 12(%ebx,%eax,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm0, 12(%ebx,%edx,4)
	vmovss	20(%ebx,%ecx,4), %xmm0
	vinsertps	$16, 20(%ebx,%esi,4), %xmm0, %xmm0
	vinsertps	$32, 20(%ebx,%eax,4), %xmm0, %xmm0
	vinsertps	$48, 20(%ebx,%edx,4), %xmm0, %xmm0
	movl	856(%esp), %edx
	vmovss	20(%ebx,%edx,4), %xmm2
	movl	852(%esp), %ecx
	vinsertps	$16, 20(%ebx,%ecx,4), %xmm2, %xmm2
	movl	%edi, %esi
	vinsertps	$32, 20(%ebx,%esi,4), %xmm2, %xmm2
	movl	848(%esp), %edi
	vinsertps	$48, 20(%ebx,%edi,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm0, %ymm2, %ymm2
	movl	944(%esp), %eax
	vbroadcastss	92(%eax), %ymm0
	vfnmadd213ps	%ymm1, %ymm2, %ymm0
	vmovss	%xmm0, 12(%ebx,%edx,4)
	vextractps	$1, %xmm0, 12(%ebx,%ecx,4)
	vextractps	$2, %xmm0, 12(%ebx,%esi,4)
	vextractps	$3, %xmm0, 12(%ebx,%edi,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	896(%esp), %esi
	vmovss	%xmm1, 12(%ebx,%esi,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm1, 12(%ebx,%ecx,4)
	movl	888(%esp), %edi
	vextractps	$2, %xmm1, 12(%ebx,%edi,4)
	movl	860(%esp), %edx
	vextractps	$3, %xmm1, 12(%ebx,%edx,4)
	vbroadcastss	84(%eax), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	movl	856(%esp), %eax
	vmovss	%xmm0, 12(%ebx,%eax,4)
	movl	852(%esp), %eax
	vextractps	$1, %xmm0, 12(%ebx,%eax,4)
	movl	864(%esp), %eax
	vextractps	$2, %xmm0, 12(%ebx,%eax,4)
	movl	848(%esp), %eax
	vextractps	$3, %xmm0, 12(%ebx,%eax,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 752(%esp)
	vmovss	%xmm1, 12(%ebx,%esi,4)
	vextractps	$1, %xmm1, 12(%ebx,%ecx,4)
	vextractps	$2, %xmm1, 12(%ebx,%edi,4)
	movl	860(%esp), %eax
	vextractps	$3, %xmm1, 12(%ebx,%eax,4)
	movl	316(%esp), %eax
	movl	%eax, 1240(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1244(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	716(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1240(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	320(%esp), %eax
	movl	%eax, 1252(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1256(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1252(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	324(%esp), %eax
	movl	%eax, 1264(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1268(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1264(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	328(%esp), %eax
	movl	%eax, 1276(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1280(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1276(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	332(%esp), %eax
	movl	%eax, 1288(%esp)
	vmovaps	752(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1292(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1288(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	336(%esp), %eax
	movl	%eax, 1300(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1304(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1300(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	340(%esp), %eax
	movl	%eax, 1312(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1316(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1312(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	348(%esp), %eax
	movl	%eax, 1324(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1328(%esp)
	movl	%esi, %eax
	movl	%eax, 12(%esp)
	movl	%edi, %eax
	movl	%eax, 8(%esp)
	leal	1324(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	896(%esp), %eax
	vmovss	16(%ebx,%eax,4), %xmm0
	movl	892(%esp), %eax
	vinsertps	$16, 16(%ebx,%eax,4), %xmm0, %xmm0
	movl	888(%esp), %eax
	vinsertps	$32, 16(%ebx,%eax,4), %xmm0, %xmm0
	movl	860(%esp), %eax
	vinsertps	$48, 16(%ebx,%eax,4), %xmm0, %xmm0
	movl	856(%esp), %edi
	vmovss	16(%ebx,%edi,4), %xmm1
	movl	852(%esp), %eax
	vinsertps	$16, 16(%ebx,%eax,4), %xmm1, %xmm1
	movl	864(%esp), %ecx
	vinsertps	$32, 16(%ebx,%ecx,4), %xmm1, %xmm1
	movl	848(%esp), %edx
	vinsertps	$48, 16(%ebx,%edx,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	944(%esp), %esi
	vbroadcastss	112(%esi), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 16(%ebx,%edi,4)
	vextractps	$1, %xmm0, 16(%ebx,%eax,4)
	movl	%eax, %edi
	vextractps	$2, %xmm0, 16(%ebx,%ecx,4)
	vextractps	$3, %xmm0, 16(%ebx,%edx,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	896(%esp), %eax
	vmovss	%xmm1, 16(%ebx,%eax,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm1, 16(%ebx,%ecx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm1, 16(%ebx,%edx,4)
	movl	860(%esp), %esi
	vextractps	$3, %xmm1, 16(%ebx,%esi,4)
	vmovss	20(%ebx,%eax,4), %xmm1
	vinsertps	$16, 20(%ebx,%ecx,4), %xmm1, %xmm1
	vinsertps	$32, 20(%ebx,%edx,4), %xmm1, %xmm1
	vinsertps	$48, 20(%ebx,%esi,4), %xmm1, %xmm1
	movl	856(%esp), %eax
	vmovss	20(%ebx,%eax,4), %xmm2
	vinsertps	$16, 20(%ebx,%edi,4), %xmm2, %xmm2
	movl	864(%esp), %ecx
	vinsertps	$32, 20(%ebx,%ecx,4), %xmm2, %xmm2
	movl	848(%esp), %edx
	vinsertps	$48, 20(%ebx,%edx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm2
	movl	944(%esp), %esi
	vbroadcastss	116(%esi), %ymm1
	vfnmadd213ps	%ymm0, %ymm2, %ymm1
	vmovss	%xmm1, 16(%ebx,%eax,4)
	vextractps	$1, %xmm1, 16(%ebx,%edi,4)
	vextractps	$2, %xmm1, 16(%ebx,%ecx,4)
	vextractps	$3, %xmm1, 16(%ebx,%edx,4)
	vextractf128	$1, %ymm1, %xmm0
	movl	896(%esp), %edi
	vmovss	%xmm0, 16(%ebx,%edi,4)
	movl	892(%esp), %edx
	vextractps	$1, %xmm0, 16(%ebx,%edx,4)
	movl	888(%esp), %ecx
	vextractps	$2, %xmm0, 16(%ebx,%ecx,4)
	movl	860(%esp), %eax
	vextractps	$3, %xmm0, 16(%ebx,%eax,4)
	vbroadcastss	112(%esi), %ymm0
	vdivps	%ymm0, %ymm1, %ymm0
	movl	856(%esp), %esi
	vmovss	%xmm0, 16(%ebx,%esi,4)
	movl	852(%esp), %esi
	vextractps	$1, %xmm0, 16(%ebx,%esi,4)
	movl	864(%esp), %esi
	vextractps	$2, %xmm0, 16(%ebx,%esi,4)
	movl	848(%esp), %esi
	vextractps	$3, %xmm0, 16(%ebx,%esi,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 752(%esp)
	vmovss	%xmm1, 16(%ebx,%edi,4)
	vextractps	$1, %xmm1, 16(%ebx,%edx,4)
	vextractps	$2, %xmm1, 16(%ebx,%ecx,4)
	vextractps	$3, %xmm1, 16(%ebx,%eax,4)
	movl	344(%esp), %eax
	movl	%eax, 1336(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1340(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	716(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1336(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	352(%esp), %eax
	movl	%eax, 1348(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1352(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1348(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	356(%esp), %eax
	movl	%eax, 1360(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1364(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1360(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	360(%esp), %eax
	movl	%eax, 1372(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1376(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1372(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	364(%esp), %eax
	movl	%eax, 1384(%esp)
	vmovaps	752(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 768(%esp)
	vmovlpd	%xmm0, 1388(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1384(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	372(%esp), %eax
	movl	%eax, 1396(%esp)
	vmovapd	768(%esp), %ymm0
	vmovhpd	%xmm0, 1400(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1396(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	380(%esp), %eax
	movl	%eax, 1408(%esp)
	vmovapd	768(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 768(%esp)
	vmovlpd	%xmm0, 1412(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1408(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	388(%esp), %eax
	movl	%eax, 1420(%esp)
	vmovapd	768(%esp), %xmm0
	vmovhpd	%xmm0, 1424(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1420(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	896(%esp), %eax
	vmovss	20(%ebx,%eax,4), %xmm0
	movl	892(%esp), %eax
	vinsertps	$16, 20(%ebx,%eax,4), %xmm0, %xmm0
	movl	888(%esp), %eax
	vinsertps	$32, 20(%ebx,%eax,4), %xmm0, %xmm0
	movl	860(%esp), %eax
	vinsertps	$48, 20(%ebx,%eax,4), %xmm0, %xmm0
	movl	856(%esp), %esi
	vmovss	20(%ebx,%esi,4), %xmm1
	movl	852(%esp), %eax
	vinsertps	$16, 20(%ebx,%eax,4), %xmm1, %xmm1
	movl	864(%esp), %ecx
	vinsertps	$32, 20(%ebx,%ecx,4), %xmm1, %xmm1
	movl	848(%esp), %edx
	vinsertps	$48, 20(%ebx,%edx,4), %xmm1, %xmm1
	vinsertf128	$1, %xmm0, %ymm1, %ymm1
	movl	944(%esp), %edi
	vbroadcastss	140(%edi), %ymm0
	vfnmadd213ps	%ymm1, %ymm1, %ymm0
	vmovss	%xmm0, 20(%ebx,%esi,4)
	vextractps	$1, %xmm0, 20(%ebx,%eax,4)
	vextractps	$2, %xmm0, 20(%ebx,%ecx,4)
	vextractps	$3, %xmm0, 20(%ebx,%edx,4)
	vextractf128	$1, %ymm0, %xmm1
	movl	896(%esp), %eax
	vmovss	%xmm1, 20(%ebx,%eax,4)
	movl	892(%esp), %ecx
	vextractps	$1, %xmm1, 20(%ebx,%ecx,4)
	movl	888(%esp), %edx
	vextractps	$2, %xmm1, 20(%ebx,%edx,4)
	movl	860(%esp), %edi
	vextractps	$3, %xmm1, 20(%ebx,%edi,4)
	movl	944(%esp), %esi
	vbroadcastss	164(%esi), %ymm1
	vdivps	%ymm1, %ymm0, %ymm0
	movl	856(%esp), %esi
	vmovss	%xmm0, 20(%ebx,%esi,4)
	movl	852(%esp), %esi
	vextractps	$1, %xmm0, 20(%ebx,%esi,4)
	movl	864(%esp), %esi
	vextractps	$2, %xmm0, 20(%ebx,%esi,4)
	movl	848(%esp), %esi
	vextractps	$3, %xmm0, 20(%ebx,%esi,4)
	vextractf128	$1, %ymm0, %xmm1
	vmovaps	%xmm1, 864(%esp)
	vmovss	%xmm1, 20(%ebx,%eax,4)
	vextractps	$1, %xmm1, 20(%ebx,%ecx,4)
	vextractps	$2, %xmm1, 20(%ebx,%edx,4)
	vextractps	$3, %xmm1, 20(%ebx,%edi,4)
	movl	368(%esp), %eax
	movl	%eax, 1432(%esp)
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 896(%esp)
	vmovlpd	%xmm0, 1436(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	716(%esp), %edi
	movl	%edi, 8(%esp)
	leal	1432(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	376(%esp), %eax
	movl	%eax, 1444(%esp)
	vmovapd	896(%esp), %ymm0
	vmovhpd	%xmm0, 1448(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1444(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	384(%esp), %eax
	movl	%eax, 1456(%esp)
	vmovapd	896(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 896(%esp)
	vmovlpd	%xmm0, 1460(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1456(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	392(%esp), %eax
	movl	%eax, 1468(%esp)
	vmovapd	896(%esp), %xmm0
	vmovhpd	%xmm0, 1472(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1468(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	396(%esp), %eax
	movl	%eax, 1480(%esp)
	vmovaps	864(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 896(%esp)
	vmovlpd	%xmm0, 1484(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1480(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	400(%esp), %eax
	movl	%eax, 1492(%esp)
	vmovapd	896(%esp), %ymm0
	vmovhpd	%xmm0, 1496(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1492(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	404(%esp), %eax
	movl	%eax, 1504(%esp)
	vmovapd	896(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 896(%esp)
	vmovlpd	%xmm0, 1508(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1504(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	408(%esp), %eax
	movl	%eax, 1516(%esp)
	vmovapd	896(%esp), %xmm0
	vmovhpd	%xmm0, 1520(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1516(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1528(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1529(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1530(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1531(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1532(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1533(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1534(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	opencl_printf
	movl	%esi, 12(%esp)
	movl	%edi, 8(%esp)
	leal	1535(%esp), %eax
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
	movl	412(%esp), %eax
	incl	%eax
	cmpl	276(%esp), %eax
	movl	%ebx, %edi
	movl	948(%esp), %ebx
	movl	844(%esp), %edx
	jne	.LBB4_2
.LBB4_70:
	movl	280(%esp), %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %eax
	je	.LBB4_195
	movl	%ecx, %eax
	subl	%eax, 280(%esp)
	movl	28(%esp), %ecx
	addl	%ecx, %eax
	movl	%eax, 800(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI4_2, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, 896(%esp)
	vxorps	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 864(%esp)
	movl	276(%esp), %eax
	leal	(%ecx,%eax,8), %ecx
	imull	$6, %ecx, %eax
	leal	(%edi,%eax,4), %esi
	imull	%edx, %ecx
	movl	%ecx, 740(%esp)
	movl	676(%esp), %eax
	leal	(%eax,%ecx,4), %edi
	leal	(,%ecx,4), %ecx
	movl	%ecx, 848(%esp)
	movl	%edx, %ecx
	negl	%ecx
	movl	%ecx, 736(%esp)
	leal	(,%edx,4), %ecx
	movl	%ecx, 732(%esp)
	movl	%edx, %ecx
	andl	$1, %ecx
	movl	%ecx, 724(%esp)
	xorl	%ecx, %ecx
	movl	%eax, 852(%esp)
	movl	%esi, %eax
	.align	16, 0x90
.LBB4_72:
	movl	%ecx, 768(%esp)
	movl	%edi, 860(%esp)
	movl	%eax, 892(%esp)
	testl	%edx, %edx
	movl	%edx, %esi
	movl	%ebx, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	jle	.LBB4_73
	.align	16, 0x90
.LBB4_134:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$0, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_134
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_136:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_136
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_138:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_138
	jmp	.LBB4_74
	.align	16, 0x90
.LBB4_73:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_74:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	%ebx, %ecx
	movl	%eax, %ebx
	movl	%ecx, %edi
	jle	.LBB4_224
	.align	16, 0x90
.LBB4_75:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_75
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_77:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_77
	jmp	.LBB4_225
	.align	16, 0x90
.LBB4_224:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_225:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %ebx
	movl	%ebx, %edi
	jle	.LBB4_227
	.align	16, 0x90
.LBB4_226:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_226
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 20(%eax)
	cmpl	$0, 724(%esp)
	jne	.LBB4_122
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	movl	844(%esp), %edx
	jmp	.LBB4_123
	.align	16, 0x90
.LBB4_227:
	movl	944(%esp), %ecx
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 20(%ecx)
	movl	728(%esp), %eax
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 24(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.LBB4_130
	.align	16, 0x90
.LBB4_122:
	movl	800(%esp), %eax
	movl	844(%esp), %edx
	imull	%edx, %eax
	movl	676(%esp), %ecx
	vxorps	%xmm0, %xmm0, %xmm0
	vaddss	(%ecx,%eax,4), %xmm0, %xmm0
	movl	$1, %ecx
.LBB4_123:
	cmpl	$2, %edx
	jb	.LBB4_126
	movl	736(%esp), %eax
	leal	(%eax,%ecx), %eax
	movl	852(%esp), %edx
	leal	(%edx,%ecx,4), %ecx
	movl	740(%esp), %edx
	.align	16, 0x90
.LBB4_125:
	vaddss	(%ecx,%edx,4), %xmm0, %xmm0
	vaddss	4(%ecx,%edx,4), %xmm0, %xmm0
	addl	$2, %edx
	addl	$2, %eax
	jne	.LBB4_125
.LBB4_126:
	vmovss	896(%esp), %xmm1
	vmulss	%xmm0, %xmm1, %xmm0
	movl	728(%esp), %eax
	vmovss	%xmm0, (%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_127:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$1, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_127
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 24(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_129:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_129
.LBB4_130:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 28(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	%ebx, %ecx
	movl	%eax, %ebx
	movl	%ecx, %edi
	jle	.LBB4_217
	.align	16, 0x90
.LBB4_131:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_131
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_133:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_133
	jmp	.LBB4_218
	.align	16, 0x90
.LBB4_217:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 32(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_218:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 36(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %ebx
	movl	%ebx, %edi
	jle	.LBB4_235
	.align	16, 0x90
.LBB4_219:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_219
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_221:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_221
	jmp	.LBB4_222
	.align	16, 0x90
.LBB4_235:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 40(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_222:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ebx
	vmovss	%xmm0, 44(%ebx)
	movl	844(%esp), %edx
	testl	%edx, %edx
	jle	.LBB4_223
	movl	848(%esp), %eax
	movl	852(%esp), %ecx
	leal	(%ecx,%eax), %eax
	xorl	%ecx, %ecx
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_140:
	vmovss	(%edi,%ecx), %xmm2
	vmovss	(%eax,%ecx), %xmm1
	vfmadd213ss	%xmm0, %xmm2, %xmm1
	addl	$4, %ecx
	adcl	$0, %esi
	decl	%edx
	vmovaps	%xmm1, %xmm0
	jne	.LBB4_140
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	728(%esp), %eax
	vmovss	%xmm0, 4(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %esi
	.align	16, 0x90
.LBB4_142:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_142
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 48(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_144:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_144
	jmp	.LBB4_145
	.align	16, 0x90
.LBB4_223:
	movl	728(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	%xmm0, 48(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_145:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 52(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	948(%esp), %edi
	jle	.LBB4_210
	.align	16, 0x90
.LBB4_146:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_146
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 56(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_148:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_148
	jmp	.LBB4_211
	.align	16, 0x90
.LBB4_210:
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 56(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_211:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 60(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	948(%esp), %edi
	jle	.LBB4_234
	.align	16, 0x90
.LBB4_212:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_212
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 64(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	844(%esp), %edi
	.align	16, 0x90
.LBB4_214:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_214
	jmp	.LBB4_215
	.align	16, 0x90
.LBB4_234:
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 64(%ebx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_215:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	%ebx, %ecx
	vmovss	%xmm0, 68(%ecx)
	movl	844(%esp), %eax
	testl	%eax, %eax
	jle	.LBB4_216
	movl	848(%esp), %ecx
	movl	852(%esp), %edx
	leal	(%edx,%ecx), %ecx
	movl	%ecx, 856(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	movl	%eax, %ebx
	xorl	%esi, %esi
	.align	16, 0x90
.LBB4_150:
	vmovss	%xmm0, 888(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$2, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	856(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	888(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%xmm1, %xmm0
	jne	.LBB4_150
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	728(%esp), %eax
	vmovss	%xmm0, 8(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_152:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_152
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 72(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_154:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_154
	jmp	.LBB4_155
	.align	16, 0x90
.LBB4_216:
	movl	%eax, %ebx
	movl	728(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 8(%eax)
	vmovss	%xmm0, 72(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_155:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 76(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_203
	.align	16, 0x90
.LBB4_156:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_156
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_158:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_158
	jmp	.LBB4_204
	.align	16, 0x90
.LBB4_203:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 80(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_204:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 84(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_233
	.align	16, 0x90
.LBB4_205:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_205
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_207:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$8, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_207
	jmp	.LBB4_208
	.align	16, 0x90
.LBB4_233:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 88(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_208:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	vmovss	%xmm0, 92(%ecx)
	testl	%ebx, %ebx
	jle	.LBB4_209
	movl	848(%esp), %eax
	movl	852(%esp), %ecx
	leal	(%ecx,%eax), %eax
	movl	%eax, 856(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	.align	16, 0x90
.LBB4_160:
	vmovss	%xmm0, 888(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$3, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	856(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	888(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%xmm1, %xmm0
	jne	.LBB4_160
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	728(%esp), %eax
	vmovss	%xmm0, 12(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_162:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_162
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 96(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_164:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_164
	jmp	.LBB4_165
	.align	16, 0x90
.LBB4_209:
	movl	728(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 12(%eax)
	vmovss	%xmm0, 96(%ecx)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_165:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 100(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_196
	.align	16, 0x90
.LBB4_166:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_166
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 104(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_168:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_168
	jmp	.LBB4_197
	.align	16, 0x90
.LBB4_196:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 104(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_197:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 108(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	%ebx, %esi
	movl	948(%esp), %edi
	jle	.LBB4_232
	.align	16, 0x90
.LBB4_198:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_198
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 112(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_200:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$9, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_200
	jmp	.LBB4_201
	.align	16, 0x90
.LBB4_232:
	movl	944(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 112(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
.LBB4_201:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	vmovss	%xmm0, 116(%ecx)
	testl	%ebx, %ebx
	jle	.LBB4_202
	movl	848(%esp), %eax
	movl	852(%esp), %ecx
	leal	(%ecx,%eax), %eax
	movl	%eax, 856(%esp)
	xorl	%edi, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%esi, %esi
	.align	16, 0x90
.LBB4_170:
	vmovss	%xmm0, 888(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	$4, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	856(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	888(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %esi
	decl	%ebx
	vmovaps	%xmm1, %xmm0
	jne	.LBB4_170
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	728(%esp), %eax
	vmovss	%xmm0, 16(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	844(%esp), %eax
	movl	%eax, %esi
	movl	%eax, %ebx
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_172:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_172
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 120(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_174:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$6, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_174
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 124(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_176:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$7, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_176
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 128(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_178:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$8, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_178
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 132(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%ebx, %esi
	movl	948(%esp), %edi
	.align	16, 0x90
.LBB4_180:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%edi), %xmm0
	movl	$9, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%esi
	jne	.LBB4_180
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %eax
	vmovss	%xmm0, 136(%eax)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	948(%esp), %esi
	movl	%ebx, %edi
	.align	16, 0x90
.LBB4_182:
	vmovss	%xmm1, 888(%esp)
	vmovss	(%esi), %xmm0
	movl	$10, (%esp)
	calll	__ocl_svml_s9_pownf1
	vmovss	888(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB4_182
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	944(%esp), %ecx
	jmp	.LBB4_184
	.align	16, 0x90
.LBB4_202:
	movl	728(%esp), %eax
	vmovss	864(%esp), %xmm0
	vmovss	%xmm0, 16(%eax)
	vmovss	%xmm0, 120(%ecx)
	vmovss	%xmm0, 124(%ecx)
	vmovss	%xmm0, 128(%ecx)
	vmovss	%xmm0, 132(%ecx)
	vmovss	%xmm0, 136(%ecx)
.LBB4_184:
	vmovss	%xmm0, 140(%ecx)
	xorl	%esi, %esi
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	movl	$0, %edi
	jle	.LBB4_186
	.align	16, 0x90
.LBB4_185:
	vmovss	%xmm1, 888(%esp)
	movl	948(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	$5, (%esp)
	calll	__ocl_svml_s9_pownf1
	movl	860(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vfmadd213ss	888(%esp), %xmm0, %xmm1
	addl	$4, %esi
	adcl	$0, %edi
	decl	%ebx
	jne	.LBB4_185
.LBB4_186:
	vmovss	896(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	728(%esp), %edx
	vmovss	%xmm0, 20(%edx)
	movl	712(%esp), %ecx
	movl	(%ecx), %eax
	vmovss	(%edx,%eax,4), %xmm0
	imull	$6, 800(%esp), %esi
	movl	840(%esp), %edi
	vmovss	%xmm0, (%edi,%esi,4)
	movl	4(%ecx), %eax
	vmovss	(%edx,%eax,4), %xmm2
	vmovss	%xmm2, 4(%edi,%esi,4)
	movl	944(%esp), %eax
	vmovss	24(%eax), %xmm1
	vfnmadd213ss	%xmm2, %xmm0, %xmm1
	vmovss	%xmm1, 4(%edi,%esi,4)
	movl	8(%ecx), %eax
	vmovss	(%edx,%eax,4), %xmm3
	vmovss	%xmm3, 8(%edi,%esi,4)
	leal	2(%esi), %eax
	movl	%eax, 888(%esp)
	leal	1(%esi), %eax
	movl	%eax, 748(%esp)
	xorl	%eax, %eax
	movl	$2, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB4_187:
	movl	944(%esp), %edi
	vmovss	48(%edi,%eax), %xmm4
	movl	892(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm2
	vfnmadd213ss	%xmm3, %xmm4, %xmm2
	movl	840(%esp), %edi
	vmovss	%xmm2, 8(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm2, %xmm3
	jne	.LBB4_187
	movl	712(%esp), %eax
	movl	12(%eax), %eax
	movl	728(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm4
	movl	840(%esp), %eax
	vmovss	%xmm4, 12(%eax,%esi,4)
	leal	3(%esi), %eax
	movl	%eax, 856(%esp)
	xorl	%eax, %eax
	movl	$3, %ecx
	xorl	%edx, %edx
	movl	944(%esp), %ebx
	.align	16, 0x90
.LBB4_189:
	vmovss	72(%ebx,%eax), %xmm5
	movl	%ebx, %edi
	movl	892(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm3
	movl	%edi, %ebx
	vfnmadd213ss	%xmm4, %xmm5, %xmm3
	movl	840(%esp), %edi
	vmovss	%xmm3, 12(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm3, %xmm4
	jne	.LBB4_189
	movl	712(%esp), %eax
	movl	16(%eax), %eax
	movl	728(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm5
	movl	840(%esp), %eax
	vmovss	%xmm5, 16(%eax,%esi,4)
	leal	4(%esi), %eax
	movl	%eax, 752(%esp)
	xorl	%eax, %eax
	movl	$4, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB4_191:
	vmovss	96(%ebx,%eax), %xmm6
	movl	%ebx, %edi
	movl	892(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm4
	movl	%edi, %ebx
	vfnmadd213ss	%xmm5, %xmm6, %xmm4
	movl	840(%esp), %edi
	vmovss	%xmm4, 16(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm4, %xmm5
	jne	.LBB4_191
	movl	712(%esp), %eax
	movl	20(%eax), %eax
	movl	728(%esp), %ecx
	vmovss	(%ecx,%eax,4), %xmm6
	movl	840(%esp), %eax
	vmovss	%xmm6, 20(%eax,%esi,4)
	leal	5(%esi), %eax
	movl	%eax, 744(%esp)
	xorl	%eax, %eax
	movl	$5, %ecx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB4_193:
	vmovss	120(%ebx,%eax), %xmm7
	movl	%ebx, %edi
	movl	892(%esp), %ebx
	vmovss	(%ebx,%eax), %xmm5
	movl	%edi, %ebx
	vfnmadd213ss	%xmm6, %xmm7, %xmm5
	movl	840(%esp), %edi
	vmovss	%xmm5, 20(%edi,%esi,4)
	addl	$4, %eax
	adcl	$0, %edx
	decl	%ecx
	vmovaps	%xmm5, %xmm6
	jne	.LBB4_193
	vmovss	(%ebx), %xmm6
	vfnmadd213ss	%xmm0, %xmm6, %xmm0
	movl	840(%esp), %edi
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
	movl	%esi, 1536(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1540(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	716(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1536(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	748(%esp), %eax
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
	movl	%eax, 1548(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1552(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	716(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1548(%esp), %eax
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
	movl	888(%esp), %eax
	movl	%eax, 1560(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1564(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	716(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1560(%esp), %eax
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
	movl	856(%esp), %eax
	movl	%eax, 1572(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1576(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	716(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1572(%esp), %eax
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
	movl	752(%esp), %eax
	movl	%eax, 1584(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1588(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	716(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1584(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	vmovss	20(%edi,%esi,4), %xmm1
	vmovss	140(%ebx), %xmm0
	vfnmadd213ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, 20(%edi,%esi,4)
	vdivss	164(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, 20(%edi,%esi,4)
	movl	744(%esp), %eax
	movl	%eax, 1596(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1600(%esp)
	movl	16(%ebp), %edi
	movl	%edi, 12(%esp)
	movl	716(%esp), %esi
	movl	%esi, 8(%esp)
	leal	1596(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	opencl_printf
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	leal	1611(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str1, (%esp)
	movl	860(%esp), %edi
	movl	732(%esp), %eax
	addl	%eax, %edi
	addl	%eax, 852(%esp)
	calll	opencl_printf
	movl	892(%esp), %eax
	addl	$24, %eax
	incl	800(%esp)
	movl	768(%esp), %ecx
	incl	%ecx
	cmpl	280(%esp), %ecx
	movl	948(%esp), %ebx
	movl	844(%esp), %edx
	jne	.LBB4_72
.LBB4_195:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp49:
	.size	build_polinome, .Ltmp49-build_polinome
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
.LCPI5_2:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI5_1:
	.long	1065353216
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_3:
	.zero	16
	.text
	.globl	build_polinome_square_root
	.align	16, 0x90
	.type	build_polinome_square_root,@function
build_polinome_square_root:
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
	andl	$-32, %esp
	subl	$1088, %esp
.Ltmp56:
	.cfi_offset %esi, -20
.Ltmp57:
	.cfi_offset %edi, -16
.Ltmp58:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	64(%eax), %edx
	movl	%edx, 148(%esp)
	movl	12(%ebp), %ecx
	movl	(%ecx), %ecx
	imull	%edx, %ecx
	addl	40(%eax), %ecx
	movl	%ecx, 40(%esp)
	movl	32(%eax), %edi
	movl	%edi, 720(%esp)
	movl	28(%eax), %ecx
	movl	%ecx, 652(%esp)
	movl	24(%eax), %ecx
	movl	%ecx, 664(%esp)
	movl	20(%eax), %ecx
	movl	%ecx, 348(%esp)
	movl	16(%eax), %ecx
	movl	%ecx, 344(%esp)
	movl	12(%eax), %ecx
	movl	%ecx, 668(%esp)
	movl	8(%eax), %ecx
	movl	%ecx, 284(%esp)
	movl	(%eax), %ecx
	movl	%ecx, 660(%esp)
	movl	4(%eax), %ecx
	movl	%ecx, 144(%esp)
	movl	100(%eax), %eax
	movl	%eax, 656(%esp)
	sarl	$3, %edx
	movl	%edx, 140(%esp)
	je	.LBB5_40
	vmovd	%edi, %xmm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm1
	movl	40(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI5_0, %ymm0, %ymm0
	vpmulld	%ymm1, %ymm0, %ymm3
	vmovdqa	%ymm3, 384(%esp)
	vmovd	%xmm3, %ecx
	vpextrd	$1, %xmm3, %eax
	subl	%ecx, %eax
	shll	$3, %eax
	vmovd	%eax, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vmovaps	%ymm1, 96(%esp)
	movl	664(%esp), %edx
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
	movl	284(%esp), %eax
	leal	(%eax,%edi,4), %eax
	movl	%eax, 60(%esp)
	leal	(,%edi,4), %esi
	movl	%esi, 604(%esp)
	movl	$-4, %eax
	subl	%esi, %eax
	movl	%eax, 268(%esp)
	leal	-1(%edi), %ecx
	movl	%ecx, 280(%esp)
	movl	%edi, %eax
	imull	%ecx, %eax
	movl	652(%esp), %ecx
	leal	-4(%ecx,%eax,4), %eax
	movl	%eax, 56(%esp)
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI5_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovaps	%ymm0, 352(%esp)
	vpermps	%ymm0, %ymm2, %ymm0
	vmovaps	%ymm0, 224(%esp)
	leal	8(%ecx), %eax
	movl	%eax, 52(%esp)
	leal	4(%ecx), %eax
	movl	%eax, 48(%esp)
	leal	-2(%edi), %eax
	movl	%eax, 156(%esp)
	movl	%edi, %eax
	imull	%eax, %eax
	movl	%eax, 44(%esp)
	sarl	$31, %esi
	movl	%esi, 732(%esp)
	xorl	%eax, %eax
	vmovaps	%ymm3, 160(%esp)
	.align	16, 0x90
.LBB5_2:
	movl	%eax, 152(%esp)
	testl	%edi, %edi
	jle	.LBB5_12
	vmovdqa	192(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	144(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 608(%esp)
	vpextrd	$2, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 600(%esp)
	vpextrd	$1, %xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 576(%esp)
	vmovd	%xmm0, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 544(%esp)
	vpextrd	$3, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 528(%esp)
	vpextrd	$2, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 480(%esp)
	vpextrd	$1, %xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 476(%esp)
	vmovd	%xmm1, %eax
	leal	(%ecx,%eax,4), %eax
	movl	%eax, 472(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB5_4:
	movl	%eax, 724(%esp)
	imull	%edi, %eax
	movl	%eax, 672(%esp)
	movl	$0, 728(%esp)
	.align	16, 0x90
.LBB5_5:
	vxorpd	%xmm1, %xmm1, %xmm1
	cmpl	$0, 664(%esp)
	jle	.LBB5_8
	movl	724(%esp), %eax
	movl	728(%esp), %ecx
	leal	(%ecx,%eax), %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	660(%esp), %esi
	movl	664(%esp), %edi
	.align	16, 0x90
.LBB5_7:
	vmovss	%xmm1, 736(%esp)
	vmovss	(%esi), %xmm0
	movl	%ebx, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	736(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %esi
	decl	%edi
	jne	.LBB5_7
.LBB5_8:
	vmovaps	352(%esp), %ymm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	672(%esp), %eax
	movl	728(%esp), %edx
	leal	(%edx,%eax), %eax
	movl	668(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	incl	%edx
	movl	%edx, 728(%esp)
	cmpl	720(%esp), %edx
	jne	.LBB5_5
	xorl	%esi, %esi
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	664(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %edi
	movl	$0, %ebx
	jle	.LBB5_11
	.align	16, 0x90
.LBB5_10:
	vmovapd	%ymm1, 736(%esp)
	movl	660(%esp), %eax
	vmovss	(%eax,%esi), %xmm0
	movl	724(%esp), %eax
	movl	%eax, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	576(%esp), %edx
	movl	600(%esp), %ecx
	movl	544(%esp), %eax
	vmovss	(%eax,%esi), %xmm1
	vinsertps	$16, (%edx,%esi), %xmm1, %xmm1
	movl	528(%esp), %edx
	vinsertps	$32, (%ecx,%esi), %xmm1, %xmm1
	movl	608(%esp), %eax
	vinsertps	$48, (%eax,%esi), %xmm1, %xmm1
	movl	472(%esp), %eax
	vmovss	(%eax,%esi), %xmm2
	movl	476(%esp), %eax
	vinsertps	$16, (%eax,%esi), %xmm2, %xmm2
	movl	480(%esp), %eax
	vinsertps	$32, (%eax,%esi), %xmm2, %xmm2
	vinsertps	$48, (%edx,%esi), %xmm2, %xmm2
	vinsertf128	$1, %xmm1, %ymm2, %ymm1
	vbroadcastss	%xmm0, %ymm0
	vfmadd213ps	736(%esp), %ymm1, %ymm0
	addl	$4, %esi
	adcl	$0, %ebx
	decl	%edi
	vmovaps	%ymm0, %ymm1
	jne	.LBB5_10
.LBB5_11:
	vmovaps	224(%esp), %ymm0
	vmulps	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm0
	movl	344(%esp), %eax
	movl	724(%esp), %ecx
	vextractps	$3, %xmm0, (%eax,%ecx,4)
	incl	%ecx
	movl	720(%esp), %edi
	cmpl	%edi, %ecx
	movl	%ecx, %eax
	jne	.LBB5_4
.LBB5_12:
	movl	668(%esp), %eax
	vmovss	(%eax), %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	652(%esp), %edx
	vmovss	%xmm0, (%edx)
	movl	$2, %eax
	cmpl	$1, %edi
	jg	.LBB5_13
	movl	344(%esp), %eax
	vmovss	(%eax), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	348(%esp), %ecx
	movl	%eax, (%ecx)
	movl	%ecx, %eax
	vmovdqa	160(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %ecx
	movl	%ecx, 472(%esp)
	vpextrd	$2, %xmm0, %ecx
	movl	%ecx, 468(%esp)
	vpextrd	$1, %xmm0, %ecx
	movl	%ecx, 464(%esp)
	vmovd	%xmm0, 460(%esp)
	vpextrd	$3, %xmm1, %ecx
	vpextrd	$2, %xmm1, %ebx
	vpextrd	$1, %xmm1, %edx
	vmovd	%xmm1, %esi
	vmovaps	%ymm1, 288(%esp)
	jmp	.LBB5_34
	.align	16, 0x90
.LBB5_14:
	incl	%eax
	vmovss	(%edx), %xmm0
.LBB5_13:
	movl	668(%esp), %ecx
	vmovss	-4(%ecx,%eax,4), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -4(%edx,%eax,4)
	cmpl	%eax, %edi
	jne	.LBB5_14
	vmovdqa	384(%esp), %ymm1
	vextracti128	$1, %ymm1, %xmm0
	vpextrd	$3, %xmm0, %eax
	movl	%eax, 472(%esp)
	vpextrd	$2, %xmm0, %eax
	movl	%eax, 468(%esp)
	vpextrd	$1, %xmm0, %eax
	movl	%eax, 464(%esp)
	vmovd	%xmm0, %eax
	movl	%eax, 460(%esp)
	vpextrd	$3, %xmm1, %eax
	movl	%eax, 476(%esp)
	vpextrd	$2, %xmm1, %eax
	movl	%eax, 456(%esp)
	vpextrd	$1, %xmm1, %eax
	movl	%eax, 452(%esp)
	vmovd	%xmm1, 448(%esp)
	movl	$1, 288(%esp)
	xorl	%eax, %eax
	movl	52(%esp), %ecx
	movl	%ecx, 276(%esp)
	movl	48(%esp), %ecx
	.align	16, 0x90
.LBB5_16:
	movl	%ecx, %edi
	movl	%eax, %ebx
	movl	288(%esp), %ecx
	movl	%ecx, %eax
	imull	720(%esp), %eax
	movl	%eax, 444(%esp)
	leal	(%eax,%ecx), %edx
	movl	%edx, 480(%esp)
	movl	668(%esp), %eax
	vmovss	(%eax,%edx,4), %xmm0
	leal	-1(%ecx), %eax
	movl	%eax, 416(%esp)
	testl	%eax, %eax
	jle	.LBB5_17
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB5_19:
	movl	%edx, %esi
	addl	604(%esp), %esi
	adcl	732(%esp), %eax
	vmovss	(%edi,%edx), %xmm1
	vfnmadd213ss	%xmm0, %xmm1, %xmm1
	incl	%ecx
	cmpl	%ecx, %ebx
	movl	%esi, %edx
	vmovaps	%xmm1, %xmm0
	jne	.LBB5_19
	jmp	.LBB5_20
	.align	16, 0x90
.LBB5_17:
	vmovaps	%xmm0, %xmm1
.LBB5_20:
	movl	%edi, 724(%esp)
	movl	%ebx, 728(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm1, %xmm0, %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	652(%esp), %eax
	movl	480(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	288(%esp), %eax
	incl	%eax
	movl	%eax, 288(%esp)
	cmpl	720(%esp), %eax
	movl	276(%esp), %ecx
	movl	%eax, %edi
	jge	.LBB5_26
	.align	16, 0x90
.LBB5_21:
	movl	%edi, 600(%esp)
	movl	%ecx, 736(%esp)
	movl	444(%esp), %eax
	leal	(%edi,%eax), %ecx
	movl	%ecx, 672(%esp)
	movl	668(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm1
	vmovd	%edi, %xmm0
	cmpl	$0, 416(%esp)
	movl	604(%esp), %esi
	jle	.LBB5_22
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	.align	16, 0x90
.LBB5_24:
	movl	724(%esp), %edi
	vmovss	(%edi,%ebx), %xmm3
	movl	736(%esp), %edi
	vmovss	(%edi,%ecx), %xmm2
	vfnmadd213ss	%xmm1, %xmm3, %xmm2
	addl	%esi, %ecx
	adcl	732(%esp), %edx
	addl	%esi, %ebx
	incl	%eax
	cmpl	%eax, 728(%esp)
	vmovdqa	%xmm2, %xmm1
	jne	.LBB5_24
	jmp	.LBB5_25
	.align	16, 0x90
.LBB5_22:
	vmovdqa	%xmm1, %xmm2
.LBB5_25:
	vpxor	%ymm1, %ymm1, %ymm1
	vpermd	%ymm0, %ymm1, %ymm0
	movl	652(%esp), %eax
	movl	480(%esp), %ecx
	vdivss	(%eax,%ecx,4), %xmm2, %xmm1
	movl	672(%esp), %ecx
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	600(%esp), %edi
	leal	(%eax,%edi,4), %eax
	movl	460(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm1
	movl	464(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm1, %xmm1
	vmovaps	%xmm1, 576(%esp)
	movl	448(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm1
	movl	452(%esp), %ecx
	vinsertps	$16, (%eax,%ecx,4), %xmm1, %xmm1
	movl	472(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	vmovaps	%xmm2, 544(%esp)
	movl	468(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	vmovaps	%xmm2, 528(%esp)
	movl	476(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	movl	456(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm3
	vpaddd	384(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 672(%esp)
	vmovd	%xmm0, 780(%esp)
	vinsertps	$32, %xmm3, %xmm1, %xmm0
	vinsertps	$48, %xmm2, %xmm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 608(%esp)
	vmovlpd	%xmm0, 784(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	656(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	780(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	672(%esp), %ymm0
	vpextrd	$1, %xmm0, 792(%esp)
	vmovapd	608(%esp), %ymm0
	vmovhpd	%xmm0, 796(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	792(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	672(%esp), %ymm0
	vpextrd	$2, %xmm0, 804(%esp)
	vmovapd	608(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 608(%esp)
	vmovlpd	%xmm0, 808(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	804(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	672(%esp), %ymm0
	vpextrd	$3, %xmm0, 816(%esp)
	vmovapd	608(%esp), %xmm1
	vmovhpd	%xmm1, 820(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	816(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vextracti128	$1, %ymm0, 672(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	672(%esp), %xmm0
	vmovd	%xmm0, 828(%esp)
	vmovaps	576(%esp), %xmm0
	vmovaps	528(%esp), %xmm1
	vinsertps	$32, %xmm1, %xmm0, %xmm0
	vmovaps	544(%esp), %xmm1
	vinsertps	$48, %xmm1, %xmm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 608(%esp)
	vmovlpd	%xmm0, 832(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	828(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	672(%esp), %xmm0
	vpextrd	$1, %xmm0, 840(%esp)
	vmovapd	608(%esp), %ymm0
	vmovhpd	%xmm0, 844(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	840(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	672(%esp), %xmm0
	vpextrd	$2, %xmm0, 852(%esp)
	vmovapd	608(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 608(%esp)
	vmovlpd	%xmm0, 856(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	852(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	672(%esp), %xmm0
	vpextrd	$3, %xmm0, 864(%esp)
	vmovapd	608(%esp), %xmm0
	vmovhpd	%xmm0, 868(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	864(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	calll	opencl_printf
	movl	736(%esp), %eax
	addl	$4, %eax
	incl	%edi
	cmpl	720(%esp), %edi
	movl	%eax, %ecx
	jne	.LBB5_21
.LBB5_26:
	addl	$4, 276(%esp)
	movl	724(%esp), %ecx
	addl	$4, %ecx
	movl	728(%esp), %eax
	incl	%eax
	cmpl	280(%esp), %eax
	jne	.LBB5_16
	movl	344(%esp), %eax
	vmovss	(%eax), %xmm0
	movl	652(%esp), %eax
	vdivss	(%eax), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	348(%esp), %ecx
	movl	%eax, (%ecx)
	movl	$1, %esi
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB5_28:
	movl	344(%esp), %eax
	vmovss	(%eax,%esi,4), %xmm1
	leal	-1(%esi), %eax
	testl	%eax, %eax
	jle	.LBB5_29
	movl	652(%esp), %ebx
	leal	4(%ebx,%ecx,4), %eax
	movl	%ecx, 736(%esp)
	movl	348(%esp), %ecx
	xorl	%edx, %edx
	movl	604(%esp), %edi
	.align	16, 0x90
.LBB5_31:
	vcvtsi2ssl	(%ecx), %xmm0, %xmm2
	vmovss	(%eax), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	addl	%edi, %eax
	addl	$4, %ecx
	incl	%edx
	cmpl	%edx, 736(%esp)
	vmovapd	%xmm0, %xmm1
	jne	.LBB5_31
	jmp	.LBB5_32
	.align	16, 0x90
.LBB5_29:
	vmovapd	%xmm1, %xmm0
	movl	652(%esp), %ebx
	movl	%ecx, 736(%esp)
.LBB5_32:
	movl	%esi, %eax
	imull	720(%esp), %eax
	addl	%esi, %eax
	vdivss	(%ebx,%eax,4), %xmm0, %xmm0
	vcvttss2si	%xmm0, %ecx
	movl	%ecx, 728(%esp)
	movl	348(%esp), %eax
	movl	%ecx, (%eax,%esi,4)
	movl	%esi, 876(%esp)
	movl	%ecx, 880(%esp)
	movl	%ecx, %edi
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	876(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	%esi, 884(%esp)
	movl	%edi, 888(%esp)
	movl	%ebx, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	884(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 892(%esp)
	movl	%edi, 896(%esp)
	movl	%ebx, 12(%esp)
	movl	656(%esp), %edi
	movl	%edi, 8(%esp)
	leal	892(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 900(%esp)
	movl	728(%esp), %eax
	movl	%eax, 904(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	900(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 908(%esp)
	movl	728(%esp), %edi
	movl	%edi, 912(%esp)
	movl	%ebx, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	908(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 916(%esp)
	movl	%edi, 920(%esp)
	movl	%ebx, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	916(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 924(%esp)
	movl	%edi, 928(%esp)
	movl	%ebx, 12(%esp)
	movl	656(%esp), %edi
	movl	%edi, 8(%esp)
	leal	924(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	movl	%esi, 932(%esp)
	movl	728(%esp), %eax
	movl	%eax, 936(%esp)
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	leal	932(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	opencl_printf
	incl	%esi
	movl	736(%esp), %eax
	incl	%eax
	cmpl	280(%esp), %eax
	movl	%eax, %ecx
	jne	.LBB5_28
	vmovapd	384(%esp), %ymm0
	vmovapd	%ymm0, 288(%esp)
	movl	720(%esp), %edi
	movl	348(%esp), %eax
	movl	476(%esp), %ecx
	movl	456(%esp), %ebx
	movl	452(%esp), %edx
	movl	448(%esp), %esi
.LBB5_34:
	movl	%ecx, 476(%esp)
	movl	%esi, 448(%esp)
	movl	%edx, 452(%esp)
	movl	%ebx, 456(%esp)
	movl	%eax, 348(%esp)
	vcvtsi2ssl	-4(%eax,%edi,4), %xmm0, %xmm0
	movl	44(%esp), %eax
	movl	652(%esp), %ecx
	vdivss	-4(%ecx,%eax,4), %xmm0, %xmm0
	movl	284(%esp), %eax
	movl	280(%esp), %ecx
	leal	(%eax,%ecx,4), %eax
	vmovss	%xmm0, (%eax,%esi,4)
	vmovss	%xmm0, (%eax,%edx,4)
	vmovss	%xmm0, (%eax,%ebx,4)
	movl	476(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	460(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	464(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	468(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	movl	472(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	cmpl	$0, 156(%esp)
	js	.LBB5_39
	movl	60(%esp), %eax
	movl	448(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 728(%esp)
	movl	452(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 724(%esp)
	movl	456(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 672(%esp)
	movl	476(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 608(%esp)
	movl	460(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 600(%esp)
	movl	464(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 576(%esp)
	movl	468(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	%ecx, 276(%esp)
	movl	472(%esp), %ecx
	leal	(%eax,%ecx,4), %eax
	movl	%eax, 272(%esp)
	movl	$-1, %edx
	movl	56(%esp), %eax
	movl	156(%esp), %ecx
	.align	16, 0x90
.LBB5_36:
	movl	%eax, 736(%esp)
	movl	%ecx, 528(%esp)
	movl	%edx, 444(%esp)
	movl	348(%esp), %eax
	vcvtsi2ssl	(%eax,%ecx,4), %xmm0, %xmm0
	vbroadcastss	%xmm0, %ymm1
	vmovd	%ecx, %xmm0
	leal	1(%ecx), %ecx
	xorl	%eax, %eax
	cmpl	%edi, %ecx
	movl	$0, %ecx
	movl	276(%esp), %esi
	movl	272(%esp), %ebx
	jge	.LBB5_38
	.align	16, 0x90
.LBB5_37:
	movl	600(%esp), %edi
	vmovss	(%edi,%edx,4), %xmm2
	movl	576(%esp), %edi
	vinsertps	$16, (%edi,%edx,4), %xmm2, %xmm2
	vinsertps	$32, (%esi,%edx,4), %xmm2, %xmm2
	vinsertps	$48, (%ebx,%edx,4), %xmm2, %xmm2
	movl	728(%esp), %edi
	vmovss	(%edi,%edx,4), %xmm3
	movl	724(%esp), %edi
	vinsertps	$16, (%edi,%edx,4), %xmm3, %xmm3
	movl	672(%esp), %edi
	vinsertps	$32, (%edi,%edx,4), %xmm3, %xmm3
	movl	608(%esp), %edi
	vinsertps	$48, (%edi,%edx,4), %xmm3, %xmm3
	vinsertf128	$1, %xmm2, %ymm3, %ymm3
	movl	736(%esp), %edi
	vbroadcastss	(%edi,%eax), %ymm2
	vfnmadd213ps	%ymm1, %ymm3, %ymm2
	addl	$4, %eax
	adcl	$0, %ecx
	incl	%edx
	vmovaps	%ymm2, %ymm1
	jne	.LBB5_37
.LBB5_38:
	movl	528(%esp), %edx
	movl	%edx, %ecx
	movl	720(%esp), %edi
	imull	%edi, %ecx
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm0
	movl	284(%esp), %eax
	leal	(%eax,%edx,4), %eax
	addl	%edx, %ecx
	movl	652(%esp), %edx
	vbroadcastss	(%edx,%ecx,4), %ymm2
	vdivps	%ymm2, %ymm1, %ymm1
	movl	448(%esp), %ecx
	vmovss	%xmm1, (%eax,%ecx,4)
	movl	452(%esp), %ecx
	vextractps	$1, %xmm1, (%eax,%ecx,4)
	movl	456(%esp), %ecx
	vextractps	$2, %xmm1, (%eax,%ecx,4)
	movl	476(%esp), %ecx
	vextractps	$3, %xmm1, (%eax,%ecx,4)
	vextractf128	$1, %ymm1, %xmm2
	vmovaps	%xmm2, 416(%esp)
	movl	460(%esp), %ecx
	vmovss	%xmm2, (%eax,%ecx,4)
	movl	464(%esp), %ecx
	vextractps	$1, %xmm2, (%eax,%ecx,4)
	movl	468(%esp), %ecx
	vextractps	$2, %xmm2, (%eax,%ecx,4)
	movl	472(%esp), %ecx
	vextractps	$3, %xmm2, (%eax,%ecx,4)
	vpaddd	288(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 544(%esp)
	vmovd	%xmm0, 940(%esp)
	vcvtps2pd	%xmm1, %ymm0
	vmovapd	%ymm0, 480(%esp)
	vmovlpd	%xmm0, 944(%esp)
	movl	16(%ebp), %esi
	movl	%esi, 12(%esp)
	movl	656(%esp), %ebx
	movl	%ebx, 8(%esp)
	leal	940(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %ymm0
	vpextrd	$1, %xmm0, 952(%esp)
	vmovapd	480(%esp), %ymm0
	vmovhpd	%xmm0, 956(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	952(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %ymm0
	vpextrd	$2, %xmm0, 964(%esp)
	vmovapd	480(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 480(%esp)
	vmovlpd	%xmm0, 968(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	964(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %ymm0
	vpextrd	$3, %xmm0, 976(%esp)
	vmovapd	480(%esp), %xmm1
	vmovhpd	%xmm1, 980(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	976(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vextracti128	$1, %ymm0, 544(%esp)
	vzeroupper
	calll	opencl_printf
	vmovapd	544(%esp), %xmm0
	vmovd	%xmm0, 988(%esp)
	vmovaps	416(%esp), %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vmovapd	%ymm0, 480(%esp)
	vmovlpd	%xmm0, 992(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	988(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %xmm0
	vpextrd	$1, %xmm0, 1000(%esp)
	vmovapd	480(%esp), %ymm0
	vmovhpd	%xmm0, 1004(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1000(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %xmm0
	vpextrd	$2, %xmm0, 1012(%esp)
	vmovapd	480(%esp), %ymm0
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 480(%esp)
	vmovlpd	%xmm0, 1016(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1012(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	vzeroupper
	calll	opencl_printf
	vmovdqa	544(%esp), %xmm0
	vpextrd	$3, %xmm0, 1024(%esp)
	vmovapd	480(%esp), %xmm0
	vmovhpd	%xmm0, 1028(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	leal	1024(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	movl	736(%esp), %esi
	addl	268(%esp), %esi
	calll	opencl_printf
	movl	528(%esp), %ecx
	movl	444(%esp), %edx
	decl	%edx
	testl	%ecx, %ecx
	leal	-1(%ecx), %ecx
	movl	%esi, %eax
	jg	.LBB5_36
.LBB5_39:
	vmovdqa	96(%esp), %ymm1
	vmovdqa	160(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 160(%esp)
	vmovdqa	384(%esp), %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 384(%esp)
	vmovdqa	192(%esp), %ymm0
	vpaddd	64(%esp), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%esp)
	movl	152(%esp), %eax
	incl	%eax
	cmpl	140(%esp), %eax
	jne	.LBB5_2
.LBB5_40:
	movl	148(%esp), %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %eax
	je	.LBB5_79
	subl	%ecx, 148(%esp)
	movl	40(%esp), %esi
	addl	%esi, %ecx
	movl	%ecx, 456(%esp)
	movl	284(%esp), %eax
	leal	(%eax,%edi,4), %eax
	movl	%eax, 444(%esp)
	leal	(,%edi,4), %ebx
	movl	%ebx, 672(%esp)
	movl	$-4, %eax
	subl	%ebx, %eax
	movl	%eax, 460(%esp)
	leal	-1(%edi), %ecx
	movl	%ecx, 468(%esp)
	movl	%edi, %eax
	imull	%ecx, %eax
	movl	652(%esp), %ecx
	leal	-4(%ecx,%eax,4), %eax
	movl	%eax, 416(%esp)
	movl	664(%esp), %edx
	leal	1(%edx), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	.LCPI5_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, 544(%esp)
	movl	140(%esp), %eax
	leal	(%esi,%eax,8), %eax
	imull	%edx, %eax
	movl	144(%esp), %esi
	leal	(%esi,%eax,4), %eax
	leal	8(%ecx), %esi
	movl	%esi, 384(%esp)
	leal	4(%ecx), %ecx
	movl	%ecx, 352(%esp)
	leal	(,%edx,4), %ecx
	movl	%ecx, 288(%esp)
	leal	-2(%edi), %ecx
	movl	%ecx, 452(%esp)
	movl	%edi, %ecx
	imull	%ecx, %ecx
	movl	%ecx, 280(%esp)
	sarl	$31, %ebx
	movl	%ebx, 732(%esp)
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB5_42:
	movl	%ecx, 448(%esp)
	movl	%eax, 476(%esp)
	testl	%edi, %edi
	movl	$0, %eax
	jle	.LBB5_51
	.align	16, 0x90
.LBB5_43:
	movl	%eax, 724(%esp)
	imull	%edi, %eax
	movl	%eax, 608(%esp)
	movl	$0, 728(%esp)
	.align	16, 0x90
.LBB5_44:
	vxorps	%xmm1, %xmm1, %xmm1
	cmpl	$0, 664(%esp)
	jle	.LBB5_47
	movl	724(%esp), %eax
	movl	728(%esp), %ecx
	leal	(%ecx,%eax), %esi
	vxorps	%xmm1, %xmm1, %xmm1
	movl	660(%esp), %edi
	movl	664(%esp), %ebx
	.align	16, 0x90
.LBB5_46:
	vmovss	%xmm1, 736(%esp)
	vmovss	(%edi), %xmm0
	movl	%esi, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	vmovss	736(%esp), %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	addl	$4, %edi
	decl	%ebx
	jne	.LBB5_46
.LBB5_47:
	vmovss	544(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	608(%esp), %eax
	movl	728(%esp), %edx
	leal	(%edx,%eax), %eax
	movl	668(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	incl	%edx
	movl	%edx, 728(%esp)
	cmpl	720(%esp), %edx
	jne	.LBB5_44
	xorl	%edi, %edi
	vxorps	%xmm1, %xmm1, %xmm1
	movl	664(%esp), %eax
	testl	%eax, %eax
	movl	$0, %ebx
	movl	%eax, %esi
	jle	.LBB5_50
	.align	16, 0x90
.LBB5_49:
	vmovss	%xmm1, 736(%esp)
	movl	660(%esp), %eax
	vmovss	(%eax,%edi), %xmm0
	movl	724(%esp), %eax
	movl	%eax, (%esp)
	vzeroupper
	calll	__ocl_svml_s9_pownf1
	movl	476(%esp), %eax
	vmovss	(%eax,%edi), %xmm1
	vfmadd213ss	736(%esp), %xmm0, %xmm1
	addl	$4, %edi
	adcl	$0, %ebx
	decl	%esi
	jne	.LBB5_49
.LBB5_50:
	vmovss	544(%esp), %xmm0
	vmulss	%xmm1, %xmm0, %xmm0
	movl	344(%esp), %eax
	movl	724(%esp), %ecx
	vmovss	%xmm0, (%eax,%ecx,4)
	incl	%ecx
	movl	720(%esp), %edi
	cmpl	%edi, %ecx
	movl	%ecx, %eax
	jne	.LBB5_43
.LBB5_51:
	movl	668(%esp), %eax
	vmovss	(%eax), %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	652(%esp), %ecx
	vmovss	%xmm0, (%ecx)
	movl	$2, %eax
	cmpl	$1, %edi
	jg	.LBB5_52
	movl	344(%esp), %eax
	vmovss	(%eax), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	348(%esp), %edx
	movl	%eax, (%edx)
	movl	%edx, %eax
	movl	456(%esp), %edx
	imull	%edi, %edx
	jmp	.LBB5_73
	.align	16, 0x90
.LBB5_53:
	incl	%eax
	vmovss	(%ecx), %xmm0
.LBB5_52:
	movl	668(%esp), %edx
	vmovss	-4(%edx,%eax,4), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -4(%ecx,%eax,4)
	cmpl	%eax, %edi
	jne	.LBB5_53
	movl	456(%esp), %eax
	imull	%edi, %eax
	movl	%eax, 576(%esp)
	movl	$1, 472(%esp)
	xorl	%eax, %eax
	movl	384(%esp), %ecx
	movl	%ecx, 464(%esp)
	movl	352(%esp), %ecx
	.align	16, 0x90
.LBB5_55:
	movl	%ecx, %esi
	movl	%eax, %ebx
	movl	472(%esp), %ecx
	movl	%ecx, %eax
	imull	%edi, %eax
	movl	%eax, 528(%esp)
	leal	(%eax,%ecx), %edx
	movl	%edx, 600(%esp)
	movl	668(%esp), %eax
	vmovss	(%eax,%edx,4), %xmm0
	leal	-1(%ecx), %eax
	movl	%eax, 480(%esp)
	testl	%eax, %eax
	jle	.LBB5_56
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	%esi, %edi
	.align	16, 0x90
.LBB5_58:
	movl	%edx, %esi
	addl	672(%esp), %esi
	adcl	732(%esp), %eax
	vmovss	(%edi,%edx), %xmm1
	vfnmadd213ss	%xmm0, %xmm1, %xmm1
	incl	%ecx
	cmpl	%ecx, %ebx
	movl	%esi, %edx
	vmovdqa	%xmm1, %xmm0
	jne	.LBB5_58
	jmp	.LBB5_59
	.align	16, 0x90
.LBB5_56:
	vmovdqa	%xmm0, %xmm1
	movl	%esi, %edi
.LBB5_59:
	movl	%edi, 724(%esp)
	movl	%ebx, 728(%esp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovss	%xmm1, %xmm0, %xmm0
	vsqrtps	%xmm0, %xmm0
	movl	600(%esp), %eax
	movl	652(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	472(%esp), %eax
	incl	%eax
	movl	%eax, 472(%esp)
	movl	720(%esp), %edi
	cmpl	%edi, %eax
	movl	464(%esp), %ecx
	movl	%eax, %esi
	jge	.LBB5_65
	.align	16, 0x90
.LBB5_60:
	movl	%ecx, 736(%esp)
	movl	%esi, 608(%esp)
	movl	528(%esp), %eax
	leal	(%esi,%eax), %ecx
	movl	%ecx, 604(%esp)
	movl	668(%esp), %eax
	vmovss	(%eax,%ecx,4), %xmm0
	cmpl	$0, 480(%esp)
	jle	.LBB5_61
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorl	%edi, %edi
	movl	672(%esp), %ebx
	.align	16, 0x90
.LBB5_63:
	movl	724(%esp), %esi
	vmovss	(%esi,%eax), %xmm2
	movl	736(%esp), %esi
	vmovss	(%esi,%ecx), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	addl	%ebx, %ecx
	adcl	732(%esp), %edx
	addl	%ebx, %eax
	incl	%edi
	cmpl	%edi, 728(%esp)
	vmovdqa	%xmm1, %xmm0
	jne	.LBB5_63
	jmp	.LBB5_64
	.align	16, 0x90
.LBB5_61:
	vmovdqa	%xmm0, %xmm1
.LBB5_64:
	movl	652(%esp), %ecx
	movl	600(%esp), %eax
	vdivss	(%ecx,%eax,4), %xmm1, %xmm0
	movl	604(%esp), %eax
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	576(%esp), %eax
	movl	608(%esp), %esi
	leal	(%esi,%eax), %eax
	vmovss	(%ecx,%eax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	%eax, 1036(%esp)
	vmovsd	%xmm0, 1040(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1036(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str2, (%esp)
	vzeroupper
	calll	opencl_printf
	movl	736(%esp), %eax
	addl	$4, %eax
	incl	%esi
	movl	720(%esp), %edi
	cmpl	%edi, %esi
	movl	%eax, %ecx
	jne	.LBB5_60
.LBB5_65:
	addl	$4, 464(%esp)
	movl	724(%esp), %ecx
	addl	$4, %ecx
	movl	728(%esp), %eax
	incl	%eax
	cmpl	468(%esp), %eax
	jne	.LBB5_55
	movl	344(%esp), %eax
	vmovss	(%eax), %xmm0
	movl	652(%esp), %eax
	vdivss	(%eax), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	348(%esp), %ecx
	movl	%eax, (%ecx)
	movl	$1, %esi
	xorl	%edi, %edi
	.align	16, 0x90
.LBB5_67:
	movl	344(%esp), %eax
	vmovss	(%eax,%esi,4), %xmm1
	leal	-1(%esi), %eax
	testl	%eax, %eax
	jle	.LBB5_68
	movl	652(%esp), %eax
	leal	4(%eax,%edi,4), %eax
	movl	348(%esp), %ecx
	xorl	%edx, %edx
	movl	672(%esp), %ebx
	.align	16, 0x90
.LBB5_70:
	vcvtsi2ssl	(%ecx), %xmm0, %xmm2
	vmovss	(%eax), %xmm0
	vfnmadd213ss	%xmm1, %xmm2, %xmm0
	addl	%ebx, %eax
	addl	$4, %ecx
	incl	%edx
	cmpl	%edx, %edi
	vmovdqa	%xmm0, %xmm1
	jne	.LBB5_70
	jmp	.LBB5_71
	.align	16, 0x90
.LBB5_68:
	vmovdqa	%xmm1, %xmm0
.LBB5_71:
	movl	%esi, %eax
	imull	720(%esp), %eax
	addl	%esi, %eax
	movl	652(%esp), %ecx
	vdivss	(%ecx,%eax,4), %xmm0, %xmm0
	vcvttss2si	%xmm0, %eax
	movl	348(%esp), %ecx
	movl	%eax, (%ecx,%esi,4)
	movl	%esi, 1048(%esp)
	movl	%eax, 1052(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1048(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str3, (%esp)
	vzeroupper
	calll	opencl_printf
	incl	%esi
	incl	%edi
	cmpl	468(%esp), %edi
	jne	.LBB5_67
	movl	720(%esp), %edi
	movl	652(%esp), %ecx
	movl	348(%esp), %eax
	movl	576(%esp), %edx
.LBB5_73:
	movl	%edx, 576(%esp)
	movl	%eax, 348(%esp)
	vcvtsi2ssl	-4(%eax,%edi,4), %xmm0, %xmm0
	movl	280(%esp), %eax
	vdivss	-4(%ecx,%eax,4), %xmm0, %xmm0
	movl	468(%esp), %eax
	leal	(%eax,%edx), %eax
	movl	284(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	cmpl	$0, 452(%esp)
	js	.LBB5_78
	movl	444(%esp), %eax
	movl	576(%esp), %ecx
	leal	(%eax,%ecx,4), %esi
	movl	$-1, %edx
	movl	416(%esp), %ebx
	movl	452(%esp), %edi
	.align	16, 0x90
.LBB5_75:
	movl	%edx, 736(%esp)
	movl	348(%esp), %eax
	vcvtsi2ssl	(%eax,%edi,4), %xmm0, %xmm0
	leal	1(%edi), %ecx
	xorl	%eax, %eax
	cmpl	720(%esp), %ecx
	movl	$0, %ecx
	jge	.LBB5_77
	.align	16, 0x90
.LBB5_76:
	vmovss	(%ebx,%eax), %xmm2
	vmovss	(%esi,%edx,4), %xmm1
	vfnmadd213ss	%xmm0, %xmm2, %xmm1
	addl	$4, %eax
	adcl	$0, %ecx
	incl	%edx
	vmovdqa	%xmm1, %xmm0
	jne	.LBB5_76
.LBB5_77:
	movl	%edi, %eax
	imull	720(%esp), %eax
	addl	%edi, %eax
	movl	652(%esp), %ecx
	vdivss	(%ecx,%eax,4), %xmm0, %xmm0
	movl	576(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	284(%esp), %ecx
	vmovss	%xmm0, (%ecx,%eax,4)
	movl	%eax, 1056(%esp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 1060(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	656(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1056(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str4, (%esp)
	addl	460(%esp), %ebx
	vzeroupper
	calll	opencl_printf
	movl	736(%esp), %edx
	decl	%edx
	testl	%edi, %edi
	leal	-1(%edi), %edi
	jg	.LBB5_75
.LBB5_78:
	movl	476(%esp), %eax
	addl	288(%esp), %eax
	incl	456(%esp)
	movl	448(%esp), %ecx
	incl	%ecx
	cmpl	148(%esp), %ecx
	movl	720(%esp), %edi
	jne	.LBB5_42
.LBB5_79:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp59:
	.size	build_polinome_square_root, .Ltmp59-build_polinome_square_root
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI6_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
.LCPI6_2:
	.zero	32
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI6_1:
	.long	1065353216
	.text
	.globl	build_polinome_unoptimized
	.align	16, 0x90
	.type	build_polinome_unoptimized,@function
build_polinome_unoptimized:
	.cfi_startproc
	pushl	%ebp
.Ltmp63:
	.cfi_def_cfa_offset 8
.Ltmp64:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp65:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-32, %esp
	subl	$640, %esp
.Ltmp66:
	.cfi_offset %esi, -20
.Ltmp67:
	.cfi_offset %edi, -16
.Ltmp68:
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
	je	.LBB6_19
	movl	308(%esp), %edx
	vmovd	%edx, %xmm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpermd	%ymm0, %ymm2, %ymm1
	movl	20(%esp), %eax
	vmovd	%eax, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vpaddd	.LCPI6_0, %ymm0, %ymm0
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
	vmovss	.LCPI6_1, %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 160(%esp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB6_2:
	movl	%eax, 124(%esp)
	testl	%esi, %esi
	jle	.LBB6_18
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
.LBB6_4:
	movl	%eax, 408(%esp)
	vxorpd	%ymm1, %ymm1, %ymm1
	movl	308(%esp), %eax
	testl	%eax, %eax
	movl	%eax, %esi
	movl	$0, %edi
	movl	$0, %ebx
	jle	.LBB6_6
	.align	16, 0x90
.LBB6_5:
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
	jne	.LBB6_5
.LBB6_6:
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
	jne	.LBB6_4
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
.LBB6_8:
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
	jle	.LBB6_11
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
.LBB6_10:
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
	jne	.LBB6_10
.LBB6_11:
	movl	416(%esp), %eax
	addl	220(%esp), %eax
	incl	%edx
	cmpl	372(%esp), %edx
	movl	%edx, %ecx
	movl	480(%esp), %edi
	movl	476(%esp), %ebx
	jne	.LBB6_8
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
.LBB6_13:
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
	jge	.LBB6_14
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
.LBB6_16:
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
	jne	.LBB6_16
	jmp	.LBB6_17
	.align	16, 0x90
.LBB6_14:
	movl	%ecx, 376(%esp)
	movl	412(%esp), %ecx
	vmovss	(%eax,%ecx,4), %xmm2
	movl	380(%esp), %esi
.LBB6_17:
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
	jg	.LBB6_13
.LBB6_18:
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
	jne	.LBB6_2
.LBB6_19:
	movl	120(%esp), %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	cmpl	%ecx, %eax
	je	.LBB6_38
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
	vmovss	.LCPI6_1, %xmm1
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
.LBB6_21:
	movl	%eax, 400(%esp)
	movl	%edi, 484(%esp)
	testl	%esi, %esi
	jle	.LBB6_37
	movl	408(%esp), %eax
	imull	%esi, %eax
	movl	%eax, 476(%esp)
	xorl	%edx, %edx
	.align	16, 0x90
.LBB6_23:
	movl	%edx, 492(%esp)
	vxorps	%xmm1, %xmm1, %xmm1
	movl	308(%esp), %eax
	testl	%eax, %eax
	movl	$0, %edi
	movl	$0, %ebx
	movl	%eax, %esi
	jle	.LBB6_25
	.align	16, 0x90
.LBB6_24:
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
	jne	.LBB6_24
.LBB6_25:
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
	jne	.LBB6_23
	movl	316(%esp), %ecx
	.align	16, 0x90
.LBB6_27:
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
	jle	.LBB6_30
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB6_29:
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
	jne	.LBB6_29
.LBB6_30:
	addl	468(%esp), %ecx
	incl	%eax
	xorl	%ebx, %ebx
	movl	372(%esp), %esi
	cmpl	%esi, %eax
	jne	.LBB6_27
	movl	396(%esp), %edi
	movl	404(%esp), %eax
	movl	%esi, %ecx
	.align	16, 0x90
.LBB6_32:
	movl	%ecx, 472(%esp)
	movl	%ebx, 492(%esp)
	movl	%eax, %ebx
	movl	476(%esp), %eax
	leal	-1(%ecx,%eax), %eax
	movl	480(%esp), %edx
	vmovss	(%edx,%eax,4), %xmm1
	cmpl	%esi, %ecx
	jge	.LBB6_33
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%ebx, 496(%esp)
	.align	16, 0x90
.LBB6_35:
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
	jne	.LBB6_35
	jmp	.LBB6_36
	.align	16, 0x90
.LBB6_33:
	vmovaps	%xmm1, %xmm0
	movl	%ebx, 496(%esp)
.LBB6_36:
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
	jg	.LBB6_32
.LBB6_37:
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
	jne	.LBB6_21
.LBB6_38:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp69:
	.size	build_polinome_unoptimized, .Ltmp69-build_polinome_unoptimized
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

	.type	double_const_signMask,@object
	.globl	double_const_signMask
	.align	8
double_const_signMask:
	.quad	9223372036854775807
	.size	double_const_signMask, 8


	.section	".note.GNU-stack","",@progbits
