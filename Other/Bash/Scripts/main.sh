# main.sh
# .sh - shell
#!/bin/bash
echo "Привет, Мир!\n Как вас зовут?"
read name
echo "Привет, $name! Добро пожаловать в Bash-скрипты!"
echo "Введите 1-е число:"
read num1
echo "Введите 2-е чило:"
read num2

echo "Сумма: $(($num1 + $num2))"
echo "Разность: $(($num1 - $num2))"
echo "Введите любое натуральное число:"
read number
if ((number > 10)); then
    echo "Число > 10"
elif ((number == 10)); then
    echo "Число = 10"
else
    echo "Число < 10"
fi
