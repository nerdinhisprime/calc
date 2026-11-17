section .text
itoa:
  lea rsi, [buf + BUF_SIZE]         ; создает эффективный адрес (запись байтов будет справа на лево)
  mov ecx, 10                       ; задает число для деления
  .itoa_loop:
    xor edx, edx                    ; обнуляет rdx
    div ecx                         ; делит edx:eax на ecx (10) (частное в eax, остаток в edx)
    add dl, '0'                     ; прибавляет 48 (код 0 - ASCII) к остатку деления - dl
    dec rsi                         ; смещает адрес rsi влево на 1 байт
    mov [rsi], dl                   ; записываем код цифры в байт rsi
    test eax, eax                   ; проверяем eax != 0
    jnz .itoa_loop                  ; прыгнет на .itoa_loop если eax не 0
    lea rdx, [buf + BUF_SIZE]       ; создаем эффективный адрес
    sub rdx, rsi                    ; (buf + BUF_SIZE) - rsi
    ret
