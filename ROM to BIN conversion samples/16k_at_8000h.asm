; Routine to load a 16kB (8000h~BFFFh) MSX ROM from a binary file

; Version 1.0 (2026-04) by GDX

; This program in assembler is a sample to show how to convert a 16KB rom to a single binary file

; Assembled with zasm cross assembler

; http://sourceforge.net/projects/zasm/

; Routine for MSX cartridge

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
KBUF	equ	0F41FH	; Temporary value
MNROM	equ	0FCC1h	; Slot de la Main-ROM
RG1SAV	equ	0F3E0h		; VDP register 1 content

BINstart	equ	08500h

	org	08500h-7

; Binary file header

	db	0feh
	dw	BINstart,ProgEnd+03fffh,BINstart

BINstart:

	ld	hl,(ProgEnd+4)	; Read the address STATEMENT in the ROM header
	ld	a,l
	or	h
	jr	nz,Statement	; Jump if an extended Basic instruction routine is in ROM

	ld	b,255
LOOP_DRV:
	push	bc
	call	0fd9fh
	pop	bc
	djnz	LOOP_DRV	; Wait for drive's LED goes out

	ld	a,0c9h
	ld	(0fd9fh),a	; Remove the drive routine from interrupt routine

	ld	a,39
	ld	(LINL40),a	; Width 39 when the SCREEN 0 is set
	ld	a,1
	call	CHGMOD

Statement:

	di

	ld	hl,RomExec
	ld	de,0c550h	; Destination of the routine that put and run the Rom
	ld	bc,ProgEnd-RomExec
	ldir			; Move the routine that put and run the Rom

	jp	0c550h		; Jump to  the routine that put and run the Rom
RomExec:
	ld	hl,ProgEnd
	ld	de,08000h
	ld	bc,04000h
	ldir			; Put the ROM at page 2

	xor	a
	ld	(0c000h),a
	ld	hl,0c001h
	ld	(0F676h),hl	; Set user memory to c000h

	ld	a,(RAMAD2)
	ld	c,a

	ld	hl,(08002h)
	jp	(hl)		; Run the ROM

ProgEnd:

; Add the ROM here with a hexa-editor after assembling the program.
; See also the page below to remove the protections.
; https://www.msx.org/wiki/Konami_game_protections
; The ROM won't work if you don't do it.