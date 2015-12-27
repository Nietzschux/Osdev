# Declare constants used for creating a multiboot header.
.set ALIGN,    1<<0             # align loaded modules on page boundaries
.set MEMINFO,  1<<1             # provide memory map
.set FLAGS,    ALIGN | MEMINFO  # this is the Multiboot 'flag' field
.set MAGIC,    0x1BADB002       # 'magic number' lets bootloader find the header
.set CHECKSUM, -(MAGIC + FLAGS) # checksum of above, to prove we are multiboot

# Declare a header as in the Multiboot Standard.
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

# Reserve a stack for the initial thread.
.section .bootstrap_stack, "aw", @nobits
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

# The kernel entry point.
.section .text
.global _start
.type _start, @function



[global _int00]
_int00:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_00    ; Divide by Zero #DE
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int01]
_int01:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_01    ; Debug #DB
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int02]
_int02:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_02    ; NMI interrupt #--
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int03]
_int03:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_03    ; Breakpoint #BP
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int04]
_int04:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_04    ; Overflow #OF
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int05]
_int05:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_05    ; Bound Range Exception #BR
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int06]
_int06:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_06    ; Invalid Opcode #UD
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int07]
_int07:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_07    ; Device Not Available #NM
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int08]
_int08:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_08    ; Double Fault #DF
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret


[global _int09]
_int09:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_09    ; Coprocessor Segment Overrun
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int10]
_int10:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_10    ; Invalid Task State Segment (TSS) #TS
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int11]
_int11:
     pusha
     push ds
     push es
     push fs
     push gs
     mov eax,0x10    ; Data segment
     mov ds,eax
     mov es,eax
     cld
     call _int_11    ;  Segment Not Present #NP
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int12]
_int12:
     pusha
     push ds
     push es
     push fs
     push gs
     mov eax,0x10    ; Data segment
     mov ds,eax
     mov es,eax
     cld
     call _int_12    ; Stack Segment Fault #SS
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int13]
_int13:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_13    ; General Protection Fault (GPF) #GP
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int14]
_int14:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_14    ; Page Fault #PF
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

;; Exception 15 is an Intel Reserved Interrupt

[global _int16]
_int16:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_16    ; x87 Floating-Point Error #MF
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int17]
_int17:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_17    ; Alignment Check #AC
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[global _int18]
_int18:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_18    ; Machine Check #MC
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

[extern _int_19]
[global _int19]
_int19:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _int_19    ; SIMD Floating-Point Exception #XF
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret

;; Exceptions 20-31 are Intel Reserved Interrupts

;; E n d   o f   E x c e p t i o n s   I n t e r r u p t s

[global _int32]
_int32:
     pusha
     push ds
     push es
     push fs
     push gs
     mov $0x10,$eax    ; Data segment
     mov $eax,$ds
     mov $eax,$es
     cld
     call _testint   ; Test Interrupt Handler
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret






_start:
	movl $stack_top, %esp

	# Initialize the core kernel before running the global constructors.
	call kernel_early

	# Call the global constructors.
	call _init

	# Transfer control to the main kernel.
	call kernel_main

	# Hang if kernel_main unexpectedly returns.
	cli
.Lhang:
	hlt
	jmp .Lhang
.size _start, . - _start
