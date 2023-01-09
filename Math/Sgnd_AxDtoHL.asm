; Fast multiplication of two 8 bit registers 

; Effect: HL = A x D (signed multiply)
; Modifies: AF,BC,E,HL
; Note: Uses 512-byte tables. 

Sgnd_AxDtoHL:
	sub	D
	ld	H,MULTAB/256
	ld	L,A
	ld	C,(HL)
	inc	H
	ld	B,(HL)
	add	A,D
	add	A,D
	ld	L,A
	ld	E,(HL)
	dec	H
	ld	L,(HL)
	ld	H,E
	or	A
	sbc	HL,BC
	ret
MULTAB:
	ds	512,0