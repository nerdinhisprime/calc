section .text
itoa:
  lea rsi, [buf + BUF_SIZE - 1]
  mov byte [rsi], 10
  mov r8, rax
  mov ecx, 10
  test rax, rax
  jns .loop
  neg rax
  .loop:
    xor edx, edx
    div rcx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz .loop
  test r8, r8
  jns .len
  dec rsi
  mov byte [rsi], '-'
  .len:
    lea rdx, [buf + BUF_SIZE]
    sub rdx, rsi
    ret
