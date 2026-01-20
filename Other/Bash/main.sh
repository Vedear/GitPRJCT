#!/bin/bash
# - комментарии
echo "Привет!"
echo "Как тебя зовут?"
read name

echo "Привет, $name! Добро пожаловать в Bash-скриптинг!"
# Простой арифметический калькулятор
echo "Введите 1-е любое число"
read num1
echo "Введите 2-е любое число"
read num2

echo "Сумма: $(($num1 + $num2))"
echo "Разность: $(($num1 - $num2))"

echo "Введите любое натуральное число"
read number

if (( number > 10 )); then
    echo -e "\033[33m[Число > 10]\033[0m"
elif (( number == 10 )); then
    echo -e "\033[31m[Число = 10]\033[0m"
else
    echo -e "\033[31m[Число < 10]\033[0m"
fi
