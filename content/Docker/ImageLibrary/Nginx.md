## Веб-сервер Nginx

Скачать и запустить Nginx
```shell
docker run -d --name my-nginx -p 80:80 nginx:alpine
```

```shell
curl http://localhost
```

[Проверить в браузере: http://localhost](http://localhost)

### Полезные команды для работы

#### Посмотреть запущенные контейнеры
```shell
docker ps
```

#### Остановить контейнер
```shell
docker stop my-nginx
```

#### Запустить остановленный
```shell
docker start my-nginx
```

#### Удалить контейнер
```shell
docker rm my-nginx
```

#### Удалить контейнер и его volume
```shell
docker rm -v my-nginx
```

#### Посмотреть логи
```shell
docker logs my-nginx
```
```shell
docker logs -f my-nginx  # в реальном времени
```
# Войти в контейнер
```shell
docker exec -it my-nginx /bin/sh
```

# Скопировать файл из контейнера
```shell
docker cp my-nginx:/etc/nginx/nginx.conf ./nginx.conf
```

# Посмотреть статистику
```shell
docker stats
```