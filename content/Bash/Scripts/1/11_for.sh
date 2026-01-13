#!/bin/bash
# for.sh
# Несколько разных циклов for
for i in 1 2 3 4 5; do
    echo "Итерации: $i"
    sleep 0.5
done

for i in {1..5}; do
    echo "Число: $i"
    sleep 0.5
done

for file in *.txt; do
    echo "Обрабатываю файл: $file"
    sleep 0.5
done

