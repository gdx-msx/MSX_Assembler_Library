; Disks system labels

; MSX-DOS

BDOS	equ	0005h		; Call to MSX-DOS functions
DMA	equ	00080h

; Disk driver

BREAKV	equ	0F325h		; Routine address for the CTRL+C handler
DEVICE	equ	0FD99h		; Flag to know if the SHIFT key was pressed at startup
DRVINF	equ	0FB21h		; Number of physical disk controlled by each interface and slot number of its Disk-ROM 
DRVINT	equ	0FB29h		; Slot number and address of each interrupt handler on the disk interfaces
HIMSAV	equ	0F349h		; Work area address for the Disk-ROM
MASTERS	equ	0F348h		; Slot number of the master Disk-ROM
NMBDRV	equ	0F347h		; Number of connected logical drives (0~7)
RAMAD0	equ	0F341h		; Main RAM slot number for the page 0000h~3FFFh
RAMAD1	equ	0F342h		; Main RAM slot number for the page 4000h~7FFFh
RAMAD2	equ	0F343h		; Main RAM slot number for the page 8000h~BFFFh
RAMAD3	equ	0F344h		; Main RAM slot number for the page C0000h~FFFFh
ROMBDOS	equ	0F37Dh		; Call to BDOS routine from the Disk-BASIC environment

; Files (Data recorder, Basic interpreter, Disk Basic)

FILNAM	equ	0F866h		; File name (6 or 11 bytes)
FILNM2	equ	0F871h		; Second file name (11 bytes)
FILTAB	equ	0F860h		; File data address
FLBMEM	equ	0FCAEh		; Loading flag: 0 if a Basic program is loading
FLGINP	equ	0F6A6h		; Data address of the selected file
MAXFIL	equ	0F85Fh		; Maximum number of files allowed
NLONLY	equ	0F87Ch		; Flag other than 0 when loading a program
NULBUF	equ	0F862h		; Address of the Disk-Basic SAVE and LOAD instructions
SAVEND	equ	0F87Dh		; End address specified by the BSAVE instruction of Basic
SAVENT	equ	0FCBFh		; Start address specified by the BSAVE instruction of Basic
PTRFIL	equ	0F864h		; Data address of the selected file 
RUNFLG	equ	0F866h		; Execution flag for the LOAD instruction

; System

