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

main:   
	mov rax, 0

subbing:
	cmp rax, [len]
	jz average
	mov ebx, [x+rax*4]
	sub ebx, [y+rax*4]
	mov ecx, [result]
    add ecx, ebx
	mov [result], ecx
	inc rax
	jmp subbing
	
average:
	xor rax, rax
    xor ecx, ecx
    mov rax, [result]
    mov ecx, [len]
    cdq
    idiv ecx
    mov [result], rax

finish:
    print [result]

    mov       rax, 60
    xor       rdi, rdi
    syscall

section   .data
	message db "Average: %d", 10, 0
	x dd 5, 3, 2, 6, 1, 7, 4
    len dd ($ - x) / 4
	y dd 0, 10, 1, 9, 2, 8, 5
	

section .bss
    result resb 1
