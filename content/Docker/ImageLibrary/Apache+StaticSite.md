## Статический сайт на Apache

### Apache со стандартной приветственной страницей контейнера

```shell
docker run -d --name my-apache -p 8081:80 httpd:alpine
```
или
```shell
docker run -d --name my-apache -p 8081:80 httpd
```

### Apache со своей приветственной страницей

Создайте папку с HTML файлом
```shell
mkdir ~/my-site && cd ~/my-site
```
```shell
echo "<h1>Hello Docker!</h1>" > index.html
```

Запустите Apache с монтированием папки

> Перед созданием проекта убедитесь, что порт 8081 не занят другим приложением!

```shell
docker run -d \
  --name my-apache \
  -p 8081:80 \
  -v $(pwd):/usr/local/apache2/htdocs \
  httpd:alpine
```

[Откройте: http://localhost:8081](http://localhost:8081)