# #!/bin/bash
nasm -f elf64 "$1.asm" -o "bin.o" || echo 'try ./run.sh <filename>'
ld "bin.o" -o "bin"
rm "bin.o"
./"bin"
