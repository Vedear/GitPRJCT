### [Вернуться на Главную](/README.md)

## Docker

### Получить Docker

- **Windows**
    - Включить подситему Windows для Linux (WSL 2.0).
    - [Загрузить и установить **Docker-Desktop**](https://www.docker.com/products/docker-desktop/)
    - Выполнять авторизацию в **Docker-Desktop** (можно через Google), указать personal или *Skip*;
    - Перезагрузить компьютер;
    - Запустить **Docker Desktop** (можно добавить в автозагрузку для удобства);
    - Перезапустить систему
- **MacOS**
    - Установка **Docker Desktop** через **Homebrew**
    - **Homebrew** (очень рекомендуется для macOS), вы можете установить Docker Desktop с помощью одной команды:
    ```shell
    brew install --cask docker
    ```
    - Убедитесь, что **Homebrew** установлен: Если нет, установите его.
    Выполните команду в Терминале:
    ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
    - Запустите Docker: После установки запустите приложение **Docker Desktop** из папки "Приложения".
    > Важно: Docker Desktop использует виртуализацию и требует, чтобы на вашем **Mac** был включен фреймворк **HyperKit**. Приложение автоматически настраивает все необходимые компоненты.

- **Linux**
    - **Ubuntu**
        - `sudo apt update sudo apt install ca-certificates curl gnupg lsb-release -y`
        - `sudo mkdir -p /etc/apt/keyrings curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
        - `echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
        - `sudo apt update sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y`
        - `sudo systemctl status docker`
        - `sudo docker run hello-world`
        - `reboot`
    - **Alt Linux**
        - `su-`
        - `apt-get install docker-engine docker-compose-v2`
        - `usermod ИМЯ_ПОЛЬЗОВАТЕЛЯ -aG docker`
        - `systemctl enable --now docker`
        - `reboot`

### Начало работы

Проверить Docker:
```shell
docker --version
```

или подробно:
```shell
docker version
```

**Docker образ** (Docker image) - это файлы, типа .iso

Docker image - образ, который содержит всё необходимое для запуска приложения: код, библиотеки, зависимости, системные иснтрументы и конфигурации. Образ неизменяем. Если надо что-то поменять, то приходится создавать новый образ

**Docker контейнер** - это изолированный процесс. Можно свободно создавать, запускать, останавливать и удалять контейнеры. Каждый контейнер изолирован от других и от основной системы. Контейнер подобен виртуальной машине. Внутри каждого контейнера кипит своя жизнь.

Примеры установки и управления контейнерами

#### Hello-world

Установить и запустить тестовый **Docker-контейнер**
```shell
docker run hello-world
```

> Эта команда загрузит образ, установит его, создаст и запустит контейнер и сразу остановит.

Показать запущенные контейнеры:
```shell
docker ps
```

Покзать все контейнеры, включая остановленные:
```shell
docker ps -a
```

Показать детальную информацию по выбранному образу
```shell
docker image inspect hello-world
```

Удалить контейнер
```shell
docker rm 6f72bfc0ed02
```

> Удаление контейнера не приводит к удалению Docker образа!

Удалить выбранный образ:
- Сначала остановить удаляемый контейнер
  - `docker stop` или `docker compose down`
- Определить имя Docker образа:
```shell
docker images
```
- Удалить:
```shell
docker rmi hello-world
```

#### Nginx

Установить контейнер **Nginx**
```shell
docker run -d -p 8081:80 --name my-nginx nginx
```

- `-d` - запуск в фоном режиме
- `-p` - проброс порта
- `--name` - понятное имя контейнера

Проверить защенный конейнер **Nginx**
```shell
curl http://localhost:8081
```

Команда должна вернуть HTML-код веб-страницы сервера

Открыть адрес локального веб-сервера **Nginx**:
[localhost:8081](localhost:8081)

Проверить состояние запущенных контейнеров:
```shell
docker ps
```

Показать все контейнеры, включая остановленные:
```shell
docker ps -a
```

Остановить запущенный контейнер:
```shell
docker stop my-nginx
```

Запустить контейнер:
```shell
docker start my-nginx
```

Удалить выбранный контейнер:
- Сначала остановить удаляемый контейнер
  - `docker stop` или `docker compose down`
- Определяем его ID:
```shell
docker ps -a
```
- Удаляем:
```shell
docker rm 998f036ea9e8
```

где 998f036ea9e8 - это **ID** контейнера

Удалить выбранный образ:
- Сначала остановить удаляемый контейнер образа
  - `docker stop` или `docker compose down`
- Определить имя Docker образа:
```shell
docker images
```
- Удалить:
```shell
docker rmi hello-world
```

### Docket Compose

### Установка и управление БД PostgresSQL

Создать структуру будущего проекта:
```
postgres-docker-project
├── backups
├── data
└── scripts
```

можно командой в терминале:
```shell
mkdir -p postgres-docker-project/{data,scripts,backups}
```

Войти в каталог `postgres-docker-project`
```shell
cd postgres-docker-project
```

Создать файл `docker-compose.yml`
```shell
touch docker-compose.yml
```

Вставить в него этот код:
```yml
services:
  postgres:
    image: postgres:15
    container_name: new-postgres
    environment:
      POSTGRES_DB: mydatabase
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
    ports:
      - "5432:5432"
    volumes:
      - ./data:/var/lib/postgresql/data
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
      - ./backups:/backups
    restart: unless-stopped
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U myuser -d mydatabase"]
      interval: 30s
      timeout: 10s
      retries: 3
```

Перейти в каталог `scripts`
```shell
cd scripts
```

в файл `init.sql` вставить код:
```sql
CREATE DATABASE app_db;
CREATE USER app_user WITH PASSWORD 'app_password';
GRANT ALL PRIVILEGES ON DATABASE app_db TO app_user;
\c mydatabase;
CREATE TABLE IF NOT EXISTS users (    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (name, email) VALUES
('Иван Иванов', 'ivan@example.com'),
('Мария Петрова', 'maria@example.com')
ON CONFLICT (email) DO NOTHING;
```

Запустить контейнер:
```shell
docker compose up -d
```

Показать логи базы данных `postgres`
```shell
docker compose logs postgres
```

Приостановить запущенный контейнер:
```shell
docker compose stop
```

Запустить приостановленный контейнер:
```shell
docker compose start
```

Показать конфигурацию текущего проекта:
```shell
docker compose config
```


Остановить запущенный контейнер (остановка + удаление)
```shell
docker compose down
```

Подкдючиться к запущенной БД
```shell
docker exec -it new-postgres psql -U myuser mydatabase
```

где `new-postgres` - это имя контейнера, `myuser` - имя пользователя в БД **PostgresSQL**, `mydatabase` - имя БД

ключи:

- `-it` - это интерактивный режим, который позволяет держать открытым стандартный ввод с командной строки правильного отображения терминала tty
- `-U`  - ключ утилиты `psql`, который указывает на имя пользователя для подключения к **PostgresSQL**


Показать справу по работе с БД Postgres
```
HELP
```

Выйти из БД
```
\q
```

или
```
EXIT
```

Работа с БД внутри контейнера

Исследовать текущую БД:
```sql
\l
```

Показать таблицы текущей БД:
```sql
\dt
```

Показат подробую ин-у о таблицах
```sql
\d+
```

Создать свои таблицы и данные

Создаем новую таблицу
```sql
CREATE TABLE products (id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL,price DECIMAL(10,2),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
```

Вставляем в неё тестовые данные

```sql
INSERT INTO products (name, price) VALUES ('Laptop', 999.99), ('Mouse', 29.99), ('Keyboard', 79.99);
```

Проверяем данные новой таблицы
```sql
SELECT * FROM products;
```

Остановить контейнер:
```shell
docker compose down
```

Остановить контейнер и удалить данные:
```shell
docker compose down -v
```

Проверить состояние сетевых подключений Docker-контейнеров:
```shell
docker network ls
```

Полное удаление выбранного контейнера и образа

- Сначала остановить удаляемый контейнер
- Определяем его ID:
```shell
docker ps -a
```
- Удаляем:
```shell
docker rm 3a64cdd0d9f5
```

Удаляем образ контейнера

Определяем ID образа:
```shell
docker images
```

```shell
docker rmi postgres:15
```




























