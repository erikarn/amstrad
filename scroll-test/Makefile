
default: image

test.bin: test.z80
	z80asm -i test.z80 -o test.bin

test.dsk:
	dskform -type dsk -format cpcdata test.dsk

test.prg: test.bin
	~/local/bin/addamsdosheader test.bin test.prg b 0xa000 0xa000

image: test.dsk test.prg
	~/local/bin/cpmcp -f cpcdata test.dsk test.prg 0:test.prg

clean:
	rm -f *.bin test.dsk *.prg

