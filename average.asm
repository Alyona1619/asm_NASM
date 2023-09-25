%macro pushd 0
	push rax
	push rbx
	push rcx
	push rdx
%endmacro

%macro popd 0
	pop rdx
	pop rcx
	pop rbx
	pop rax
%endmacro

%macro print 1
    pushd
    push rdi
    mov rdi, message
    mov rsi, %1
    call printf
    pop rdi
    popd
%endmacro

section   .text
global    main
extern printf

_start:


finish:
        mov       rax, 60
        xor       rdi, rdi
        syscall

section   .data
    x dd 5, 3, 2, 6, 1, 7, 4
    y dd 0, 10, 1, 9, 2, 8, 5
    len dd ($ - x) / 4
    format db "Average: %d", 0xA

section .bss
    result resb 1
