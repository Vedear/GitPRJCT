## Codespace

Докер компоуз файл для запуска СУБД и визуальный среды pgadmin4 в браузере для работы с базой данных.

Шаги:
1. запустить Codespace
2. создать файл docker-compose.yml и внести в него код ниже
3. в терминале запустить команду docker-compose up
4. зайти в меню ПОРТЫ в codespace
5. перейти в веб браузере по ссылке которая ведёт на pgadmin(смотрите, где открытый порт 8080)
6. нажимает на Add New Server( на русском - Добавить новый сервер)
7. В открывшемся окне вводим имя сервера, которое может быть любым придуманным вами словом.
8. Заходим в Connections и вписываем данные от сервера (они у нас вбиты в docker-compose.yml):

HOST_NAME/Address           postgres
Maintenance database        mydb
Username:                       postgres
PASSWORD:                   postgres
PORT                        5432

вводим эти данные или свои, если меняли стандартные записанные в файле

9. Нажимаем кнопку SAVE


version: '3.8'

services:
  postgres:
    image: postgres:15
    container_name: postgres_db
    environment:
      POSTGRES_DB: mydb
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - db_network
    restart: unless-stopped

  pgadmin:
    image: dpage/pgadmin4:7
    container_name: pgadmin
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@admin.com
      PGADMIN_DEFAULT_PASSWORD: admin
      PGADMIN_CONFIG_SERVER_MODE: 'False'
      PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION: 'False'
      PGADMIN_CONFIG_WTF_CSRF_ENABLED: 'False'
      PGADMIN_CONFIG_WTF_CSRF_SSL_STRICT: 'False'
    ports:
      - "8080:80"
    depends_on:
      - postgres
    networks:
      - db_network
    restart: unless-stopped

volumes:
  postgres_data:

networks:
  db_network:
    driver: bridge
