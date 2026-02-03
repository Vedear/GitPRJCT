## Node.js для JavaScript

Запустить Node.js REPL
```shell
docker run -it --rm node:alpine node
```

Или запустить скрипт
```shell
echo "console.log('Hello Node!')" > app.js
```
```shell
docker run --rm -v $(pwd):/app node:alpine node /app/app.js
```