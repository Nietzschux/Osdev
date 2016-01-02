#include <kernel/pic.h>
#include <kernel/io.h>
#include <stdio.h>
#include <defines.h>



void INTS(bool on)
{
  if(on)
	{
		asm("sti");
    puts("interrupt disabled!");
	}
	else
	{
		asm("cli");
    puts("interrupt enabled!");
	}
}


void remapPIC(int pic1, int pic2)
{
// fonctionondefinie();
  byte md,sd;
  md =inb(MASTERDATA);
  sd =inb(SLAVEDATA);
  outb(MASTER,EOI); //send EOI
  io_wait();

  outb(MASTER,ICW1_INIT+ICW1_ICW4);
  io_wait();
  outb(SLAVE,ICW1_INIT+ICW1_ICW4);
  io_wait();

  outb(MASTERDATA,pic1);
  io_wait();
  outb(SLAVEDATA,pic2);
  io_wait();

  outb(MASTERDATA,0x04);
  io_wait();
  outb(SLAVEDATA,0x02);
  io_wait();

  outb(MASTERDATA,ICW4_8086);
  io_wait();
  outb(SLAVEDATA,ICW4_8086);
  io_wait();

  outb(MASTERDATA,md);                    // restore both MASTER DATA
  io_wait();
  outb(SLAVEDATA,sd);
  io_wait();

}

void maskIRQ(byte irq)
{
	if(irq==ALL)
	{
		outb(MASTERDATA,0xFF);
		outb(SLAVEDATA,0xFF);
	}
	else
	{
		irq = irq | (1<<irq);
		if(irq < 8)
			outb(MASTERDATA, irq&0xFF);
		else
			outb(SLAVEDATA, irq>>8);
	}
}
