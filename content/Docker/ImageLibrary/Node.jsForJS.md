## Node.js для JavaScript

Выполните все этапы работы с проектом по примеру с [Nginx](/content/Docker/ImageLibrary/Nginx.md)

> Никогда в разработке не используйте русские имена файлов и каталогов!
> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

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