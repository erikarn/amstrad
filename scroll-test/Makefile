
test.bin: test.z80
	z80asm -i test.z80 -o test.bin

blank:
	dskform -type dsk -format cpcdata test.dsk

image: test.dsk
	cpmcp -f cpcdata test.dsk test.bin 0:test.bin


default: test.bin

clean:
	rm -f *.bin

