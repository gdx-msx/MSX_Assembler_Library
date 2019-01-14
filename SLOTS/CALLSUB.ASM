
; Effect: Call Sub-ROM routine under MSX-DOS
; Entry: IX= Address of Bios routine
;        AF, HL, DE, BC = Parameters of the routine to call
; Output: AF, HL, DE, BC = Called routine result
; Modifies: AF, IX, IY, auxiliary registers

CALSLT	equ	001ch
EXTROM	equ	015fh
NMI	equ	0066h	; Non-maskable interrupt
EXPTBL	equ	0fcc1h
H.NMI	equ	0fdd6h	; Hook for NMI

CALLSUB:
	exx			; Preserves parameters
	ex	af,af'		; of registers

	ld	hl,EXTROM	; Push the next routine
	push	hl		; in stack (lenght = 10)
	ld	hl,0c300h	;
	push	hl		; +0   inc sp
	push	ix		; +1   inc sp
	ld	hl,021ddh	; +2   ld ix,<address to call>
	push	hl		; +6   nop
	ld	hl,03333h	; +7   jp EXTROM
	push	hl
	ld	hl,0
	add	hl,sp
	ld	a,0c3h
	ld	(H.NMI),a
	ld	(H.NMI+1),hl
	ex	af,af'		; Restore the parameters
	exx			; of registers

	ld	ix,NMI
	ld	iy,(EXPTBL-1)
	call	CALSLT
	ei

	ld	hl,10		; Throw away the interface routine
	add	hl,sp
	ld	sp,hl
	ret