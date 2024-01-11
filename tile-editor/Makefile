
default: image

main.bin: main.asm
	~/local/bin/rasm main.asm -o main

test.dsk:
	dskform -type dsk -format cpcdata test.dsk

main.prg: main.bin
	~/local/bin/addamsdosheader main.bin main.prg b 0x2000 0x2000

image: test.dsk main.prg
	~/local/bin/cpmcp -f cpcdata test.dsk main.prg 0:main.prg

clean:
	rm -f *.bin test.dsk *.prg

