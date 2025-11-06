# Конспект занятий

## Навигация по проекту

- [Todo](/Todo.md)
- [Markdown](/Markdown.md)
- [Bash](/content/Bash/)
- [Docker](/content/Docker.md)
- [Основы проектирования баз данных](/content/Basics_database_design/README.md)
- [Обеспечение качества функционирования компьютерных систем](/content/Ensuring_quality_computer_systems_functioning/README.md)
- [Поддержка и тестирование программных модулей](/content/SupportAndTesting_of_software_modules/)

[Минимальные технические требования для места разработчика](https://gitflic.ru/project/rurewa/cpp/file?branch=master)

Минимальные требования к студентам

1. Персональный компьютер и аудиогарнитура. [Минимальные требования](https://gitflic.ru/project/rurewa/cpp/file?branch=master)
1. **Git** (Git-Bash) [Git-Bash](https://git-scm.com/)
1. Регистрация в [Яндекс](https://ya.ru/) или [VK](https://vk.com/)
1. Сервис [gitflic.ru](gitflic.ru) и [Github](github.com)
1. Создать публичный репозиторий на [gitflic.ru](gitflic.ru)
1. **Dia** [Dia](https://ru.wikipedia.org/wiki/Dia)
1. **VSCode** [VSCode](https://code.visualstudio.com/)
1. **Termux** (для Андроид) [Termux](https://termux.dev/en/)
1. Компилятор **gcc** (Для Windows MinGW) [MinGW](https://www.mingw-w64.org/downloads/)
1. **WSL 2.0** - установить Ubuntu - для БД [WSL 2.0](https://gitflic.ru/project/rurewa/education/blob?file=content%2FProgramming%2Fwsl2.md&commit=f9dc07eb6d93862b751d82c6806a1f860043b785&mode=markdown)
1. Docker - [Загрузить и установить Docker-Desktop](https://www.docker.com/products/docker-desktop/)
1. **Virtual Box** - для установки **Alt Образование 11** - для контроллера домена (групповые политики)
[Virtual Box](https://www.oracle.com/virtualization/virtualbox/)
[Альт Образование 11](https://download.basealt.ru/pub/distributions/ALTLinux/p11/images/education/x86_64/alt-education-11.0-x86_64.iso)
1. Нейросети [DeepSeek](https://chat.deepseek.com/) и [Cursor](https://cursor.com/)

### Git

Открыть Powersheell или Git-Bash

Сделать тектовый редактор Nano по умолчанию
```shell
git config --global core.editor "nano"
```

Команды представления системе **Git**

```shell
git config --global user.name "Rurewa"
```

> где вместо **Rurewa** - ваш username

```shell
git config --global user.email "rurewa@mail.ru"
```

> где вместо `rurewa@mail.ru` - ваша почта


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

1. [Загрузить и установить Docker-Desktop](https://www.docker.com/products/docker-desktop/)
1. Выполнять авторизацию в Docker-Desktop (можно через Google), указать personal;
1. Перезагрузить компьютер;
1. Запустить Docker Desktop (можно добавить в автозагрузку для удобства);
1. В Powershell выполнить ```docker images``` для показа установленных образов;
1. Установить тестовый контейнер ```docker run hello-world```

[Подробный урок по Docker для начинающих](https://gitflic.ru/project/rurewa/altlinux/blob?file=content%2FDocker%2FDocker.md&branch=master&mode=markdown)

### Virtual Box (Для организации контроллера домена)

> Вместо Virtual Box можно использовать **Hyper V**

[Загрузить и установить Virtual Box](https://www.oracle.com/virtualization/virtualbox/)

[Создание виртуальной машины в Virtual Box 7.0 для установки Альт Образование](https://rutube.ru/video/9f1c18dafa34d0c525bbca95d4002863/)

[Установка Альт Образование 10/11 без UEFI](https://rutube.ru/video/8e0549a3a10f8881efb4260c77f4973b/)

[Загрузить Альт Образование 11](https://download.basealt.ru/pub/distributions/ALTLinux/p11/images/education/x86_64/alt-education-11.0-x86_64.iso)

После установки **Альт Образование 11** необходимо выполнить:

Обновить ОС
```shell
epm ei --auto && epm full-upgrade -y
```

Установить дополнительные утилиты
```shell
epmi --auto newt52 lshw yt-dlp btop htop nvtop apt-repo apt-https NetworkManager-tui eget wget fd git ncdu micro xclip xsel mc tree glxgears glmark2 neofetch fastfetch whois curl inxi net-tools arp-scan aria2 alterator-grub sysctl-conf-userns cmatrix codetest_sl caca-utils asciiquarium
```

Установить средства разработки
```shell
epmi --auto valgrind rpm-build llvm-common-clang-tools clang-devel gcc-c++ cppcheck ghex cmake gdb ascii kdbg
```

**Обновление ОС:**

Открыть **Терминал** (консоль) по **Ctrl+Alt+T**

Войти в консоль как **root**
```shell
su-
```

```shell
epm ei --auto && epm full-upgrade -y
```

перезагрузить

потом:

```shell
epmi --auto newt52 lshw yt-dlp btop htop nvtop apt-repo apt-https NetworkManager-tui eget wget fd git ncdu micro xclip xsel mc tree glxgears glmark2 neofetch fastfetch whois curl inxi net-tools arp-scan aria2 alterator-grub sysctl-conf-userns
```

Проверить систему Альт Образование 11

```shell
fastfetch
```

```shell
inxi -F
```

### Минимальные настройки VSCode

- Включить машстабирование по **Ctrl+WheelMouse**
    - **Settings** -> **Zoom** -> **Mouse Wheel Zoom**
- Отключить Миникарту в редакторе
    - **Settings** -> **Editor** -› **Minimap:**

Установка расширений

- LiveServer (**FiveServer**)
    - [LiveServer(FiveServer)](https://marketplace.visualstudio.com/items?itemName=yandeu.five-server)
- **CodeSnap**
    - [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap)
- **Trailing Spaces**
    - [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)

Открыть и закрыть встроенный терминал по **Ctrl+~**

(Подробней о настройках VSCode)[https://gitflic.ru/project/rurewa/education/blob?file=content%2FProgramming%2FVCode.md&commit=b7894efff8eadc1c1fc442028810b950c8d6a432&mode=markdown]

### Рекомендуемые навыки и умения

1. "Слепая печать" на стандартной клавиатуре
    - [Онлайн-клавиатурный тренажер](https://stamina-online.com/ru/)
1. Эффективная работа с текстом (важные клавиатурные сокращения)
1. Технический английский
1. Читать тематические группы в Телеграм
1. Git+Markdown

### Git

#### 1. Запуск Git на персональном компьютере

Проверить установку **Git** в **Powershell**
```shell
git --version
```

**Сменить редактор по умолчанию:**

На **Nano** (проще для новичков):

```shell
git config --global core.editor "nano"
```

На **VS Code**:

```shell
git config --global core.editor "code --wait"
```

**Представиться системе Git (выполняется однократно, после установки Git или перед 1-м коммитом)**

Команды представления системе **Git**

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
git clone https://gitflic.ru/project/rurewa/mfua
```

> этой командой будет склонирован на ваш компьютер мой репозиторий.

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

Показать сравнение до и после изменения файлов (до git add)
```shell
git diff
```

#### 7. Подготовить файлы к коммиту (добавить)

добавить все файлы и папки, включая скрытые
```shell
git add .
```

или все кроме скрытых
```shell
git add *
```

или объединить **git add** с **git commit**
```shell
git commit -a
```

> Откроется текстовый редактор командной сроки, в котором нужно записать текст коммит

Отменить добавленные изменения
```shell
git restore --staged README.md
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

Перейти на сайт проверяемого репозитория и обновить страницу в браузере **Ctrl-R** либо **F5**

#### 11. Получить изменения из удалённого репозитория

```shell
git pull
```

#### Получить список коммитов текущего репозитория

```shell
git log
```

> чтобы выйти из списка коммитов, выполните **Q**

Показать подробности каждого коммита

```git log -p```

или показать подробности нескольких коммитов
```shell
git log -p -3
```
покажет 3 последних коммита

Показать последний коммит кратко

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

сравнение до ```git commit - m```

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

**Bash** - командный интерпретатор и скриптовый язык программирования

Показать текущее расположение

```pwd```

Показать содержимое текущего каталога

```ls```

```ls -all``` - включая скрытые файлы и папки

Показать в виде дерева каталогов

```tree```

Переход в указанный каталог

```cd foldername``` - где *foldername* - это имя целевого каталога

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

Показать содержимое текстового файла без его открытия
```shell
cat file1.txt
```

Пролистать большой текст клавишами **ВВЕРХ/ВНИЗ**
```shell
cat file1.txt | less
```

> Выйти из режима `less` по клавише **Q**

Редактирование текстового файла
```shell
nano file1.txt
```

> Сохранить текст по **Ctrl+S**, выйти из nano по **Ctrl+X**

Можно ещё установить тектовый редактор **Micro** и редактировать файлы в нём:

```shell
apt install micro
```

Запустить консольный текстовый редактор **Micro** для создания и редактирования текстового файла
```shell
micro main.cpp
```

> Соранить текст по **Ctrl+S**, выйти из редактора по **Ctrl+Q**

Установить команду **tree** в Windows

[Tree](https://github.com/chocolatey/choco/releases?ysclid=mh035mg6en297039295)

```powershell
choco install tree
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

[Мои заметки по базовой работе с Git](https://gitflic.ru/project/rurewa/education/blob?file=content%2FGit%2FREADME.md&branch=master&mode=markdown)