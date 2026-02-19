## Docker compose конетейнеры c Joomla

(админка и фронтэнд работает, но заизать подробней пока не успел)

1. Создаём каталог проекта
```shell
mkdir joomla-docker
```

2. Переходим в каталог проекта
```shellc
cd joomla-docker
```

3. docker-compose.yml
```yml
services:
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: joomla
    ports:
      - "3308:3306"
  joomla:
    image: joomla:4-apache
    depends_on:
      - db
    environment:
      JOOMLA_DB_HOST: db
      JOOMLA_DB_USER: root
      JOOMLA_DB_PASSWORD: root
      JOOMLA_DB_NAME: joomla
    ports:
      - "8082:80"
```

Доступ к сайту:

- [Joomla сайт: http://localhost:8082](http://localhost:8082)
- [MySQL: localhost:3307](localhost:3307)

Установка Joomla

drf-Pis-4nU-pj8

7. Работа с проектом в Docker

# Запуск всех сервисов
docker compose up -d

# Проверка статуса
docker compose ps

# Просмотр логов Joomla
docker compose logs -f joomla

# Проверьте логи MySQL
docker compose logs db

# Проверьте сеть
docker network inspect joomla-docker_joomla-network

# Пересоздайте контейнеры
docker compose down -v
docker compose up -d


### Возможные проблемы

```
Error response from daemon: failed to set up container networking: driver failed programming external connectivity on endpoint joomla-mysql (269d5375c5e04cc699cae01dc80c527147a5e18c868cc0e8ace67552aad6deb9): Bind for 0.0.0.0:3306 failed: port is already allocated
```

Решение: поменять порт для коннекта с БД

Остановить текущий композер
```shell
docker compose down
```

Поменять порт
```shell
sed -i 's/3306:3306/3307:3306/' docker-compose.yml
```

Снова запустить
```shell
docker compose up -d
```

### Удалить композер проекта

Переходим в папку проекта
```shell
cd joomla-docker
```

Останавливаем и удаляем контейнеры и volumes
```shell
docker compose down -v
```

Выходим
```shell
cd ..
```

Удаляем папку проекта через `su-` или `sudo`
```shell
rm -rf joomla-docker/
```


