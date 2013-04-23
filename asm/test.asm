.text 
.code 32 

    b reset // Reset
    b . // Undefined instruction
    b . // Software interrupt
    b . // Prefetch abort
    b . // Data abort
    b . // Reserved
    b . // IRQ
    b . // FIQ

.string "Armem test binary"
.align 4

reset:
    mov r0, #10
    subs r0, r0, #1
    bne reset
    swi 1
