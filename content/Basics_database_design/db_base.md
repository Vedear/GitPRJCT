## Работа с базой данных внутри контейнера

### Подключение и работа с БД в Docker-контейнере

`docker exec -it my-postgres psql -U myuser -d mydatabase`

1. Исследовать текущую базу

Посмотреть все базы данных
`\l`

Подключиться к конкретной базе (если не подключены)
`\c mydatabase`

Посмотреть таблицы в текущей базе
`\dt`

Посмотреть подробную информацию о таблицах
`\d+ users`

### Создать свои таблицы и данные

Создаем новую таблицу

`CREATE TABLE products (id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL,price DECIMAL(10,2),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);`

Вставляем в неё тестовые данные

`INSERT INTO products (name, price) VALUES ('Laptop', 999.99), ('Mouse', 29.99), ('Keyboard', 79.99);`

Проверяем данные новой таблицы

`SELECT * FROM products;`