#!/bin/bash
# Счётчик строк в файлах
# line-counter-v1.sh

echo "Введите путь к файлу:"
read filepath

if [ -f "$filepath" ]; then
    line_count=$(wc -l < "$filepath")
    echo "Файл: $filepath"
    echo "Количество строк: $line_count"
else
    echo "Ошибка: файл '$filepath' не существует или это не файл"
fi