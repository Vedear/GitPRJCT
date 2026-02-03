## Прокси сервер Squid proxy

1. Запустить Squid proxy
```shell
docker run -d \
  --name squid-proxy \
  -p 3128:3128 \
  ubuntu/squid:latest
```
2. [Настройте браузер использовать proxy: localhost:3128](localhost:3128)