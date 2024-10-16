	.file	"tlb.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.2) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D _GNU_SOURCE tlb.c
# -mtune=generic -march=x86-64 -fverbose-asm -fasynchronous-unwind-tables
# -fstack-protector-strong -Wformat -Wformat-security
# -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
# -fipa-stack-alignment -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fplt -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fshrink-wrap-separate
# -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
# -fstack-clash-protection -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.section	.rodata
.LC0:
	.string	"Please provide arguments"
.LC1:
	.string	"could not pin to core"
.LC2:
	.string	"%lu \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$264, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -292(%rbp)	# argc, argc
	movq	%rsi, -304(%rbp)	# argv, argv
# tlb.c:13: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp173
	movq	%rax, -56(%rbp)	# tmp173, D.4080
	xorl	%eax, %eax	# tmp173
	movq	%rsp, %rax	#, tmp120
	movq	%rax, %rbx	# tmp120, saved_stack.2_39
# tlb.c:14:     if (argc < 3)
	cmpl	$2, -292(%rbp)	#, argc
	jg	.L2	#,
# tlb.c:16:         printf("Please provide arguments\n");
	leaq	.LC0(%rip), %rdi	#,
	call	puts@PLT	#
# tlb.c:17:         exit(0);
	movl	$0, %edi	#,
	call	exit@PLT	#
.L2:
# tlb.c:21:     CPU_ZERO(&mask);
	leaq	-192(%rbp), %rax	#, tmp121
	movq	%rax, %rsi	# tmp121, tmp122
	movl	$0, %eax	#, tmp123
	movl	$16, %edx	#, tmp124
	movq	%rsi, %rdi	# tmp122, tmp122
	movq	%rdx, %rcx	# tmp124, tmp124
	rep stosq
# tlb.c:22:     CPU_SET(0, &mask);
	movq	$0, -256(%rbp)	#, __cpu
	cmpq	$1023, -256(%rbp)	#, __cpu
	ja	.L4	#,
# tlb.c:22:     CPU_SET(0, &mask);
	movq	-256(%rbp), %rax	# __cpu, tmp125
	shrq	$6, %rax	#, _44
	leaq	0(,%rax,8), %rdx	#, _1
	leaq	-192(%rbp), %rcx	#, tmp126
	addq	%rcx, %rdx	# tmp126, _2
	movq	(%rdx), %rdx	# *_2, _3
	movq	-256(%rbp), %rcx	# __cpu, tmp127
	andl	$63, %ecx	#, _5
	movl	$1, %esi	#, tmp128
	salq	%cl, %rsi	# _5, tmp128
	movq	%rsi, %rcx	# tmp128, _6
	leaq	0(,%rax,8), %rsi	#, _7
	leaq	-192(%rbp), %rax	#, tmp129
	addq	%rsi, %rax	# _7, _8
	orq	%rcx, %rdx	# _6, _9
	movq	%rdx, (%rax)	# _9, *_8
.L4:
# tlb.c:23:     int result = sched_setaffinity(0, sizeof(mask), &mask);
	leaq	-192(%rbp), %rax	#, tmp130
	movq	%rax, %rdx	# tmp130,
	movl	$128, %esi	#,
	movl	$0, %edi	#,
	call	sched_setaffinity@PLT	#
	movl	%eax, -272(%rbp)	# tmp131, result
# tlb.c:25:     if (result < 0)
	cmpl	$0, -272(%rbp)	#, result
	jns	.L5	#,
