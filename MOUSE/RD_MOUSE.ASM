; Routine to read the mouse by direct accesses (works on MSX1/2/2+/turbo R)
;
; Input: DE = 09310h for mouse in port 1 (D = 10010011b, E = 00010000b)
; 	 DE = 0EC20h for mouse in port 2 (D = 11101100b, E = 00100000b)
; Output: H = X-offset, L = Y-offset (H = L = 255 if no mouse)

WAIT1:  equ   10              ; Short delay value
WAIT2:  equ   30              ; Long delay value

GTMOUS:
	ld	b,WAIT2	; Long delay for first read
	call	GTOFS2	; Read bits 7-4 of the x-offset
	and	0Fh
	rlca
	rlca
	rlca
	rlca
	ld	c,a
	call	GTOFST	; Read bits 3-0 of the x-offset
	and	0Fh
	or	c
	ld	h,a	; Store combined x-offset
	call	GTOFST	; Read bits 7-4 of the y-offset
	and	0Fh
	rlca
	rlca
	rlca
	rlca
	ld	c,a
	call	GTOFST	; Read bits 3-0 of the y-offset
	and 0Fh
	or c
	ld l,a		; Store combined y-offset
	ret
	
GTOFST:	ld b,WAIT1
GTOFS2:	ld a,15		; Read PSG register 15 for mouse
	di		; DI useless if the routine is used during an interrupt
	out (0A0h),a
	ld a,d
	out (0A1h),a
	xor e
	ld d,a
	
	call WAITMS	; Extra delay because the mouse is slow
	
	ld a,14
	out (0A0h),a
	ei		; EI useless if the routine is used during an interrupt
	in a,(0A2h)
	ret
WAITMS:
	ld	a,b
WTTR:
	djnz	WTTR
	db	0EDh,055h	; Back if Z80 (RETN on Z80, NOP on R800)
	rlca
	rlca
	ld	b,a
WTTR2:
	djnz	WTTR2
	ld	b,a	
WTTR3:
	djnz	WTTR3
	ret
