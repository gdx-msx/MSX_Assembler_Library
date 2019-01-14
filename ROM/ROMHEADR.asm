; ROM Header


	org	 4000h	; Address can be 4000h or 8000h only

	db	"AB"	; ID for ROM auto-executed by the system
	dw	INIT	; Replace with 0 if not used
	dw	0	; STATEMENT
	dw	0	; DEVICE
	dw	0	; TEXT
	dw	0	; Reserved
	dw	0	; Reserved
	dw	0	; Reserved

INIT:

; Replace this line with your program here

End:

; Padding with 255 to make the file of 16K size (can be 4K, 8K, 16k, etc)

	ds 4000h+RomSize-End,255	; 8000h+RomSize-End if org 8000h
