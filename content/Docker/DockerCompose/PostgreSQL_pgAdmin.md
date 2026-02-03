## Установка и запуск контейнера PostgreSQL+pgAdmin

### Процесс создания Dockers проекта PostgreSQL+pgAdmin

1. В папке Dockers создать файл `create-project.sh`
1. Вставить код инструкции в `create-project.sh`
1. Запустить проект командой: `docker compose up -d`
1. http://localhost:8082/
1. Создать сервер с параметрами подключения
    - В pgAdmin создайте сервер с параметрами:
    - Host: postgres (это имя сервиса в docker-compose.yml)
    - Port: 5432
    - Database: mydatabase
    - Username: myuser
    - Password: mypassword
1. Показать таблицы: Servers -> Database -> Schemas -> Tables -> app_users -> Вверху нажать на значок таблицы

> Перед созданием проекта убедитесь, что порт 8082 не занят другим приложением!

Посмотреть все проброшенные порты
```shell
docker ps --format "table {{.Names}}\t{{.Ports}}"
```
Или подробно для конкретного Docker-приложения
```shell
docker port my-website
```

создайте файл create-project.sh:

```shell
#!/bin/bash

PROJECT_DIR="postgres-pgadmin-stack"

echo "🚀 Создание структуры проекта: $PROJECT_DIR"

# Создаем структуру папок
mkdir -p $PROJECT_DIR/postgres/{data,backups,scripts}
mkdir -p $PROJECT_DIR/pgadmin/data
mkdir -p $PROJECT_DIR/docs
mkdir -p $PROJECT_DIR/scripts

# Создаем файлы
touch $PROJECT_DIR/.env
touch $PROJECT_DIR/docs/README.md

# SQL скрипты
cat > $PROJECT_DIR/postgres/scripts/01-init.sql << 'EOF'
-- Основная инициализация базы данных
CREATE TABLE IF NOT EXISTS app_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF

cat > $PROJECT_DIR/postgres/scripts/02-sample-data.sql << 'EOF'
-- Тестовые данные
INSERT INTO app_users (username, email) VALUES
('admin', 'admin@example.com'),
('user1', 'user1@example.com'),
('user2', 'user2@example.com')
ON CONFLICT (username) DO NOTHING;
EOF

cat > $PROJECT_DIR/postgres/scripts/03-users.sql << 'EOF'
-- Дополнительные пользователи и права
CREATE USER readonly_user WITH PASSWORD 'readonly_pass';
GRANT CONNECT ON DATABASE mydatabase TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;
EOF

# Bash скрипты
cat > $PROJECT_DIR/scripts/backup-db.sh << 'EOF'
#!/bin/bash
echo "📦 Создание бэкапа базы данных..."
BACKUP_FILE="../postgres/backups/backup_$(date +%Y%m%d_%H%M%S).sql"
docker compose exec postgres pg_dump -U myuser mydatabase > $BACKUP_FILE
echo "✅ Бэкап создан: $BACKUP_FILE"
EOF

cat > $PROJECT_DIR/scripts/restore-db.sh << 'EOF'
#!/bin/bash
if [ -z "$1" ]; then
    echo "❌ Укажите файл для восстановления: ./restore-db.sh ../postgres/backups/backup_YYYYMMDD_HHMMSS.sql"
    exit 1
fi

BACKUP_FILE=$1
echo "🔄 Восстановление из $BACKUP_FILE..."
docker compose exec -T postgres psql -U myuser -d mydatabase < $BACKUP_FILE
echo "✅ База восстановлена!"
EOF

cat > $PROJECT_DIR/scripts/connect-db.sh << 'EOF'
#!/bin/bash
echo "🔗 Подключение к PostgreSQL..."
docker compose exec postgres psql -U myuser -d mydatabase
EOF

# Docker Compose файл
cat > $PROJECT_DIR/docker-compose.yml << 'EOF'
services:
  postgres:
    image: postgres:15
    container_name: postgres-db
    environment:
      POSTGRES_DB: ${POSTGRES_DB:-mydatabase}
      POSTGRES_USER: ${POSTGRES_USER:-myuser}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-mypassword}
    ports:
      - "5432:5432"
    volumes:
      - ./postgres/data:/var/lib/postgresql/data
      - ./postgres/scripts:/docker-entrypoint-initdb.d
      - ./postgres/backups:/backups
    restart: unless-stopped
    networks:
      - db-network

  pgadmin:
    image: dpage/pgadmin4:latest
    container_name: pgadmin-web
    environment:
      PGADMIN_DEFAULT_EMAIL: ${PGADMIN_EMAIL:-admin@example.com}
      PGADMIN_DEFAULT_PASSWORD: ${PGADMIN_PASSWORD:-admin}
    ports:
      - "8082:80"
    volumes:
      - ./pgadmin/data:/var/lib/pgadmin
    user: "0:0"
    restart: unless-stopped
    depends_on:
      - postgres
    networks:
      - db-network

networks:
  db-network:
    driver: bridge
EOF

# Делаем скрипты исполняемыми
chmod +x $PROJECT_DIR/scripts/*.sh

# Создаем базовый .env файл
cat > $PROJECT_DIR/.env << 'EOF'
# PostgreSQL Configuration
POSTGRES_DB=mydatabase
POSTGRES_USER=myuser
POSTGRES_PASSWORD=mypassword

# pgAdmin Configuration
PGADMIN_EMAIL=admin@example.com
PGADMIN_PASSWORD=admin
EOF
```

запустите его в папке для контейнеров командой:

```shell
docker compose up -d
```

Сделать исполняемым
```shell
chmod +x create-project.sh
```

и запустить создание проекта

```shell
./create-project.sh
```

В результате будет создана структура проекта

```
postgres-pgadmin-stack/
├── docker-compose.yml          # Главная конфигурация
├── .env                        # Переменные окружения (опционально)
├── postgres/
│   ├── data/                  # Данные PostgreSQL
│   ├── backups/               # Бэкапы БД
│   └── scripts/               # SQL скрипты инициализации
│       ├── 01-init.sql        # Основная инициализация
│       ├── 02-sample-data.sql # Тестовые данные
│       └── 03-users.sql       # Пользователи и права
├── pgadmin/
│   └── data/                  # Данные pgAdmin (настройки, сессии)
├── docs/                      # Документация проекта
│   └── README.md
└── scripts/                   # Вспомогательные скрипты
    ├── backup-db.sh           # создание бэкапа
    ├── restore-db.sh          # восстановление из бэкапа
    └── connect-db.sh          # подключение к БД
```

Проверяем
```shell
docker ps
```
```shell
curl http://localhost:8082
```

[pgAdmin будет доступен по адресу](gAdmin: http://localhost:8082)

### Управление проектом

остановить все контейнеры
```shell
docker compose down
```

> docker compose down выполнять в каталоге проекта, в котором есть файл .yml

и запустить нужные

```shell
docker compose up -d
```

[pgAdmin будет доступен по адресу](gAdmin: http://localhost:8082)