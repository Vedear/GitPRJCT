#!/bin/bash
# isEven.sh
# Проверка чётности числа
echo "Введите натуральное число: "
read number

if (( number % 2 == 0 )); then
    echo "Число $number - чётное"
else
    echo "Число $number - нечётное"
fi