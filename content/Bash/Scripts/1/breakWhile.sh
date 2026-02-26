#!/bin/bash
# Бесконечный цикл с break
while true; do
    echo "Введите 'stop' для выхода: "
    read input
    if [ "$input" = "stop" ]; then
        break
    fi
done
