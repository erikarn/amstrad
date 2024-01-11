SCR_SET_MODE		EQU $BC0E
SCR_SET_INK		EQU $BC32
SCR_SET_BORDER		EQU $BC38

GRA_MOVE_ABSOLUTE	EQU $BBC0
GRA_MOVE_RELATIVE	EQU $BBC3
GRA_SET_ORIGIN		EQU $BBC9

GRA_LINE_ABSOLUTE	EQU $BBF6
GRA_LINE_RELATIVE	EQU $BBF9

GRA_FILL		EQU $BD52
GRA_SET_PEN		EQU $BBDE


; In: H = col, L = row
; Out: HL = top left corner address, B width in bytes
SCR_CHAR_POSITION	equ $BC1A

; In: HL = Y, DE = X
; Out: HL = screen address, C = mask, B = num pixels in byte - 1
SCR_DOT_POSITION	equ $BC1D

; In: HL = screen address
; Out: HL = next line screen address
SCR_NEXT_LINE		equ $BC26
