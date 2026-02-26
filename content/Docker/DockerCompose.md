**Docker Compose** — это мощный инструмент для определения и запуска многоконтейнерных приложений. Давайте разберем его подробно.

## 🏗️ Что такое Docker Compose?

**Docker Compose** — это инструмент для управления **несколькими контейнерами** как единым приложением с помощью одного файла конфигурации.

### Простая аналогия:
- **`docker run`** = ручная сборка одного стула по инструкции
- **`docker compose`** = кнопка "собери всю мебель в комнате" по общему плану

## 🎯 Зачем нужен Docker Compose?

### Проблема без Compose:
```bash
# Чтобы запустить приложение + БД + кэш, нужно:
docker run -d --name db -e POSTGRES_PASSWORD=pass postgres
docker run -d --name cache -p 6379:6379 redis
docker run -d --name app -p 80:5000 --link db --link cache my-app
# И это еще простой случай!
```

### Решение с Compose:
```yaml
# docker-compose.yml
services:
  app:
    build: .
    ports:
      - "80:5000"
  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: pass
  cache:
    image: redis
```
**Запуск:** `docker compose up -d`

## 📁 Структура docker-compose.yml

### Базовый пример:
```yaml
version: '3.8'  # Современные версии могут не требовать эту строку

services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html

  database:
    image: postgres:13
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

## 🔧 Ключевые директивы Docker Compose

### Основные директивы:

| Директива | Назначение | Пример |
|-----------|-------------|---------|
| **`image`** | Готовый образ | `nginx:alpine` |
| **`build`** | Собрать из Dockerfile | `build: .` |
| **`ports`** | Проброс портов | `"8080:80"` |
| **`volumes`** | Монтирование данных | `./data:/app/data` |
| **`environment`** | Переменные окружения | `POSTGRES_PASSWORD: pass` |
| **`depends_on`** | Зависимости | `depends_on: - db` |
| **`networks`** | Сети | `networks: - app-net` |

## 🚀 Основные команды

### Запуск и управление:
```bash
# Запуск всех сервисов в фоне
docker compose up -d

# Остановка всех сервисов
docker compose down

# Просмотр статуса
docker compose ps

# Просмотр логов
docker compose logs

# Перезапуск сервисов
docker compose restart

# Выполнение команды в сервисе
docker compose exec db psql -U user myapp
```

### Разработка и отладка:
```bash
# Просмотр конфигурации
docker compose config

# Сборка образов
docker compose build

# Запуск одного сервиса
docker compose up web

# Просмотр логов в реальном времени
docker compose logs -f web
```

## 📊 Практические примеры

### Пример 1: Веб-приложение + БД
```yaml
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
    depends_on:
      - backend

  backend:
    build: ./backend
    ports:
      - "5000:5000"
    environment:
      DATABASE_URL: postgresql://user:pass@db:5432/myapp
    depends_on:
      - db

  db:
    image: postgres:13
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

### Пример 2: Простой блог на WordPress
```yaml
services:
  wordpress:
    image: wordpress:latest
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: exampleuser
      WORDPRESS_DB_PASSWORD: examplepass
      WORDPRESS_DB_NAME: exampledb
    volumes:
      - wordpress_data:/var/www/html
    depends_on:
      - db

  db:
    image: mysql:5.7
    environment:
      MYSQL_DATABASE: exampledb
      MYSQL_USER: exampleuser
      MYSQL_PASSWORD: examplepass
      MYSQL_RANDOM_ROOT_PASSWORD: "1"
    volumes:
      - db_data:/var/lib/mysql

volumes:
  wordpress_data:
  db_data:
```

## 🎯 Преимущества Docker Compose

### 1. **Однокомандное развертывание**
```bash
# Вместо 5+ команд docker run - одна команда:
docker compose up -d
```

### 2. **Воспроизводимость**
- Идентичное окружение у всех разработчиков
- Файл `docker-compose.yml` в системе контроля версий

### 3. **Управление зависимостями**
- Автоматический порядок запуска сервисов
- Сетевые соединения между контейнерами

### 4. **Изоляция проектов**
- Каждый проект в своей папке
- Нет конфликтов между проектами

## 🔧 Продвинутые возможности

### Переменные окружения:
```yaml
services:
  app:
    image: myapp:${APP_VERSION:-latest}
    environment:
      - DATABASE_URL=${DATABASE_URL}
    env_file:
      - .env
```

### Настройки развертывания:
```yaml
services:
  web:
    image: nginx
    deploy:
      replicas: 3
      resources:
        limits:
          memory: 512M
        reservations:
          memory: 256M
    restart_policy:
      condition: on-failure
```

### Health checks:
```yaml
services:
  db:
    image: postgres
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d myapp"]
      interval: 30s
      timeout: 10s
      retries: 3
```

## 📁 Структура проекта с Docker Compose

```
my-app/
├── docker-compose.yml
├── .env
├── backend/
│   ├── Dockerfile
│   └── src/
├── frontend/
│   ├── Dockerfile
│   └── src/
└── database/
    └── init.sql
```

## 💡 Best Practices

### 1. **Используйте .env файлы**
```bash
# .env
POSTGRES_PASSWORD=secure_password
APP_VERSION=1.2.3
```

### 2. **Разделяйте конфигурации**
```yaml
# docker-compose.yml - базовая конфигурация
# docker-compose.override.yml - для разработки
# docker-compose.prod.yml - для продакшена
```

### 3. **Используйте именованные volumes**
```yaml
volumes:
  db_data:
    driver: local
```

### 4. **Настраивайте health checks**
```yaml
healthcheck:
  test: curl -f http://localhost/health || exit 1
  interval: 30s
```

## 🚀 Workflow разработки

### Локальная разработка:
```bash
# Клонируем проект
git clone project-url
cd project

# Запускаем окружение
docker compose up -d

# Работаем...
code .

# Останавливаем
docker compose down
```

### Продакшен:
```bash
# Используем продакшен конфигурацию
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

## 🔄 Docker Compose vs Docker Swarm vs Kubernetes

| Инструмент | Сценарии использования | Сложность |
|------------|----------------------|-----------|
| **Docker Compose** | Локальная разработка, тестирование | 🟢 Низкая |
| **Docker Swarm** | Простые кластеры, small-scale production | 🟡 Средняя |
| **Kubernetes** | Сложные production среды, масштабирование | 🔴 Высокая |

## 💡 Советы для начинающих

1. **Начинайте с простых конфигураций**
2. **Используйте `docker compose config` для проверки**
3. **Изучайте логи при проблемах**
4. **Экспериментируйте с разными сервисами**
5. **Используйте официальные образы**

## 🎯 Итог

**Docker Compose идеален для:**
- 🏗️ **Локальной разработки**
- 🧪 **Тестирования многоконтейнерных приложений**
- 🚀 **Быстрого прототипирования**
- 📚 **Изучения Docker и микросервисов**

**Теперь у вас есть мощный инструмент для управления сложными приложениями!** 🐳✨