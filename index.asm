default rel
%include "consts.inc"

section .bss
  buf resb BUF_SIZE

section .text
global _start
_start:
  call read
  call atoi
  mov r12, rax
  movzx r13d, byte [rsi]
  inc rsi

  call atoi

  cmp r13b, '+'
  je .add

  cmp r13b, '-'
  je .sub

  jmp .exit

  .add:
    add rax, r12
    jmp .out
  .sub:
    sub r12, rax
    mov rax, r12
  .out:
    call itoa
    mov eax, 1
    mov edi, 1
    syscall
  .exit:

  ; exit
  mov eax, 60
  xor edi, edi
  syscall


  %include "libs/atoi1.asm"
  %include "libs/itoa1.asm"
  %include "libs/read.asm"
