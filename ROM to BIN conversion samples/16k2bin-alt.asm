; Routine to mainly load a few 16kB MSX ROM realeased by Ponyca from a binary file

; Version 1.02 (2026-04) by GDX

; This program in assembler is a sample to show how to convert a 16KB rom that
; start from page 0 (0000h-3FFFh) to a single binary file

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
	dw	ProgStart,ROMstart+03fffh,ProgStart	; 03FFFh is to take in account the half size of the ROM in the binary file

ProgStart:

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

	jp	RomExec		; Jump to the routine that put and run the Rom

	db	"Ver. 1.02",0	; Don't forget to change the version number here if you update

RomExec:
	di

Run0000:

;-- Select the Main-RAM to MSX page 0

	in	a,(0A8h)	; Read the primary slot register
	and	11000000b
	ld	b,a		; Store the current primary slot register bits of the page 3 (RAM) to B
	ld	a,(0FFFFh)	; Read the secondary slot register
	cpl			; CPL because the bits are reversed when read
	and	11000000b
	ld	c,a		; Store the current secondary slot register bits of the page 3 (RAM) to C

	ld	a,(RAMAD0)
	and	00000011b
	ld	d,a		; Store the Main-RAM primary slot register bits of the page 0 to D
	ld	a,(RAMAD0)
	and	00001100b
	rrca
	rrca
	ld	e,a		; Store the Main-RAM secondary slot register bits of the page 0 to E

	in	a,(0A8h)
	and	00111100b
	rlca
	rlca
	or	d
	rrca
	rrca
	or	d
	out	(0A8h),a	; Select the primary slot of the Main-Ram of the page 0 on pages 0 and 3

	ld	a,(0FFFFh)
	cpl
	and	00111100b
	rlca
	rlca
	or	e
	rrca
	rrca
	or	e
	ld	(0FFFFh),a	; Select the secondary slot of the Main-Ram of the page 0 on pages 0 and 3

	in	a,(0A8h)
	and	00111111b
	or	b
	out	(0A8h),a	; Select the stored primary slot (Main-Ram) on pages 3

	ld	a,(0FFFFh)
	cpl
	and	00111111b
	or	c
	ld	(0FFFFh),a	; Select the stored primary slot (Main-Ram) on pages 3
;--
	ld	hl,ROMstart
	ld	de,00000h
	ld	bc,04000h
	ldir			; Put the ROM at page 0

	ld	a,(RAMAD0)
	ld	c,a

	ld	hl,(00002h)
	jp	(hl)

ROMstart:

; Add the ROM here with a hexa-editor after assembling the program or with an INCBIN "RomName.rom" below.
; Some Rom need to remove the protections. The ROM won't work if you don't do it.

; List of suitable Roms for this routine (There aren't numerous)

; Beamrider (Ponyca) (Compatible with the joystick fixed version)
; Decathlon (Ponyca) (needs to remove the protection: replace 00 by 4A at 0AD0h and 00 by 21 at 0AD5h
; H.E.R.O. (Ponyca)
; River Raid (Ponyca) (needs to remove the protection: replace 00 by CD at 006Bh, 0073h and 007Ah, replace ED B0 by 00 00 at 0081h-0082h)
; Space Shuttle Uchuu no Tabi (Ponyca) (Not dumped)
; Zenji (Ponyca) (needs to remove the protection: replace 71 by 00 at 19DFh
