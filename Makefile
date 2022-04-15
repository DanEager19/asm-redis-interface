NAME=redis-interface

all: redis-interface

clean:
	rm -rf redis-interface redis-interface.o

redis-interface: redis-interface.asm
	nasm -f elf -F dwarf -g redis-interface.asm
	gcc -no-pie -g -m32 -o redis-interface redis-interface.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
