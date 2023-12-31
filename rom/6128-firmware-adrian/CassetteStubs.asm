;;CASSETTE ROUTINES

CAS_INITIALISE:
	scf
	ret

CAS_NOISY:
	scf
        ret                       ;{{24e4:c9}} 

CAS_IN_OPEN:
	scf
	ret                       ;{{24fd:c9}} 

CAS_OUT_OPEN:
	scf                       ;{{254e:37}} 
	ret                       ;{{254f:c9}} 

CAS_IN_CLOSE:
	scf
	ret

CAS_IN_ABANDON:
	scf
	ret

CAS_OUT_CLOSE:
	scf
	ret

CAS_OUT_ABANDON:
	scf
	ret

CAS_IN_CHAR:
	scf
	ret

CAS_OUT_CHAR:
	scf
	ret

CAS_TEST_EOF:
	scf
	ret

CAS_RETURN:
	scf
	ret

CAS_IN_DIRECT:
	scf
	ret

CAS_OUT_DIRECT:
	scf
	ret

;;============================================================================
;; CAS CATALOG
;;
;; DE = address of 2k buffer

CAS_CATALOG:
	scf
	ret

CAS_READ:
	scf
	ret

CAS_WRITE:
	scf
	ret

CAS_CHECK:
	scf
	ret

CAS_START_MOTOR:
	scf
	ret

CAS_STOP_MOTOR:
	scf
	ret

CAS_RESTORE_MOTOR:
	scf
	ret

CAS_SET_SPEED:
	scf
	ret
