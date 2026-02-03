## Adminer (замена phpMyAdmin)

Запуск Adminer для управления БД

> Перед созданием проекта убедитесь, что порт 8081 не занят другим приложением!

```shell
docker run -d \
  --name adminer \
  -p 8080:8081 \
  adminer:latest
```

[Откройте: http://localhost:8080](http://localhost:8080)

Система:
    - PostgreSQL,
    - сервер: host.docker.internal,
    - логин: postgres,
    - пароль: mysecretpassword