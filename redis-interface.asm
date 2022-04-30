%include "/usr/local/share/csc314/asm_io.inc"

segment .data
	interface	db	"1) Set Value",10,"2) Get Value",10,"3) Delete All",10,"0) Quit",10,0
	
	scanf_fmt	db	"%s",0
	printf_key	db	"Enter the key: ",0
	printf_value	db	"Enter the value: ",0
	
	redis	db	"/usr/bin/redis-cli",0
	rset	db	"set",0
	rget	db	"get",0

	argv_get	dd	redis,rget,key,0
	argv_set	dd	redis,rset,key,value,0

segment .bss
	key	resb	100
	value	resb	100

segment .text
	global  asm_main
	extern	printf
	extern	scanf

asm_main:
	push	ebp
	mov	ebp, esp
	; ********** CODE STARTS HERE **********

	do:
	mov	eax, interface
	call	print_string
	call	read_int

	cmp	eax, 0
	je	done
	cmp	eax, 1
	je	call_set
	cmp	eax, 2
	je	call_get
	jmp	do

	call_set:
	call	setter
	jmp	do

	call_get:
	call	getter
	jmp	do

	done:
	
	; *********** CODE ENDS HERE ***********
	mov	eax, 0
	mov	esp, ebp
	pop	ebp
	ret

set_key:
	push	ebp
	mov	ebp, esp

	mov	eax, printf_key
	push	eax
	call	printf
	add	esp, 4

	mov	ebx, scanf_fmt
	lea	eax, BYTE[key]
	push	eax
	push	ebx
	call	scanf
	add	esp, 8

	mov	esp, ebp
	pop	ebp
	ret

set_value:
	push	ebp
	mov	ebp, esp

	mov	eax, printf_value
	push	eax
	call	printf
	add	esp, 4

	mov	ebx, scanf_fmt
	lea	eax, BYTE[value]
	push	eax
	push	ebx
	call	scanf
	add	esp, 8

	mov	esp, ebp
	pop	ebp
	ret

setter:
	push	ebp
	mov	ebp, esp
	
	call	set_key
	call	set_value

	mov	eax, 11
	mov	ebx, redis
	lea	ecx, [argv_set]
	xor	edx, edx
	int	0x80

	mov	esp, ebp
	pop	ebp
	ret

getter:
	push	ebp
	mov	ebp, esp

	call	set_key

	mov	eax, 11
	mov	ebx, redis
	lea	ecx, [argv_get]
	xor	edx, edx
	int	0x80

	mov	esp, ebp
	pop	ebp
	ret
