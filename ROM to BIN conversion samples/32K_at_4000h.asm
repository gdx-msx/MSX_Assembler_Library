; Routine to load a 32kB (4000h~BFFFh) MSX ROM from binary

; Version 1.0 (2026-04) by GDX

; This program in assembler is a sample to show how to convert a 32KB rom to a single binary file

; When the binary file is bigger than that what is indicated by the header, the rest can be with the BDOS function 27h.

; Assembled with zasm cross assembler

; http://sourceforge.net/projects/zasm/


VDP.DW	equ	00007h	; First VDP port to write
RDSLT	equ	0000Ch	; Read a byte in a Slot
WRSLT	equ	00014h	; Write a byte in a Slot
ENASLT	equ	00024h	; Slot select
CHGMOD	equ	0005Fh	; Change screen mode
RSLREG	equ	00138h	; Read primary Slot REGister
WSLREG	equ	0013Bh	; Write primary Slot REGister
RAMAD0	equ	0F341h	; Main-RAM Slot (00000h~03FFFh)
RAMAD1	equ	0F342h	; Main-RAM Slot (04000h~07FFFh)
RAMAD2	equ	0F343h	; Main-RAM Slot (08000h~0BFFFh)
RAMAD3	equ	0F344h	; Main-RAM Slot (0C000h~0FFFFh)
LINL40	equ	0F3AEh	; SCREEN 8 Width
RG1SAV	equ	0F3E0h	; VDP register 1 content
KBUF	equ	0F41Fh	; Temporary value
MNROM	equ	0FCC1h	; Slot de la Main-ROM
RG1SAV	equ	0F3E0h	; VDP register 1 content
BDOS	equ	0F37Dh	; BDOS functions

FILNAM	equ	0F866h	; File name (11 bytes)
FCBadrs	equ	0F353h	; Content the current FCB address

ROMstart	equ	08500h
BINstart	equ	ROMstart-0AFh	; 0A8h is the length of the loading routine + header size

	org	BINstart

;Binary Header

	db	0feh
	dw	progStart,progEnd+03FFFh,progStart

; Moving the second part of the loader to the page 3

progStart:
	di
	ld	hl,def_RAMAD1
	ld	de,0c500h
	ld	bc,progEnd-def_RAMAD1
	ldir
	ei
	jp	0c500h

; Put the first ROM part on the page 1

def_RAMAD1:

.phase	0c500h

	ld	a,(RAMAD1)
	ld	h,40h
	call	ENASLT		; Select Main-RAM on page 1

	ld	hl,ROMstart
	ld	de,04000h
	ld	bc,04000h
	ldir

	ld	a,(MNROM)
	ld	h,40h
	call	ENASLT		; Select Main-ROM on page 1

; Second part loading

LD_Part2:

	ld	hl,(FCBadrs)	; HL = FCB address
	ld	de,14
	add	hl,de
	ld	(hl),1		; Record size = 1 byte

	ld	c,01Ah
	ld	de,8000h
	call	BDOS		; DMA Buffer = 8000h

	ld	hl,(FCBadrs)	; HL = FCB address
	ld	de,16
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		; ld	de,(hl)
	dec	hl
	ex	de,hl		; HL = Block length to read
	push	hl

	ld	hl,(FCBadrs)	; HL = FCB address
	ex	de,hl		; DE = FCB address
	pop	hl

	ld	c,027h
	call	BDOS		; Load the rest of the binary file (16KB) to the page 2

	ld	a,b
	or	c
	cp	040h
	ld	de,ReadError_TXT
	jr	nz,BCK2BAS	; Jump if readed bytes are not 04000h

	ld	hl,(FCBadrs)	; HL = FCB address
	ex	de,hl		; DE = FCB address

	ld	c,10H
	call	BDOS		; Close the file

	ld	a,1
	call	CHGMOD		; Set the SCREEN1 mode

	ld	b,255
LOOP_DRV:
	push	bc
	call	0fd9fh
	pop	bc
	djnz	LOOP_DRV	; Wait for the drive's LED goes out

	ld	a,0c9h
	ld	(0fd9fh),a	; Remove the drive routine from interrupt routine

	ld	a,39
	ld	(LINL40),a	; Width 39 when the SCREEN 0 is set

	di
	ld	a,(RAMAD1)
	ld	h,40h
	call	ENASLT		; Select the Main-RAM on the page 1

	ld	hl,(04002h)
	jp	(hl)		; Run the ROM

BCK2BAS:
	push	de		; Store error message adresse
	ld	hl,(FCBadrs)	; HL = FCB address
	ex	de,hl		; DE = FCB address adresse

	ld	c,10H
	call	BDOS		; Close the file
	pop	de		; Restore error message

	ld	c,9
	jp	BDOS		; Back to MSX-BASIC

ReadError_TXT:
	db	"Read error!",10,13,'$'

.dephase

progEnd:

; Add the ROM here with a hexa-editor after assembling the program.
; The ROM must not contain a call to a slot-changing routine.
; To remove these calls from the ROM, replace all CD 24 00 by 00 00 00 for example.
; See also the page below to remove the protections.
; https://www.msx.org/wiki/Konami_game_protections
; The ROM won't work if you don't do it.