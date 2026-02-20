## Welcome to Docker

Это репозиторий для новых пользователей, начинающих работу с Docker

> Перед созданием проекта убедитесь, что порт `8088` не занят другим приложением!

Проверить порт `8088` для **Linux/Mac/WSL**:
```shell
# Проверьте, занят ли порт
netstat -tuln | grep :8088
```
> Если эта команда ничего не возвращает, то порт свободен

Проверить порт `8088` для **Windows**:
```shell
netstat -aon | findstr :8088
```

Загрузить образ и запустить контейнера
```shell
docker run -d -p 8088:80 --name welcome-to-docker docker/welcome-to-docker
```

[Открыть http://localhost:8088 в браузере](http://localhost:8088)