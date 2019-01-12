
; Routine: HL = HL * DE (Rest -> DE)
; Modifies: DE, HL

Mul_HLDE:
	push	af
	push	bc
	ld	b,h
	ld	c,l
	ld	a,16
	ld	hl,0
Mult:
	rr	b
	rr	c
	jr	nc,NoAdd_Mul
	add	hl,de
NoAdd_Mul:
	ex	de,hl
	add	hl,hl
	ex	de,hl
	dec	a
	jr	nz, Mult
	pop	bc
	pop	af
	ret
