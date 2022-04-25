%include "/usr/local/share/csc314/asm_io.inc"


segment .data
	get	db	"Enter the key:",10,0
	set1	db	"Enter the key:",10,0
	set2	db	"Enter the value:",10,0
	input1	db	"/usr/bin/users",0
	output1	db	"--help",0
	out2	dd	output1,0
segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov	ebp, esp
	; ********** CODE STARTS HERE **********
	mov	eax, 11
	mov	ebx, input1
	lea	ecx, DWORD[out2]
	mov	edx, 0
	int	0x80

	; *********** CODE ENDS HERE ***********
	mov	eax, 0
	mov	esp, ebp
	pop	ebp
	ret

setter: 
	push	ebp
	mov	ebp, esp
	
;	mov	eax, 11
;	mov	ebx, 1
;	lea	ecx, someStr
	

	mov	esp, ebp
	pop	ebp
	ret
getter:
	push	ebp
	mov	ebp, esp

	mov	esp, ebp
	pop	ebp
	ret
