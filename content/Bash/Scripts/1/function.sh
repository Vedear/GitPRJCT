#!/bin/bash
# function.sh
# Определение функции
приветствие() {
    local name=$1
    echo "Привет, $name!"
}

hello() {
    local hello=$1
    echo "Привет, $hello"
}

sum() {
    local a=$1
    local b=$2
    return $((a + b))
}

# Вызов функции
приветствие "Мир"
hello " World!"
sum 2 2
echo "Результат: $?"