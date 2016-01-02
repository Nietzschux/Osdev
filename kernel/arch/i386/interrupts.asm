[extern _int_00]
[global _int00]
_int00:
     pusha
     push ds
     push es
     push fs
     push gs
     mov eax,0x10    ; Data segment
     mov ds,eax
     mov es,eax
     cld
     call _int_00    ; Divide by Zero #DE
     pop gs
     pop fs
     pop es
     pop ds
     popa
     iret
