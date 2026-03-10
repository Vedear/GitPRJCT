## Dockerfile. Hello-world

> Никогда в разработке не используйте русские имена файлов и каталогов!
> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

```dockerfile
# Используем минимальный базовый образ Alpine Linux
FROM alpine:latest
# Команда, которая выполнится при запуске контейнера
CMD ["echo", "Привет, Docker! 🐳"]
```
Сборка
```shell
docker build -t hello-world .
```
Запуск
```shell
docker run --rm hello-world
```

![Скриншот из командной строки](/content/img/docker_hello_world.png)