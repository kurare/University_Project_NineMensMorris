#ifdef __linux__
#ifdef __i386__
	.file	"mcp_state.c"
	.text
	.p2align 4,,15
	.globl	start_game
	.type	start_game, @function
start_game:
.LFB15:
	.cfi_startproc
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$9, game.2176@GOTOFF(%eax)
	movl	$9, 4+game.2176@GOTOFF(%eax)
	movl	$0, 8+game.2176@GOTOFF(%eax)
	movl	$0, 12+game.2176@GOTOFF(%eax)
	movl	$0, 16+game.2176@GOTOFF(%eax)
	movl	$0, 20+game.2176@GOTOFF(%eax)
	movl	$0, 24+game.2176@GOTOFF(%eax)
	leal	game.2176@GOTOFF(%eax), %eax
	ret
	.cfi_endproc
.LFE15:
	.size	start_game, .-start_game
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"mcp_state.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC1:
	.string	"(game->board[0] & game->board[1]) == 0"
	.section	.rodata.str1.1
.LC2:
	.string	"%u %u %u\n"
.LC3:
	.string	"0"
.LC4:
	.string	"1"
.LC5:
	.string	"."
.LC6:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	serialize_state
	.type	serialize_state, @function
serialize_state:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	56(%esp), %esi
	movl	8(%esi), %eax
	testl	%eax, 12(%esi)
	jne	.L15
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	4(%esi)
	.cfi_def_cfa_offset 64
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	(%esi)
	.cfi_def_cfa_offset 68
	pushl	72(%esp)
	.cfi_def_cfa_offset 72
	pushl	%eax
	.cfi_def_cfa_offset 76
	pushl	76(%esp)
	.cfi_def_cfa_offset 80
	call	fprintf@PLT
	addl	$32, %esp
	.cfi_def_cfa_offset 48
	cmpl	$6, %eax
	je	.L4
.L10:
	xorl	%eax, %eax
.L2:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	leal	.LC5@GOTOFF(%ebx), %eax
	movl	$1, %ebp
	movl	%esi, 56(%esp)
	xorl	%edi, %edi
	movl	%eax, 8(%esp)
	leal	.LC4@GOTOFF(%ebx), %eax
	movl	%ebp, %esi
	movl	56(%esp), %ebp
	movl	$24, 4(%esp)
	movl	%eax, 12(%esp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L18:
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	56(%esp)
	.cfi_def_cfa_offset 60
	pushl	24(%esp)
	.cfi_def_cfa_offset 64
.L13:
	call	fputs@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$-1, %eax
	setne	%al
	addl	%esi, %esi
	movzbl	%al, %eax
	addl	%eax, %edi
	subl	$1, 4(%esp)
	je	.L16
.L9:
	testl	%esi, 8(%ebp)
	jne	.L17
	testl	%esi, 12(%ebp)
	jne	.L18
	subl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pushl	56(%esp)
	.cfi_def_cfa_offset 60
	pushl	20(%esp)
	.cfi_def_cfa_offset 64
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	leal	.LC3@GOTOFF(%ebx), %eax
	subl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pushl	56(%esp)
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	leal	.LC6@GOTOFF(%ebx), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	56(%esp)
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	fputs@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$-1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %edi
	cmpl	$25, %edi
	jne	.L10
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	60(%esp)
	.cfi_def_cfa_offset 64
	call	fflush@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	$1, %eax
	jmp	.L2
.L15:
	leal	__PRETTY_FUNCTION__.2184@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 52
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	$92
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	__assert_fail@PLT
	.cfi_endproc
.LFE16:
	.size	serialize_state, .-serialize_state
	.section	.rodata.str1.1
.LC7:
	.string	"%3c%c"
	.section	.rodata.str1.4
	.align 4
.LC8:
	.string	"[MCP] Move was not terminated by a newline character."
	.text
	.p2align 4,,15
	.globl	deserialize_move
	.type	deserialize_move, @function
deserialize_move:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	leal	12(%esp), %ebp
	leal	13(%esp), %edi
	leal	.LC7@GOTOFF(%ebx), %esi
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L27:
	call	__errno_location@PLT
	cmpl	$4, (%eax)
	jne	.L24
.L21:
	pushl	%ebp
	.cfi_def_cfa_offset 52
	pushl	%edi
	.cfi_def_cfa_offset 56
	pushl	%esi
	.cfi_def_cfa_offset 60
	pushl	60(%esp)
	.cfi_def_cfa_offset 64
	call	__isoc99_fscanf@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$-1, %eax
	je	.L27
	cmpl	$2, %eax
	jne	.L24
	cmpb	$10, 12(%esp)
	je	.L23
	movl	stderr@GOT(%ebx), %eax
	pushl	(%eax)
	.cfi_def_cfa_offset 52
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	$53
	.cfi_def_cfa_offset 56
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	fwrite@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L23:
	call	__ctype_toupper_loc@PLT
	movl	(%eax), %esi
	movsbl	13(%esp), %eax
	movl	(%esi,%eax,4), %edx
	movl	$1, %eax
	movl	%eax, %edi
	leal	-65(%edx), %ecx
	subl	$65, %edx
	sall	%cl, %edi
	cmpb	$24, %dl
	sbbl	%edx, %edx
	movl	%edi, %ecx
	movl	%eax, %edi
	andl	%edx, %ecx
	movsbl	14(%esp), %edx
	movl	%ecx, move.2191@GOTOFF(%ebx)
	movl	(%esi,%edx,4), %edx
	leal	-65(%edx), %ecx
	subl	$65, %edx
	sall	%cl, %edi
	cmpb	$24, %dl
	sbbl	%edx, %edx
	movl	%edi, %ecx
	andl	%edx, %ecx
	movsbl	15(%esp), %edx
	movl	%ecx, 4+move.2191@GOTOFF(%ebx)
	movl	(%esi,%edx,4), %edx
	leal	-65(%edx), %ecx
	sall	%cl, %eax
	cmpb	$24, %cl
	sbbl	%edx, %edx
	andl	%edx, %eax
	movl	%eax, 8+move.2191@GOTOFF(%ebx)
	leal	move.2191@GOTOFF(%ebx), %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE17:
	.size	deserialize_move, .-deserialize_move
	.p2align 4,,15
	.globl	dump_move
	.type	dump_move, @function
dump_move:
.LFB18:
	.cfi_startproc
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	$65, %edx
	movl	$32, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movb	$0, 3(%esp)
	movl	%eax, %edi
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movb	$32, 2+dump.2207@GOTOFF(%edi)
	movb	$32, 1+dump.2207@GOTOFF(%edi)
	movb	$32, dump.2207@GOTOFF(%edi)
	xorl	%edi, %edi
	movl	(%eax), %esi
	movb	$32, 2(%esp)
	movl	4(%eax), %ebx
	movb	$0, 1(%esp)
	movl	8(%eax), %ecx
	movb	$32, (%esp)
	movl	$1, %eax
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	%eax, %ebx
	je	.L50
.L30:
	cmpl	%eax, %ecx
	je	.L51
.L31:
	addl	$1, %edx
	addl	%eax, %eax
	cmpb	$89, %dl
	je	.L52
.L32:
	cmpl	%eax, %esi
	jne	.L29
	movl	%edx, %ebp
	movl	$1, %edi
	cmpl	%eax, %ebx
	jne	.L30
.L50:
	movb	%dl, (%esp)
	movb	$1, 1(%esp)
	cmpl	%eax, %ecx
	jne	.L31
.L51:
	movb	%dl, 2(%esp)
	addl	$1, %edx
	addl	%eax, %eax
	movb	$1, 3(%esp)
	cmpb	$89, %dl
	jne	.L32
.L52:
	movl	%edi, %eax
	testb	%al, %al
	jne	.L53
.L33:
	cmpb	$0, 1(%esp)
	je	.L34
	movl	4(%esp), %ebx
	movzbl	(%esp), %eax
	movb	%al, 1+dump.2207@GOTOFF(%ebx)
.L34:
	cmpb	$0, 3(%esp)
	je	.L35
	movl	4(%esp), %esi
	movzbl	2(%esp), %eax
	movb	%al, 2+dump.2207@GOTOFF(%esi)
.L35:
	movl	4(%esp), %eax
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	leal	dump.2207@GOTOFF(%eax), %eax
	ret
.L53:
	.cfi_restore_state
	movl	4(%esp), %ecx
	movl	%ebp, %eax
	movb	%al, dump.2207@GOTOFF(%ecx)
	jmp	.L33
	.cfi_endproc
.LFE18:
	.size	dump_move, .-dump_move
	.p2align 4,,15
	.globl	apply_move
	.type	apply_move, @function
apply_move:
.LFB19:
	.cfi_startproc
	call	__x86.get_pc_thunk.cx
	addl	$_GLOBAL_OFFSET_TABLE_, %ecx
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	32(%esp), %eax
	movl	28(%esp), %edi
	leal	(%eax,%edi,4), %ebx
	movl	36(%esp), %eax
	movl	(%ebx), %edx
	testl	%edx, %edx
	je	.L55
	movl	(%eax), %esi
	testl	%esi, %esi
	jne	.L59
	subl	$1, %edx
	xorl	%edi, %edi
	xorl	%eax, %eax
	movl	%edx, (%ebx)
.L58:
	movl	36(%esp), %esi
	movl	4(%esi), %ebp
	testl	%ebp, %ebp
	je	.L59
	movl	32(%esp), %esi
	testl	%ebp, 8(%esi)
	jne	.L59
	orl	12(%esi), %edi
	testl	%ebp, %edi
	jne	.L59
	testl	%eax, %eax
	je	.L62
	orl	%ebp, %eax
	movl	%ebp, 4(%esp)
	xorl	%edx, %edx
	movl	%ebx, %ebp
	movl	%eax, (%esp)
	movl	%eax, %edi
	.p2align 4,,10
	.p2align 3
.L63:
	movl	edges@GOTOFF(%ecx,%edx,4), %esi
	addl	$1, %edx
	cmpl	$31, %edx
	setbe	%bl
	cmpl	%esi, %edi
	sete	%al
	cmpb	%al, %bl
	ja	.L63
	movl	%ebp, %ebx
	movl	4(%esp), %ebp
	cmpl	%esi, (%esp)
	jne	.L59
.L62:
	movl	8(%ebx), %edi
	xorl	%ebp, %edi
	movl	%edi, 8(%ebx)
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L64:
	movl	mills@GOTOFF(%ecx,%ebx,4), %edx
	movl	%edi, %eax
	andl	%edx, %eax
	cmpl	%edx, %eax
	sete	%al
	andl	%ebp, %edx
	cmpl	$1, %edx
	sbbl	%edx, %edx
	addl	$1, %ebx
	notl	%edx
	andl	%edx, %eax
	cmpl	$15, %ebx
	setbe	%dl
	cmpb	%dl, %al
	jb	.L64
	testb	%al, %al
	je	.L65
	movl	36(%esp), %ecx
	movl	8(%ecx), %ecx
	testl	%ecx, %ecx
	je	.L66
	movl	28(%esp), %ebx
	xorl	%edx, %edx
	movl	32(%esp), %edi
	testl	%ebx, %ebx
	sete	%dl
	leal	(%edi,%edx,4), %ebp
	movl	8(%ebp), %edx
	testl	%edx, %ecx
	je	.L59
	movl	%edx, %ebx
	movl	%edx, %edi
	andl	$7, %ebx
	cmpl	$7, %ebx
	setne	%bl
	andl	$8404996, %edi
	movzbl	%bl, %ebx
	subl	$1, %ebx
	andl	$7, %ebx
	movl	%ebx, %esi
	orl	$8404996, %esi
	cmpl	$8404996, %edi
	je	.L68
	movl	%ebx, %esi
.L68:
	movl	%edx, %ebx
	movl	%esi, %edi
	andl	$14680064, %ebx
	orl	$14680064, %edi
	cmpl	$14680064, %ebx
	je	.L133
.L70:
	movl	%edx, %ebx
	movl	%esi, %edi
	andl	$2097665, %ebx
	orl	$2097665, %edi
	cmpl	$2097665, %ebx
	je	.L72
	movl	%esi, %edi
.L72:
	movl	%edx, %esi
	movl	%edi, %ebx
	andl	$56, %esi
	orl	$56, %ebx
	cmpl	$56, %esi
	je	.L74
	movl	%edi, %ebx
.L74:
	movl	%edx, %edi
	movl	%ebx, %esi
	andl	$1056800, %edi
	orl	$1056800, %esi
	cmpl	$1056800, %edi
	je	.L76
	movl	%ebx, %esi
.L76:
	movl	%edx, %edi
	movl	%esi, %ebx
	andl	$1835008, %edi
	orl	$1835008, %ebx
	cmpl	$1835008, %edi
	je	.L78
	movl	%esi, %ebx
.L78:
	movl	%edx, %edi
	movl	%ebx, %esi
	andl	$263176, %edi
	orl	$263176, %esi
	cmpl	$263176, %edi
	je	.L80
	movl	%ebx, %esi
.L80:
	movl	%edx, %edi
	movl	%esi, %ebx
	andl	$448, %edi
	orl	$448, %ebx
	cmpl	$448, %edi
	je	.L82
	movl	%esi, %ebx
.L82:
	movl	%edx, %edi
	movl	%ebx, %esi
	andl	$135424, %edi
	orl	$135424, %esi
	cmpl	$135424, %edi
	je	.L84
	movl	%ebx, %esi
.L84:
	movl	%edx, %edi
	movl	%esi, %ebx
	andl	$229376, %edi
	orl	$229376, %ebx
	cmpl	$229376, %edi
	je	.L86
	movl	%esi, %ebx
.L86:
	movl	%edx, %edi
	movl	%ebx, %esi
	andl	$34880, %edi
	orl	$34880, %esi
	cmpl	$34880, %edi
	je	.L88
	movl	%ebx, %esi
.L88:
	movl	%edx, %edi
	movl	%esi, %ebx
	andl	$146, %edi
	orb	$-110, %bl
	cmpl	$146, %edi
	je	.L90
	movl	%esi, %ebx
.L90:
	movl	%edx, %edi
	movl	%ebx, %esi
	andl	$3584, %edi
	orl	$3584, %esi
	cmpl	$3584, %edi
	je	.L92
	movl	%ebx, %esi
.L92:
	movl	%edx, %edi
	movl	%esi, %ebx
	andl	$28672, %edi
	orb	$112, %bh
	cmpl	$28672, %edi
	je	.L94
	movl	%esi, %ebx
.L94:
	movl	%edx, %esi
	movl	%ebx, %edi
	andl	$4784128, %esi
	orl	$4784128, %edi
	cmpl	$4784128, %esi
	je	.L134
.L96:
	cmpl	%edx, %ebx
	je	.L97
	testl	%ecx, %ebx
	jne	.L59
.L97:
	xorl	%ecx, %edx
	movl	32(%esp), %ecx
	movl	%edx, 8(%ebp)
	movl	$0, 20(%ecx)
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L55:
	movl	(%eax), %edi
	testl	%edi, %edi
	jne	.L135
.L59:
	xorl	%eax, %eax
.L54:
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	.cfi_restore_state
	movl	8(%ebx), %ebp
	testl	%ebp, %edi
	je	.L59
	movl	%ebp, %eax
	.p2align 4,,10
	.p2align 3
.L60:
	leal	-1(%eax), %esi
	addl	$1, %edx
	andl	%esi, %eax
	jne	.L60
	cmpl	$3, %edx
	jbe	.L61
	movl	%edi, %eax
.L61:
	xorl	%edi, %ebp
	movl	%ebp, 8(%ebx)
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L65:
	movl	36(%esp), %eax
	movl	8(%eax), %ecx
.L66:
	testl	%ecx, %ecx
	sete	%al
	jmp	.L54
.L134:
	movl	%edi, %ebx
	jmp	.L96
.L133:
	movl	%edi, %esi
	jmp	.L70
	.cfi_endproc
.LFE19:
	.size	apply_move, .-apply_move
	.p2align 4,,15
	.globl	is_final_state
	.type	is_final_state, @function
is_final_state:
.LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	call	__x86.get_pc_thunk.bp
	addl	$_GLOBAL_OFFSET_TABLE_, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	xorl	%edi, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %esi
.L141:
	movl	8(%esi,%edi,4), %eax
	xorl	%ecx, %ecx
	movl	(%esi,%edi,4), %ebx
	testl	%eax, %eax
	je	.L137
	.p2align 4,,10
	.p2align 3
.L138:
	leal	-1(%eax), %edx
	addl	$1, %ecx
	andl	%edx, %eax
	jne	.L138
.L137:
	addl	%ebx, %ecx
	cmpl	$2, %ecx
	je	.L167
	addl	$1, %edi
	cmpl	$2, %edi
	jne	.L141
	movl	32(%esp), %eax
	leal	(%esi,%eax,4), %eax
	movl	(%eax), %ebx
	testl	%ebx, %ebx
	jne	.L142
	movl	8(%eax), %eax
	movl	%eax, %edi
	testl	%eax, %eax
	je	.L142
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L143:
	leal	-1(%eax), %edx
	addl	$1, %ecx
	andl	%edx, %eax
	jne	.L143
	cmpl	$3, %ecx
	jbe	.L142
	xorl	%ebx, %ebx
	movl	%esi, 36(%esp)
	.p2align 4,,10
	.p2align 3
.L146:
	movl	edges@GOTOFF(%ebp,%ebx,4), %esi
	movl	%edi, %eax
	andl	%esi, %eax
	je	.L154
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L145:
	leal	-1(%eax), %edx
	addl	$1, %ecx
	andl	%edx, %eax
	jne	.L145
	xorl	%eax, %eax
	cmpl	$1, %ecx
	je	.L168
.L144:
	addl	$1, %ebx
	cmpl	$31, %ebx
	setbe	%dl
	cmpb	%dl, %al
	jb	.L146
	movl	36(%esp), %esi
	testb	%al, %al
	je	.L169
	.p2align 4,,10
	.p2align 3
.L142:
	movl	4(%esi), %eax
	addl	(%esi), %eax
	jne	.L156
	movl	20(%esi), %ecx
	xorl	%eax, %eax
	movl	16(%esi), %edx
	testl	%ecx, %ecx
	je	.L148
	movl	8(%esi), %ebx
	xorl	%eax, %eax
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L149:
	addl	$1, %eax
	cmpl	%ecx, %eax
	je	.L170
.L150:
	cmpl	%ebx, (%edx,%eax,8)
	jne	.L149
	movl	12(%esi), %edi
	cmpl	%edi, 4(%edx,%eax,8)
	jne	.L149
	movl	40(%esp), %eax
	movl	$-1, (%eax)
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L170:
	.cfi_restore_state
	movl	%ecx, %eax
.L148:
	cmpl	%eax, 24(%esi)
	je	.L171
.L151:
	leal	(%edx,%ecx,8), %eax
	movl	8(%esi), %edx
	addl	$1, %ecx
	movl	%edx, (%eax)
	movl	12(%esi), %edx
	movl	%edx, 4(%eax)
	xorl	%eax, %eax
	movl	%ecx, 20(%esi)
.L136:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	.cfi_restore_state
	movl	32(%esp), %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	movl	36(%esp), %ecx
	sete	%al
	testl	%esi, 8(%ecx,%eax,4)
	sete	%al
	jmp	.L144
.L154:
	xorl	%eax, %eax
	jmp	.L144
.L156:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L169:
	.cfi_restore_state
	movl	32(%esp), %edx
	xorl	%eax, %eax
	movl	40(%esp), %edi
	testl	%edx, %edx
	sete	%al
	movl	%eax, (%edi)
	movl	$1, %eax
	jmp	.L136
.L167:
	movl	40(%esp), %eax
	xorl	$1, %edi
	movl	%edi, (%eax)
	movl	$1, %eax
	jmp	.L136
.L171:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	addl	$4096, %eax
	movl	%ebp, %ebx
	movl	%eax, 24(%esi)
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	realloc@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	%eax, 16(%esi)
	testl	%eax, %eax
	je	.L152
	movl	20(%esi), %ecx
	movl	%eax, %edx
	jmp	.L151
.L152:
	movl	%ebp, %ebx
	call	abort@PLT
	.cfi_endproc
.LFE20:
	.size	is_final_state, .-is_final_state
	.local	dump.2207
	.comm	dump.2207,4,4
	.local	move.2191
	.comm	move.2191,12,4
	.section	.rodata
	.align 4
	.type	__PRETTY_FUNCTION__.2184, @object
	.size	__PRETTY_FUNCTION__.2184, 16
__PRETTY_FUNCTION__.2184:
	.string	"serialize_state"
	.local	game.2176
	.comm	game.2176,28,4
	.align 32
	.type	mills, @object
	.size	mills, 64
mills:
	.long	7
	.long	8404996
	.long	14680064
	.long	2097665
	.long	56
	.long	1056800
	.long	1835008
	.long	263176
	.long	448
	.long	135424
	.long	229376
	.long	34880
	.long	146
	.long	3584
	.long	28672
	.long	4784128
	.align 32
	.type	edges, @object
	.size	edges, 128
edges:
	.long	3
	.long	6
	.long	16388
	.long	8404992
	.long	12582912
	.long	6291456
	.long	2097664
	.long	513
	.long	24
	.long	48
	.long	8224
	.long	1056768
	.long	1572864
	.long	786432
	.long	263168
	.long	1032
	.long	192
	.long	384
	.long	4352
	.long	135168
	.long	196608
	.long	98304
	.long	34816
	.long	2112
	.long	18
	.long	144
	.long	1536
	.long	3072
	.long	12288
	.long	24576
	.long	589824
	.long	4718592
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB21:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE21:
	.section	.text.__x86.get_pc_thunk.cx,"axG",@progbits,__x86.get_pc_thunk.cx,comdat
	.globl	__x86.get_pc_thunk.cx
	.hidden	__x86.get_pc_thunk.cx
	.type	__x86.get_pc_thunk.cx, @function
__x86.get_pc_thunk.cx:
.LFB22:
	.cfi_startproc
	movl	(%esp), %ecx
	ret
	.cfi_endproc
.LFE22:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB23:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE23:
	.section	.text.__x86.get_pc_thunk.bp,"axG",@progbits,__x86.get_pc_thunk.bp,comdat
	.globl	__x86.get_pc_thunk.bp
	.hidden	__x86.get_pc_thunk.bp
	.type	__x86.get_pc_thunk.bp, @function
__x86.get_pc_thunk.bp:
.LFB24:
	.cfi_startproc
	movl	(%esp), %ebp
	ret
	.cfi_endproc
.LFE24:
	.ident	"GCC: (GNU) 6.2.0"
	.section	.note.GNU-stack,"",@progbits
#endif
#ifdef __x86_64__
	.file	"mcp_state.c"
	.text
	.p2align 4,,15
	.globl	start_game
	.type	start_game, @function
start_game:
.LFB15:
	.cfi_startproc
	movl	$9, game.2526(%rip)
	leaq	game.2526(%rip), %rax
	movl	$9, 4+game.2526(%rip)
	movq	$0, 8+game.2526(%rip)
	movq	$0, 16+game.2526(%rip)
	movq	$0, 24+game.2526(%rip)
	movl	$0, 32+game.2526(%rip)
	movl	$0, 36+game.2526(%rip)
	ret
	.cfi_endproc
.LFE15:
	.size	start_game, .-start_game
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"mcp_state.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"(game->board[0] & game->board[1]) == 0"
	.section	.rodata.str1.1
.LC2:
	.string	"%u %u %u\n"
.LC3:
	.string	"0"
.LC4:
	.string	"1"
.LC5:
	.string	"."
.LC6:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	serialize_state
	.type	serialize_state, @function
serialize_state:
.LFB16:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rdx), %rax
	testq	%rax, 16(%rdx)
	jne	.L15
	movl	4(%rdx), %r8d
	xorl	%eax, %eax
	movq	%rdx, %r12
	movq	%rdi, %r14
	movl	(%rdx), %ecx
	movl	%esi, %edx
	leaq	.LC2(%rip), %rsi
	call	fprintf@PLT
	cmpl	$6, %eax
	je	.L4
