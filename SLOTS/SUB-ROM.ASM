; Effect: Call Sub-ROM from BASIC environement
; Modifies: All register except IX

SUBROM	equ	015ch

CSUBROM:
	push	ix	
	ld	ix,<adresse>	; routine de la Sub-ROM
	jp	SUBROM