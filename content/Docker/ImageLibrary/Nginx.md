## Практическая работа на примере готового образа Nginx в Docker

> **Nginx** - это легкий и небольшой веб-сервер

### Проверить Docker

Получить версию установленного у вас Docker
```shell
docker version
```

![Скрин версии Docker](img/docker_version.png)

> Готовые образы берутся из сторонних источников: **Docker Hub** или другие

[Ссылка на Docker Hub](https://hub.docker.com/)

### Подготовка Docker (чтобы начать работать с "чистого листа")

1. Остановить все запущенные контейнеры
1. Удалить все остановленные контейнеры
1. Удалить все неиспользуемые образы

- Следует убедиться, нет ли у вас уже установленных и запущенных контейнеров:
```shell
docker ps -a
```
- Если есть, то лучше их остановить:
```shell
docker stop $(docker ps -q)
```
- Если остановленные контейнеры не нужно, то удалить их:
```shell
docker container prune
```
или
```shell
docker container prune $(docker ps -q)
```
- Ещё раз убедиться, что нет лишних контейнеров:
```shell
docker ps -a
```

![Тут нужен скриншот вывода]()

- Опционально можно удалить ненужные образы. Показать текущие образы:
```shell
docker images
```
Удалить все ненужные образы
```shell
docker image prune -a
```
или
```shell
docker rmi $(docker images -q)
```

> Удалять нужно только учебные контейнеры и образы, т.к. есть риск потерять важные данные, которые могут содержаться в контейнерах!

### Получение готового образа Nginx

1. Поиск и получение готового образа на Docker Hub
1. Создание и запуск контейнера из полученного образа
1. Проверка состояния приложения из Docker-контейнера
1. Управление контейнером

Найти нужный образ на **Docker Hub**
```shell
docker search nginx
```

![Скрин вывода поиска по слову nginx](img/docker_screen.png)

Получить, создать и запустить Nginx
```shell
docker run -d --name my-nginx -p 80:80 nginx
```

Если запуск контейнера не удался, то проверьте уже созданные контейнеры с таким именем у себя
```shell
docker ps -a
```

![Тут нужен скриншот]()

Показать загруженный на ваш компьютер образ
```shell
docker images
```

Если нужно только получить готовый образ, без создания и запуска контейнера, то
```shell
docker pull nginx
```

Получить информацию по загруженному образу:
```shell
docker inspect nginx
```

При необходимости остановить контейнер с таким именем:
```shell
docker stop my-nginx
```
Перезапустить контейнер по имени
```shell
docker restart my-nginx
```
Перезапустить контейнер по его **id**
```shell
docker restart 2e6c42d9b6af
```

Удалить выбранный контейнер по его имени
```shell
docker rm my-nginx
```

![Тут нужен скриншот вывода]()

И можно удалить ещё и образ загруженного ранее Nginx:

Получить id образа
```shell
docker images
```

Удалить по `id` нужный образ
```shell
docker rmi 062a783918fb
```

![Скрин состояния docker images](img/rm_image.png)

### Проверить работу контейнера

Можно снова установить и запустить Nginx (если его удаляли ранее)
```shell
docker run -d --name my-nginx -p 80:80 nginx
```

Показать наличие загруженного файла образа
```shell
docker images
```

![Скрин образа](img/2_images.png)

Показать только запущенные контейнеры
```shell
docker ps
```
или показать все контейнеры (в т.ч. остановленные)
```shell
docker ps -a
```
![Скрин контейнера](img/contaurer.png)

> Из одного образа можно получить несколько контейнеров!

Показать работающий Nginx

Способ 1
```shell
curl http://localhost/
```

![Скрин вывода curl](img/curl_nginx.png)

Способ 2 - [открыть http://localhost/ адрес в браузере](http://localhost/)

![Скрин nginx в браузере](img/web_nginx.png)

### Управление контейнером

#### Мониторинг контейнеров

Показать состояние всех контейнеров
```shell
docker ps -a
```

Показать подробности о контейнере
```shell
docker inspect my-nginx
```

Запустить мониторинг контейнеров
```shell
docker stats
```

![](img/2_stats.png)


> Выйти из мониторинга контейнеров можно по `Ctrl+C`

Получить лог контейнера
```shell
docker logs my-nginx
```

Показать логи в режиме ожидания
```shell
docker logs -f my-nginx
```
> Выйти из логов в режиме ожидания можно по `Ctrl+C`

![](img/logs.png)

### Управление контейнером

Остановить контейнер
```shell
docker stop my-nginx
```

Снова запустить контейнер
```shell
docker start my-nginx
```

Перезапустить контейнер
```shell
docker restart my-nginx
```

Зайти в контейнер
```shell
docker exec -it my-nginx /bin/bash
```
или
```shell
docker exec -it my-nginx bash
```
или
```shell
docker exec -it my-nginx /bin/sh
```
или
```shell
docker exec -it my-nginx sh
```

внутри контейнера можно повыполнять некоторые команды Linux
Получить информацию об ОС контейнера
```shell
uname -a
```
![](img/uname.png)

Получить больше информации об ОС контейнера
```shell
cat /etc/os-release
```
![](img/os_release.png)

Установить **Fastfetch**
```shell
apt update && apt install -y fastfetch
```
> apt update - обновит списки источников приложений, apt install - установит указанное приложение
Запустить **Fastfetch**
```shell
fastfetch
```
![Вывод команды fastfetch](img/fastfetch.png)

Можно установить ещё несколько приложений внутри Docker-контейнера:
```shell
apt update && apt install -y fastfetch htop cmatrix hollywood mc micro
```
> На все вопросы ответьте `1` и `Enter`

и позапускать их отдельно друг от друга:
```shell
htop
```

![Скрин вывода htop]()

> Выйти из `htop` можно по **Q**

```shell
cmatrix
```

![Скрин вывода cmatrix]()

> Выйти из `cmatrix` можно по **Q**

```shell
hollywood
```
![Скрин вывода hollywood]()

> Выйти из `hollywood` можно по `Ctrl-C`

Выйти из контейнера можно командой `exit`

Отредактировать текст страницы приветствия Nginx (Находится в разработке!)

Открыть файл `index.html` для редактирования содержимого
```shell
micro /usr/local/apache2/htdocs/index.html
```

отредайтируйте и сохраните по `Ctrl+S` и выйти из режима редактирования по `Ctrl+Q`

[Проверить изменения на открытой странице >>](http://localhost/)

![Скрин изменённой страницы в браузере](img/)

Остановить все запущенные контейнеры
```shell
docker stop $(docker ps -q)
```

Удалить все остановленные контейнеры
```shell
docker container prune $(docker ps -q)
```

Удалить все образы
```shell
docker rmi $(docker images -q)
```