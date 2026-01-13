#!/bin/bash
# diffStr.sh
# Сравнение строк
str1="cap"
str2="word"

if [[ "$str1" < "$str2" ]]; then
    echo "'$str1' в алф.пор. перед '$str2'"
fi

if [[ "$str1" > "uncorn" ]]; then
    echo "'$str1' в алф.пор. после 'unicorn'"
fi