#!/bin/bash
# Чтение файла построчно
while IFS= read -r line; do
    echo "Строка: $line"
done < "function.sh"