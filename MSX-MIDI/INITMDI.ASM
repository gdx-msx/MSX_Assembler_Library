
; Effect: Initialize MIDI Interface 
; Return: None
; Modifies: AF, HL


TIMER0	equ	0ECh		;Timer 0 du 8253
TIMER2	equ	0EEh		;Timer 2 du 8253
TM_CMD	equ	0EFh		;Registre de commande du 8253

INIMDI: 
; 
; MIDI baud rate generator 
; 
	ld	a,00010110b		;Commande de controle du 8253
;		  |||||||+------- Timer en mode binaire
;		  ||||+++-------- Mode 3 : Générateur de signal (signal carré)
;		  ||++----------- Lecture/Écriture de l'octet le moins significatif
;		  ++------------- Timer 0 for Baud Rate Generater of 8251
	out	(TM_CMD),a 
	ld	a,8			;4MHz / 8 = 500KHz
	out	(TIMER0),a		;Réglage des bits de point fort du timer 0 (8253)
; 
; 5msec timer 
; 
	ld	a,10110100b		;Commande de controle du 8253
;		  |||||||+------- Timer en mode binaire
;		  ||||+++-------- Mode 2 : Générateur de la cadence
;		  ||++----------- Lecture/Écriture de 2 octets
;		  ++------------- Timer 2 cadencé à 5msec 
	out	(TM_CMD),a 
	ld	hl,20000 
	ld	a,l
	out	(TIMER2),a		;Règle l'octet de point faible du Timer du 8253
	ld	a,h 
	out	(TIMER2),a		; Règle l'octet de point fort du Timer du 8253

;Initialise le 8251

UARTcmd	equ	0E9h		;0E1h par défaut si MSX-MIDI  externe

	xor	a 
	out	(UARTcmd),a		;Ecrit 0 
	call	MID_WAIT 
	out	(UARTcmd),a		;Ecrit 0 
	call	MID_WAIT 
	out	(UARTcmd),a		;Ecrit 0 
	call	MID_WAIT 
	ld	a,40h 
	out	(UARTcmd),a		;puis 40h 
	call	MID_WAIT