
;;============================================================================================
;; read byte from address pointed to IX with roms disabled
;; (used by cassette functions to read/write to RAM)
;;
;; IX = address of byte to read
;; C' = current rom selection and mode

; NOTE: This is also copied into the high jumpblock, but it isn't a published
; API?  So include it in the ROM.

read_byte_from_address_pointed_to_IX_with_roms_disabled:
        exx                       ; switch to alternative register set

        ld      a,c               ; get rom configuration
        or      $0c               ; %00001100 (disable upper and lower rom)
        out     (c),a             ; set the new rom configuration

        ld      a,(ix+$00)        ; read byte from RAM

        out     (c),c             ; restore original rom configuration
        exx                       ; switch back from alternative register set
        ret                       ;

