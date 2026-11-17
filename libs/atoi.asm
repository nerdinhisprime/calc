section .text
atoi:
  xor eax, eax            ; обнуляет eax
  .atoi_loop:
    movzx ecx, byte [rsi] ; пишет первый байт rsi в ecx (читает слева на право)
    sub ecx, '0'          ; отнимает у ecx - 48
    cmp ecx, 9            ; вычитает из разности (ecx - 48) - 9
    ja .atoi_ret          ; если разность (ecx - 48) > 9, тогда прыгает к .atoi_ret (выходит из цикл)
    imul eax, eax, 10     ; пишет в eax результат умножения eax на 10
    add eax, ecx          ; прибавляет к eax байт ecx
    inc rsi               ; прибавляет 1 к rsi (смещает курсор вправо)
    jmp .atoi_loop        ; возобновляет цикл
    .atoi_ret:
      ret
