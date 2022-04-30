%include "/usr/local/share/csc314/asm_io.inc"


segment .data
	scanf_fmt	db	"%s",0
	printf_key	db	"Enter the key: ",0
	printf_value	db	"Enter the value: ",0
	
	redis	db	"/usr/bin/redis-cli",0
	rset	db	"set",0
	rget	db	"get",0

	argv_get	dd	redis,rget,key,0
	argv_set	dd	redis,rset,key,value,0

segment .bss
	key	db	100
	value	db	100

segment .text
	global  asm_main
	extern	printf
	extern	scanf

asm_main:
	push	ebp
	mov	ebp, esp
	; ********** CODE STARTS HERE **********

	call	setter

	; *********** CODE ENDS HERE ***********
	mov	eax, 0
	mov	esp, ebp
	pop	ebp
	ret
getter:
	push	ebp
	mov	ebp, esp

	mov	esi, printf_key
	push	esi
	call	printf
	add	esp, 4

	mov	edi, scanf_fmt
	lea	esi, BYTE[key]
	push	esi
	push	edi
	call	scanf
	add	esp, 8

	mov	eax, 11
	mov	ebx, redis
	lea	ecx, argv_get
	mov	edx, 0
	int	0x80

	mov	esp, ebp
	pop	ebp
	ret

setter:
	push	ebp
	mov	ebp, esp

	mov	esi, printf_key
	push	esi
	call	printf
	add	esp, 4

	mov	edi, scanf_fmt
	lea	esi, BYTE[key]
	push	esi
	push	edi
	call	scanf
	pop	edi
	pop	esi
	add	esp, 8

	mov	esi, printf_value
	push	esi
	call	printf
	add	esp, 4

	mov	edi, scanf_fmt
	lea	esi, BYTE[value]
	push	esi
	push	edi
	call	scanf
	add	esp, 8

	mov	eax, 11
	mov	ebx, redis
	lea	ecx, argv_set
	mov	edx, 0
	int	0x80

	mov	esp, ebp
	pop	ebp
	ret
