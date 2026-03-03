## Adminer (альтернатива phpMyAdmin)

Запуск Adminer для управления БД

> Перед созданием проекта убедитесь, что порт 8084 не занят другим приложением!

```shell
docker run -d \
  --name adminer \
  -p 8084:8080 \
  adminer:latest
```

[Откройте: http://localhost:8084](http://localhost:8084)

> Без отдельно запущенного контейнера с БД PostgreSQL и связи с ним админ-панель работаеть не будет!

Система:
- PostgreSQL
- сервер: host.docker.internal
- логин: postgres
- пароль: mysecretpassword