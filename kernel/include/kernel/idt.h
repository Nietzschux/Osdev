#ifndef _KERNEL_IDT_H
#define _KERNEL_IDT_H
#include <defines.h>
void loadIDTR();//sets up IDT by loading IDTR
void AddInt(int number, void (*handler)(), dword dpl); //add interrupt


#endif
