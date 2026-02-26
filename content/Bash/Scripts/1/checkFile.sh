#!/bin/bash

echo "Введите имя файла: "
read filename

if [ -f "$filename" ]; then
    echo "Файл $filename существует!"
else
    echo "Файл $filename не найден."
fi