# tlb.c:27:         printf("could not pin to core");
	leaq	.LC1(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# tlb.c:28:         exit(0);
	movl	$0, %edi	#,
	call	exit@PLT	#
.L5:
# tlb.c:31:     int NUMPAGES = atoi(argv[1]);
	movq	-304(%rbp), %rax	# argv, tmp132
	addq	$8, %rax	#, _10
# tlb.c:31:     int NUMPAGES = atoi(argv[1]);
	movq	(%rax), %rax	# *_10, _11
	movq	%rax, %rdi	# _11,
	call	atoi@PLT	#
	movl	%eax, -268(%rbp)	# tmp133, NUMPAGES
# tlb.c:32:     int NLOOPS = atoi(argv[2]);
	movq	-304(%rbp), %rax	# argv, tmp134
	addq	$16, %rax	#, _12
# tlb.c:32:     int NLOOPS = atoi(argv[2]);
	movq	(%rax), %rax	# *_12, _13
	movq	%rax, %rdi	# _13,
	call	atoi@PLT	#
	movl	%eax, -264(%rbp)	# tmp135, NLOOPS
# tlb.c:35:     int jump = PAGESIZE / sizeof(int); // to jump into the next page
	movl	$1024, -260(%rbp)	#, jump
# tlb.c:36:     int a[NUMPAGES * jump];
	movl	-268(%rbp), %eax	# NUMPAGES, tmp136
	imull	-260(%rbp), %eax	# jump, _54
	movslq	%eax, %rdx	# _54, _14
# tlb.c:36:     int a[NUMPAGES * jump];
	subq	$1, %rdx	#, _15
	movq	%rdx, -248(%rbp)	# _15, D.4070
	movslq	%eax, %rdx	# _54, _17
	movq	%rdx, %r14	# _17, _18
	movl	$0, %r15d	#, _18
	movslq	%eax, %rdx	# _54, _22
	movq	%rdx, %r12	# _22, _23
	movl	$0, %r13d	#, _23
	cltq
	leaq	0(,%rax,4), %rdx	#, _59
	movl	$16, %eax	#, tmp171
	subq	$1, %rax	#, tmp137
	addq	%rdx, %rax	# _59, tmp138
	movl	$16, %ecx	#, tmp172
	movl	$0, %edx	#, tmp141
	divq	%rcx	# tmp172
	imulq	$16, %rax, %rax	#, tmp140, tmp142
	movq	%rax, %rdx	# tmp142, tmp144
	andq	$-4096, %rdx	#, tmp144
	movq	%rsp, %rdi	#, tmp145
	subq	%rdx, %rdi	# tmp144, tmp145
	movq	%rdi, %rdx	# tmp145, tmp145
.L6:
	cmpq	%rdx, %rsp	# tmp145,
	je	.L7	#,
	subq	$4096, %rsp	#,
	orq	$0, 4088(%rsp)	#,
	jmp	.L6	#
.L7:
	movq	%rax, %rdx	# tmp142, tmp146
	andl	$4095, %edx	#, tmp146
	subq	%rdx, %rsp	# tmp146,
	movq	%rax, %rdx	# tmp142, tmp147
	andl	$4095, %edx	#, tmp147
	testq	%rdx, %rdx	# tmp147
	je	.L8	#,
	andl	$4095, %eax	#, tmp148
	subq	$8, %rax	#, tmp148
	addq	%rsp, %rax	#, tmp149
	orq	$0, (%rax)	#,
.L8:
	movq	%rsp, %rax	#, tmp143
	addq	$3, %rax	#, tmp150
	shrq	$2, %rax	#, tmp151
	salq	$2, %rax	#, tmp152
	movq	%rax, -240(%rbp)	# tmp152, a.1
# tlb.c:38:     for (int i = 0; i < NUMPAGES * jump; i += jump)
	movl	$0, -276(%rbp)	#, i
# tlb.c:38:     for (int i = 0; i < NUMPAGES * jump; i += jump)
	jmp	.L9	#
.L10:
# tlb.c:40:         a[i] = 0;
	movq	-240(%rbp), %rax	# a.1, tmp153
	movl	-276(%rbp), %edx	# i, tmp155
	movslq	%edx, %rdx	# tmp155, tmp154
	movl	$0, (%rax,%rdx,4)	#, *a.1_61
# tlb.c:38:     for (int i = 0; i < NUMPAGES * jump; i += jump)
	movl	-260(%rbp), %eax	# jump, tmp156
	addl	%eax, -276(%rbp)	# tmp156, i
.L9:
# tlb.c:38:     for (int i = 0; i < NUMPAGES * jump; i += jump)
	movl	-268(%rbp), %eax	# NUMPAGES, tmp157
	imull	-260(%rbp), %eax	# jump, _27
# tlb.c:38:     for (int i = 0; i < NUMPAGES * jump; i += jump)
	cmpl	%eax, -276(%rbp)	# _27, i
	jl	.L10	#,
# tlb.c:43:     clock_gettime(CLOCK_MONOTONIC, &ts_start);
	leaq	-224(%rbp), %rax	#, tmp158
	movq	%rax, %rsi	# tmp158,
	movl	$1, %edi	#,
	call	clock_gettime@PLT	#
# tlb.c:44:     for (int j = 0; j < NLOOPS; ++j)
	movl	$0, -280(%rbp)	#, j
# tlb.c:44:     for (int j = 0; j < NLOOPS; ++j)
	jmp	.L11	#
.L14:
# tlb.c:46:         for (int i = 0; i < NUMPAGES * jump; i += jump)
	movl	$0, -284(%rbp)	#, i
# tlb.c:46:         for (int i = 0; i < NUMPAGES * jump; i += jump)
	jmp	.L12	#
.L13:
# tlb.c:48:             a[i] += 1;
	movq	-240(%rbp), %rax	# a.1, tmp159
	movl	-284(%rbp), %edx	# i, tmp161
	movslq	%edx, %rdx	# tmp161, tmp160
	movl	(%rax,%rdx,4), %eax	# *a.1_61, _28
	leal	1(%rax), %ecx	#, _29
	movq	-240(%rbp), %rax	# a.1, tmp162
	movl	-284(%rbp), %edx	# i, tmp164
	movslq	%edx, %rdx	# tmp164, tmp163
	movl	%ecx, (%rax,%rdx,4)	# _29, *a.1_61
# tlb.c:46:         for (int i = 0; i < NUMPAGES * jump; i += jump)
	movl	-260(%rbp), %eax	# jump, tmp165
	addl	%eax, -284(%rbp)	# tmp165, i
.L12:
# tlb.c:46:         for (int i = 0; i < NUMPAGES * jump; i += jump)
	movl	-268(%rbp), %eax	# NUMPAGES, tmp166
	imull	-260(%rbp), %eax	# jump, _30
# tlb.c:46:         for (int i = 0; i < NUMPAGES * jump; i += jump)
	cmpl	%eax, -284(%rbp)	# _30, i
	jl	.L13	#,
# tlb.c:44:     for (int j = 0; j < NLOOPS; ++j)
	addl	$1, -280(%rbp)	#, j
.L11:
# tlb.c:44:     for (int j = 0; j < NLOOPS; ++j)
	movl	-280(%rbp), %eax	# j, tmp167
	cmpl	-264(%rbp), %eax	# NLOOPS, tmp167
	jl	.L14	#,
# tlb.c:52:     clock_gettime(CLOCK_MONOTONIC, &ts_end);
	leaq	-208(%rbp), %rax	#, tmp168
	movq	%rax, %rsi	# tmp168,
	movl	$1, %edi	#,
	call	clock_gettime@PLT	#
# tlb.c:53:     unsigned long time_taken = (ts_end.tv_nsec - ts_start.tv_nsec);// * 10 / (NLOOPS * NUMPAGES);
	movq	-200(%rbp), %rdx	# ts_end.tv_nsec, _31
# tlb.c:53:     unsigned long time_taken = (ts_end.tv_nsec - ts_start.tv_nsec);// * 10 / (NLOOPS * NUMPAGES);
	movq	-216(%rbp), %rax	# ts_start.tv_nsec, _32
# tlb.c:53:     unsigned long time_taken = (ts_end.tv_nsec - ts_start.tv_nsec);// * 10 / (NLOOPS * NUMPAGES);
	subq	%rax, %rdx	# _32, _31
	movq	%rdx, %rax	# _31, _33
# tlb.c:53:     unsigned long time_taken = (ts_end.tv_nsec - ts_start.tv_nsec);// * 10 / (NLOOPS * NUMPAGES);
	movq	%rax, -232(%rbp)	# _33, time_taken
# tlb.c:54:     printf("%lu \n", time_taken);
	movq	-232(%rbp), %rax	# time_taken, tmp169
	movq	%rax, %rsi	# tmp169,
	leaq	.LC2(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
	movq	%rbx, %rsp	# saved_stack.2_39,
	movl	$0, %eax	#, _72
# tlb.c:55: }
	movq	-56(%rbp), %rbx	# D.4080, tmp174
	xorq	%fs:40, %rbx	# MEM[(<address-space-1> long unsigned int *)40B], tmp174
	je	.L16	#,
	call	__stack_chk_fail@PLT	#
.L16:
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
