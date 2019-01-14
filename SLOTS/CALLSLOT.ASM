
; Effect: Call routine in another slot
; Entry: IX= Address of Bios routine
; Modifies: AF, IX, IY, auxiliary registers.
; Doesn't work from MSX-DOS environment. 

CALSLT	equ	001Ch

CALLSLOT:
	ld	iy,(0fcc0h)
	jp	CALSLT
