
; a test to have something to draw line based art
; based on a vector list.

; Populate the ink list
; HL = pointer to border and ink list
; B = number of inks in the pen list - so mode 1, mode 2 screens don't require
; all of the inks populated.
;
; exit: HL points to address after ink list,
; everything else is corrupted.
;
populate_ink_list:
					; populate border ink
	PUSH BC
	LD A, (HL)
	LD B, A
	LD C, A
	PUSH HL
	CALL SCR_SET_BORDER
	POP HL
	POP BC

	INC HL				; next ink

					; populate screen inks
	XOR A				; start at 0
loop:
	PUSH BC
	PUSH AF
	LD A, (HL)			; get the pen colour
	LD B, A
	LD C, A
	POP AF				; A is again the ink colour
	PUSH HL
	CALL SCR_SET_INK
	POP HL
	POP BC
	INC HL				; next ink in memory
	INC A				; next pen number
	DJNZ loop

	RET

; Populate the screen mode
;
; HL - points to screen address mode byte
;
; Return: HL points after screen address mode byte,
; everything else corrupted
;
screen_mode_setup:
	LD A, (HL)
	PUSH HL
	CALL SCR_SET_MODE
	POP HL
	INC HL
	RET

; Set the screen origin to the middle of the screen.
;
screen_set_origin_middle:
	LD DE, 320
	LD HL, 200
	CALL GRA_SET_ORIGIN
	RET

screen_setup:
	call screen_mode_setup
	call populate_ink_list
;	call screen_set_origin_middle
	RET

