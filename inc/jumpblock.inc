; In: A = mode
SCR_SET_MODE		EQU $BC0E

; In: A = pen, B = colour 1, C = colour 2
SCR_SET_INK		EQU $BC32

; In: B = colour 1, C = colour 2
SCR_SET_BORDER		EQU $BC38

; In: DE = X, HL = Y
GRA_MOVE_ABSOLUTE	EQU $BBC0

; In: DEL = X, HL = Y
GRA_MOVE_RELATIVE	EQU $BBC3

; In: DE = X, HL = Y
GRA_SET_ORIGIN		EQU $BBC9

; In: DE = X, HL = Y
GRA_LINE_ABSOLUTE	EQU $BBF6

; In: DE = X, HL = Y
GRA_LINE_RELATIVE	EQU $BBF9

; Fill at current graphics coordinate
; In: A = pen to fill, HL = fill buffer address, DE = fill buffer length
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
