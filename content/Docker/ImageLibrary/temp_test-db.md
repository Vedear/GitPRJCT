## Временная база данных для тестов

- 1 - Запустить PostgreSQL для тестов
```shell
docker run -d \
  --name test-db \
  -p 5433:5432 \
  -e POSTGRES_PASSWORD=test123 \
  postgres:alpine
```
- 2 - Зайти в эту БД:
```shell
docker exec -it test-db psql -U postgres
```
- 3 - Выполнить несколько демонстрационных команд, например:
Получить список баз данных:
```sql
\l
```
Получить версию:
```sql
SELECT version();
```
выйти из БД
```sql
exit
```
- 4 - После тестов удалить
```shell
docker stop test-db && docker rm test-db
```