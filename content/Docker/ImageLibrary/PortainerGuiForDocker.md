## Portainer (GUI для управления Docker)

1. Установите Portainer для управления Docker через веб-интерфейс
```shell
docker run -d \
  --name portainer \
  -p 9000:9000 \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```
2. [Откройте: https://localhost:9443](https://localhost:9443)