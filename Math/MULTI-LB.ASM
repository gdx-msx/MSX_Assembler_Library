; Routine: HL = L * B
; Modifies: B, DE, HL

Multi_LB:
	xor	a
	ld	d,a
	ld	e,b
	ld	h,a
	or	b
	jr	z,Multi_LB0	; Jump if B=0
	or	l
	ret	z		; Back if L=0
	jr	Multiply_LB
Multi_LB_Loop:
	add	hl,de
Multiply_LB:
	djnz	Multi_LB_Loop
	ret
Multi_LB0:
	ld	l,a
	ret