ACPAGE	equ	0FAF6h		; Destination page number (MSX2~)
ARG	equ	0F847h		; Argument (16 bytes)
ARYTAB	equ	0F6C4h		; Array variables area address
ARYTA2	equ	0F7B5h		; End of the variable area address
ASPCT1	equ	0F40Bh		; 256/aspect ratio for CIRCLE
ASPCT2	equ	0F40Dh		; 256*aspect ratio for CIRCLE
ASPECT	equ	0F931h		; Aspect ratio of the circle for CIRCLE
ATRBAS	equ	0F928h		; Current sprite attribute table address
ATRBYT	equ	0F3F2h		; Tracing attribute (Plot color)
AUTFLG	equ	0F6AAh		; Mode flag for AUTO
AUTINC	equ	0F6ADh		; Line incremention for AUTO
AUTLIN	equ	0F6ABh		; Current line number for AUTO
AVCSAV	equ	0FAF7h		; AV control port (0F7h) content. (MSX2+~) 
BAKCLR	equ	0F3EAh		; Background color
BASROM	equ	0FBB1h		; BASIC program in ROM flag
BDRCLR	equ	0F3EBh		; Border color
BOTTOM	equ	0FC48h		; Beginning of the available RAM area address
BRDATR	equ	0FCB2h		; Border color of PAINT
BUF	equ	0F55Eh		; Buffer to store characters displayed to screen under BASIC in direct mode (258 bytes)
LINWRK	equ	0FC18h		; Work area of one line of screen management (40 bytes)
BUFMIN	equ	0F55Dh		; Work area for INPUT
CAPST	equ	0FCABh		; CAPS key status
CASPRV	equ	0FCB1h		; Work area for the cassette or Pause/R800 LED status
CENCNT	equ	0F933h		; Counter used by CIRCLE
CGPBAS	equ	0F924h		; Current pattern generator table address
CGPNT	equ	0F91Fh		; Current character font location (3 bytes)
CHRCNT	equ	0FAF9h		; Character counter in the Roma-Kana cache. (MSX2 ~)
CLIKFL	equ	0FBD9h		; Flag to know if the click has already occurred
CLIKSW	equ	0F3DBh		; Key click switch
CLINEF	equ	0F935h		; Flag to draw line to circle center
CLMLST	equ	0F3B2h		; Value (LINLEN-(LINLEN MOD 14)-14) used by PRINT
CLOC	equ	0F92Ah		; Cursor location
CLPRIM	equ	0F3B2h		; Call primary slot routine (14 bytes)
CMASK	equ	0F92Ch		; Graphic cursor mask or ordinate
CNPNTS	equ	0F936h		; Point to be plottted
CNSDFG	equ	0F3DEh		; Flag for function keys display
CODSAV	equ	0FBCCh		; ASCII code of character under the cursor
CONLO	equ	0F66Ah		; Value of stored constant
CONSAV	equ	0F668h		; Token of constant stored after calling CHRGET
CONTXT	equ	0F666h		; Temporary save of the text pointer
CONTYP	equ	0F669h		; Type of stored constant
CPCNT	equ	0F939h		; Number of points in 1/8 of circle
CPCNT8	equ	0F93Bh		; Number of points in the circle
CPLOTF	equ	0F938h		; Plot polarity flag for CIRCLE
CRCSUM	equ	0F93Dh		; CRC Sum of the circle
CRTCNT	equ	0F3B1h		; Number of lines of current text screen
CS120	equ	0F3FCh		; Work area of the data recorder. (5 bytes, until MSX2+)
CS240	equ	0F3FCh		; Work area of the data recorder. (5 bytes, until MSX2+)
CSAVEA	equ	0F942h		; Address of the first pixel of different color for PAINT
CSAVEM	equ	0F944h		; Mask of the first pixel of different color for PAINT
CSCLXY	equ	0F941h		; Scale of X & Y for CIRCLE
CSRSW	equ	0FCA9h		; Cursor display switch
CSRX	equ	0F3DDh		; X-coordinate of text cursor
XSRY	equ	0F3DCh		; Y-coordinate of text cursor
CSTCNT	equ	0F93Fh		; Number of points of the starting angle for CIRCLE
CSTYLE	equ	0FCAAh		; Cursor style flag
CURLIN	equ	0F41Ch		; Current execution line number of BASIC program
CXOFF	equ	0F945h		; X offset from center for PAINT
CYOFF	equ	0F947h		; Y offset from center for PAINT
DAC	equ	0F7F6h		; Decimal accumulator
DATLIN	equ	0F6A3h		; Current line number of DATA
DATPTR	equ	0F6C8h		; Pointer to next data to read with READ
DECCNT	equ	0F7F4h		; Work area for divisions
DECTMP	equ	0F7F0h		; Work area to convert decimal integer to floating point number
DECTM2	equ	0F7F2h		; Work area for divisions
DEFTBL	equ	0F6CAh		; Type table of BASIC variables (26 bytes)
DIMFLG	equ	0F662h		; Array flag for DIM
DORES	equ	0F664h		; Flag that indicates if stored keyword can be tokenized or not.
DONUM	equ	0F665h		; Flag for the number encoding
DOT	equ	0F6B5h		; Current line number displayed by LIST
DPPAGE	equ	0FAF5h		; Displayed page number. (MSX2~)
DRWANG	equ	0FCBDh		; Parameter for DRAW rotation
DRWFLG	equ	0FCBBh		; DRAW flag
DRWSCL	equ	0FCBCh		; Parameter for DRAW scaling
DSCPTR	equ	0F699h		; Pointer to the "Ok" message
DSCTMP	equ	0F698h		; Length and position of the "Ok" message
ENDBUF	equ	0F660h		; Flag to prevent overflow of BUF
ENDFOR	equ	0F6A1h		; Next address of the instruction FOR
ENDPRG	equ	0F40Fh		; Dummy program end (5 bytes)
ENSTOP	equ	0FBB0h		; Flag to resume execution of a BASIC program
ERRFLG	equ	0F414h		; Number of the last error occurred in BASIC
ERRLIN	equ	0F6B3h		; Line number where last error in BASIC
ERRTXT	equ	0F6B7h		; Pointer to the error message
ESCCNT	equ	0FCA7h		; Escape sequence counter
EXBRSA	equ	0FAF8h		; Slot number of SUB-ROM. (MSX2~)
EXPTBL	equ	0FCC1h		; Extended slot flags table (4 bytes)
EXTBIO	equ	0FFCAh		; Extended Bios call
FACLO	equ	0F7F8h		; Interer value or string location in the DAC
FBUFFR	equ	0F7C5h		; Buffer of mathematical routines
FNKFLG	equ	0FBCEh		; Ten flags for Basic's KEY (x) ON/OFF/STOP instruction 
FNKSTR	equ	0F87Fh		; 
FNKSWI	equ	0FBCDh		; 
FORCLR	equ	0F3E9h		; Draw/Text color
FRCNEW	equ	0F3F5h		; 
FRETOP	equ	0F69Bh		; 
FSTPOS	equ	0FBCAh		; 
FUNACT	equ	0F7BAh		; 
GETPNT	equ	0F3FAh		; 
GRPACX	equ	0FCB7h		; 
GRPACY	equ	0FCB9h		; 
GRPATR	equ	0F3CDh		; SCREEN 2 sprite attribute table address
GRPCGP	equ	0F3CBh		; SCREEN 2 pattern generator table address
GRPCOL	equ	0F3C9h		; SCREEN 2 color table address
GRPHED	equ	0FCA6h		; Heading for the output of graphic characters
GRPNAM	equ	0F3C7h		; SCREEN 2 pattern name table address
GRPPAT	equ	0F3CFh		; SCREEN 2 sprite generator table address
GXPOS	equ	0FCB3h		; 
GYPOS	equ	0FCB5h		; 
HEADER	equ	0F40Ah		; Settings for the tape player. (5 bytes, until MSX2+) 
HIGH	equ	0F408h		; Settings for the tape player. (5 bytes, until MSX2+) 
HIMEM	equ	0FC4Ah		; 
HOLD	equ	0F83Eh		; 
HOLD2	equ	0F836h		; 
HIGH	equ	0F408h		; 
HOLD8	equ	0F806h		; 
INSFLG	equ	0FCA8h		; 
INTCNT	equ	0FCA2h		; 
INTFLG	equ	0FC9Bh		; 
INTVAL	equ	0FCA0h		; 
JIFFY	equ	0FC9Eh		; 
KANAMD	equ	0FCADh		; 
KANAST	equ	0FCACh		; 
KBFMIN	equ	0F41Eh		; 
KBUF	equ	0F41Fh		; 
KEYBUF	equ	0FBF0h		; 
LFPROG	equ	0F954h		; 
LINL32	equ	0F3AFh		; Columns number in SCREEN 1
LINL40	equ	0F3AEh		; Columns number in SCREEN 0
LINLEN	equ	0F3B0h		; Columns number in current text screen 
LINTTB	equ	0FBB2h		; 
LINWRK	equ	0FC18h		; 
LOGOPR	equ	0FB02h		; 
LOHADR	equ	0F94Bh		; 
LOHCNT	equ	0F94Dh		; 
LOHDIR	equ	0F94Ah		; 
LOHMSK	equ	0F949h		; 
LOW	equ	0F406h		; Settings for the tape player. (5 bytes, until MSX2+)
LOWLIM	equ	0FCA4h		; 
LPTPOS	equ	0F415h		; 
MAXDEL	equ	0F92Fh		; 
MAXUPD	equ	0F3ECh		; 
MCLFLG	equ	0F958h		; 
MCLLEN	equ	0FB3Bh		; 
MCLPTR	equ	0FB3Ch		; 
MCLTAB	equ	0F956h		; 
MEMSIZ	equ	0F672h		; 
MINDEL	equ	0F92Dh		; 
MINUPD	equ	0F3EFh		; 
MLTATR	equ	0F3D7h		; SCREEN 3 sprite attribute table address
MLTCGP	equ	0F3D5h		; SCREEN 3 pattern generator table address
MLTCOL	equ	0F3D3h		; SCREEN 3 color table address
MLTNAM	equ	0F3D1h		; SCREEN 3 pattern name tabte address
MLTPAT	equ	0F3D9h		; SCREEN 3 sprite generator table address
MNROM	equ	0FCC1h		; 
MODE	equ	0FAFCh		; Current screen mode
MOVCNT	equ	0F951h		; 
MUSICF	equ	0FB3Fh		; 
NAMBAS	equ	0F922h		; 
NEWKEY	equ	0FBE5h		; 
NOFUNS	equ	0F7B7h		; 
NTMSXP	equ	0F417h		; 
OLDKEY	equ	0FBDAh		; 
OLDLIN	equ	0F6BEh		; 
OLDSCR	equ	0FCB0h		; 
OLDTXT	equ	0F6C0h		; 
ONEFLG	equ	0F6BBh		; Error flag for the ON ERROR GOTO instruction
ONELIN	equ	0F6B9h		; Line number defined by the ON ERROR GOTO instruction
ONGSBF	equ	0FBD8h		; Flag for the Basic ON ... GOSUB instruction
OPRTYP	equ	0F664h		; Operator type (See also DORES)
PADX	equ	0FC9Dh		; 
PADY	equ	0FC9Ch		; 
PARM1	equ	0F6E8h		; 
PARM2	equ	0F750h		; 
PATBAS	equ	0F926h		; 
PATWRK	equ	0FC40h		; 
PDIREC	equ	0F953h		; 
PLYCNT	equ	0FB40h		; 
PRMFLG	equ	0F7B4h		; 
PRMLEN	equ	0F6E6h		; 
PRMLN2	equ	0F74Eh		; 
PRMPRV	equ	0F74Ch		; 
PRMSTK	equ	0F6E4h		; 
PROCNM	equ	0FD89h		; Work area for CALL and OPEN (16 bytes)
PRSCNT	equ	0FB35h		; 
PTRFLG	equ	0F6A9h		; 
PUTPNT	equ	0F3F8h		; 
QUEBAK	equ	0F971h		; 
QUETAB	equ	0F959h		; 
QUEUEN	equ	0FB3Eh		; 
QUEUES	equ	0F3F3h		; 
RAWPRT	equ	0F418h		; 
REPCNT	equ	0F3F7h		; 
REQSTP	equ	0FC6Ah		; Flag for for STOP trap
RG0SAV	equ	0F3DFh		; VDP register 0 content
RG1SAV	equ	0F3E0h		; VDP register 1 content
RG2SAV	equ	0F3E1h		; VDP register 2 content
RG3SAV	equ	0F3E2h		; VDP register 3 content
RG4SAV	equ	0F3E3h		; VDP register 4 content
RG5SAV	equ	0F3E4h		; VDP register 5 content
RG6SAV	equ	0F3E5h		; VDP register 6 content
RG7SAV	equ	0F3E6h		; VDP register 7 content
RG8SAV	equ	0F3E7h		; VDP register 8 content
RG9SAV	equ	0F3E8h		; VDP register 9 content
RG10SAV	equ	0F3E9h		; VDP register 10 content
RG11SAV	equ	0F3EAh		; VDP register 11 content
RG12SAV	equ	0F3EBh		; VDP register 12 content
RG13SAV	equ	0F3ECh		; VDP register 13 content
RG14SAV	equ	0F3EDh		; VDP register 14 content
RG15SAV	equ	0F3EEh		; VDP register 15 content
RG16SAV	equ	0F3EFh		; VDP register 16 content
RG17SAV	equ	0FFF0h		; VDP register 17 content
RG18SAV	equ	0FFF1h		; VDP register 18 content
RG19SAV	equ	0FFF2h		; VDP register 19 content
RG20SAV	equ	0FFF3h		; VDP register 20 content
RG21SAV	equ	0FFF4h		; VDP register 21 content
RG22SAV	equ	0FFF5h		; VDP register 22 content
RG23SAV	equ	0FFF5h		; VDP register 23 content
RDPRIM	equ	0F380h		; Read from primary slot routine (5 bytes)
ROMA	equ	0FAFAh		; 
RNDX	equ	0F857h		; 
RSFCB	equ	0FB04h		; 
RSIQLN	equ	0FB06h		; 
RS2IQ	equ	0FAF5h		; 
RTPROG	equ	0F955h		; 
RTYCNT	equ	0FC9Ah		; 
RUNBNF	equ	0FCBEh		; 
SAVSP	equ	0FB36h		; 
SAVSTK	equ	0F6B1h		; 
SAVTXT	equ	0F6AFh		; 
SAVVOL	equ	0FB39h		; 
SCNCNT	equ	0F3F6h		; 
SCRMOD	equ	0FCAFh		; Current screen mode
SFTKEY	equ	0FBEBh		; 
SKPCNT	equ	0F94Fh		; 
SLTATR	equ	0FCC9h		; 
SLTTBL	equ	0FCC5h		; Current secondary slot table (4 bytes)
SLTWRK	equ	0FD09h		; 
STATFL	equ	0F3E7h		; 
STKTOP	equ	0F674h		; 
STREND	equ	0F6C6h		; 
SUBFLG	equ	0F6A5h		; 
SWPTMP	equ	0F7BCh		; 
TEMP	equ	0F6A7h		; 
TEMP2	equ	0F6BCh		; 
TEMP3	equ	0F69Dh		; 
TEMP8	equ	0F69Fh		; 
TEMP9	equ	0F7B9h		; 
TEMPPT	equ	0F678h		; 
TEMPST	equ	0F67Ah		; 
TOCNT	equ	0FB03h		; 
TRCFLG	equ	0F7C4h		; 
TRGFLG	equ	0F3E8h		; 
TRPTBL	equ	0FC4Ch		; 
TTYPOS	equ	0F661h		; 
TXTATR	equ	0F3B9h		; Unused
TXTCGP	equ	0F3B7h		; SCREEN 0 pattern generator table address
TXTCOL	equ	0F3B5h		; SCREEN 0 color table address
TXTNAM	equ	0F3B3h		; SCREEN 0 pattern name tabte address
TXTPAT	equ	0F3BBh		; Unused
TXTTAB	equ	0F676h		; Start address of the Basic program to load
T32ATR	equ	0F3C3h		; SCREEN 1 sprite attribute table address
T32CGP	equ	0F3C1h		; SCREEN 1 pattern generator table address
T32COL	equ	0F3BFh		; SCREEN 1 color table address
T32NAM	equ	0F3BDh		; SCREEN 1 pattern name table address
T32PAT	equ	0F3C5h		; SCREEN 1 sprite generator table address
USRTAB	equ	0F39Ah		; Addresses table of DEFUSR instruction (20 bytes)
VALTYP	equ	0F663h		; Variable type that is currently in DAC
VARTAB	equ	0F6C2h		; 
VCBA	equ	0FB41h		; 
VCBB	equ	0FB66h		; 
VCBC	equ	0FB8Bh		; 
VLZADR	equ	0F419h		; 
VLZDAT	equ	0F41Bh		; 
VOICAQ	equ	0F975h		; 
VOICBQ	equ	0F9F5h		; 
VOICBC	equ	0FA75h		; 
VOICEN	equ	0FB38h		; 
WINWID	equ	0FCA5h		; 
WRPRIM	equ	0F385h		; Write to primary slot routine (7 bytes)
XSAVE	equ	0FAFEh		; X-coordinate for Mouse/Trackball/Lightpen. (MSX2~)
YSAVE	equ	0FB00h		; Y-coordinate for Mouse/Trackball/Lightpen. (MSX2~)
ESLREG	equ	0FFFFh		; Extended slot register