.L10:
	xorl	%eax, %eax
.L2:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	movl	$24, %ebp
	xorl	%r13d, %r13d
	movl	$1, %ebx
	leaq	.LC5(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L9:
	testq	%rbx, 8(%r12)
	leaq	.LC3(%rip), %rdi
	movq	%r14, %rsi
	jne	.L13
	testq	%rbx, 16(%r12)
	leaq	.LC4(%rip), %rdi
	jne	.L13
	movq	%r15, %rdi
.L13:
	call	fputs@PLT
	cmpl	$-1, %eax
	setne	%al
	addq	%rbx, %rbx
	movzbl	%al, %eax
	addl	%eax, %r13d
	subl	$1, %ebp
	jne	.L9
	leaq	.LC6(%rip), %rdi
	movq	%r14, %rsi
	call	fputs@PLT
	cmpl	$-1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %r13d
	cmpl	$25, %r13d
	jne	.L10
	movq	%r14, %rdi
	call	fflush@PLT
	movl	$1, %eax
	jmp	.L2
.L15:
	leaq	__PRETTY_FUNCTION__.2534(%rip), %rcx
	movl	$92, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE16:
	.size	serialize_state, .-serialize_state
	.section	.rodata.str1.1
.LC7:
	.string	"%3c%c"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[MCP] Move was not terminated by a newline character."
	.text
	.p2align 4,,15
	.globl	deserialize_move
	.type	deserialize_move, @function
deserialize_move:
.LFB17:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	.LC7(%rip), %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	leaq	15(%rsp), %r12
	leaq	16(%rsp), %rbp
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L24:
	call	__errno_location@PLT
	cmpl	$4, (%rax)
	jne	.L21
.L18:
	xorl	%eax, %eax
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	je	.L24
	cmpl	$2, %eax
	jne	.L21
	cmpb	$10, 15(%rsp)
	je	.L20
	movq	stderr@GOTPCREL(%rip), %rax
	movl	$53, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	movq	(%rax), %rcx
	call	fwrite@PLT
.L20:
	call	__ctype_toupper_loc@PLT
	xorl	%esi, %esi
	movq	(%rax), %rdi
	movsbq	16(%rsp), %rax
	movl	(%rdi,%rax,4), %edx
	movl	$1, %eax
	movl	%eax, %ebx
	leal	-65(%rdx), %ecx
	subl	$65, %edx
	sall	%cl, %ebx
	cmpb	$23, %dl
	movsbq	17(%rsp), %rdx
	movq	%rbx, %rcx
	movl	%eax, %ebx
	cmova	%rsi, %rcx
	movq	%rcx, move.2541(%rip)
	movl	(%rdi,%rdx,4), %edx
	leal	-65(%rdx), %ecx
	subl	$65, %edx
	sall	%cl, %ebx
	cmpb	$23, %dl
	movsbq	18(%rsp), %rdx
	movq	%rbx, %rcx
	cmova	%rsi, %rcx
	movq	%rcx, 8+move.2541(%rip)
	movl	(%rdi,%rdx,4), %edx
	leal	-65(%rdx), %ecx
	sall	%cl, %eax
	cmpb	$23, %cl
	cmova	%rsi, %rax
	movq	%rax, 16+move.2541(%rip)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	leaq	move.2541(%rip), %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	addq	$40, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE17:
	.size	deserialize_move, .-deserialize_move
	.p2align 4,,15
	.globl	dump_move
	.type	dump_move, @function
dump_move:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%r10d, %r10d
	movl	$32, %r9d
	movl	$32, %r11d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$32, %ebp
	movq	(%rdi), %r8
	xorl	%ebx, %ebx
	movq	8(%rdi), %rsi
	movb	$32, 2+dump.2557(%rip)
	movl	$65, %edx
	movl	$1, %eax
	movq	16(%rdi), %rcx
	movb	$32, 1+dump.2557(%rip)
	xorl	%edi, %edi
	movb	$32, dump.2557(%rip)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L26:
	cmpq	%rax, %rsi
	je	.L47
.L27:
	cmpq	%rax, %rcx
	je	.L48
.L28:
	addl	$1, %edx
	addq	%rax, %rax
	cmpb	$89, %dl
	je	.L49
.L29:
	cmpq	%rax, %r8
	jne	.L26
	cmpq	%rax, %rsi
	movl	%edx, %ebp
	movl	$1, %edi
	jne	.L27
.L47:
	cmpq	%rax, %rcx
	movl	%edx, %r11d
	movl	$1, %ebx
	jne	.L28
.L48:
	movl	%edx, %r9d
	addl	$1, %edx
	addq	%rax, %rax
	cmpb	$89, %dl
	movl	$1, %r10d
	jne	.L29
.L49:
	testb	%dil, %dil
	jne	.L50
.L30:
	testb	%bl, %bl
	je	.L31
	movb	%r11b, 1+dump.2557(%rip)
.L31:
	testb	%r10b, %r10b
	je	.L32
	movb	%r9b, 2+dump.2557(%rip)
.L32:
	leaq	dump.2557(%rip), %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L50:
	.cfi_restore_state
	movb	%bpl, dump.2557(%rip)
	jmp	.L30
	.cfi_endproc
.LFE18:
	.size	dump_move, .-dump_move
	.p2align 4,,15
	.globl	apply_move
	.type	apply_move, @function
apply_move:
.LFB19:
	.cfi_startproc
	movl	%edi, %r11d
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	(%rsi,%r11,4), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L52
	cmpq	$0, (%rdx)
	jne	.L56
	subl	$1, %ecx
	xorl	%r9d, %r9d
	movl	%ecx, (%rax)
	xorl	%eax, %eax
.L55:
	movq	8(%rdx), %r10
	testq	%r10, %r10
	je	.L56
	testq	%r10, 8(%rsi)
	jne	.L56
	orq	16(%rsi), %r9
	testq	%r10, %r9
	jne	.L56
	testq	%rax, %rax
	je	.L59
	leaq	edges(%rip), %rbp
	orq	%r10, %rax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L60:
	movq	0(%rbp,%rcx,8), %r8
	addq	$1, %rcx
	cmpq	$31, %rcx
	setbe	%bl
	cmpq	%r8, %rax
	sete	%r9b
	cmpb	%r9b, %bl
	ja	.L60
	cmpq	%r8, %rax
	jne	.L56
.L59:
	leaq	(%rsi,%r11,8), %rax
	movq	%r10, %r9
	xorl	%ecx, %ecx
	xorq	8(%rax), %r9
	leaq	mills(%rip), %rbx
	xorl	%r11d, %r11d
	movq	%r9, 8(%rax)
	.p2align 4,,10
	.p2align 3
.L61:
	movq	(%rbx,%rcx,8), %r8
	movq	%r9, %rax
	andq	%r8, %rax
	cmpq	%r8, %rax
	sete	%al
	testq	%r8, %r10
	cmove	%r11d, %eax
	addq	$1, %rcx
	cmpq	$15, %rcx
	setbe	%r8b
	cmpb	%r8b, %al
	jb	.L61
	testb	%al, %al
	movq	16(%rdx), %r8
	je	.L63
	testq	%r8, %r8
	je	.L63
	xorl	%edx, %edx
	testl	%edi, %edi
	sete	%dl
	leaq	(%rsi,%rdx,8), %rdi
	movq	8(%rdi), %rcx
	testq	%rcx, %r8
	je	.L56
	movq	%rcx, %rdx
	movl	$0, %r9d
	movq	%rcx, %r10
	andl	$7, %edx
	cmpq	$7, %rdx
	movl	$7, %edx
	cmovne	%r9, %rdx
	andl	$8404996, %r10d
	movq	%rdx, %r9
	orq	$8404996, %r9
	cmpq	$8404996, %r10
	movq	%rcx, %r10
	cmovne	%rdx, %r9
	andl	$14680064, %r10d
	movq	%r9, %rdx
	orq	$14680064, %rdx
	cmpq	$14680064, %r10
	movq	%rcx, %r10
	cmovne	%r9, %rdx
	andl	$2097665, %r10d
	movq	%rdx, %r9
	orq	$2097665, %r9
	cmpq	$2097665, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$56, %r10d
	movq	%rdx, %r9
	orq	$56, %r9
	cmpq	$56, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$1056800, %r10d
	movq	%rdx, %r9
	orq	$1056800, %r9
	cmpq	$1056800, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$1835008, %r10d
	movq	%rdx, %r9
	orq	$1835008, %r9
	cmpq	$1835008, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$263176, %r10d
	movq	%rdx, %r9
	orq	$263176, %r9
	cmpq	$263176, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$448, %r10d
	movq	%rdx, %r9
	orq	$448, %r9
	cmpq	$448, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$135424, %r10d
	movq	%rdx, %r9
	orq	$135424, %r9
	cmpq	$135424, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$229376, %r10d
	movq	%rdx, %r9
	orq	$229376, %r9
	cmpq	$229376, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$34880, %r10d
	movq	%rdx, %r9
	orq	$34880, %r9
	cmpq	$34880, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$146, %r10d
	movq	%rdx, %r9
	orb	$-110, %r9b
	cmpq	$146, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$3584, %r10d
	movq	%rdx, %r9
	orq	$3584, %r9
	cmpq	$3584, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$28672, %r10d
	movq	%rdx, %r9
	orq	$28672, %r9
	cmpq	$28672, %r10
	movq	%rcx, %r10
	cmove	%r9, %rdx
	andl	$4784128, %r10d
	movq	%rdx, %r9
	orq	$4784128, %r9
	cmpq	$4784128, %r10
	cmove	%r9, %rdx
	cmpq	%rcx, %rdx
	je	.L64
	testq	%r8, %rdx
	jne	.L56
.L64:
	xorq	%r8, %rcx
	movq	%rcx, 8(%rdi)
	movl	$0, 32(%rsi)
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L52:
	movq	(%rdx), %r9
	testq	%r9, %r9
	jne	.L87
.L56:
	xorl	%eax, %eax
.L51:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_restore_state
	leaq	(%rsi,%r11,8), %rbx
	movq	8(%rbx), %r10
	testq	%r10, %r9
	je	.L56
	movq	%r10, %rax
	.p2align 4,,10
	.p2align 3
.L57:
	leaq	-1(%rax), %r8
	addl	$1, %ecx
	andq	%r8, %rax
	jne	.L57
	cmpl	$4, %ecx
	cmovnb	%r9, %rax
	xorq	%r9, %r10
	movq	%r10, 8(%rbx)
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L63:
	testq	%r8, %r8
	sete	%al
	jmp	.L51
	.cfi_endproc
.LFE19:
	.size	apply_move, .-apply_move
	.p2align 4,,15
	.globl	is_final_state
	.type	is_final_state, @function
is_final_state:
.LFB20:
	.cfi_startproc
	xorl	%r9d, %r9d
.L93:
	movq	8(%rsi,%r9,8), %rax
	xorl	%r8d, %r8d
	movl	(%rsi,%r9,4), %r10d
	testq	%rax, %rax
	je	.L89
	.p2align 4,,10
	.p2align 3
.L90:
	leaq	-1(%rax), %rcx
	addl	$1, %r8d
	andq	%rcx, %rax
	jne	.L90
.L89:
	addl	%r10d, %r8d
	cmpl	$2, %r8d
	je	.L122
	addq	$1, %r9
	cmpq	$2, %r9
	jne	.L93
	movl	%edi, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	(%rsi,%rax,4), %ecx
	testl	%ecx, %ecx
	jne	.L94
	movq	8(%rsi,%rax,8), %r11
	testq	%r11, %r11
	je	.L94
	xorl	%r8d, %r8d
	movq	%r11, %rax
	.p2align 4,,10
	.p2align 3
.L95:
	leaq	-1(%rax), %rcx
	addl	$1, %r8d
	andq	%rcx, %rax
	jne	.L95
	cmpl	$3, %r8d
	jbe	.L94
	leaq	edges(%rip), %rbx
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L98:
	movq	(%rbx,%r9,8), %r10
	movq	%r11, %rax
	andq	%r10, %rax
	je	.L106
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L97:
	leaq	-1(%rax), %rcx
	addl	$1, %r8d
	andq	%rcx, %rax
	jne	.L97
	xorl	%eax, %eax
	cmpl	$1, %r8d
	je	.L123
.L96:
	addq	$1, %r9
	cmpq	$31, %r9
	setbe	%cl
	cmpb	%cl, %al
	jb	.L98
	testb	%al, %al
	je	.L124
	.p2align 4,,10
	.p2align 3
.L94:
	movl	4(%rsi), %eax
	addl	(%rsi), %eax
	jne	.L108
	movl	32(%rsi), %r8d
	movq	24(%rsi), %rdi
	testq	%r8, %r8
	movq	%r8, %r10
	je	.L100
	movq	8(%rsi), %r9
	movq	%rdi, %rax
	xorl	%ecx, %ecx
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L101:
	addq	$1, %rcx
	addq	$16, %rax
	cmpq	%rcx, %r8
	je	.L100
.L102:
	cmpq	%r9, (%rax)
	jne	.L101
	movq	16(%rsi), %rbx
	cmpq	%rbx, 8(%rax)
	jne	.L101
	movl	$-1, (%rdx)
	movl	$1, %eax
.L88:
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L100:
	.cfi_restore_state
	cmpl	%r10d, 36(%rsi)
	movq	%rsi, %rbx
	je	.L125
.L103:
	movdqu	8(%rbx), %xmm0
	salq	$4, %r8
	addl	$1, %r10d
	xorl	%eax, %eax
	movups	%xmm0, (%rdi,%r8)
	movl	%r10d, 32(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	.cfi_restore_state
	xorl	%eax, %eax
	testl	%edi, %edi
	sete	%al
	testq	%r10, 8(%rsi,%rax,8)
	sete	%al
	jmp	.L96
.L106:
	xorl	%eax, %eax
	jmp	.L96
.L108:
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.L124:
	.cfi_restore_state
	xorl	%eax, %eax
	testl	%edi, %edi
	sete	%al
	movl	%eax, (%rdx)
	movl	$1, %eax
	jmp	.L88
.L122:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	xorq	$1, %r9
	movl	$1, %eax
	movl	%r9d, (%rdx)
	ret
.L125:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	4096(%r10), %esi
	movl	%esi, 36(%rbx)
	call	realloc@PLT
	testq	%rax, %rax
	movq	%rax, 24(%rbx)
	je	.L104
	movl	32(%rbx), %r8d
	movq	%rax, %rdi
	movq	%r8, %r10
	jmp	.L103
.L104:
	call	abort@PLT
	.cfi_endproc
.LFE20:
	.size	is_final_state, .-is_final_state
	.local	dump.2557
	.comm	dump.2557,4,1
	.local	move.2541
	.comm	move.2541,24,16
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.2534, @object
	.size	__PRETTY_FUNCTION__.2534, 16
__PRETTY_FUNCTION__.2534:
	.string	"serialize_state"
	.local	game.2526
	.comm	game.2526,40,32
	.align 32
	.type	mills, @object
	.size	mills, 128
mills:
	.quad	7
	.quad	8404996
	.quad	14680064
	.quad	2097665
	.quad	56
	.quad	1056800
	.quad	1835008
	.quad	263176
	.quad	448
	.quad	135424
	.quad	229376
	.quad	34880
	.quad	146
	.quad	3584
	.quad	28672
	.quad	4784128
	.align 32
	.type	edges, @object
	.size	edges, 256
edges:
	.quad	3
	.quad	6
	.quad	16388
	.quad	8404992
	.quad	12582912
	.quad	6291456
	.quad	2097664
	.quad	513
	.quad	24
	.quad	48
	.quad	8224
	.quad	1056768
	.quad	1572864
	.quad	786432
	.quad	263168
	.quad	1032
	.quad	192
	.quad	384
	.quad	4352
	.quad	135168
	.quad	196608
	.quad	98304
	.quad	34816
	.quad	2112
	.quad	18
	.quad	144
	.quad	1536
	.quad	3072
	.quad	12288
	.quad	24576
	.quad	589824
	.quad	4718592
	.ident	"GCC: (GNU) 6.2.0"
	.section	.note.GNU-stack,"",@progbits
#endif
#endif
#ifdef __APPLE__
#ifdef __i386__
	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_start_game
	.p2align	4, 0x90
_start_game:                            ## @start_game
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	calll	L0$pb
L0$pb:
	popl	%ecx
	movl	$9, _start_game.game-L0$pb(%ecx)
	leal	_start_game.game-L0$pb(%ecx), %eax
	movl	$9, (_start_game.game-L0$pb)+4(%ecx)
	movl	$0, (_start_game.game-L0$pb)+12(%ecx)
	movl	$0, (_start_game.game-L0$pb)+8(%ecx)
	movl	$0, (_start_game.game-L0$pb)+20(%ecx)
	movl	$0, (_start_game.game-L0$pb)+16(%ecx)
	movl	$0, (_start_game.game-L0$pb)+24(%ecx)
	popl	%ebp
	retl

	.globl	_serialize_state
	.p2align	4, 0x90
_serialize_state:                       ## @serialize_state
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
	calll	L1$pb
L1$pb:
	popl	%edi
	movl	16(%ebp), %eax
	movl	8(%eax), %ecx
	movl	12(%eax), %edx
	movl	%ecx, -36(%ebp)         ## 4-byte Spill
	movl	%edx, -28(%ebp)         ## 4-byte Spill
	testl	%ecx, %edx
	jne	LBB1_13
## BB#1:
	subl	$12, %esp
	leal	L_.str.2-L1$pb(%edi), %ecx
	pushl	4(%eax)
	pushl	(%eax)
	pushl	12(%ebp)
	pushl	%ecx
	pushl	8(%ebp)
	calll	_fprintf
	addl	$32, %esp
	xorl	%ebx, %ebx
	cmpl	$6, %eax
	jne	LBB1_12
## BB#2:
	movl	$1, %esi
	leal	L_.str.5-L1$pb(%edi), %eax
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	leal	L_.str.4-L1$pb(%edi), %eax
	movl	%eax, -24(%ebp)         ## 4-byte Spill
	movl	%edi, -16(%ebp)         ## 4-byte Spill
	leal	L_.str.3-L1$pb(%edi), %eax
	movl	%eax, -32(%ebp)         ## 4-byte Spill
	.p2align	4, 0x90
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	testl	-36(%ebp), %esi         ## 4-byte Folded Reload
	je	LBB1_5
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=1
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	-32(%ebp)               ## 4-byte Folded Reload
	jmp	LBB1_8
	.p2align	4, 0x90
LBB1_5:                                 ##   in Loop: Header=BB1_3 Depth=1
	testl	-28(%ebp), %esi         ## 4-byte Folded Reload
	je	LBB1_7
## BB#6:                                ##   in Loop: Header=BB1_3 Depth=1
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	-24(%ebp)               ## 4-byte Folded Reload
	jmp	LBB1_8
LBB1_7:                                 ##   in Loop: Header=BB1_3 Depth=1
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	-20(%ebp)               ## 4-byte Folded Reload
	.p2align	4, 0x90
LBB1_8:                                 ##   in Loop: Header=BB1_3 Depth=1
	calll	_fputs$UNIX2003
	addl	$16, %esp
	xorl	%ebx, %ebx
	cmpl	$-1, %eax
	setne	%bl
	addl	%edi, %ebx
	addl	%esi, %esi
	cmpl	$16777216, %esi         ## imm = 0x1000000
	jne	LBB1_3
## BB#9:
	subl	$8, %esp
	movl	-16(%ebp), %eax         ## 4-byte Reload
	leal	L_.str.6-L1$pb(%eax), %eax
	movl	8(%ebp), %esi
	pushl	%esi
	pushl	%eax
	calll	_fputs$UNIX2003
	addl	$16, %esp
	xorl	%ecx, %ecx
	cmpl	$-1, %eax
	setne	%cl
	addl	%ebx, %ecx
	cmpl	$25, %ecx
	jne	LBB1_10
## BB#11:
	subl	$12, %esp
	pushl	%esi
	calll	_fflush
	addl	$16, %esp
	movb	$1, %bl
	jmp	LBB1_12
LBB1_10:
	xorl	%ebx, %ebx
LBB1_12:
	movl	%ebx, %eax
	addl	$28, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB1_13:
	leal	L_.str.1-L1$pb(%edi), %eax
	leal	L_.str-L1$pb(%edi), %ecx
	leal	L___func__.serialize_state-L1$pb(%edi), %edx
	pushl	%eax
	pushl	$92
	pushl	%ecx
	pushl	%edx
	calll	___assert_rtn

	.globl	_deserialize_move
	.p2align	4, 0x90
_deserialize_move:                      ## @deserialize_move
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
	calll	L2$pb
L2$pb:
	popl	%eax
	leal	-15(%ebp), %ebx
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	leal	L_.str.7-L2$pb(%eax), %edi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
	pushl	%edi
	pushl	8(%ebp)
	calll	_fscanf
	addl	$16, %esp
	cmpl	$-1, %eax
	jne	LBB2_2
## BB#12:                               ##   in Loop: Header=BB2_1 Depth=1
	calll	___error
	cmpl	$4, (%eax)
	je	LBB2_1
	jmp	LBB2_13
LBB2_2:
	cmpl	$2, %eax
	jne	LBB2_13
## BB#3:
	cmpb	$10, -16(%ebp)
	movl	-20(%ebp), %edi         ## 4-byte Reload
	je	LBB2_5
## BB#4:
	movl	L___stderrp$non_lazy_ptr-L2$pb(%edi), %eax
	leal	L_.str.8-L2$pb(%edi), %ecx
	pushl	(%eax)
	pushl	$1
	pushl	$53
	pushl	%ecx
	calll	_fwrite$UNIX2003
	addl	$16, %esp
LBB2_5:
	movsbl	-15(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	calll	___toupper
	addl	$16, %esp
	movb	%al, -15(%ebp)
	movl	%eax, %ecx
	shll	$24, %ecx
	addl	$-1073741825, %ecx      ## imm = 0xBFFFFFFF
	xorl	%esi, %esi
	cmpl	$419430398, %ecx        ## imm = 0x18FFFFFE
	movl	$0, %edx
	ja	LBB2_7
## BB#6:
	addl	$-65, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
LBB2_7:
	movl	%edx, _deserialize_move.move-L2$pb(%edi)
	movsbl	-14(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	calll	___toupper
	addl	$16, %esp
	movb	%al, -14(%ebp)
	movl	%eax, %ecx
	shll	$24, %ecx
	addl	$-1073741825, %ecx      ## imm = 0xBFFFFFFF
	cmpl	$419430399, %ecx        ## imm = 0x18FFFFFF
	jae	LBB2_9
## BB#8:
	addl	$-65, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	shll	%cl, %esi
LBB2_9:
	movl	%esi, (_deserialize_move.move-L2$pb)+4(%edi)
	movsbl	-13(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	calll	___toupper
	addl	$16, %esp
	movb	%al, -13(%ebp)
	movl	%eax, %ecx
	shll	$24, %ecx
	addl	$-1073741825, %ecx      ## imm = 0xBFFFFFFF
	xorl	%edx, %edx
	cmpl	$419430398, %ecx        ## imm = 0x18FFFFFE
	ja	LBB2_11
## BB#10:
	addl	$-65, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
LBB2_11:
	movl	%edx, (_deserialize_move.move-L2$pb)+8(%edi)
	leal	_deserialize_move.move-L2$pb(%edi), %esi
LBB2_13:
	movl	%esi, %eax
	addl	$12, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl

	.globl	_dump_move
	.p2align	4, 0x90
_dump_move:                             ## @dump_move
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	calll	L3$pb
L3$pb:
	popl	%eax
	movl	8(%ebp), %esi
	movb	$32, (_dump_move.dump-L3$pb)+2(%eax)
	movw	$8224, _dump_move.dump-L3$pb(%eax) ## imm = 0x2020
	movl	(%esi), %ecx
	movl	4(%esi), %edx
	movl	8(%esi), %esi
	movl	$1, %edi
	movb	$65, %bl
	.p2align	4, 0x90
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	%edi, %ecx
	jne	LBB3_3
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	movb	%bl, _dump_move.dump-L3$pb(%eax)
LBB3_3:                                 ##   in Loop: Header=BB3_1 Depth=1
	cmpl	%edi, %edx
	jne	LBB3_5
## BB#4:                                ##   in Loop: Header=BB3_1 Depth=1
	movb	%bl, (_dump_move.dump-L3$pb)+1(%eax)
LBB3_5:                                 ##   in Loop: Header=BB3_1 Depth=1
	cmpl	%edi, %esi
	jne	LBB3_7
## BB#6:                                ##   in Loop: Header=BB3_1 Depth=1
	movb	%bl, (_dump_move.dump-L3$pb)+2(%eax)
LBB3_7:                                 ##   in Loop: Header=BB3_1 Depth=1
	addl	%edi, %edi
	incb	%bl
	cmpl	$16777216, %edi         ## imm = 0x1000000
	jb	LBB3_1
## BB#8:
	leal	_dump_move.dump-L3$pb(%eax), %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl

	.globl	_apply_move
	.p2align	4, 0x90
_apply_move:                            ## @apply_move
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$8, %esp
	movl	16(%ebp), %edi
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	(%edx,%esi,4), %eax
	testl	%eax, %eax
	movl	(%edi), %ebx
	je	LBB4_3
## BB#1:
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	jne	LBB4_36
## BB#2:
	decl	%eax
	movl	%eax, (%edx,%esi,4)
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	jmp	LBB4_10
LBB4_3:
	testl	%ebx, %ebx
	je	LBB4_35
## BB#4:
	movl	8(%edx,%esi,4), %ecx
	xorl	%eax, %eax
	testl	%ebx, %ecx
	je	LBB4_35
## BB#5:
	testl	%ecx, %ecx
	je	LBB4_9
## BB#6:
	movl	%edx, %edi
	xorl	%edx, %edx
	movl	%ecx, %eax
	.p2align	4, 0x90
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	leal	-1(%eax), %esi
	incl	%edx
	andl	%esi, %eax
	jne	LBB4_7
## BB#8:
	xorl	%eax, %eax
	cmpl	$3, %edx
	cmoval	%ebx, %eax
	movl	%edi, %edx
	movl	8(%ebp), %esi
	movl	16(%ebp), %edi
LBB4_9:
	xorl	%ebx, %ecx
	movl	%ecx, 8(%edx,%esi,4)
LBB4_10:
	movl	4(%edi), %edi
	testl	%edi, %edi
	je	LBB4_35
## BB#11:
	testl	8(%edx), %edi
	jne	LBB4_35
## BB#12:
	orl	12(%edx), %ebx
	testl	%edi, %ebx
	je	LBB4_13
LBB4_35:
	xorl	%ecx, %ecx
LBB4_36:
	movl	%ecx, %eax
	addl	$8, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB4_13:
	calll	L4$pb
L4$pb:
	popl	%ebx
	testl	%eax, %eax
	je	LBB4_20
## BB#14:
	orl	%edi, %eax
	movl	%eax, %esi
	movl	%ebx, -16(%ebp)         ## 4-byte Spill
	leal	_edges-L4$pb(%ebx), %ecx
	movl	$1, %edx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB4_15:                                ## =>This Inner Loop Header: Depth=1
	movl	%esi, %eax
	cmpl	(%ecx), %eax
	movb	$1, %al
	je	LBB4_17
## BB#16:                               ##   in Loop: Header=BB4_15 Depth=1
	movl	%ebx, %eax
LBB4_17:                                ##   in Loop: Header=BB4_15 Depth=1
	testb	$1, %al
	sete	%ah
	cmpl	$31, %edx
	ja	LBB4_19
## BB#18:                               ##   in Loop: Header=BB4_15 Depth=1
	addl	$4, %ecx
	incl	%edx
	testb	%ah, %ah
	movb	%al, %bl
	jne	LBB4_15
LBB4_19:
	testb	$1, %al
	movl	12(%ebp), %edx
	movl	-16(%ebp), %ebx         ## 4-byte Reload
	je	LBB4_35
LBB4_20:
	movl	8(%ebp), %eax
	movl	8(%edx,%eax,4), %ecx
	xorl	%edi, %ecx
	movl	%ecx, -16(%ebp)         ## 4-byte Spill
	movl	%ecx, 8(%edx,%eax,4)
	leal	_mills-L4$pb(%ebx), %ebx
	movl	$1, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB4_21:                                ## =>This Inner Loop Header: Depth=1
	movl	(%ebx), %eax
	testl	%eax, %edi
	je	LBB4_25
## BB#22:                               ##   in Loop: Header=BB4_21 Depth=1
	movl	-16(%ebp), %esi         ## 4-byte Reload
	andl	%eax, %esi
	cmpl	%eax, %esi
	movb	$1, %al
	je	LBB4_24
## BB#23:                               ##   in Loop: Header=BB4_21 Depth=1
	movl	%edx, %eax
LBB4_24:                                ##   in Loop: Header=BB4_21 Depth=1
	movb	%al, %dl
LBB4_25:                                ##   in Loop: Header=BB4_21 Depth=1
	testb	$1, %dl
	sete	%al
	cmpl	$15, %ecx
	ja	LBB4_27
## BB#26:                               ##   in Loop: Header=BB4_21 Depth=1
	addl	$4, %ebx
	incl	%ecx
	testb	%al, %al
	jne	LBB4_21
LBB4_27:
	testb	$1, %dl
	movl	16(%ebp), %eax
	movl	8(%eax), %edx
	je	LBB4_34
## BB#28:
	testl	%edx, %edx
	je	LBB4_33
## BB#29:
	xorl	%ecx, %ecx
	cmpl	$0, 8(%ebp)
	sete	%cl
	movl	12(%ebp), %eax
	movl	8(%eax,%ecx,4), %ebx
	testl	%edx, %ebx
	je	LBB4_35
## BB#30:
	movl	%ecx, -20(%ebp)         ## 4-byte Spill
	xorl	%ecx, %ecx
	movl	%ebx, %eax
	andl	$7, %eax
	cmpl	$7, %eax
	cmovnel	%ecx, %eax
	movl	%edx, -16(%ebp)         ## 4-byte Spill
	movl	%ebx, %esi
	andl	$8404996, %esi          ## imm = 0x804004
	cmpl	$8404996, %esi          ## imm = 0x804004
	cmovnel	%ecx, %esi
	orl	%eax, %esi
	movl	%ebx, %eax
	andl	$14680064, %eax         ## imm = 0xE00000
	cmpl	$14680064, %eax         ## imm = 0xE00000
	cmovnel	%ecx, %eax
	movl	%ebx, %edx
	andl	$2097665, %edx          ## imm = 0x200201
	cmpl	$2097665, %edx          ## imm = 0x200201
	cmovnel	%ecx, %edx
	orl	%eax, %edx
	orl	%esi, %edx
	movl	%ebx, %eax
	andl	$56, %eax
	cmpl	$56, %eax
	cmovnel	%ecx, %eax
	movl	%ebx, %esi
	andl	$1056800, %esi          ## imm = 0x102020
	cmpl	$1056800, %esi          ## imm = 0x102020
	cmovnel	%ecx, %esi
	orl	%eax, %esi
	movl	%ebx, %edi
	andl	$1835008, %edi          ## imm = 0x1C0000
	cmpl	$1835008, %edi          ## imm = 0x1C0000
	cmovnel	%ecx, %edi
	orl	%esi, %edi
	orl	%edx, %edi
	movl	%ebx, %eax
	andl	$263176, %eax           ## imm = 0x40408
	cmpl	$263176, %eax           ## imm = 0x40408
	cmovnel	%ecx, %eax
	movl	%ebx, %edx
	andl	$448, %edx              ## imm = 0x1C0
	cmpl	$448, %edx              ## imm = 0x1C0
	cmovnel	%ecx, %edx
	orl	%eax, %edx
	movl	%ebx, %eax
	andl	$135424, %eax           ## imm = 0x21100
	cmpl	$135424, %eax           ## imm = 0x21100
	cmovnel	%ecx, %eax
	orl	%edx, %eax
	movl	%ebx, %esi
	andl	$229376, %esi           ## imm = 0x38000
	cmpl	$229376, %esi           ## imm = 0x38000
	cmovnel	%ecx, %esi
	orl	%eax, %esi
	orl	%edi, %esi
	movl	%ebx, %eax
	andl	$34880, %eax            ## imm = 0x8840
	cmpl	$34880, %eax            ## imm = 0x8840
	cmovnel	%ecx, %eax
	movl	%ebx, %edx
	andl	$146, %edx
	cmpl	$146, %edx
	cmovnel	%ecx, %edx
	orl	%eax, %edx
	movl	%ebx, %eax
	andl	$3584, %eax             ## imm = 0xE00
	cmpl	$3584, %eax             ## imm = 0xE00
	cmovnel	%ecx, %eax
	orl	%edx, %eax
	movl	%ebx, %edx
	andl	$28672, %edx            ## imm = 0x7000
	cmpl	$28672, %edx            ## imm = 0x7000
	cmovnel	%ecx, %edx
	orl	%eax, %edx
	movl	%ebx, %eax
	andl	$4784128, %eax          ## imm = 0x490000
	cmpl	$4784128, %eax          ## imm = 0x490000
	cmovnel	%ecx, %eax
	orl	%edx, %eax
	movl	12(%ebp), %edx
	orl	%esi, %eax
	movl	-16(%ebp), %esi         ## 4-byte Reload
	cmpl	%eax, %ebx
	je	LBB4_32
## BB#31:
	andl	%esi, %eax
	jne	LBB4_36
LBB4_32:
	xorl	%esi, %ebx
	movl	-20(%ebp), %eax         ## 4-byte Reload
	movl	%ebx, 8(%edx,%eax,4)
	movl	$0, 20(%edx)
	jmp	LBB4_33
LBB4_34:
	testl	%edx, %edx
	jne	LBB4_35
LBB4_33:
	movb	$1, %cl
	jmp	LBB4_36

	.globl	_is_final_state
	.p2align	4, 0x90
_is_final_state:                        ## @is_final_state
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$44, %esp
	calll	L5$pb
L5$pb:
	popl	%edi
	movl	12(%ebp), %ebx
	movl	(%ebx), %esi
	movl	8(%ebx), %eax
	testl	%eax, %eax
	movl	%eax, -44(%ebp)         ## 4-byte Spill
	je	LBB5_3
## BB#1:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	leal	-1(%eax), %edx
	incl	%ecx
	andl	%edx, %eax
	jne	LBB5_2
	jmp	LBB5_4
LBB5_3:
	xorl	%ecx, %ecx
LBB5_4:
	movl	16(%ebp), %edx
	addl	%esi, %ecx
	movl	$1, %eax
	cmpl	$2, %ecx
	je	LBB5_9
## BB#5:
	movl	%esi, -20(%ebp)         ## 4-byte Spill
	movl	4(%ebx), %eax
	movl	%eax, -16(%ebp)         ## 4-byte Spill
	movl	12(%ebx), %ecx
	xorl	%eax, %eax
	movl	%ecx, -28(%ebp)         ## 4-byte Spill
	testl	%ecx, %ecx
	movl	$0, %ecx
	je	LBB5_8
## BB#6:
	xorl	%ecx, %ecx
	movl	-28(%ebp), %edx         ## 4-byte Reload
	.p2align	4, 0x90
LBB5_7:                                 ## =>This Inner Loop Header: Depth=1
	leal	-1(%edx), %esi
	incl	%ecx
	andl	%esi, %edx
	jne	LBB5_7
LBB5_8:
	movl	-16(%ebp), %esi         ## 4-byte Reload
	addl	%esi, %ecx
	cmpl	$2, %ecx
	movl	16(%ebp), %edx
	movl	-20(%ebp), %ecx         ## 4-byte Reload
	jne	LBB5_12
LBB5_9:
	movl	%eax, (%edx)
LBB5_10:
	movb	$1, %al
LBB5_11:
                                        ## kill: %AL<def> %AL<kill> %EAX<kill>
	addl	$44, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB5_12:
	movl	8(%ebp), %eax
	cmpl	$0, (%ebx,%eax,4)
	je	LBB5_23
LBB5_13:
	xorl	%eax, %eax
	addl	%esi, %ecx
	jne	LBB5_11
## BB#14:
	movl	20(%ebx), %esi
	testl	%esi, %esi
	movl	-44(%ebp), %edx         ## 4-byte Reload
	je	LBB5_20
## BB#15:
	movl	16(%ebx), %eax
	xorl	%ecx, %ecx
	movl	-28(%ebp), %edi         ## 4-byte Reload
	.p2align	4, 0x90
LBB5_16:                                ## =>This Inner Loop Header: Depth=1
	cmpl	%edx, (%eax,%ecx,8)
	jne	LBB5_18
## BB#17:                               ##   in Loop: Header=BB5_16 Depth=1
	cmpl	%edi, 4(%eax,%ecx,8)
	je	LBB5_43
LBB5_18:                                ##   in Loop: Header=BB5_16 Depth=1
	incl	%ecx
	cmpl	%esi, %ecx
	jb	LBB5_16
## BB#19:
	movl	%esi, %eax
LBB5_20:
	cmpl	24(%ebx), %eax
	jne	LBB5_41
## BB#21:
	addl	$4096, %eax             ## imm = 0x1000
	movl	%eax, 24(%ebx)
	subl	$8, %esp
	pushl	%eax
	pushl	16(%ebx)
	movl	%edx, %edi
	calll	_realloc
	movl	%edi, %edx
	addl	$16, %esp
	movl	%eax, 16(%ebx)
	testl	%eax, %eax
	jne	LBB5_42
## BB#22:
	calll	_abort
LBB5_23:
	movl	8(%ebx,%eax,4), %edx
	movl	%edx, -32(%ebp)         ## 4-byte Spill
	testl	%edx, %edx
	je	LBB5_13
## BB#24:
	xorl	%ecx, %ecx
	movl	-32(%ebp), %edx         ## 4-byte Reload
	.p2align	4, 0x90
LBB5_25:                                ## =>This Inner Loop Header: Depth=1
	leal	-1(%edx), %esi
	incl	%ecx
	andl	%esi, %edx
	jne	LBB5_25
## BB#26:
	cmpl	$4, %ecx
	movl	-20(%ebp), %ecx         ## 4-byte Reload
	movl	-16(%ebp), %esi         ## 4-byte Reload
	jb	LBB5_13
## BB#27:
	movl	%edi, -40(%ebp)         ## 4-byte Spill
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
	movl	%ecx, -24(%ebp)         ## 4-byte Spill
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB5_28:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_30 Depth 2
	movl	%ebx, %edi
	movl	-40(%ebp), %eax         ## 4-byte Reload
	movl	_edges-L5$pb(%eax,%esi,4), %ecx
	movl	-32(%ebp), %ebx         ## 4-byte Reload
	andl	%ecx, %ebx
	je	LBB5_33
## BB#29:                               ##   in Loop: Header=BB5_28 Depth=1
	movl	%edx, -36(%ebp)         ## 4-byte Spill
	movl	$1, %edx
	.p2align	4, 0x90
LBB5_30:                                ##   Parent Loop BB5_28 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	-1(%ebx), %eax
	decl	%edx
	andl	%eax, %ebx
	jne	LBB5_30
## BB#31:                               ##   in Loop: Header=BB5_28 Depth=1
	movl	%edi, %ebx
	testl	%edx, %edx
	je	LBB5_34
## BB#32:                               ##   in Loop: Header=BB5_28 Depth=1
	movl	-36(%ebp), %edx         ## 4-byte Reload
	jmp	LBB5_37
	.p2align	4, 0x90
LBB5_33:                                ##   in Loop: Header=BB5_28 Depth=1
	movl	%edi, %ebx
	jmp	LBB5_37
	.p2align	4, 0x90
LBB5_34:                                ##   in Loop: Header=BB5_28 Depth=1
	movl	-24(%ebp), %eax         ## 4-byte Reload
	testl	8(%ebx,%eax,4), %ecx
	movb	$1, %cl
	movl	-36(%ebp), %eax         ## 4-byte Reload
	je	LBB5_36
## BB#35:                               ##   in Loop: Header=BB5_28 Depth=1
	movl	%eax, %ecx
LBB5_36:                                ##   in Loop: Header=BB5_28 Depth=1
	movb	%cl, %dl
LBB5_37:                                ##   in Loop: Header=BB5_28 Depth=1
	incl	%esi
	testb	$1, %dl
	sete	%cl
	cmpl	$31, %esi
	ja	LBB5_39
## BB#38:                               ##   in Loop: Header=BB5_28 Depth=1
	testb	%cl, %cl
	jne	LBB5_28
LBB5_39:
	testb	$1, %dl
	movl	16(%ebp), %eax
	movl	-20(%ebp), %ecx         ## 4-byte Reload
	movl	-16(%ebp), %esi         ## 4-byte Reload
	jne	LBB5_13
## BB#40:
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	movl	%ecx, (%eax)
	jmp	LBB5_10
LBB5_41:
	movl	16(%ebx), %eax
LBB5_42:
	movl	%edx, (%eax,%esi,8)
	movl	12(%ebx), %ecx
	movl	%ecx, 4(%eax,%esi,8)
	incl	%esi
	movl	%esi, 20(%ebx)
	xorl	%eax, %eax
	jmp	LBB5_11
LBB5_43:
	movl	16(%ebp), %eax
	movl	$-1, (%eax)
	jmp	LBB5_10

.zerofill __DATA,__bss,_start_game.game,28,2 ## @start_game.game
	.section	__TEXT,__cstring,cstring_literals
L___func__.serialize_state:             ## @__func__.serialize_state
	.asciz	"serialize_state"

L_.str:                                 ## @.str
	.asciz	"mcp_state.c"

L_.str.1:                               ## @.str.1
	.asciz	"(game->board[0] & game->board[1]) == 0"

L_.str.2:                               ## @.str.2
	.asciz	"%u %u %u\n"

L_.str.3:                               ## @.str.3
	.asciz	"0"

L_.str.4:                               ## @.str.4
	.asciz	"1"

L_.str.5:                               ## @.str.5
	.asciz	"."

L_.str.6:                               ## @.str.6
	.asciz	"\n"

.zerofill __DATA,__bss,_deserialize_move.move,12,2 ## @deserialize_move.move
L_.str.7:                               ## @.str.7
	.asciz	"%3c%c"

L_.str.8:                               ## @.str.8
	.asciz	"[MCP] Move was not terminated by a newline character."

.zerofill __DATA,__bss,_dump_move.dump,4,0 ## @dump_move.dump
	.section	__TEXT,__const
	.p2align	2               ## @edges
_edges:
	.long	3                       ## 0x3
	.long	6                       ## 0x6
	.long	16388                   ## 0x4004
	.long	8404992                 ## 0x804000
	.long	12582912                ## 0xc00000
	.long	6291456                 ## 0x600000
	.long	2097664                 ## 0x200200
	.long	513                     ## 0x201
	.long	24                      ## 0x18
	.long	48                      ## 0x30
	.long	8224                    ## 0x2020
	.long	1056768                 ## 0x102000
	.long	1572864                 ## 0x180000
	.long	786432                  ## 0xc0000
	.long	263168                  ## 0x40400
	.long	1032                    ## 0x408
	.long	192                     ## 0xc0
	.long	384                     ## 0x180
	.long	4352                    ## 0x1100
	.long	135168                  ## 0x21000
	.long	196608                  ## 0x30000
	.long	98304                   ## 0x18000
	.long	34816                   ## 0x8800
	.long	2112                    ## 0x840
	.long	18                      ## 0x12
	.long	144                     ## 0x90
	.long	1536                    ## 0x600
	.long	3072                    ## 0xc00
	.long	12288                   ## 0x3000
	.long	24576                   ## 0x6000
	.long	589824                  ## 0x90000
	.long	4718592                 ## 0x480000

	.p2align	2               ## @mills
_mills:
	.long	7                       ## 0x7
	.long	8404996                 ## 0x804004
	.long	14680064                ## 0xe00000
	.long	2097665                 ## 0x200201
	.long	56                      ## 0x38
	.long	1056800                 ## 0x102020
	.long	1835008                 ## 0x1c0000
	.long	263176                  ## 0x40408
	.long	448                     ## 0x1c0
	.long	135424                  ## 0x21100
	.long	229376                  ## 0x38000
	.long	34880                   ## 0x8840
	.long	146                     ## 0x92
	.long	3584                    ## 0xe00
	.long	28672                   ## 0x7000
	.long	4784128                 ## 0x490000


	.section	__IMPORT,__pointers,non_lazy_symbol_pointers
L___stderrp$non_lazy_ptr:
	.indirect_symbol	___stderrp
	.long	0

.subsections_via_symbols
#endif
#ifdef __x86_64__
	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_start_game
	.p2align	4, 0x90
_start_game:                            ## @start_game
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	movabsq	$38654705673, %rax      ## imm = 0x900000009
	movq	%rax, _start_game.game(%rip)
	leaq	_start_game.game(%rip), %rax
	movq	$0, _start_game.game+24(%rip)
	movq	$0, _start_game.game+16(%rip)
	movq	$0, _start_game.game+8(%rip)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_serialize_state
	.p2align	4, 0x90
_serialize_state:                       ## @serialize_state
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi3:
	.cfi_def_cfa_offset 16
Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi6:
	.cfi_offset %rbx, -56
Lcfi7:
	.cfi_offset %r12, -48
Lcfi8:
	.cfi_offset %r13, -40
Lcfi9:
	.cfi_offset %r14, -32
Lcfi10:
	.cfi_offset %r15, -24
	movl	%esi, %r9d
	movq	%rdi, %r14
	movl	8(%rdx), %r15d
	movl	12(%rdx), %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	testl	%r15d, %eax
	jne	LBB1_13
## BB#1:
	movl	(%rdx), %ecx
	movl	4(%rdx), %r8d
	leaq	L_.str.2(%rip), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%r9d, %edx
	callq	_fprintf
	cmpl	$6, %eax
	jne	LBB1_12
## BB#2:
	movl	$1, %r13d
	.p2align	4, 0x90
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %r12d
	testl	%r13d, %r15d
	je	LBB1_5
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=1
	leaq	L_.str.3(%rip), %rdi
	jmp	LBB1_8
	.p2align	4, 0x90
LBB1_5:                                 ##   in Loop: Header=BB1_3 Depth=1
	testl	-44(%rbp), %r13d        ## 4-byte Folded Reload
	je	LBB1_7
## BB#6:                                ##   in Loop: Header=BB1_3 Depth=1
	leaq	L_.str.4(%rip), %rdi
	jmp	LBB1_8
LBB1_7:                                 ##   in Loop: Header=BB1_3 Depth=1
	leaq	L_.str.5(%rip), %rdi
	.p2align	4, 0x90
LBB1_8:                                 ##   in Loop: Header=BB1_3 Depth=1
	movq	%r14, %rsi
	callq	_fputs
	xorl	%ebx, %ebx
	cmpl	$-1, %eax
	setne	%bl
	addl	%r12d, %ebx
	addl	%r13d, %r13d
	cmpl	$16777216, %r13d        ## imm = 0x1000000
	jne	LBB1_3
## BB#9:
	leaq	L_.str.6(%rip), %rdi
	movq	%r14, %rsi
	callq	_fputs
	xorl	%ecx, %ecx
	cmpl	$-1, %eax
	setne	%cl
	addl	%ebx, %ecx
	cmpl	$25, %ecx
	jne	LBB1_10
## BB#11:
	movq	%r14, %rdi
	callq	_fflush
	movb	$1, %bl
	jmp	LBB1_12
LBB1_10:
	xorl	%ebx, %ebx
LBB1_12:
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_13:
	leaq	L___func__.serialize_state(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	leaq	L_.str.1(%rip), %rcx
	movl	$92, %edx
	callq	___assert_rtn
	.cfi_endproc

	.globl	_deserialize_move
	.p2align	4, 0x90
_deserialize_move:                      ## @deserialize_move
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi11:
	.cfi_def_cfa_offset 16
Lcfi12:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi13:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi14:
	.cfi_offset %rbx, -56
Lcfi15:
	.cfi_offset %r12, -48
Lcfi16:
	.cfi_offset %r13, -40
Lcfi17:
	.cfi_offset %r14, -32
Lcfi18:
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	leaq	L_.str.7(%rip), %r15
	xorl	%r14d, %r14d
	leaq	-43(%rbp), %r12
	leaq	-44(%rbp), %r13
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	_fscanf
	cmpl	$-1, %eax
	jne	LBB2_2
## BB#12:                               ##   in Loop: Header=BB2_1 Depth=1
	callq	___error
	cmpl	$4, (%rax)
	je	LBB2_1
	jmp	LBB2_13
LBB2_2:
	cmpl	$2, %eax
	jne	LBB2_13
## BB#3:
	cmpb	$10, -44(%rbp)
	je	LBB2_5
## BB#4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.8(%rip), %rdi
	movl	$53, %esi
	movl	$1, %edx
	callq	_fwrite
LBB2_5:
	movsbl	-43(%rbp), %edi
	callq	___toupper
	movb	%al, -43(%rbp)
	movl	%eax, %ecx
	shll	$24, %ecx
	addl	$-1073741825, %ecx      ## imm = 0xBFFFFFFF
	xorl	%ebx, %ebx
	cmpl	$419430398, %ecx        ## imm = 0x18FFFFFE
	movl	$0, %edx
	ja	LBB2_7
## BB#6:
	addl	$-65, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
LBB2_7:
	movl	%edx, _deserialize_move.move(%rip)
	movsbl	-42(%rbp), %edi
	callq	___toupper
	movb	%al, -42(%rbp)
	movl	%eax, %ecx
	shll	$24, %ecx
	addl	$-1073741825, %ecx      ## imm = 0xBFFFFFFF
	cmpl	$419430399, %ecx        ## imm = 0x18FFFFFF
	jae	LBB2_9
## BB#8:
	addl	$-65, %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	shll	%cl, %ebx
LBB2_9:
	movl	%ebx, _deserialize_move.move+4(%rip)
	movsbl	-41(%rbp), %edi
	callq	___toupper
	movb	%al, -41(%rbp)
	movl	%eax, %ecx
	shll	$24, %ecx
	addl	$-1073741825, %ecx      ## imm = 0xBFFFFFFF
	xorl	%edx, %edx
	cmpl	$419430398, %ecx        ## imm = 0x18FFFFFE
	ja	LBB2_11
## BB#10:
	addl	$-65, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
LBB2_11:
	movl	%edx, _deserialize_move.move+8(%rip)
	leaq	_deserialize_move.move(%rip), %r14
LBB2_13:
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_dump_move
	.p2align	4, 0x90
_dump_move:                             ## @dump_move
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi19:
	.cfi_def_cfa_offset 16
Lcfi20:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi21:
	.cfi_def_cfa_register %rbp
	movb	$32, _dump_move.dump+2(%rip)
	movw	$8224, _dump_move.dump(%rip) ## imm = 0x2020
	movl	(%rdi), %r8d
	movl	4(%rdi), %ecx
	movl	8(%rdi), %edx
	movl	$1, %esi
	movb	$65, %al
	.p2align	4, 0x90
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	%esi, %r8d
	jne	LBB3_3
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	movb	%al, _dump_move.dump(%rip)
LBB3_3:                                 ##   in Loop: Header=BB3_1 Depth=1
	cmpl	%esi, %ecx
	jne	LBB3_5
## BB#4:                                ##   in Loop: Header=BB3_1 Depth=1
	movb	%al, _dump_move.dump+1(%rip)
LBB3_5:                                 ##   in Loop: Header=BB3_1 Depth=1
	cmpl	%esi, %edx
	jne	LBB3_7
## BB#6:                                ##   in Loop: Header=BB3_1 Depth=1
	movb	%al, _dump_move.dump+2(%rip)
LBB3_7:                                 ##   in Loop: Header=BB3_1 Depth=1
	addl	%esi, %esi
	incb	%al
	cmpl	$16777216, %esi         ## imm = 0x1000000
	jb	LBB3_1
## BB#8:
	leaq	_dump_move.dump(%rip), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_apply_move
	.p2align	4, 0x90
_apply_move:                            ## @apply_move
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi22:
	.cfi_def_cfa_offset 16
Lcfi23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi24:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
Lcfi25:
	.cfi_offset %rbx, -24
	movl	%edi, %r9d
	movl	(%rsi,%r9,4), %ebx
	testl	%ebx, %ebx
	movl	(%rdx), %r10d
	je	LBB4_3
## BB#1:
	xorl	%eax, %eax
	testl	%r10d, %r10d
	jne	LBB4_36
## BB#2:
	decl	%ebx
	movl	%ebx, (%rsi,%r9,4)
	xorl	%r10d, %r10d
	jmp	LBB4_10
LBB4_3:
	testl	%r10d, %r10d
	je	LBB4_35
## BB#4:
	movl	8(%rsi,%r9,4), %r8d
	xorl	%eax, %eax
	testl	%r10d, %r8d
	je	LBB4_36
## BB#5:
	testl	%r8d, %r8d
	je	LBB4_9
## BB#6:
	xorl	%ebx, %ebx
	movl	%r8d, %eax
	.p2align	4, 0x90
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	leal	-1(%rax), %ecx
	incl	%ebx
	andl	%ecx, %eax
	jne	LBB4_7
## BB#8:
	xorl	%eax, %eax
	cmpl	$3, %ebx
	cmoval	%r10d, %eax
LBB4_9:
	xorl	%r10d, %r8d
	movl	%r8d, 8(%rsi,%r9,4)
LBB4_10:
	movl	4(%rdx), %r8d
	testl	%r8d, %r8d
	je	LBB4_35
## BB#11:
	testl	8(%rsi), %r8d
	jne	LBB4_35
## BB#12:
	orl	12(%rsi), %r10d
	testl	%r8d, %r10d
	je	LBB4_13
LBB4_35:
	xorl	%eax, %eax
LBB4_36:
                                        ## kill: %AL<def> %AL<kill> %EAX<kill>
	popq	%rbx
	popq	%rbp
	retq
LBB4_13:
	testl	%eax, %eax
	je	LBB4_20
## BB#14:
	orl	%r8d, %eax
	leaq	_edges(%rip), %r10
	xorl	%ebx, %ebx
	movl	$1, %ecx
	.p2align	4, 0x90
LBB4_15:                                ## =>This Inner Loop Header: Depth=1
	cmpl	(%r10), %eax
	movb	$1, %r11b
	je	LBB4_17
## BB#16:                               ##   in Loop: Header=BB4_15 Depth=1
	movl	%ebx, %r11d
LBB4_17:                                ##   in Loop: Header=BB4_15 Depth=1
	testb	$1, %r11b
	sete	%bl
	cmpq	$31, %rcx
	ja	LBB4_19
## BB#18:                               ##   in Loop: Header=BB4_15 Depth=1
	addq	$4, %r10
	incq	%rcx
	testb	%bl, %bl
	movb	%r11b, %bl
	jne	LBB4_15
LBB4_19:
	testb	$1, %r11b
	je	LBB4_35
LBB4_20:
	movl	8(%rsi,%r9,4), %r10d
	xorl	%r8d, %r10d
	movl	%r10d, 8(%rsi,%r9,4)
	leaq	_mills(%rip), %r11
	xorl	%r9d, %r9d
	movl	$1, %eax
	.p2align	4, 0x90
LBB4_21:                                ## =>This Inner Loop Header: Depth=1
	movl	(%r11), %ebx
	testl	%ebx, %r8d
	je	LBB4_25
## BB#22:                               ##   in Loop: Header=BB4_21 Depth=1
	movl	%r10d, %ecx
	andl	%ebx, %ecx
	cmpl	%ebx, %ecx
	movb	$1, %bl
	je	LBB4_24
## BB#23:                               ##   in Loop: Header=BB4_21 Depth=1
	movl	%r9d, %ebx
LBB4_24:                                ##   in Loop: Header=BB4_21 Depth=1
	movb	%bl, %r9b
LBB4_25:                                ##   in Loop: Header=BB4_21 Depth=1
	testb	$1, %r9b
	sete	%bl
	cmpq	$15, %rax
	ja	LBB4_27
## BB#26:                               ##   in Loop: Header=BB4_21 Depth=1
	addq	$4, %r11
	incq	%rax
	testb	%bl, %bl
	jne	LBB4_21
LBB4_27:
	testb	$1, %r9b
	movl	8(%rdx), %r9d
	je	LBB4_34
## BB#28:
	testl	%r9d, %r9d
	je	LBB4_33
## BB#29:
	xorl	%r8d, %r8d
	testl	%edi, %edi
	sete	%r8b
	movl	8(%rsi,%r8,4), %r10d
	xorl	%eax, %eax
	testl	%r9d, %r10d
	je	LBB4_36
## BB#30:
	movl	%r10d, %edx
	andl	$7, %edx
	cmpl	$7, %edx
	cmovnel	%eax, %edx
	movl	%r10d, %edi
	andl	$8404996, %edi          ## imm = 0x804004
	cmpl	$8404996, %edi          ## imm = 0x804004
	cmovnel	%eax, %edi
	orl	%edx, %edi
	movl	%r10d, %edx
	andl	$14680064, %edx         ## imm = 0xE00000
	cmpl	$14680064, %edx         ## imm = 0xE00000
	cmovnel	%eax, %edx
	movl	%r10d, %ecx
	andl	$2097665, %ecx          ## imm = 0x200201
	cmpl	$2097665, %ecx          ## imm = 0x200201
	cmovnel	%eax, %ecx
	orl	%edx, %ecx
	orl	%edi, %ecx
	movl	%r10d, %edx
	andl	$56, %edx
	cmpl	$56, %edx
	cmovnel	%eax, %edx
	movl	%r10d, %edi
	andl	$1056800, %edi          ## imm = 0x102020
	cmpl	$1056800, %edi          ## imm = 0x102020
	cmovnel	%eax, %edi
	orl	%edx, %edi
	movl	%r10d, %edx
	andl	$1835008, %edx          ## imm = 0x1C0000
	cmpl	$1835008, %edx          ## imm = 0x1C0000
	cmovnel	%eax, %edx
	orl	%edi, %edx
	orl	%ecx, %edx
	movl	%r10d, %ecx
	andl	$263176, %ecx           ## imm = 0x40408
	cmpl	$263176, %ecx           ## imm = 0x40408
	cmovnel	%eax, %ecx
	movl	%r10d, %edi
	andl	$448, %edi              ## imm = 0x1C0
	cmpl	$448, %edi              ## imm = 0x1C0
	cmovnel	%eax, %edi
	orl	%ecx, %edi
	movl	%r10d, %ecx
	andl	$135424, %ecx           ## imm = 0x21100
	cmpl	$135424, %ecx           ## imm = 0x21100
	cmovnel	%eax, %ecx
	orl	%edi, %ecx
	movl	%r10d, %edi
	andl	$229376, %edi           ## imm = 0x38000
	cmpl	$229376, %edi           ## imm = 0x38000
	cmovnel	%eax, %edi
	orl	%ecx, %edi
	orl	%edx, %edi
	movl	%r10d, %ecx
	andl	$34880, %ecx            ## imm = 0x8840
	cmpl	$34880, %ecx            ## imm = 0x8840
	cmovnel	%eax, %ecx
	movl	%r10d, %edx
	andl	$146, %edx
	cmpl	$146, %edx
	cmovnel	%eax, %edx
	orl	%ecx, %edx
	movl	%r10d, %ecx
	andl	$3584, %ecx             ## imm = 0xE00
	cmpl	$3584, %ecx             ## imm = 0xE00
	cmovnel	%eax, %ecx
	orl	%edx, %ecx
	movl	%r10d, %ebx
	andl	$28672, %ebx            ## imm = 0x7000
	cmpl	$28672, %ebx            ## imm = 0x7000
	cmovnel	%eax, %ebx
	orl	%ecx, %ebx
	movl	%r10d, %edx
	andl	$4784128, %edx          ## imm = 0x490000
	cmpl	$4784128, %edx          ## imm = 0x490000
	cmovnel	%eax, %edx
	orl	%ebx, %edx
	orl	%edi, %edx
	cmpl	%edx, %r10d
	je	LBB4_32
## BB#31:
	andl	%r9d, %edx
	jne	LBB4_36
LBB4_32:
	xorl	%r9d, %r10d
	movl	%r10d, 8(%rsi,%r8,4)
	movl	$0, 24(%rsi)
	jmp	LBB4_33
LBB4_34:
	testl	%r9d, %r9d
	jne	LBB4_35
LBB4_33:
	movb	$1, %al
	jmp	LBB4_36
	.cfi_endproc

	.globl	_is_final_state
	.p2align	4, 0x90
_is_final_state:                        ## @is_final_state
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi26:
	.cfi_def_cfa_offset 16
Lcfi27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi28:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi29:
	.cfi_offset %rbx, -56
Lcfi30:
	.cfi_offset %r12, -48
Lcfi31:
	.cfi_offset %r13, -40
Lcfi32:
	.cfi_offset %r14, -32
Lcfi33:
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movl	(%r15), %r13d
	movl	8(%r15), %r14d
	xorl	%esi, %esi
	testl	%r14d, %r14d
	je	LBB5_3
## BB#1:
	movl	%r14d, %eax
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	leal	-1(%rax), %ecx
	incl	%esi
	andl	%ecx, %eax
	jne	LBB5_2
LBB5_3:
	addl	%r13d, %esi
	movl	$1, %eax
	cmpl	$2, %esi
	je	LBB5_8
## BB#4:
	movl	4(%r15), %r8d
	movl	12(%r15), %r12d
	xorl	%eax, %eax
	testl	%r12d, %r12d
	movl	$0, %esi
	je	LBB5_7
## BB#5:
	xorl	%esi, %esi
	movl	%r12d, %ecx
	.p2align	4, 0x90
LBB5_6:                                 ## =>This Inner Loop Header: Depth=1
	leal	-1(%rcx), %ebx
	incl	%esi
	andl	%ebx, %ecx
	jne	LBB5_6
LBB5_7:
	addl	%r8d, %esi
	cmpl	$2, %esi
	jne	LBB5_11
LBB5_8:
	movl	%eax, (%rdx)
LBB5_9:
	movb	$1, %al
LBB5_10:
                                        ## kill: %AL<def> %AL<kill> %RAX<kill>
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_11:
	movl	%edi, %eax
	cmpl	$0, (%r15,%rax,4)
	je	LBB5_22
LBB5_12:
	xorl	%eax, %eax
	addl	%r8d, %r13d
	jne	LBB5_10
## BB#13:
	movl	24(%r15), %ebx
	testq	%rbx, %rbx
	je	LBB5_19
## BB#14:
	movq	16(%r15), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB5_15:                                ## =>This Inner Loop Header: Depth=1
	cmpl	%r14d, (%rax,%rcx,8)
	jne	LBB5_17
## BB#16:                               ##   in Loop: Header=BB5_15 Depth=1
	cmpl	%r12d, 4(%rax,%rcx,8)
	je	LBB5_40
LBB5_17:                                ##   in Loop: Header=BB5_15 Depth=1
	incq	%rcx
	cmpq	%rbx, %rcx
	jb	LBB5_15
## BB#18:
	movl	%ebx, %eax
LBB5_19:
	cmpl	28(%r15), %eax
	jne	LBB5_38
## BB#20:
	addl	$4096, %eax             ## imm = 0x1000
	movl	%eax, 28(%r15)
	movq	16(%r15), %rdi
	movq	%rax, %rsi
	callq	_realloc
	movq	%rax, 16(%r15)
	testq	%rax, %rax
	jne	LBB5_39
## BB#21:
	callq	_abort
LBB5_22:
	movl	8(%r15,%rax,4), %r10d
	testl	%r10d, %r10d
	je	LBB5_12
## BB#23:
	xorl	%eax, %eax
	movl	%r10d, %ecx
	.p2align	4, 0x90
LBB5_24:                                ## =>This Inner Loop Header: Depth=1
	leal	-1(%rcx), %esi
	incl	%eax
	andl	%esi, %ecx
	jne	LBB5_24
## BB#25:
	cmpl	$4, %eax
	jb	LBB5_12
## BB#26:
	xorl	%eax, %eax
	testl	%edi, %edi
	sete	%al
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB5_27:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_29 Depth 2
	leaq	_edges(%rip), %rcx
	movl	(%rcx,%rax,4), %esi
	movl	%r10d, %ecx
	andl	%esi, %ecx
	je	LBB5_34
## BB#28:                               ##   in Loop: Header=BB5_27 Depth=1
	movl	$1, %r9d
	.p2align	4, 0x90
LBB5_29:                                ##   Parent Loop BB5_27 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	-1(%rcx), %r11d
	decl	%r9d
	andl	%r11d, %ecx
	jne	LBB5_29
## BB#30:                               ##   in Loop: Header=BB5_27 Depth=1
	testl	%r9d, %r9d
	jne	LBB5_34
## BB#31:                               ##   in Loop: Header=BB5_27 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	8(%r15,%rcx,4), %esi
	movb	$1, %cl
	je	LBB5_33
## BB#32:                               ##   in Loop: Header=BB5_27 Depth=1
	movl	%ebx, %ecx
LBB5_33:                                ##   in Loop: Header=BB5_27 Depth=1
	movb	%cl, %bl
LBB5_34:                                ##   in Loop: Header=BB5_27 Depth=1
	incq	%rax
	testb	$1, %bl
	sete	%cl
	cmpq	$31, %rax
	ja	LBB5_36
## BB#35:                               ##   in Loop: Header=BB5_27 Depth=1
	testb	%cl, %cl
	jne	LBB5_27
LBB5_36:
	testb	$1, %bl
	jne	LBB5_12
## BB#37:
	xorl	%eax, %eax
	testl	%edi, %edi
	sete	%al
	jmp	LBB5_8
LBB5_38:
	movq	16(%r15), %rax
LBB5_39:
	movl	%r14d, (%rax,%rbx,8)
	movl	12(%r15), %ecx
	movl	24(%r15), %edx
	movl	%ecx, 4(%rax,%rdx,8)
	leal	1(%rdx), %eax
	movl	%eax, 24(%r15)
	xorl	%eax, %eax
	jmp	LBB5_10
LBB5_40:
	movl	$-1, (%rdx)
	jmp	LBB5_9
	.cfi_endproc

.zerofill __DATA,__bss,_start_game.game,32,3 ## @start_game.game
	.section	__TEXT,__cstring,cstring_literals
L___func__.serialize_state:             ## @__func__.serialize_state
	.asciz	"serialize_state"

L_.str:                                 ## @.str
	.asciz	"mcp_state.c"

L_.str.1:                               ## @.str.1
	.asciz	"(game->board[0] & game->board[1]) == 0"

L_.str.2:                               ## @.str.2
	.asciz	"%u %u %u\n"

L_.str.3:                               ## @.str.3
	.asciz	"0"

L_.str.4:                               ## @.str.4
	.asciz	"1"

L_.str.5:                               ## @.str.5
	.asciz	"."

L_.str.6:                               ## @.str.6
	.asciz	"\n"

.zerofill __DATA,__bss,_deserialize_move.move,12,2 ## @deserialize_move.move
L_.str.7:                               ## @.str.7
	.asciz	"%3c%c"

L_.str.8:                               ## @.str.8
	.asciz	"[MCP] Move was not terminated by a newline character."

.zerofill __DATA,__bss,_dump_move.dump,4,0 ## @dump_move.dump
	.section	__TEXT,__const
	.p2align	4               ## @edges
_edges:
	.long	3                       ## 0x3
	.long	6                       ## 0x6
	.long	16388                   ## 0x4004
	.long	8404992                 ## 0x804000
	.long	12582912                ## 0xc00000
	.long	6291456                 ## 0x600000
	.long	2097664                 ## 0x200200
	.long	513                     ## 0x201
	.long	24                      ## 0x18
	.long	48                      ## 0x30
	.long	8224                    ## 0x2020
	.long	1056768                 ## 0x102000
	.long	1572864                 ## 0x180000
	.long	786432                  ## 0xc0000
	.long	263168                  ## 0x40400
	.long	1032                    ## 0x408
	.long	192                     ## 0xc0
	.long	384                     ## 0x180
	.long	4352                    ## 0x1100
	.long	135168                  ## 0x21000
	.long	196608                  ## 0x30000
	.long	98304                   ## 0x18000
	.long	34816                   ## 0x8800
	.long	2112                    ## 0x840
	.long	18                      ## 0x12
	.long	144                     ## 0x90
	.long	1536                    ## 0x600
	.long	3072                    ## 0xc00
	.long	12288                   ## 0x3000
	.long	24576                   ## 0x6000
	.long	589824                  ## 0x90000
	.long	4718592                 ## 0x480000

	.p2align	4               ## @mills
_mills:
	.long	7                       ## 0x7
	.long	8404996                 ## 0x804004
	.long	14680064                ## 0xe00000
	.long	2097665                 ## 0x200201
	.long	56                      ## 0x38
	.long	1056800                 ## 0x102020
	.long	1835008                 ## 0x1c0000
	.long	263176                  ## 0x40408
	.long	448                     ## 0x1c0
	.long	135424                  ## 0x21100
	.long	229376                  ## 0x38000
	.long	34880                   ## 0x8840
	.long	146                     ## 0x92
	.long	3584                    ## 0xe00
	.long	28672                   ## 0x7000
	.long	4784128                 ## 0x490000


.subsections_via_symbols
#endif
#endif
#ifdef __WIN32__
#ifdef __i386__
	.file	"mcp_state.c"
	.text
	.p2align 4,,15
	.def	_fprintf;	.scl	3;	.type	32;	.endef
_fprintf:
	subl	$28, %esp
	leal	40(%esp), %eax
	movl	%eax, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	___mingw_vfprintf
	addl	$28, %esp
	ret
	.section .rdata,"dr"
LC0:
	.ascii "%3c%c\0"
	.text
	.p2align 4,,15
	.def	_fscanf.constprop.0;	.scl	3;	.type	32;	.endef
_fscanf.constprop.0:
	subl	$28, %esp
	leal	40(%esp), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, 8(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	___mingw_vfscanf
	addl	$28, %esp
	ret
	.p2align 4,,15
	.globl	_start_game
	.def	_start_game;	.scl	2;	.type	32;	.endef
_start_game:
	movl	$9, _game.3672
	movl	$_game.3672, %eax
	movl	$9, _game.3672+4
	movl	$0, _game.3672+8
	movl	$0, _game.3672+12
	movl	$0, _game.3672+16
	movl	$0, _game.3672+20
	movl	$0, _game.3672+24
	ret
	.section .rdata,"dr"
LC1:
	.ascii "mcp_state.c\0"
	.align 4
LC2:
	.ascii "(game->board[0] & game->board[1]) == 0\0"
LC3:
	.ascii "%u %u %u\12\0"
LC4:
	.ascii "0\0"
LC5:
	.ascii "1\0"
LC6:
	.ascii ".\0"
LC7:
	.ascii "\12\0"
	.text
	.p2align 4,,15
	.globl	_serialize_state
	.def	_serialize_state;	.scl	2;	.type	32;	.endef
_serialize_state:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	72(%esp), %ebp
	movl	8(%ebp), %eax
	testl	%eax, 12(%ebp)
	jne	L22
L7:
	movl	4(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	0(%ebp), %eax
	movl	$LC3, 4(%esp)
	movl	%eax, 12(%esp)
	movl	68(%esp), %eax
	movl	%eax, 8(%esp)
	movl	64(%esp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	cmpl	$6, %eax
	je	L8
L14:
	xorl	%eax, %eax
L6:
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,10
L8:
	movl	$24, %esi
	xorl	%edi, %edi
	movl	$1, %ebx
	jmp	L13
	.p2align 4,,10
L25:
	movl	$LC5, (%esp)
L20:
	call	_fputs
	cmpl	$-1, %eax
	setne	%al
	addl	%ebx, %ebx
	movzbl	%al, %eax
	addl	%eax, %edi
	subl	$1, %esi
	je	L23
L13:
	movl	64(%esp), %eax
	testl	%ebx, 8(%ebp)
	jne	L24
	testl	%ebx, 12(%ebp)
	movl	%eax, 4(%esp)
	jne	L25
	movl	$LC6, (%esp)
	jmp	L20
	.p2align 4,,10
L24:
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	jmp	L20
	.p2align 4,,10
L23:
	movl	64(%esp), %eax
	movl	$LC7, (%esp)
	movl	%eax, 4(%esp)
	call	_fputs
	cmpl	$-1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %edi
	cmpl	$25, %edi
	jne	L14
	movl	64(%esp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$1, %eax
	jmp	L6
	.p2align 4,,10
L22:
	movl	$92, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	__assert
	jmp	L7
	.section .rdata,"dr"
	.align 4
LC8:
	.ascii "[MCP] Move was not terminated by a newline character.\0"
	.text
	.p2align 4,,15
	.globl	_deserialize_move
	.def	_deserialize_move;	.scl	2;	.type	32;	.endef
_deserialize_move:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	__imp___errno, %ebp
	movl	64(%esp), %edi
	leal	28(%esp), %esi
	leal	29(%esp), %ebx
	jmp	L28
	.p2align 4,,10
L40:
	call	*%ebp
	cmpl	$4, (%eax)
	jne	L30
L28:
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	%edi, (%esp)
	call	_fscanf.constprop.0
	cmpl	$-1, %eax
	je	L40
	cmpl	$2, %eax
	jne	L30
	cmpb	$10, 28(%esp)
	je	L31
	movl	__imp___iob, %eax
	movl	$LC8, 4(%esp)
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_fprintf
L31:
	movsbl	29(%esp), %eax
	movl	__imp__toupper, %ebx
	movl	%eax, (%esp)
	call	*%ebx
	movl	$1, %edx
	leal	-65(%eax), %esi
	movb	%al, 29(%esp)
	movl	$0, %eax
	movl	%esi, %ecx
	sall	%cl, %edx
	cmpb	$23, %cl
	cmova	%eax, %edx
	movsbl	30(%esp), %eax
	movl	%edx, _move.3686
	movl	%eax, (%esp)
	call	*%ebx
	movl	$1, %edx
	leal	-65(%eax), %esi
	movb	%al, 30(%esp)
	movl	$0, %eax
	movl	%esi, %ecx
	sall	%cl, %edx
	cmpb	$23, %cl
	cmova	%eax, %edx
	movsbl	31(%esp), %eax
	movl	%edx, _move.3686+4
	movl	%eax, (%esp)
	call	*%ebx
	movl	$1, %edx
	leal	-65(%eax), %ebx
	movl	$0, %eax
	movl	%ebx, %ecx
	sall	%cl, %edx
	cmpb	$23, %bl
	cmova	%eax, %edx
	movl	$_move.3686, %eax
	movl	%edx, _move.3686+8
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,10
L30:
	addl	$44, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,15
	.globl	_dump_move
	.def	_dump_move;	.scl	2;	.type	32;	.endef
_dump_move:
	pushl	%ebp
	movl	$65, %edx
	movl	$32, %ebp
	pushl	%edi
	xorl	%edi, %edi
	pushl	%esi
	pushl	%ebx
	subl	$4, %esp
	movb	$32, _dump.3699+2
	movl	24(%esp), %eax
	movb	$32, _dump.3699+1
	movb	$32, _dump.3699
	movb	$0, 3(%esp)
	movb	$32, 2(%esp)
	movl	(%eax), %esi
	movb	$0, 1(%esp)
	movl	4(%eax), %ebx
	movb	$32, (%esp)
	movl	8(%eax), %ecx
	movl	$1, %eax
	jmp	L45
	.p2align 4,,10
L42:
	cmpl	%eax, %ebx
	je	L63
L43:
	cmpl	%eax, %ecx
	je	L64
L44:
	addl	$1, %edx
	addl	%eax, %eax
	cmpb	$89, %dl
	je	L65
L45:
	cmpl	%eax, %esi
	jne	L42
	movl	%edx, %ebp
	movl	$1, %edi
	cmpl	%eax, %ebx
	jne	L43
L63:
	movb	%dl, (%esp)
	movb	$1, 1(%esp)
	cmpl	%eax, %ecx
	jne	L44
L64:
	movb	%dl, 2(%esp)
	addl	$1, %edx
	addl	%eax, %eax
	movb	$1, 3(%esp)
	cmpb	$89, %dl
	jne	L45
L65:
	movl	%edi, %eax
	testb	%al, %al
	jne	L66
L46:
	cmpb	$0, 1(%esp)
	je	L47
	movzbl	(%esp), %eax
	movb	%al, _dump.3699+1
L47:
	cmpb	$0, 3(%esp)
	je	L48
	movzbl	2(%esp), %eax
	movb	%al, _dump.3699+2
L48:
	addl	$4, %esp
	movl	$_dump.3699, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L66:
	movl	%ebp, %eax
	movb	%al, _dump.3699
	jmp	L46
	.p2align 4,,15
	.globl	_apply_move
	.def	_apply_move;	.scl	2;	.type	32;	.endef
_apply_move:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	28(%esp), %eax
	movl	(%ecx), %edx
	testl	%edx, %edx
	je	L68
	movl	(%eax), %esi
	testl	%esi, %esi
	jne	L72
	subl	$1, %edx
	xorl	%esi, %esi
	xorl	%eax, %eax
	movl	%edx, (%ecx)
L71:
	movl	28(%esp), %edi
	movl	4(%edi), %ebx
	testl	%ebx, %ebx
	je	L72
	movl	24(%esp), %edi
	testl	%ebx, 8(%edi)
	jne	L72
	orl	12(%edi), %esi
	testl	%ebx, %esi
	jne	L72
	testl	%eax, %eax
	je	L75
	orl	%ebx, %eax
	xorl	%edx, %edx
	movl	%ecx, %ebp
	movl	%eax, %edi
	.p2align 4,,10
L76:
	movl	_edges(,%edx,4), %esi
	addl	$1, %edx
	cmpl	$31, %edx
	setbe	%cl
	cmpl	%esi, %edi
	sete	%al
	cmpb	%al, %cl
	ja	L76
	movl	%ebp, %ecx
	cmpl	%esi, %edi
	jne	L72
L75:
	movl	8(%ecx), %esi
	xorl	%edx, %edx
	movl	%ebx, %ebp
	xorl	%ebx, %esi
	movl	%esi, 8(%ecx)
	xorl	%ecx, %ecx
	.p2align 4,,10
L77:
	movl	_mills(,%edx,4), %edi
	movl	%esi, %eax
	andl	%edi, %eax
	cmpl	%edi, %eax
	sete	%al
	testl	%edi, %ebp
	cmove	%ecx, %eax
	addl	$1, %edx
	cmpl	$15, %edx
	setbe	%bl
	cmpb	%bl, %al
	jb	L77
	testb	%al, %al
	je	L78
	movl	28(%esp), %esi
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	je	L79
	movl	20(%esp), %ebx
	xorl	%edx, %edx
	movl	24(%esp), %esi
	testl	%ebx, %ebx
	sete	%dl
	leal	(%esi,%edx,4), %ebp
	movl	8(%ebp), %edx
	testl	%edx, %ecx
	je	L72
	movl	%edx, %ebx
	movl	$7, %esi
	movl	%edx, %edi
	andl	$7, %ebx
	cmpl	$7, %ebx
	movl	$0, %ebx
	cmovne	%ebx, %esi
	andl	$8404996, %edi
	movl	%esi, %ebx
	orl	$8404996, %ebx
	cmpl	$8404996, %edi
	movl	%edx, %edi
	cmovne	%esi, %ebx
	andl	$14680064, %edi
	movl	%ebx, %esi
	orl	$14680064, %esi
	cmpl	$14680064, %edi
	movl	%edx, %edi
	cmove	%esi, %ebx
	andl	$2097665, %edi
	movl	%ebx, %esi
	orl	$2097665, %esi
	cmpl	$2097665, %edi
	movl	%edx, %edi
	cmovne	%ebx, %esi
	andl	$56, %edi
	movl	%esi, %ebx
	orl	$56, %ebx
	cmpl	$56, %edi
	movl	%edx, %edi
	cmove	%ebx, %esi
	andl	$1056800, %edi
	movl	%esi, %ebx
	orl	$1056800, %ebx
	cmpl	$1056800, %edi
	movl	%edx, %edi
	cmovne	%esi, %ebx
	andl	$1835008, %edi
	movl	%ebx, %esi
	orl	$1835008, %esi
	cmpl	$1835008, %edi
	movl	%edx, %edi
	cmovne	%ebx, %esi
	andl	$263176, %edi
	movl	%esi, %ebx
	orl	$263176, %ebx
	cmpl	$263176, %edi
	movl	%edx, %edi
	cmove	%ebx, %esi
	andl	$448, %edi
	movl	%esi, %ebx
	orl	$448, %ebx
	cmpl	$448, %edi
	movl	%edx, %edi
	cmovne	%esi, %ebx
	andl	$135424, %edi
	movl	%ebx, %esi
	orl	$135424, %esi
	cmpl	$135424, %edi
	movl	%edx, %edi
	cmovne	%ebx, %esi
	andl	$229376, %edi
	movl	%esi, %ebx
	orl	$229376, %ebx
	cmpl	$229376, %edi
	movl	%edx, %edi
	cmove	%ebx, %esi
	andl	$34880, %edi
	movl	%esi, %ebx
	orl	$34880, %ebx
	cmpl	$34880, %edi
	movl	%edx, %edi
	cmovne	%esi, %ebx
	andl	$146, %edi
	movl	%ebx, %esi
	orl	$146, %esi
	cmpl	$146, %edi
	movl	%edx, %edi
	cmovne	%ebx, %esi
	andl	$3584, %edi
	movl	%esi, %ebx
	orb	$14, %bh
	cmpl	$3584, %edi
	movl	%edx, %edi
	cmove	%ebx, %esi
	andl	$28672, %edi
	movl	%esi, %ebx
	orb	$112, %bh
	cmpl	$28672, %edi
	movl	%edx, %edi
	cmovne	%esi, %ebx
	andl	$4784128, %edi
	movl	%ebx, %esi
	orl	$4784128, %esi
	cmpl	$4784128, %edi
	cmove	%esi, %ebx
	cmpl	%edx, %ebx
	je	L80
	testl	%ecx, %ebx
	jne	L72
L80:
	movl	24(%esp), %esi
	xorl	%ecx, %edx
	movl	%edx, 8(%ebp)
	movl	$0, 20(%esi)
	jmp	L67
	.p2align 4,,10
L68:
	movl	(%eax), %esi
	testl	%esi, %esi
	jne	L103
L72:
	xorl	%eax, %eax
L67:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,10
L103:
	movl	8(%ecx), %edi
	testl	%edi, %esi
	je	L72
	movl	%edi, %eax
	.p2align 4,,10
L73:
	leal	-1(%eax), %ebx
	addl	$1, %edx
	andl	%ebx, %eax
	jne	L73
	cmpl	$4, %edx
	cmovnb	%esi, %eax
	xorl	%esi, %edi
	movl	%edi, 8(%ecx)
	jmp	L71
	.p2align 4,,10
L78:
	movl	28(%esp), %eax
	movl	8(%eax), %ecx
L79:
	testl	%ecx, %ecx
	sete	%al
	jmp	L67
	.p2align 4,,15
	.globl	_is_final_state
	.def	_is_final_state;	.scl	2;	.type	32;	.endef
_is_final_state:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$28, %esp
	movl	52(%esp), %edi
L109:
	movl	8(%edi,%ebx,4), %eax
	xorl	%ecx, %ecx
	movl	(%edi,%ebx,4), %esi
	testl	%eax, %eax
	je	L105
	.p2align 4,,10
L106:
	leal	-1(%eax), %edx
	addl	$1, %ecx
	andl	%edx, %eax
	jne	L106
L105:
	addl	%esi, %ecx
	cmpl	$2, %ecx
	je	L135
	addl	$1, %ebx
	cmpl	$2, %ebx
	jne	L109
	movl	48(%esp), %eax
	leal	(%edi,%eax,4), %eax
	movl	(%eax), %ebx
	testl	%ebx, %ebx
	jne	L110
	movl	8(%eax), %ebp
	testl	%ebp, %ebp
	je	L110
	xorl	%ecx, %ecx
	movl	%ebp, %eax
	.p2align 4,,10
L111:
	leal	-1(%eax), %edx
	addl	$1, %ecx
	andl	%edx, %eax
	jne	L111
	cmpl	$3, %ecx
	jbe	L110
	xorl	%ebx, %ebx
	.p2align 4,,10
L114:
	movl	_edges(,%ebx,4), %esi
	movl	%ebp, %eax
	andl	%esi, %eax
	je	L122
	xorl	%ecx, %ecx
	.p2align 4,,10
L113:
	leal	-1(%eax), %edx
	addl	$1, %ecx
	andl	%edx, %eax
	jne	L113
	xorl	%eax, %eax
	cmpl	$1, %ecx
	je	L136
L112:
	addl	$1, %ebx
	cmpl	$31, %ebx
	setbe	%dl
	cmpb	%dl, %al
	jb	L114
	testb	%al, %al
	je	L137
	.p2align 4,,10
L110:
	movl	4(%edi), %eax
	addl	(%edi), %eax
	jne	L124
	movl	20(%edi), %ecx
	xorl	%eax, %eax
	movl	16(%edi), %edx
	testl	%ecx, %ecx
	je	L116
	movl	8(%edi), %ebx
	xorl	%eax, %eax
	jmp	L118
	.p2align 4,,10
L117:
	addl	$1, %eax
	cmpl	%ecx, %eax
	je	L138
L118:
	cmpl	%ebx, (%edx,%eax,8)
	jne	L117
	movl	12(%edi), %esi
	cmpl	%esi, 4(%edx,%eax,8)
	jne	L117
	movl	56(%esp), %eax
	movl	$-1, (%eax)
	addl	$28, %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L138:
	movl	%ecx, %eax
L116:
	cmpl	%eax, 24(%edi)
	je	L139
L119:
	leal	(%edx,%ecx,8), %eax
	movl	8(%edi), %edx
	addl	$1, %ecx
	movl	%edx, (%eax)
	movl	12(%edi), %edx
	movl	%edx, 4(%eax)
	xorl	%eax, %eax
	movl	%ecx, 20(%edi)
L104:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,10
L136:
	movl	48(%esp), %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
	testl	%esi, 8(%edi,%eax,4)
	sete	%al
	jmp	L112
L122:
	xorl	%eax, %eax
	jmp	L112
L124:
	addl	$28, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L137:
	movl	48(%esp), %edx
	xorl	%eax, %eax
	movl	56(%esp), %edi
	testl	%edx, %edx
	sete	%al
	movl	%eax, (%edi)
	movl	$1, %eax
	jmp	L104
L135:
	movl	56(%esp), %eax
	xorl	$1, %ebx
	movl	%ebx, (%eax)
	movl	$1, %eax
	jmp	L104
L139:
	addl	$4096, %eax
	movl	%eax, 24(%edi)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_realloc
	movl	%eax, 16(%edi)
	testl	%eax, %eax
	je	L120
	movl	20(%edi), %ecx
	movl	%eax, %edx
	jmp	L119
L120:
	call	_abort
.lcomm _dump.3699,4,4
.lcomm _move.3686,12,4
.lcomm _game.3672,28,4
	.section .rdata,"dr"
	.align 32
_mills:
	.long	7
	.long	8404996
	.long	14680064
	.long	2097665
	.long	56
	.long	1056800
	.long	1835008
	.long	263176
	.long	448
	.long	135424
	.long	229376
	.long	34880
	.long	146
	.long	3584
	.long	28672
	.long	4784128
	.align 32
_edges:
	.long	3
	.long	6
	.long	16388
	.long	8404992
	.long	12582912
	.long	6291456
	.long	2097664
	.long	513
	.long	24
	.long	48
	.long	8224
	.long	1056768
	.long	1572864
	.long	786432
	.long	263168
	.long	1032
	.long	192
	.long	384
	.long	4352
	.long	135168
	.long	196608
	.long	98304
	.long	34816
	.long	2112
	.long	18
	.long	144
	.long	1536
	.long	3072
	.long	12288
	.long	24576
	.long	589824
	.long	4718592
	.ident	"GCC: (GNU) 6.2.0"
	.def	___mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	___mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	_fputs;	.scl	2;	.type	32;	.endef
	.def	_fflush;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_realloc;	.scl	2;	.type	32;	.endef
	.def	_abort;	.scl	2;	.type	32;	.endef
#endif
#ifdef __x86_64__
	.file	"mcp_state.c"
	.text
	.p2align 4,,15
	.def	fprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	fprintf
fprintf:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%r8, 80(%rsp)
	leaq	80(%rsp), %r8
	movq	%r9, 88(%rsp)
	movq	%r8, 40(%rsp)
	call	__mingw_vfprintf
	addq	$56, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%3c%c\0"
	.text
	.p2align 4,,15
	.def	fscanf.constprop.0;	.scl	3;	.type	32;	.endef
	.seh_proc	fscanf.constprop.0
fscanf.constprop.0:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	.LC0(%rip), %rdx
	movq	%r8, 80(%rsp)
	leaq	80(%rsp), %r8
	movq	%r9, 88(%rsp)
	movq	%r8, 40(%rsp)
	call	__mingw_vfscanf
	addq	$56, %rsp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	start_game
	.def	start_game;	.scl	2;	.type	32;	.endef
	.seh_proc	start_game
start_game:
	.seh_endprologue
	leaq	game.4011(%rip), %rax
	movdqa	.LC1(%rip), %xmm0
	movq	$0, 16+game.4011(%rip)
	movl	$0, 24+game.4011(%rip)
	movaps	%xmm0, game.4011(%rip)
	movl	$0, 28+game.4011(%rip)
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "mcp_state.c\0"
	.align 8
.LC3:
	.ascii "(game->board[0] & game->board[1]) == 0\0"
.LC4:
	.ascii "%u %u %u\12\0"
.LC5:
	.ascii "0\0"
.LC6:
	.ascii "1\0"
.LC7:
	.ascii ".\0"
.LC8:
	.ascii "\12\0"
	.text
	.p2align 4,,15
	.globl	serialize_state
	.def	serialize_state;	.scl	2;	.type	32;	.endef
	.seh_proc	serialize_state
serialize_state:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movl	8(%r8), %eax
	testl	%eax, 12(%r8)
	movq	%rcx, %r12
	movl	%edx, %ebx
	movq	%r8, %rdi
	jne	.L19
.L5:
	movl	4(%rdi), %eax
	movl	%ebx, %r8d
	movq	%r12, %rcx
	movl	(%rdi), %r9d
	leaq	.LC4(%rip), %rdx
	movl	%eax, 32(%rsp)
	call	fprintf
	cmpl	$6, %eax
	je	.L6
.L12:
	xorl	%eax, %eax
.L4:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L6:
	movl	$24, %esi
	xorl	%ebp, %ebp
	movl	$1, %ebx
	leaq	.LC7(%rip), %r14
	leaq	.LC6(%rip), %r13
	leaq	.LC5(%rip), %r15
	.p2align 4,,10
.L11:
	testl	%ebx, 8(%rdi)
	movq	%r12, %rdx
	movq	%r15, %rcx
	jne	.L17
	testl	%ebx, 12(%rdi)
	movq	%r13, %rcx
	jne	.L17
	movq	%r14, %rcx
.L17:
	call	fputs
	cmpl	$-1, %eax
	setne	%al
	addl	%ebx, %ebx
	movzbl	%al, %eax
	addl	%eax, %ebp
	subl	$1, %esi
	jne	.L11
	leaq	.LC8(%rip), %rcx
	movq	%r12, %rdx
	call	fputs
	cmpl	$-1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %ebp
	cmpl	$25, %ebp
	jne	.L12
	movq	%r12, %rcx
	call	fflush
	movl	$1, %eax
	jmp	.L4
	.p2align 4,,10
.L19:
	leaq	.LC2(%rip), %rdx
	movl	$92, %r8d
	leaq	.LC3(%rip), %rcx
	call	_assert
	jmp	.L5
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[MCP] Move was not terminated by a newline character.\0"
	.text
	.p2align 4,,15
	.globl	deserialize_move
	.def	deserialize_move;	.scl	2;	.type	32;	.endef
	.seh_proc	deserialize_move
deserialize_move:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	.LC0(%rip), %rbx
	movq	__imp__errno(%rip), %r12
	leaq	47(%rsp), %rdi
	movq	%rcx, %rbp
	leaq	48(%rsp), %rsi
	jmp	.L22
	.p2align 4,,10
.L33:
	call	*%r12
	cmpl	$4, (%rax)
	jne	.L24
.L22:
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	call	fscanf.constprop.0
	cmpl	$-1, %eax
	je	.L33
	cmpl	$2, %eax
	jne	.L24
	cmpb	$10, 47(%rsp)
	je	.L25
	call	*__imp___iob_func(%rip)
	leaq	.LC9(%rip), %rdx
	leaq	96(%rax), %rcx
	call	fprintf
.L25:
	movsbl	48(%rsp), %ecx
	movq	__imp_toupper(%rip), %rbx
	call	*%rbx
	xorl	%edx, %edx
	leal	-65(%rax), %ecx
	movb	%al, 48(%rsp)
	cmpb	$23, %cl
	ja	.L26
	movl	$1, %edx
	sall	%cl, %edx
.L26:
	movsbl	49(%rsp), %ecx
	movl	%edx, move.4025(%rip)
	call	*%rbx
	xorl	%edx, %edx
	leal	-65(%rax), %ecx
	movb	%al, 49(%rsp)
	cmpb	$23, %cl
	ja	.L27
	movl	$1, %edx
	sall	%cl, %edx
.L27:
	movl	%edx, 4+move.4025(%rip)
	movsbl	50(%rsp), %ecx
	call	*%rbx
	xorl	%edx, %edx
	leal	-65(%rax), %ecx
	cmpb	$23, %cl
	jbe	.L34
.L28:
	leaq	move.4025(%rip), %rax
	movl	%edx, 8+move.4025(%rip)
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L34:
	movl	$1, %edx
	sall	%cl, %edx
	jmp	.L28
	.p2align 4,,10
.L24:
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	dump_move
	.def	dump_move;	.scl	2;	.type	32;	.endef
	.seh_proc	dump_move
dump_move:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movb	$32, 2+dump.4038(%rip)
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movb	$32, 1+dump.4038(%rip)
	movl	$32, %r11d
	movl	$32, %esi
	xorl	%r10d, %r10d
	movl	(%rcx), %r9d
	movl	$32, %ebp
	movl	$65, %edx
	movb	$32, dump.4038(%rip)
	movl	4(%rcx), %r8d
	movl	$1, %eax
	movl	8(%rcx), %ecx
	jmp	.L39
	.p2align 4,,10
.L36:
	cmpl	%eax, %r8d
	je	.L56
.L37:
	cmpl	%eax, %ecx
	je	.L57
.L38:
	addl	$1, %edx
	addl	%eax, %eax
	cmpb	$89, %dl
	je	.L58
.L39:
	cmpl	%eax, %r9d
	jne	.L36
	cmpl	%eax, %r8d
	movl	%edx, %ebp
	movl	$1, %r10d
	jne	.L37
.L56:
	cmpl	%eax, %ecx
	movl	%edx, %esi
	movl	$1, %edi
	jne	.L38
.L57:
	movl	%edx, %r11d
	addl	$1, %edx
	addl	%eax, %eax
	cmpb	$89, %dl
	movl	$1, %ebx
	jne	.L39
.L58:
	testb	%r10b, %r10b
	jne	.L59
.L40:
	testb	%dil, %dil
	je	.L41
	movb	%sil, 1+dump.4038(%rip)
.L41:
	testb	%bl, %bl
	je	.L42
	movb	%r11b, 2+dump.4038(%rip)
.L42:
	leaq	dump.4038(%rip), %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L59:
	movb	%bpl, dump.4038(%rip)
	jmp	.L40
	.seh_endproc
	.p2align 4,,15
	.globl	apply_move
	.def	apply_move;	.scl	2;	.type	32;	.endef
	.seh_proc	apply_move
apply_move:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movl	%ecx, %eax
	leaq	(%rdx,%rax,4), %r11
	movl	(%r11), %r9d
	testl	%r9d, %r9d
	je	.L61
	movl	(%r8), %eax
	testl	%eax, %eax
	jne	.L65
	subl	$1, %r9d
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	movl	%r9d, (%r11)
.L64:
	movl	4(%r8), %esi
	testl	%esi, %esi
	je	.L65
	testl	%esi, 8(%rdx)
	jne	.L65
	orl	12(%rdx), %ebx
	testl	%esi, %ebx
	jne	.L65
	testl	%eax, %eax
	je	.L68
	leaq	edges(%rip), %rbp
	orl	%esi, %eax
	xorl	%r9d, %r9d
	.p2align 4,,10
.L69:
	movl	0(%rbp,%r9,4), %r10d
	addq	$1, %r9
	cmpq	$31, %r9
	setbe	%dil
	cmpl	%r10d, %eax
	sete	%bl
	cmpb	%bl, %dil
	ja	.L69
	cmpl	%r10d, %eax
	jne	.L65
.L68:
	movl	8(%r11), %ebx
	leaq	mills(%rip), %rdi
	xorl	%r9d, %r9d
	xorl	%esi, %ebx
	movl	%ebx, 8(%r11)
	xorl	%r11d, %r11d
	.p2align 4,,10
.L70:
	movl	(%rdi,%r9,4), %r10d
	movl	%ebx, %eax
	andl	%r10d, %eax
	cmpl	%r10d, %eax
	sete	%al
	testl	%r10d, %esi
	cmove	%r11d, %eax
	addq	$1, %r9
	cmpq	$15, %r9
	setbe	%r10b
	cmpb	%r10b, %al
	jb	.L70
	testb	%al, %al
	movl	8(%r8), %r9d
	je	.L72
	testl	%r9d, %r9d
	je	.L72
	testl	%ecx, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	leaq	(%rdx,%rcx,4), %r10
	movl	8(%r10), %r8d
	testl	%r8d, %r9d
	je	.L65
	movl	%r8d, %ecx
	movl	$0, %r11d
	movl	%r8d, %ebx
	andl	$7, %ecx
	cmpl	$7, %ecx
	movl	$7, %ecx
	cmovne	%r11d, %ecx
	andl	$8404996, %ebx
	movl	%ecx, %r11d
	orl	$8404996, %r11d
	cmpl	$8404996, %ebx
	movl	%r8d, %ebx
	cmovne	%ecx, %r11d
	andl	$14680064, %ebx
	movl	%r11d, %ecx
	orl	$14680064, %ecx
	cmpl	$14680064, %ebx
	movl	%r8d, %ebx
	cmovne	%r11d, %ecx
	andl	$2097665, %ebx
	movl	%ecx, %r11d
	orl	$2097665, %r11d
	cmpl	$2097665, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$56, %ebx
	movl	%ecx, %r11d
	orl	$56, %r11d
	cmpl	$56, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$1056800, %ebx
	movl	%ecx, %r11d
	orl	$1056800, %r11d
	cmpl	$1056800, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$1835008, %ebx
	movl	%ecx, %r11d
	orl	$1835008, %r11d
	cmpl	$1835008, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$263176, %ebx
	movl	%ecx, %r11d
	orl	$263176, %r11d
	cmpl	$263176, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$448, %ebx
	movl	%ecx, %r11d
	orl	$448, %r11d
	cmpl	$448, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$135424, %ebx
	movl	%ecx, %r11d
	orl	$135424, %r11d
	cmpl	$135424, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$229376, %ebx
	movl	%ecx, %r11d
	orl	$229376, %r11d
	cmpl	$229376, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$34880, %ebx
	movl	%ecx, %r11d
	orl	$34880, %r11d
	cmpl	$34880, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$146, %ebx
	movl	%ecx, %r11d
	orb	$-110, %r11b
	cmpl	$146, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$3584, %ebx
	movl	%ecx, %r11d
	orl	$3584, %r11d
	cmpl	$3584, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$28672, %ebx
	movl	%ecx, %r11d
	orl	$28672, %r11d
	cmpl	$28672, %ebx
	movl	%r8d, %ebx
	cmove	%r11d, %ecx
	andl	$4784128, %ebx
	movl	%ecx, %r11d
	orl	$4784128, %r11d
	cmpl	$4784128, %ebx
	cmove	%r11d, %ecx
	cmpl	%r8d, %ecx
	je	.L73
	testl	%r9d, %ecx
	jne	.L65
.L73:
	xorl	%r9d, %r8d
	movl	%r8d, 8(%r10)
	movl	$0, 24(%rdx)
	jmp	.L60
	.p2align 4,,10
.L61:
	movl	(%r8), %ebx
	testl	%ebx, %ebx
	jne	.L95
.L65:
	xorl	%eax, %eax
.L60:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L95:
	movl	8(%r11), %esi
	testl	%esi, %ebx
	je	.L65
	movl	%esi, %eax
	.p2align 4,,10
.L66:
	leal	-1(%rax), %r10d
	addl	$1, %r9d
	andl	%r10d, %eax
	jne	.L66
	cmpl	$4, %r9d
	cmovnb	%ebx, %eax
	xorl	%ebx, %esi
	movl	%esi, 8(%r11)
	jmp	.L64
	.p2align 4,,10
.L72:
	testl	%r9d, %r9d
	sete	%al
	jmp	.L60
	.seh_endproc
	.p2align 4,,15
	.globl	is_final_state
	.def	is_final_state;	.scl	2;	.type	32;	.endef
	.seh_proc	is_final_state
is_final_state:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	xorl	%r10d, %r10d
	movq	%rdx, %rbx
.L101:
	movl	8(%rbx,%r10,4), %eax
	xorl	%r9d, %r9d
	movl	(%rbx,%r10,4), %r11d
	testl	%eax, %eax
	je	.L97
	.p2align 4,,10
.L98:
	leal	-1(%rax), %edx
	addl	$1, %r9d
	andl	%edx, %eax
	jne	.L98
.L97:
	addl	%r11d, %r9d
	cmpl	$2, %r9d
	je	.L126
	addq	$1, %r10
	cmpq	$2, %r10
	jne	.L101
	movl	%ecx, %eax
	leaq	(%rbx,%rax,4), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	jne	.L102
	movl	8(%rax), %esi
	testl	%esi, %esi
	je	.L102
	xorl	%r9d, %r9d
	movl	%esi, %eax
	.p2align 4,,10
.L103:
	leal	-1(%rax), %edx
	addl	$1, %r9d
	andl	%edx, %eax
	jne	.L103
	cmpl	$3, %r9d
	jbe	.L102
	leaq	edges(%rip), %rdi
	xorl	%r10d, %r10d
	.p2align 4,,10
.L106:
	movl	(%rdi,%r10,4), %r11d
	movl	%esi, %eax
	andl	%r11d, %eax
	je	.L114
	xorl	%r9d, %r9d
	.p2align 4,,10
.L105:
	leal	-1(%rax), %edx
	addl	$1, %r9d
	andl	%edx, %eax
	jne	.L105
	xorl	%eax, %eax
	cmpl	$1, %r9d
	je	.L127
.L104:
	addq	$1, %r10
	cmpq	$31, %r10
	setbe	%dl
	cmpb	%dl, %al
	jb	.L106
	testb	%al, %al
	je	.L128
	.p2align 4,,10
.L102:
	movl	4(%rbx), %eax
	addl	(%rbx), %eax
	jne	.L116
	movl	24(%rbx), %edx
	movq	16(%rbx), %rcx
	testq	%rdx, %rdx
	movq	%rdx, %r10
	je	.L108
	movl	8(%rbx), %r9d
	xorl	%eax, %eax
	jmp	.L110
	.p2align 4,,10
.L109:
	addq	$1, %rax
	cmpq	%rax, %rdx
	je	.L108
.L110:
	cmpl	%r9d, (%rcx,%rax,8)
	jne	.L109
	movl	12(%rbx), %edi
	cmpl	%edi, 4(%rcx,%rax,8)
	jne	.L109
	movl	$1, %eax
	movl	$-1, (%r8)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L108:
	cmpl	%r10d, 28(%rbx)
	je	.L129
.L111:
	leaq	(%rcx,%rdx,8), %rax
	movl	8(%rbx), %edx
	addl	$1, %r10d
	movl	%edx, (%rax)
	movl	12(%rbx), %edx
	movl	%edx, 4(%rax)
	xorl	%eax, %eax
	movl	%r10d, 24(%rbx)
.L96:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L127:
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
	testl	%r11d, 8(%rbx,%rax,4)
	sete	%al
	jmp	.L104
.L114:
	xorl	%eax, %eax
	jmp	.L104
.L116:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L128:
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
	movl	%eax, (%r8)
	movl	$1, %eax
	jmp	.L96
.L126:
	xorq	$1, %r10
	movl	$1, %eax
	movl	%r10d, (%r8)
	jmp	.L96
.L129:
	leal	4096(%r10), %edx
	movl	%edx, 28(%rbx)
	call	realloc
	testq	%rax, %rax
	movq	%rax, 16(%rbx)
	je	.L112
	movl	24(%rbx), %edx
	movq	%rax, %rcx
	movq	%rdx, %r10
	jmp	.L111
.L112:
	call	abort
	nop
	.seh_endproc
.lcomm dump.4038,4,1
.lcomm move.4025,12,8
.lcomm game.4011,32,32
	.section .rdata,"dr"
	.align 32
mills:
	.long	7
	.long	8404996
	.long	14680064
	.long	2097665
	.long	56
	.long	1056800
	.long	1835008
	.long	263176
	.long	448
	.long	135424
	.long	229376
	.long	34880
	.long	146
	.long	3584
	.long	28672
	.long	4784128
	.align 32
edges:
	.long	3
	.long	6
	.long	16388
	.long	8404992
	.long	12582912
	.long	6291456
	.long	2097664
	.long	513
	.long	24
	.long	48
	.long	8224
	.long	1056768
	.long	1572864
	.long	786432
	.long	263168
	.long	1032
	.long	192
	.long	384
	.long	4352
	.long	135168
	.long	196608
	.long	98304
	.long	34816
	.long	2112
	.long	18
	.long	144
	.long	1536
	.long	3072
	.long	12288
	.long	24576
	.long	589824
	.long	4718592
	.align 16
.LC1:
	.long	9
	.long	9
	.long	0
	.long	0
	.ident	"GCC: (GNU) 6.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	_assert;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	abort;	.scl	2;	.type	32;	.endef
#endif
#endif
