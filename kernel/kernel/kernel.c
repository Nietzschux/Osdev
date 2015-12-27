#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <defines.h>
#include <kernel/pic.h>
#include <kernel/tty.h>
#include <kernel/panic.h>
#include <kernel/interrupts.h>

void kernel_early(void)
{
	terminal_initialize();
}
//A20 Line is enabled and PMode
void kernel_main(void)
{
  /*  int before = -1;
    int after = abs(before);
		//int enough = (int)((ceil(log10(num))+1)*sizeof(char))
		//char* str[5];
		//itoa(after,str,10);*/
  	printf("Hello, kernel World!\n");
    //printf("La valeur absolue de -1 est: %s",str);
		terminal_flush();
		INTS(false);
		remapPIC(0x20,0x28);
		puts("8259 PIC Remapped.");
		LoadExceptions();
		puts("Exceptions loaded.");



}
