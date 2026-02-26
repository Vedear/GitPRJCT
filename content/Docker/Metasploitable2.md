## Metasploitable2 docker

Установить докер-образ

```shell
docker pull tleemcjr/metasploitable2
```

Зайти в контейнер
```shell
docker run --name metasploitable2 -it tleemcjr/metasploitable2:latest sh -c "/bin/services.sh && bash"
```

Остановить контейнер и выйти из него
```shell
exit
```

Удалить контейнер
```shell
docker rm metasploitable2
```

Удалить образ
```shell
docker rmi tleemcjr/metasploitable2
```

[Metasploitable2 на Docker hub](https://hub.docker.com/r/tleemcjr/metasploitable2#!)