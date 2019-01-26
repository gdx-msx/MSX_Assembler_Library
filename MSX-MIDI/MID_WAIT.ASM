;
; Effect: Waiting routine between accesses to command and mode register
; Return: None
; Modifies: -

TIMERLSB	equ	0E6h	;A write initializes the system timer
TIMERMSB	equ	0E7h	;System timer MSB

MID_WAIT: 
	push	af 
	push	bc 
	ld	c,1 
	out	(TIMERLSB),a	;Clear timer
MID_WAITLP: 
	in	a,(TIMERMSB)	;Read counter
	cp	c 
	jr	c,MID_WAITLP	;Loop
	pop	bc 
	pop	af 
	ret
