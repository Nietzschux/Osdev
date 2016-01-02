
#ifndef _KERNEL_IO_H
#define _KERNEL_IO_H
#include <stdint.h>
#include <defines.h>

__inline__  void outb(uint16_t,uint8_t);
__inline__  uint8_t inb(uint16_t);
__inline__  void outportw(dword port,dword value);
__inline__  void io_wait(void);



#endif
