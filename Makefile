# Makefile hex2bin/mot2bin

CPFLAGS = -std=c99 -O2 -Wall -pedantic

# Compile
%.o : %.c
	gcc -c $(CPFLAGS) $< -o $@

WINDOWS = i686-w64-mingw32
WIN_GCC = $(WINDOWS)-gcc
WIN_STRIP = $(WINDOWS)-strip

INSTALL_DIR = /usr/local

all: hex2bin mot2bin

hex2bin: hex2bin.o common.o libcrc.o binary.o
	gcc -O2 -Wall -o hex2bin hex2bin.o common.o libcrc.o binary.o

mot2bin: mot2bin.o common.o libcrc.o binary.o
	gcc -O2 -Wall -o mot2bin mot2bin.o common.o libcrc.o binary.o

windows:
	$(WIN_GCC) $(CPFLAGS) -o Win64/hex2bin.exe hex2bin.c common.c libcrc.c binary.c
	$(WIN_GCC) $(CPFLAGS) -o Win64/mot2bin.exe mot2bin.c common.c libcrc.c binary.c
	$(WIN_STRIP) Win64/hex2bin.exe
	$(WIN_STRIP) Win64/mot2bin.exe

install:
	strip hex2bin
	strip mot2bin
	cp hex2bin mot2bin $(INSTALL_DIR)/bin

clean:
	rm -rf *.o hex2bin mot2bin
