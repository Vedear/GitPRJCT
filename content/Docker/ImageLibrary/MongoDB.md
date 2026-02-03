## MongoDB (NoSQL)

1. Запуск MongoDB
```shell
docker run -d \
  --name my-mongo \
  -p 27017:27017 \
  mongo:latest
```
2. Подключиться через shell
```shell
docker exec -it my-mongo mongosh
```