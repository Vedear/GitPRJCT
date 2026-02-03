## Тест скорости интернета

1. Speedtest в Docker
```shell
docker run --rm networkstatic/speedtest-cli --simple
```
2. Или
```shell
docker run --rm python:alpine sh -c "pip install speedtest-cli && speedtest-cli --simple"
```