; Fast multiplication of two 8 bit registers 

; Effect: HL = A x E (integers)
; Modifies: AF, DE, HL.
; Note: Unsigned multiplication

ExAtoHL:
;	or	a
;	ret	z	; Back if A = 0
	ld	hl,0
	ld	d,h
	rra
	jr	nc,bit0
	ld	l,e
bit0:
	sla	e
	rl	d
	rra
	jr	nc,bit1
	add	hl,de
bit1:
	sla	e
	rl	d
	rra
	jr	nc,bit2
	add	hl,de
bit2:
	sla	e
	rl	d
	rra
	jr	nc,bit3
	add	hl,de
bit3:
	sla	e
	rl	d
	rra
	jr	nc,bit4
	add	hl,de
bit4:
	sla	e
	rl	d
	rra
	jr	nc,bit5
	add	hl,de
bit5:
	sla	e
	rl	d
	rra
	jr	nc,bit6
	add	hl,de
bit6:
	sla	e
	rl	d
	rra
	ret	nc	; Back if bit7 = 0
	add	hl,de
	ret