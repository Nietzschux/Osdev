#ifndef _KERNEL_TTY_H
#define _KERNEL_TTY_H

#include <stddef.h>

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <defines.h>





void terminal_initialize(void);
void terminal_scroll(void);
void terminal_putchar(char c);
void terminal_write(const char* data, size_t size);
void terminal_writestring(const char* data);
void terminal_flush(void);

#endif
