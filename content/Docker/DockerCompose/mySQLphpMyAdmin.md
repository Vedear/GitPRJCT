## Docker compose конетейнеры c MySQL + phpMyAdmin

### Процесс создания Docker проекта MySql+phpMyAdmin

1. Создать папку `Dockers` для хранения всех Docker проектов
1. Открыть папку `Dockers` в VS Code
1. Создать в папке Dockers папку `mysql-phpmyadmin`
1. В папке mysql-phpmyadmin средствами VS Code создать пустой файл `docker-compose.yml`
1. Вставить код в файл `docker-compose.yml`
1. Войти в папку `mysql-phpmyadmin` с командной строки
1. Выполнить скрипт инициализации базы данных SQL
1. Установить и запустить Docker Composer командой: `docker compose up -d`
1. Если установка и запуск прошли успешно, то войти в браузере по адресу `http://localhost:8081/` в админ-панель **phpMyAdmin**

Создаём папку проекта
```shell
mkdir mysql-phpmyadmin
```

Переходим в папку проекта
```shell
cd mysql-phpmyadmin
```

Создаём и редактируем файл настроек композера
```shell
micro docker-compose.yml
```

> Перед созданием проекта убедитесь, что порт 8081 не занят другим приложением!

Посмотреть все проброшенные порты
```shell
docker ps --format "table {{.Names}}\t{{.Ports}}"
```
Или подробно для конкретного Docker-приложения
```shell
docker port my-website
```

Файл настроек композера
```yml
services:
  # MySQL Database
  mysql:
    image: mysql:8.0
    container_name: mysql-db
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword      # Пароль root пользователя
      MYSQL_DATABASE: mydatabase             # База данных по умолчанию
      MYSQL_USER: myuser                     # Дополнительный пользователь
      MYSQL_PASSWORD: mypassword             # Пароль пользователя
    ports:
      - "3306:3306"                          # Порт MySQL
    volumes:
      - mysql_data:/var/lib/mysql           # Сохраняем данные БД
      - ./mysql/init.sql:/docker-entrypoint-initdb.d/init.sql  # SQL скрипты
    restart: unless-stopped
    networks:
      - db-network
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 30s
      timeout: 20s
      retries: 10
      start_period: 40s
  # phpMyAdmin Web Interface
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    container_name: phpmyadmin-web
    environment:
      PMA_HOST: mysql                        # Имя сервиса MySQL
      PMA_PORT: 3306                         # Порт MySQL
      PMA_ARBITRARY: 1                       # Разрешить подключение к любому серверу
      UPLOAD_LIMIT: 100M                     # Лимит загрузки файлов
    ports:
      - "8081:80"                            # phpMyAdmin будет на порту 8081
    depends_on:
      mysql:
        condition: service_healthy
    restart: unless-stopped
    networks:
      - db-network
networks:
  db-network:
    driver: bridge
volumes:
  mysql_data:
    driver: local
```

Создаем SQL скрипт для инициализации (опционально)

```shell
mkdir mysql
cat > mysql/init.sql << 'EOF'
-- Создаем дополнительную базу данных
CREATE DATABASE IF NOT EXISTS test_db;

-- Создаем пользователя с правами
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_password';
GRANT ALL PRIVILEGES ON test_db.* TO 'app_user'@'%';
FLUSH PRIVILEGES;

-- Создаем тестовую таблицу
USE test_db;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Добавляем тестовые данные
INSERT IGNORE INTO users (name, email) VALUES
('Иван Иванов', 'ivan@example.com'),
('Мария Петрова', 'maria@example.com');
EOF
```

Установка и запуск композера
```shell
docker compose up -d
```

Проверяем
```shell
docker ps
```

и
```shell
curl http://localhost:8082
```

Проверка состояния
```shell
docker compose ps
```

Доступ к сервису

- phpMyAdmin: [URL: http://localhost:8081](http://localhost:8081)
- Сервер: `mysql` (или `localhost:3306`)
- Пользователь: `root`
- Пароль: `rootpassword`

### Управление проектом

Проверить статус проекта
```shell
docker ps -a
```

Просмотр логов в реальном времени
```shell
docker compose logs -f mysql
```

`-f` в режиме ожидания (в режиме реального времени)

Перезапустить
```shell
docker compose restart
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

Удалить проект

Остановить контейнер с удалением данных
```shell
docker compose down -v
```

Проверить, не запущен ли удаляемый контейнер
```shell
docker ps -a
```

и

```shell
docker compose ps -a
```

Получить id образа
```shell
docker images
```

Удалить образ
```shell
docker rmi 1b3a22d17cb6
```