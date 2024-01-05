
; Populate DE and HL with X and Y coordinates.
;
; IX has the address to use.  IX+0 is assumed to be
; the command byte and will be skipped over.
;
populate_de_hl_coords:
	LD D, (IX+1)
	LD E, (IX+2)
	LD H, (IX+3)
	LD L, (IX+4)
	RET


; Handle command.
;
; Return with C set if this was a FINISH command.
;
handle_command:
	LD A, (IX+0)

	CP CMD_FINISH
	JR NZ, next1

finish_cmd:
	SCF
	RET

next1:
	CP CMD_MOVE_ABS
	JR NZ, next2

	CALL populate_de_hl_coords
	CALL GRA_MOVE_ABSOLUTE
	LD BC, 5
	JR next_cmd

next2:
	CP CMD_MOVE_REL
	JR NZ, next3

	CALL populate_de_hl_coords
	CALL GRA_MOVE_RELATIVE
	LD BC, 5
	JR next_cmd

next3:
	CP CMD_LINE_ABS
	JR NZ, next4

	LD A, (IX+5)
	CALL GRA_SET_PEN
	CALL populate_de_hl_coords
	CALL GRA_LINE_RELATIVE
	LD BC, 6
	JR next_cmd

next4:
	CP CMD_LINE_REL
	JR NZ, next5

	LD A, (IX+5)
	CALL GRA_SET_PEN
	CALL populate_de_hl_coords
	CALL GRA_LINE_ABSOLUTE
	LD BC, 6
	JR next_cmd

next5:
	CP CMD_FILL
	JR NZ, next6

	LD A, (IX+1)			; pen to fill with
	LD HL, fill_buffer_address
	LD DE, fill_buffer_len
	CALL GRA_FILL
	LD BC, 2
	JR next_cmd

next6:
err_cmd:
	SCF
	RET

next_cmd:
	ADD IX, BC
	CCF
	RET
