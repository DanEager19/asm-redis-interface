%include "/usr/local/share/csc314/asm_io.inc"


segment .data
	get	db	"Enter the key:",10,0
	set1	db	"Enter the key:",10,0
	set2	db	"Enter the value:",10,0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov	ebp, esp
	; ********** CODE STARTS HERE **********

	

	; *********** CODE ENDS HERE ***********
	mov	eax, 0
	mov	esp, ebp
	pop	ebp
	ret

setter: 
	push	ebp
	mov	ebp, esp
	
	mov	eax, 11
	mov	ebx, 1
	lea	ecx, someStr
	

	mov	esp, ebp
	pop	ebp
	ret
getter:
	push	ebp
	mov	ebp, esp

	mov	esp, ebp
	pop	ebp
	ret
