;Jumblock symbols for the Amstrad CPC464/664/6128

;Auto-created from work by Dave Cantrell
;http://www.cantrell.org.uk/david/tech/cpc/cpc-firmware/

;Firmware indirections
;These are called by the firmware and can be patched to change standard behaviour
TXT_DRAW_CURSOR      EQU $BDCD
TXT_UNDRAW_CURSOR    EQU $BDD0
TXT_WRITE_CHAR       EQU $BDD3
TXT_UNWRITE          EQU $BDD6
TXT_OUT_ACTION       EQU $BDD9
GRA_PLOT             EQU $BDDC
GRA_TEST             EQU $BDDF
GRA_LINE             EQU $BDE2
SCR_READ             EQU $BDE5
SCR_WRITE            EQU $BDE8
SCR_MODE_CLEAR       EQU $BDEB
KM_TEST_BREAK        EQU $BDEE
MC_WAIT_PRINTER      EQU $BDF1
KM_SCAN_KEYS         EQU $BDF4


; Things called by firmware with Adrian's relocations
JB_TXT_WR_CHAR          EQU $BB5D
JB_TXT_GET_WINDOW       EQU $BB69
JB_TXT_GET_CURSOR       EQU $BB78
JB_TXT_CUR_ON EQU $BB81
JB_TXT_CUR_OFF EQU $BB84
JB_TXT_OUTPUT EQU $BB5A
JB_KM_WAIT_KEY EQU $BB18
JB_KM_FLUSH EQU $BD3D
JB_KM_TEST_KEY EQU $BB1E
JB_TXT_SET_COLUMN EQU $BB6F
JB_SOUND_RESET EQU $BCA7
JB_HI_KL_LDIR EQU $B91B
JB_HI_KL_LDDR EQU $B91E
