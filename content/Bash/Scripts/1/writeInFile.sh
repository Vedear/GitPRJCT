#!/bin/bash
# Запись в файл
echo "Это 1-я строка" > output.txt
echo "Это 2-я строка" >> output.txt
# После работы цикла for предыдущие записи будут удалены
for i in {1..9}; do echo ""; done > output.txt
echo "Это 10-я строка" >> output.txt