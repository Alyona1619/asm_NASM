section .text
global main
extern printf

main:
    finit
    fild dword [num]
    fsqrt
    fist dword [result]


    push rbp

    mov rdi, format
    mov rsi, [result]
    call printf

    pop rbp

    mov rax, 60
    xor rdi, rdi
    syscall


section .data
    format db "Square root: %d", 0xA   
    num dd 144    
    result dd 0  
