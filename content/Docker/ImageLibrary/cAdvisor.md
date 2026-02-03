## cAdvisor (мониторинг контейнеров)

1. Мониторинг Docker контейнеров

> Перед созданием проекта убедитесь, что порт 8083 не занят другим приложением!

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