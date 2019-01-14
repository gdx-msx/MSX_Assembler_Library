; Main-ROM Labels

BASRVN	equ	002Bh	; BASIC Rom version number
BEEP	equ	00C0h	; BEEP buzzer
BIGFIL	equ	016Bh	; Big fill (MSX2 ~)
BREAKX	equ	00B7h	; Break X
CALATR	equ	0087h	; Calculate address of atribute table
CALBAS	equ	0159h	; Call BASIC ROM (Main-ROM 4000h~7FFFh)
CALLF	equ	0030h	; Call far
CALPAT	equ	0084h	; Calculate pattern table address
CALSLT	equ	001Ch	; Call slot
CGTABL	equ	0004h	; Character generator table
CHGCAP	equ	0132h	; Change Caps lamp status
CHGCPU	equ	0180h	; Change CPU (Turbo R)
CHGCLR	equ	0062h	; Change color
CHGET	equ	009Fh	; Character get
CHGMOD	equ	005Fh	; Change screen node
CHGSND	equ	0135h	; Change sound port status
CHKNEW	equ	0165h	; Check new screen mode (MSX2 ~)
CHKSLZ	equ	0162h	; Check slot Z (MSX2 ~)
CHPUT	equ	00A2h	; Character output
CHRGTR	equ	0010h	; Character getter
CHSNS	equ	009Ch	; Check scan keyboard buffer status
CKCNTC	equ	00BDh	; Check control C
CLRSPR	equ	0069h	; Clear sprites
CLS	equ	00C3h	; Clear screen
CNVCHR	equ	00ABh	; Convert character
DCOMPR	equ	0020h	; Double register compare
DISSCR	equ	0041h	; Disable screen display
DOWNC	equ	0108h	; Down current
DSPFNK	equ	00CFh	; Display function key
ENASCR	equ	0044h	; Enable screen display
ENASLT	equ	0024h	; Enable slot
EOL	equ	0168h	; Erase to end of line (MSX2 ~)
ERAFNK	equ	00CCh	; Erase function keys
EXTROM	equ	015Fh	; Call external rom (MSX2 ~)
FETCHC	equ	0114h	; Fetch current
FILVRM	equ	0056h	; Fill VRAM
FNKSB	equ	00C9h	; Function key display enabled
FORMAT	equ	0147h	; Disk formatter
GETCPU	equ	0183h	; Get CPU (Turbo R)
GETVCP	equ	0150h	; Get voice pointer
GETVC2	equ	0153h	; Get voice 2
GETYPR	equ	0028h	; Get the type of decimal acumulator
GICINI	equ	0090h	; GI sound chip initialize
GRPPRT	equ	008Dh	; Graphic print
GSPSIZ	equ	008Ah	; Get sprite size
GTASPC	equ	0126h	; Get aspect ratio
GTPAD	equ	00DBh	; Get touch pad
GTPDL	equ	00DEh	; Get paddle
GTSTCK	equ	00D5h	; Get joystick status
GTTRIG	equ	00D8h	; Get trigger button status
INIFNK	equ	003Eh	; Initialize function key
INIGRP	equ	0072h	; Initialize graphic mode
INIMLT	equ	0075h	; Initialize multicolor mode
INITIO	equ	003Bh	; Initialize Input/Output
INITXT	equ	006Ch	; Initialize text 40/80 columns mode
INIT32	equ	006Fh	; Initialize text 32 columns mode
INLIN	equ	00B1h	; Input line
ISCNTC	equ	00BAh	; Is control C ?
ISFLIO	equ	014Ah	; Is file I/O
KEYINT	equ	0038h	; Encode keyboard / timer interrupt routine
KILBUF	equ	0156h	; Kill buffer
LDIRMV	equ	0059h	; Load increment repeat memory with VRAM
LDIRVM	equ	005Ch	; Load increment repeat VRAM with memory
LEFTC	equ	00FFh	; Left current
LFTQ	equ	00F6h	; Left in queue
LPTOUT	equ	00A5h	; Line printer out
LPTSTT	equ	00A8h	; Line printer status
MAPXYC	equ	0111h	; Map X & Y to current
MSXVER	equ	002Dh	; MSX version
NMI	equ	0066h	; Non Maskable Interrupt
NRDVRM	equ	0174h	; New read VRAM (MSX2 ~)
NSETCX	equ	0123h	; Next set current X
NSETRD	equ	016Eh	; New set address for read VRAM (MSX2 ~)
NSTWRT	equ	0171h	; New set address for write VRAM (MSX2 ~)
NWRVRM	equ	0177h	; New write VRAM (MSX2 ~)
OUTLDP	equ	014Dh	; Out do line printer
OUTDO	equ	0018h	; Out do (Send a character)
PCMPLY	equ	0186h	; PCM play (Turbo R)
PCMREC	equ	0189h	; PCM record (Turbo R)
PNTINI	equ	0129h	; PAINT initialize
PINLIN	equ	00AEh	; Program input line
POSIT	equ	00C6h	; Position cursor
PUTQ	equ	00F9h	; Put in queue
PYSDIO	equ	0144h	; Physical disk I/O
QINLIN	equ	00B4h	; Put in queue
RDPSG	equ	0096h	; Read PSG register
RDRES	equ	017Ah	; Read reset (MSX2+ ~)
RDSLT	equ	000Ch	; Read slot
RDVDP	equ	013Eh	; Read VDP status register
RDVRM	equ	004Ah	; Read VRAM
READC	equ	011Dh	; Read current
RIGHTC	equ	00FCh	; Right current
RSLREG	equ	0138h	; Read primary slot register
SCALXY	equ	010Eh	; Scale X & Y
SCANL	equ	012Fh	; Scan left
SCANR	equ	012Ch	; Scan right
SETATR	equ	011Ah	; Set attribute byte
SETC	equ	0120h	; Set current
SETGRP	equ	007Eh	; Set graphic mode
SETMLT	equ	0081h	; Set multicolor mode
SETRD	equ	0050h	; Set address for read VRAM
SETTXT	equ	0078h	; Set text mode
SETT32	equ	007Bh	; Set text 32 mode
SETWRT	equ	0053h	; Set address to write in VRAM
SNSMAT	equ	0141h	; Scan specified row in keyboard matrix
STARUP	equ	0000h	; MSX start up / Reset 
STMOTR	equ	00F3h	; Set motor
STOREC	equ	0117h	; Store current
STRTMS	equ	0099h	; Start background music task
SUBROM	equ	015Ch	; Call Sub-ROM (MSX2 ~)
SYNCHR	equ	0008h	; Syntax of character
TAPIN	equ	00E4h	; Tape in
TAPIOF	equ	00E7h	; Tape in on
TAPION	equ	00E1h	; Tape in off
TAPOOF	equ	00F0h	; Tape out off
TAPOON	equ	00EAh	; Tape out on
TAPOUT	equ	00EDh	; Tape out
TDOWNC	equ	010Bh	; Test and down current
TOTEXT	equ	00D2h	; Force screen to text mode
TUPC	equ	0105h	; Test and up current
UPC	equ	0102h	; Up current
VDP.DR	equ	0006h	; VDP data read port
VDP.DW	equ	0007h	; VDP data write port
WRRES	equ	017Dh	; Write reset (MSX2+ ~)
WRTPSG	equ	0093h	; Write into PSG register
WRSLT	equ	0014h	; Write into slot
WRTVDP	equ	0047h	; Write into VDP register
WRTVRM	equ	004Dh	; Write into VRAM
WSLREG	equ	013Bh	; Write slot register
