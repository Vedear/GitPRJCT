#!/bin/bash
# myScript.sh
echo "Это мой первый скрипт"
echo "Содержимое текущей директории: $(ls)" 
echo "Текущая директория: $(pwd)"
echo "Текущее время: $(date)"
echo "Сумма 2 + 2 = $((2+2))"
for i in 1 2 3 4 5; do
    echo "$i раз(a)"
    sleep 0.5
done

while true; do
    echo "Останови меня!"
    sleep 0.1
done