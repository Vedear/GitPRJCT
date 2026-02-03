## Ubuntu для тестирования команд

Запуск временного Ubuntu контейнера
```shell
docker run -it --rm ubuntu:latest /bin/bash
```
> Контейнер удалится автоматически (`--rm`)

Установите что-нибудь внутри
```shell
apt update && apt install curl -y
```
```shell
curl --version
```