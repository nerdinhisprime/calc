section .text
read:
  xor eax, eax
  xor edi, edi
  lea rsi, [buf]
  mov edx, BUF_SIZE
  syscall
  ret
