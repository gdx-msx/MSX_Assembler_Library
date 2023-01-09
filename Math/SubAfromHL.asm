; Subtract an 8 bit register from a 16 bit register

; Effect: HL = HL - A
; Modifies: AF, DE, HL.

SubAfromHL:
	ld	e,a	; DE = A
	add	a,a
	sbc	a
	ld	d,a
	or	a	; Reset carry flag
	sbc	hl,de	; HL = HL-DE
	ret