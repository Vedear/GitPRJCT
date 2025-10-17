# Конспект занятий

## Навигация по проекту

- [Todo](/Todo.md)
- [Markdown](/Markdown.md)
- [Bash](/content/Bash/)
- [Docker](/content/Docker.md)
- [Основы проектирования баз данных](/content/Basics_database_design/README.md)
- [Обеспечение качества функционирования компьютерных систем](/content/Ensuring_quality_computer_systems_functioning/README.md)
- [Поддержка и тестирование программных модулей](/content/SupportAndtesting_of_software_modules/README.md)

```markdown
> Со студентами составить навигацию по этому репозиторию средствами Markdown!
```

Минимальные требования к студентам

1. Персональный компьютер и аудиогарнитура
1. **Git** (Git-Bash) [Git-Bash](https://git-scm.com/)
1. Регистрация в Яндекса или VK
1. Сервис [gitflic.ru](gitflic.ru) и [Github](github.com)
1. Создать публичный репозиторий на [gitflic.ru](gitflic.ru)
1. **Dia** [Dia](https://ru.wikipedia.org/wiki/Dia)
1. **VSCode** [VSCode](https://code.visualstudio.com/)
1. **Termux** (для Андроид) [Termux](https://termux.dev/en/)
1. Компилятор **gcc** (Для Windows MinGW) [MinGW](https://www.mingw-w64.org/downloads/)
1. **WSL 2.0** - установить Ubuntu - для БД [WSL 2.0](https://gitflic.ru/project/rurewa/education/blob?file=content%2FProgramming%2Fwsl2.md&commit=f9dc07eb6d93862b751d82c6806a1f860043b785&mode=markdown)
1. **Virtual Box** - для установки **Alt Образование 11** - для контроллера домена (групповые политики)
[Virtual Box](https://www.oracle.com/virtualization/virtualbox/)
[Альт Образование 11](https://download.basealt.ru/pub/distributions/ALTLinux/p11/images/education/x86_64/alt-education-11.0-x86_64.iso)
1. Нейросети [DeepSeek](https://chat.deepseek.com/) и [Cursor](https://cursor.com/)

### WSL 2.0 для Windows 10 (для работы с БД)

Проверить поддержку CPU виртуализации

1. В BIOS **VTx** или **AMD-V** - `enable` (Advanced configuration CPU)

#### Основные этапы настройки и устновки WSL 2.0

1. Включение дополнения "Подсистема Windows для Linux"
    - Выполнить **Win + R**, в диалоговом окне ввести `appwiz.cpl` и нажать **Enter**.
    - Программы и компоненты -> Включение и отключение дополнительных компонентов Windows -> поставить флажок в *Подсистема Windows для Linux*
    - Перезагрузить компьютер
    - Запустить **Windows PowerShell** (Администратор)
    - Проверка подсистемы WSL 2.0 командой `wsl --version`
    - Обновить WSL 2.0 командой `wsl --update`
    - Установить WSL 2.0 `wsl --install`
    - Когда система предложит указать имя пользователя UNIX, надо указать `user` и Enter
    - Пароль польователя `user` - `123` (при наборе пароля он никак не отображается, но всё равно набирается) и **Enter**. Повтори пароль и **Enter**
    - Перезагрузить компьютер
    - После перезагрузки найти **Ubuntu** можно из **Главного меню** и запустить её как обычное приложение **Windows**
    - Обновить Ubuntu: в терминале Ubuntu запустить команду `sudo apt list --upgradable -a && sudo apt update && sudo apt full-upgrade -y`
    - Установить дополнительные утилиты в Ubuntu: в терминале Ubuntu запустить команду `sudo apt update && sudo apt install -y mc htop tree whois sl neofetch wget curl inxi ncdu micro xclip xsel cmatrix`
    - Установить поддержку g++ и clang++ в терминале Ubuntu: `sudo apt update && sudo apt install -y build-essential git gdb ascii clang mingw-w64`
    - Проверить работу Ubuntu командами:
        - `uname -a` - краткая информация о системе
        - `neofetch` - красивая информация о системе
        - `htop` - процессы в режиме реального времени. Выйти по **Q** или **Ctrl+C**
        - `sl`
        - `ascii -d`
        - `inxi -F`
    - (Не обязательно!)Если обновления Ubuntu завершаться ошибкой, то надо в **Windows PowerShell** (Администратор) задать версию WSL 2 по умолчанию: `wsl --set-default-version 2`

[Основные команды для WSL](https://learn.microsoft.com/ru-ru/windows/wsl/basic-commands)

### Docker

1. [Загрузить Docker-Desktop](https://www.docker.com/products/docker-desktop/)
1. Выполнять авторизацию в Docker-Desktop не обязательно, указать personal;
1. Перезагрузить компьютер;
1. Запустить Docker Desktop (можно добавить в автозагрузку для удобства);
1. В Powershell выполнить ```docker images``` для показа установленных образов;
1. Установить тестовый контейнер ```docker run hello-world```

### Virtual Box (Для организации контроллера домена)

[Загрузить и установить Virtual Box](https://www.oracle.com/virtualization/virtualbox/)

[Загрузить Альт Образование 11](https://download.basealt.ru/pub/distributions/ALTLinux/p11/images/education/x86_64/alt-education-11.0-x86_64.iso)


### Настройки VSCode

- Включить машстабирование по Ctrl+WheelMouse
    - Settings -> Zoom -> Mouse Wheel Zoom
- Отключить Миникарту в редакторе
    - Settings -> Editor -› Minimap:

Установка расширений

- LiveServer (FiveServer)
    - [LiveServer](https://marketplace.visualstudio.com/items?itemName=yandeu.five-server)
- CodeSnap
    - [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap)
- Trailing Spaces
    - [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)

Открыть и закрыть встроенный терминал по **Ctrl+~**


### Рекомендуемые навыки и умения

1. "Слепая печать" на стандартной клавиатуре
1. Технический английский
1. Быть подписанным на тематические группы в Телеграм
1. Markdown

### Git

#### 1. Запуск Git на персональном компьютере

Проверить утановку Git в Powershell
```shell
git --version
```

Команды представления системе Git

```shell
git config --global user.name "Rurewa"
```

> где вместо **Rurewa** - ваш username

```shell
git config --global user.email "rurewa@mail.ru"
```

> где вместо `rurewa@mail.ru` - ваша почта

#### 2. Клонировать удалённый репозиторий на свой компьютер

```shell
git clone https://gitflic.ru/project/kizdano/1234.git
```

#### 3. Открыть папку склонированного репозитория

Проверить статус текущего репозитория

```shell
git status
```
#### 5. Внести изменения в текущий репозиторий

#### 6. Проверить изменения

```shell
git status
```

#### 7. Подготовить файлы к коммиту (добавить)

```shell
git add .
```

#### 8. Закоммитить

```shell
git commit -m "Some message"
```

#### 9. Запушить

```shell
git push
```

или, если не получилось с 1-го раза запушить, то:

```shell
git push -u origin master
```

#### 10. Проверить изменения на сайте удалённого репозитория

Перейти на сайт репозитория и обновить страницу в браузере **Ctrl-R** либо **F5**

#### 11. Получить изменения из удалённого репозитория

```shell
git pull
```

#### Получить список коммитов текущего репозитория

```shell
git log
```

> чтобы выйти из списка коммитов, выполните **Q**

Показать разницу каждого коммита

```git log -p```

Показать последний коммит

```git log --stat -1```

> чтобы выйти из списка коммитов, выполните **Q**

показать несколько последних коммитов -2, -3 etc.

```git log --stat -2```

> чтобы выйти из списка коммитов, выполните **Q**

Показать кратую информацию о коммитах

```git log --stat```

> чтобы выйти из списка коммитов, выполните **Q**

Показать хеши коммитов

```git log --oneline```

> чтобы выйти из списка коммитов, выполните **Q**

Сравнения коммитов

```git diff```

сравнение до git commit - m

```git diff --staged```

> чтобы выйти из списка коммитов, выполните **Q**

Показать настройки текущего (локального) git-репозитория

```git config --list```

Изменение комментария последнего коммита

```git commit --amend```

Показать информацию об удалённом репозитории

```git remote -v```

```git remote show origin```

Отмена изменений

```git reset``` - отмена индексации

```git restore```

```git restore --staged``` - сработает только после ```add .```

Объединить команды ```git add``` . и ```git commit -m```

```git commit -a 'Some comments'```

#### Основные команды bash (командная строка, консоль)

**Bash** - командный интерпритатор и скриптовый язык программирования

Показать текущее расположение

```pwd```

Показать содержимое текущего каталога

```ls```

```ls -all``` - включая скрытые файлы и папки

Показать в виде дерева каталогов

```tree```

Переход в указанный каталог

```cd foldername``` - где foldername - это имя целевого каталога

Выйти из текущего каталога вверх по иерархии

```cd ..```

Вернуться в папку пользователя по умолчанию

```cd ~```

Создать пустой каталог
```shell
mkdir emptyDir
```

Создать пустой тектовый файл
```shell
touch emptyFile.txt
```

Показать тип файла
```shell
file enyFile.txt
```

Показать больше информации о файле
```shell
stat file1.txt
```

Показать все ранее введённые команды:
```shell
history
```

#### Работа с git-ветками

Показать локальные ветки

```git branch```

Показать удалённые ветки репозитория

```git branch --all```

Переключиться на указанную ветку

```git checkout test```

Объединить ветки - слияние бранчей

Если нужно выполнить слияние ветки master с test, то

```git merge test```

из ветки *master*

Если нужно выполнить слияние ветки *test* с *master*, то

```git merge master```

из ветки test

#### Зачем нужен Git?

##### Почему не флешка?

1. Флешка - потенциальный разносчик вирусов
1. Личные данные с флешки случайно могут попать на чужой компьютер
1. Антивирус ОС может удалить данные с флешки
1. Флешка может потеряться или сломаться

##### Почему не облако типа Yandex или Google?

1. Облако не контролирует версии данных
1. Своё облако на чужом компьютере - это риск утечки личных данных
1. Для работы с облаком на чужом компьтере необходим браузер, а это не безопасно
1. Нет надёжной фильтрации типов файлов для загрузки и хранения в облаке

##### Премущества Git

1. Трудно потерять свои проекты
1. Легко отслеживать версии прокта
1. Легко делиться с другими людьми своими проктами
1. Легко разрабатывать проекты совместно с другими людьми (в команде)
1. Git по умолчанию интегрирован во многие популярные средства разработки, т.к. VSCode
1. В Git можно создавать веб-страницы с описанием своих проектов
1. Многие Git-сервисы предоставляют возможность автоматизации сборки ваших проектов

##### Основные состояния git-репозитория

1. Инициализирован - ```git status``` - показать состояние текущего репозитория
2. Подготовлен (добавлены изменения) - ```git add .``` - добавление изменений
3. Сохранение - ```git commit -m 'Update README.md - fix'``` - сохранение с комментарием
4. Синхронизация с удалённым репозиторием - ```git push``` - сохранение на облачном сервисе, например `Gitflic.ru`

##### Что можно сохранять в git?

1. Обычно небольшие по объёму файлы,  < 40 mb.
1. Изображения, документы, mp3, видео
1. Все файлы с именами латинскими буквами без пробелов