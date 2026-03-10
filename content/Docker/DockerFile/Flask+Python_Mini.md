## Dockerfile. Flask+Python (мини-проект)

> Никогда в разработке не используйте русские имена файлов и каталогов!
> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

Простой `Dockerfile` для небольшого веб-приложения на **Python** с использованием **Flask**

- **Dockerfile** - рецепт приготовления Docker-образа
- **Flask** — микрофреймворк для создания веб-приложений на языке программирования **Python**

### 1. Структура проекта

Одной bash-командой создать всю структуру нового проекта:
```shell
mkdir -p simple_flask_app && touch simple_flask_app/app.py simple_flask_app/requirements.txt simple_flask_app/Dockerfile
```

Общая структура проета должна выглядеть так:
```shell
simple_flask_app/
├── app.py              # простое Flask-приложение
├── requirements.txt    # список зависимостей Python
└── Dockerfile          # инструкции для сборки образа
└── .dockerignore       # чтобы исключить ненужные файлы сборки
```

### 2. Файл `requirements.txt`:
```
Flask==3.0.0
```

### 3. Файл `Dockerfile`:
```dockerfile
# Базовый образ – официальный легковесный Python
FROM python:3.11-slim
# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app
# Копируем файл с зависимостями сначала (используем кэш слоёв)
COPY requirements.txt .
# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt
# Копируем остальные файлы проекта
COPY . .
# Указываем, какой порт будет слушать приложение внутри контейнера
EXPOSE 5000
# Команда для запуска приложения
CMD ["python", "app.py"]
```

### 4. Файл `.dockerignore`
```shell
__pycache__
*.pyc
.git
.env
```

### 5. Сборка образа

В командной строке, находясь в папке `simple_flask_app`, выполнить:
```shell
docker build -t my-flask-app .
```

### 6. Запуск контейнера
```shell
docker run -d --name my-running-app -p 8082:5000 my-flask-app
```

### 7. Проверка работы

[Откройте браузер и перейдите по адресу http://localhost:8082](http://localhost:8082)

