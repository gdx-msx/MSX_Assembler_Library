; Routine: Select the second part of 32kB ROM that starts between 4010h~7FFFh
; Note: Insert these codes before execute codes between 7FFFh~BFFFh. (This is
;       the most used routine in MSX Roms.)

; Main-Rom entries:

ENASLT	equ	00024h		; Enable slot
RSLREG	equ	00138h		; Read primary slot register

; Variables system:

EXPTBL	equ	0FCC1h		; Expanded slot table

;	org	04010h		; Can be an address between 4010h~7FFEh

S32KROM4000:
	call	RSLREG
	rrca
	rrca
	and	3		; Keep slot number of bank 4000h~7FFFh
	ld	c,a
	ld	b,0
	ld	hl,EXPTBL
	add	hl,bc
	ld	a,(hl)
	and	80h
	or	c
	ld	c,a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	and	0Ch
	or	c
	ld	h,080h		; L is ignored by the slot selection routine
	call	ENASLT		; Select the second part between 7FFFh~BFFFh
;
; Insert your program below