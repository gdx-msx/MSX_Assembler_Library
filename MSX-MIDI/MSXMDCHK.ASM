;
; Effect: Check the MSX-MIDI presence
; Return: A = Bit 0 indicates the presence of internal MSX-MIDI
;             Bit 1 indicates the presence of external MSX-MIDI

RDSLT	equ	000Ch		;Read byte from a slot
MSXVER	equ	002Dh		;Main ROM Version ID
MSXMIDI	equ	002Eh		;Internal MSX-MIDI flag
EXPTBL	equ	0FCC1h		;Table of primary slots expanded

CHKMIDI:
	ld	a,(EXPTBL)
	ld	hl,MSXVER
	call	RDSLT		;Read Main ROM version ID
	cp	3
	ld	a,0
	ret	c		;Back if MSX1,MSX2,MSX2+
	
	ld	a,(EXPTBL)
	ld	hl,MSXMIDI
	call	RDSLT		;Read internal MSX-MIDI ID
	and	1		;Keeps the bit 1 value
	ld	c,a		;Then save it to C 

	ld	b,4
CHKLP1:
	push	bc		;Save counter
	ld	a,4
	sub	b		;Primary slot number
	ld	c,a		;Save it to C
	ld	hl,EXPTBL
	ld	a,c
	add	a,l		;Get slot flag from EXPTBL
	ld	l,a
	ld	a,(hl)
	and	10000000b
	jr	z,CHKLP3	;Jump if no expanded
	ld	b,4		;Number of expanded slots
CHKLP2:				;Search expanded slot
	push	bc
	ld	a,00100100b
	sub	b		;001000ss
	rlc	a
	rlc	a		;1000ss00
	or	c		;1000sspp = slot address
	call	CHKID		;Check external MSX-MIDI ID
	pop	bc
	jr	z,CHKLPP	;Found external MSX-MIDI ID
	djnz	CHKLP2		;Next expanded slot
	pop	bc
	jr	CHKLP4		;Next slot
CHKLP3:				;Search primary slot
	ld	a,c		;Set slot address
	call	CHKID		;Check MIDI ID
	pop	bc
	jr	z,CHKLPF	;Found MIDI ID
CHKLP4:
	djnz	CHKLP1		;Search next slot
	ld	a,c		;No external MSX-MIDI ID
	ret
CHKLPP:
	pop	bc
CHKLPF:
	ld	a,2		;2 for external MSX-MIDI found
	or	c
	ret

; Effet: Is MIDI interface built in ?
; Entry: A = slot address
; Return: Z Flag = 1 for built in, 0 not built in

ID_ADRS	equ	401Ch	;MIDI ID address

ID_TXT:	db	'MIDI'

CHKID:
	push	bc
	ld	de,ID_TXT
	ld	hl,ID_ADRS
	ld	b,4		;length of id_string
CHKID1:
	push	af
	push	bc
	push	de
	call	RDSLT		;Read char
	pop	de
	pop	bc
	ld	c,a		;Save char
	ld	a,(de)		;Get char
	cp	c		;Same?
	jr	nz,CHKID2	;Jump if not same
	pop	af		;Restore slot address
	inc	de		;Next char
	inc	hl
	djnz	CHKID1		;Check next char
	pop	bc		;Restore environment
	xor	a		;I found ID
	ret
CHKID2:
	pop	af		;Restore slot address
	pop	bc		;Restore environment
	xor	a
	inc	a		;Wrong ID
	ret
