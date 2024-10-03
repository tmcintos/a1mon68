all: a1mon68.bin

clean:
	$(RM) a1mon68.bin a1mon68.p a1mon68.lst

a1mon68.bin: a1mon68.p
	p2bin a1mon68.p a1mon68.bin

a1mon68.p: a1mon68.asm
	asl -l a1mon68.asm > a1mon68.lst
