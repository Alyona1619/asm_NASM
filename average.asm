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


        mov       rax, 60
        xor       rdi, rdi
        syscall

section   .data
