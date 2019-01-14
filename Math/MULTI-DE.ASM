
; Effect: HL = D * E
; Modifies: B, D, HL

Mult_DE:
	ld hl,0
	ld a,d
	or a		; Check one of the factors
	ret z		; Back if it is zero
	ld b,d		; One factor is in B
	ld d,h		; Clear D (H is zero), so DE holds the other factor
Mul_DE_Loop:		; Add DE to HL exactly B times
	add hl,de
	djnz MulLoop
	ret
