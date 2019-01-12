
; Routine: HL = H * E
; Modifies: B, DE, HL

Mult_HE:
	ld	l,0
	ld	d,0
	ld	b,8
Mult_HE_Loop:
	add	hl,hl
	jr	nc,Skip_ADD
	add	hl,de
Skip_ADD:
	djnz	Mult_HE_Loop
	ret
