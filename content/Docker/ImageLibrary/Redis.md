## База данных Redis

> Никогда в разработке не используйте русские имена файлов и каталогов!
> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

Запуск Redis
```shell
docker run -d --name my-redis -p 6379:6379 redis:alpine
```

Подключиться к Redis CLI
```shell
docker exec -it my-redis redis-cli
```

Внутри Redis: ping → PONG, SET key value, GET key - ?