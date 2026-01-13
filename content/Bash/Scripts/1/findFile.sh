#!/bin/bash
# find-files-v1.sh
# Поиск файла по его расширению в текущей директории
echo "Введите расширение файла (без точки):"
read extension

echo "Ищем файлы с расширением .$extension"
echo "-----------------------------------"

count=0

for file in *."$extension"; do
    if [ -f "$file" ]; then
        echo "$file"
        count=$((count + 1))
    fi
done

echo "-----------------------------------"
echo "Найдено файлов: $count"