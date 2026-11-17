section .text
atoi:
  xor eax, eax
  xor r8d, r8d
  cmp byte [rsi], '-'
  jne .loop
  inc r8d
  inc rsi
  .loop:
    movzx ecx, byte [rsi]
    sub ecx, '0'
    cmp ecx, 9
    ja .done
    imul rax, rax, 10
    add rax, rcx
    inc rsi
    jmp .loop
  .done:
    test r8d, r8d
    jz .ret
    neg rax
  .ret:
    ret
