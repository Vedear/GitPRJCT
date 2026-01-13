#!/bin/bash
# create-project.sh
# Создатель структуры проектов

# Название проекта (можно изменить)
PROJECT_NAME="my-project"

echo "Создание структуры проекта: $PROJECT_NAME"

# Создаем основную директорию
mkdir -p "$PROJECT_NAME"

# Создаем поддиректории
mkdir -p "$PROJECT_NAME/css"
mkdir -p "$PROJECT_NAME/js"

# Создаем файлы
touch "$PROJECT_NAME/index.html"
touch "$PROJECT_NAME/css/style.css"
touch "$PROJECT_NAME/js/script.js"

echo "Структура создана:"
echo "$PROJECT_NAME/"
echo "├── index.html"
echo "├── css/"
echo "│   └── style.css"
echo "└── js/"
echo "    └── script.js"