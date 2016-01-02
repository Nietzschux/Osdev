# Makefile for JamesM's kernel tutorials.
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler
# rule, as we use nasm instead of GNU as.

SOURCES=boot.o main.o monitor.o common.o descriptor_tables.o isr.o interrupt.o gdt.o timer.o
CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector
LDFLAGS=-Tlink.ld
ASFLAGS=-felf

SRCS = $(wildcard *.c)

PROGS = $(patsubst %.c,%,$(SRCS))

all: $(PROGS)
	i686-elf-gcc $(CFLAGS)  -c  common.c


%: %.c
	i686-elf-gcc $(CFLAGS)  -c  $<
#.c.o:	i686-elf-gcc $(CFLAGS) -c $<
calllink: $(SOURCES) link
clean:
	-rm *.o kernel

link:
	i686-elf-ld $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<
