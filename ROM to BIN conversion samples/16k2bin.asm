; Routine to load a 16kB MSX ROM from a binary file

; Version 1.02 (2026-04) by GDX

; This program in assembler is a sample to show how to convert a 16KB rom to a single binary file

; Assembled with zasm cross assembler

; http://sourceforge.net/projects/zasm/
; https://k1.spdns.de/


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
LINL40	equ	0F3AEh	; SCREEN 0 width value
RG1SAV	equ	0F3E0h	; VDP register 1 content
MNROM	equ	0FCC1h	; Slot de la Main-ROM
RG1SAV	equ	0F3E0h	; VDP register 1 content

	org	08500h-7

; Binary file header

	db	0feh
	dw	ProgStart,ProgEnd+03fffh,ProgStart	; 03FFFh is to take in account the half size of the ROM in the binary file

ProgStart:

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

	ld	hl,RomExec
	ld	de,0c500h+(ProgEnd-ProgStart)	; Destination of the routine that put and run the Rom
	ld	bc,ProgEnd-RomExec
	ldir			; Move the routine that put and run the Rom

	jp	0c500h+(ProgEnd-ProgStart)		; Jump to the routine that put and run the Rom

	db	"Ver. 1.02",0	; Don't forget to change the version number here if you update

RomExec:
	di

	ld	a,(ProgEnd+3)
	bit	7,a
	jr	nz,Run8000

Run4000:
	ld	a,(RAMAD1)
	ld	h,40h
	call	ENASLT		; Select the Main-RAM to MSX page 1

	ld	hl,ProgEnd
	ld	de,04000h
	ld	bc,04000h
	ldir			; Put the ROM at page 1

	ld	a,(RAMAD1)
	ld	c,a

	ld	hl,(04002h)
	jp	(hl)		; Run the ROM

Run8000:
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
