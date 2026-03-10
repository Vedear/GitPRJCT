## Dockerfile. Статический сайт на веб-сервере Nginx

> Никогда в разработке не используйте русские имена файлов и каталогов!
> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

Структура проекта:
```
my-website/
├── Dockerfile
└── index.html
```

index.html:
```html
<!DOCTYPE html>
<html>
<head><title>My site on Docker</title></head>
<body><h1>Hello from Docker!</h1></body>
</html>
```
или
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Мой сайт в Docker</title>
</head>
<body>
    <h1>Привет из контейнера! 🐳</h1>
    <p>Здесь может быть любой русский текст.</p>
</body>
</html>
```


Dockerfile:
```dockerfile
# Используем официальный легковесный образ Nginx
FROM nginx:alpine
# Копируем наш HTML-файл в стандартную директорию Nginx
COPY index.html /usr/share/nginx/html/index.html
# Открываем порт (документация)
EXPOSE 80
```

Сборка:
```shell
docker build -t my-site .
```
Запуск:
```shell
docker run -d -p 8081:80 --name my-site my-site
```

[Откройте http://localhost:8081](http://localhost:8080)

