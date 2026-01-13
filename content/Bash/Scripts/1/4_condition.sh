#!/bin/bash
# condition.sh
# Сравнение чисел
echo "Введите число:"
read number

if (( number > 10 )); then
    echo "Число > 10"
elif (( number == 10 )); then
    echo "Число = 10"
else
    echo "Число < 10"
fi