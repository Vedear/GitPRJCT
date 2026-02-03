## Файловый обменник

> Перед созданием проекта убедитесь, что порт 8084 не занят другим приложением!

1. Запустить **simple-http-server** для раздачи файлов
```shell
docker run -d \
  --name file-server \
  -p 8084:80 \
  -v $(pwd):/srv \
  halverneus/static-file-server:latest
```
2. [Откройте: http://localhost:8084](http://localhost:8084)