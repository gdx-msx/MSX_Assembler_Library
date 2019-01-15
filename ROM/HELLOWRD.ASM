; Effect: Print "Hello world!" from cartridge environment
;
; Save the assembled file with the name HELLO.ROM
 
CHPUT:		equ 0A2h	; Set the address of character output routine of main Rom BIOS
				; Main Rom is already selected (0000h ~ 3FFFh/7FFFh) when a
				; Rom is being executed.
RomSize:	equ 4000h	; For 16kB Rom size.
 
; Compilation address
	org 4000h	; 8000h can be also used here if Rom size is 16kB or less.
 
; ROM header (Put 0000h as address when unused)
	db "AB"		; ID for auto-executable Rom at MSX start
	dw Execute	; Main program execution address.
	dw 0		; Execution address of a program whose purpose is to add
			; instructions to the MSX-Basic using the CALL statement.
	dw 0		; Execution address of a program used to control a device
			; built into the cartridge.
	dw 0		; Basic program pointer contained in ROM.
	dw 0,0,0
 
; Program code entry point
Execute:
	ld	hl,Hello_TXT	; Load the address from the label Hello_TXT into HL.
	call	Print		; Call the routine Print below.
 
; Halt program execution. Change to "ret" to return to MSX-BASIC.
 
Finished:
	jr	Finished	; Jump to itself endlessly.
 
Print:
	ld	a,(hl)		; Load the byte from memory at address indicated by HL to A.
	and	a		; Same as CP 0 but faster.
	ret	z		; Back behind the call print if A = 0
	call	CHPUT		; Call the routine to display a character.
	inc	hl		; Increment the HL value.
	jr	Print		; Relative jump to the address in the label Print.
 
 
; Message data
Hello_TXT:			; Set the current address into label Hello_TXT. (text pointer)
	db "Hello world!",0	; Zero indicates the end of text.
End:
; Padding with 255 to make the file of 16K size (can be 4K, 8K, 16k, etc) but
; some MSX emulators or Rom loaders can not load 4K/8K Roms.
; (Alternatively, include macros.asm and use ALIGN 4000H)
 
	ds 4000h+RomSize-End,255	; 8000h+RomSize-End if org 8000h
