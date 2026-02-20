## cAdvisor (мониторинг контейнеров)

1. Мониторинг Docker контейнеров

> Перед созданием проекта убедитесь, что порт `8083` не занят другим приложением!

Проверить порт `8083` для **Linux/Mac/WSL**:
```shell
# Проверьте, занят ли порт
netstat -tuln | grep :8083
```
> Если эта команда ничего не возвращает, то порт свободен

Проверить порт `8083` для **Windows**:
```shell
netstat -aon | findstr :8083
```

Загрузка, создание и запуск контейнера с cAdvisor:
```shell
docker run -d \
  --name=cadvisor \
  -p 8083:8080 \
  -v /:/rootfs:ro \
  -v /var/run:/var/run:ro \
  -v /sys:/sys:ro \
  -v /var/lib/docker/:/var/lib/docker:ro \
  google/cadvisor:latest
```
2. [Откройте: http://localhost:8083](http://localhost:8083)