## Временная база данных для тестов

1. Запустить PostgreSQL для тестов
```shell
docker run -d \
  --name test-db \
  -p 5433:5432 \
  -e POSTGRES_PASSWORD=test123 \
  postgres:alpine
```
2. После тестов удалить
```shell
docker stop test-db && docker rm test-db
```