#!/bin/bash
# while.sh
# Цикл до пяти с задержкой
counter=1

while (( counter <= 5 )); do
    echo "Счётчик: $counter"
    ((++counter))
    sleep 0.5
done