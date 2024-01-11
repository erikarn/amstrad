
; Populate the ink list
; HL = pointer to border and ink list
; B = number of inks in the pen list - so mode 1, mode 2 screens don't require
; all of the inks populated.
;
; Note - currently doesn't support two inks for firmware
; flashing. Would be easy to support.
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

	INC HL				; next ink in list

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
