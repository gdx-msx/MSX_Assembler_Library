; Effect: Select the second part of 32kB ROM that starts between 4010h~7FFFh
; Note: Insert these codes at the very beginning of the ROM boot before
;       execute codes between 7FFFh~BFFFh. (This routine works on all MSXs!)

; Main-Rom entries:

ENASLT	equ	00024h		; Enable slot

;	org	04010h		; Can be an address between 4010h~7FFEh

S32KROM4000:
	ld	a,c	; C = Rom slot number when a ROM is called at MSX start
	ld	h,080h	; L is ignored by the slot selection routine
	call    ENASLT
;
; Insert your program below