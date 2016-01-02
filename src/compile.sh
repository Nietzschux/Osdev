#! /bin/sh
export PATH="$HOME/opt/cross/bin:$PATH"
rm *.iso
make
make calllink
cp kernel isodir/boot/myos.bin
grub-mkrescue -o myos.iso isodir
qemu-system-i386 -cdrom myos.iso
make clean
