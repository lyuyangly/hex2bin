# Makefile hex2bin/mot2bin

CPFLAGS = -std=c99 -O2 -Wall -pedantic

# Compile
%.o : %.c
	gcc -c $(CPFLAGS) $< -o $@

all: hex2bin mot2bin

hex2bin: hex2bin.o common.o libcrc.o binary.o
	gcc -O2 -Wall -o hex2bin hex2bin.o common.o libcrc.o binary.o

mot2bin: mot2bin.o common.o libcrc.o binary.o
	gcc -O2 -Wall -o mot2bin mot2bin.o common.o libcrc.o binary.o

clean:
	@rm -rf *.o hex2bin mot2bin

