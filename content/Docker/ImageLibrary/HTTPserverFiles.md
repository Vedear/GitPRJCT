## HTTP-сервер для раздачи файлов

> Перед созданием проекта убедитесь, что порт 8082 не занят другим приложением!

1. Создайте тестовый файл
echo "Hello from HTTP server" > test.txt
2. Запустите простой HTTP сервер
```shell
docker run -d \
  --name http-server \
  -p 8082:80 \
  -v $(pwd):/usr/share/nginx/html \
  nginx:alpine
```
3. Проверьте
```shell
curl http://localhost:8082/test.txt
```