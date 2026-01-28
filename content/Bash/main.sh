#!/bin/bash - шибэнг
# main.sh
# Пример bash скрипта
echo "Привет, Мир!"
echo "Hello, World!"
echo "Mы находимся в директории: $(pwd)"
echo "Текущий пользователь ОС: $USERNAME"
echo "Как вас зовут?"
read name
echo "Привет, $name! Добро пожаловать в Bash-скриптинг!"
sleep 1
mkdir New && touch New/new.txt
echo "Введите 1-е число:"
read num1
echo "Введит 2-е число:"
read num2

echo "Сумма $(($num1 + $num2))"
# отнять, умножить и разделить сделайте самостоятельно

echo "Введите любое натуральное число"
read number # Создайние переменной number
if (( number > 10 )); then
    echo -e "\033[35mВаше чило > 10\033[0m"
elif (( number == 10 )); then
    echo "Числа равны"
else
    echo "Ваше число < 10"
fi

read number # Вызов переменной number (использование)