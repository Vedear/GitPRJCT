# Конспект занятий

## Навигация по проекту

- [Bash](/content/Bash/README.md)
- [Git](/content/Git/README.md)
- [Markdown](Markdown.md)
- [Mermaid](/content/Mermaid/README.md)
- [Docker](/content/Docker/README.md)
- [Инструментальные средства разработки ПО](/content/SoftwareDevelopmentTools/README.md)
- [Информационные технологии](/content/IT/README.md)
- [Основы проектирования баз данных](/content/Basics_database_design/README.md)
- [Обеспечение качества функционирования компьютерных систем](/content/Ensuring_quality_computer_systems_functioning/README.md)
- [Поддержка и тестирование программных модулей](/content/SupportAndTesting_of_software_modules/)

[Минимальные и рекомендуемые технические требования для рабочего места студента](https://gitflic.ru/project/rurewa/cpp/file?branch=master)

## Навигация по документу

- [Git](#git)
- [WSL 2.0 для Windows 10](#wsl-20-для-windows-10-для-работы-с-бд)
- [Docker](#docker)
- [Virtual Box (Для организации контроллера домена)](#virtual-box-для-организации-контроллера-домена)
- [Минимальные настройки VSCode](#минимальные-настройки-vscode)
- [Вопросы к экзамену](#вопросы-к-экзамену)
- [Рекомендуемые навыки и умения](#рекомендуемые-навыки-и-умения)

**Минимальные требования к студентам:**

1. Персональный компьютер и аудиогарнитура.
1. **Git** (Git-Bash) [Git-Bash](https://git-scm.com/)
1. Регистрация в [Яндекс](https://ya.ru/) или [VK](https://vk.com/)
1. Сервис [gitflic.ru](gitflic.ru) и [Github](github.com)
1. Создать публичный репозиторий на [gitflic.ru](gitflic.ru)
1. **Dia** [Dia](https://ru.wikipedia.org/wiki/Dia) (не обязательно)
1. Установить команду **Tree** в Windows:
    - [Chocolatey - это основанный на CLI менеджер пакетов для Windows, который чем-то похож на apt-get](https://github.com/chocolatey/choco/releases?ysclid=mh035mg6en297039295)
    - В Powershell выполнить установку **Tree**:
    ```powershell
    choco install tree
    ```
1. **VSCode** [VSCode](https://code.visualstudio.com/)
1. **Termux** (для Андроид) [Termux](https://termux.dev/en/)
1. Компилятор **gcc** (Для Windows MSYS2) [MSYS2](https://www.msys2.org/) или [Clang](https://releases.llvm.org/download.html)
1. **WSL 2.0** - установить Ubuntu - для БД [WSL 2.0](https://gitflic.ru/project/rurewa/education/blob?file=content%2FProgramming%2Fwsl2.md&commit=f9dc07eb6d93862b751d82c6806a1f860043b785&mode=markdown)
1. Docker - [Загрузить и установить Docker-Desktop](https://www.docker.com/products/docker-desktop/)
1. **Virtual Box** - для установки **Alt Образование 11** - для контроллера домена (групповые политики)
[Virtual Box](https://www.oracle.com/virtualization/virtualbox/)
[Альт Образование 11](https://download.basealt.ru/pub/distributions/ALTLinux/p11/images/education/x86_64/alt-education-11.0-x86_64.iso)
1. Нейросети [DeepSeek](https://chat.deepseek.com/) и [Cursor](https://cursor.com/)

### Git

#### Минимальные настройки Git в Windows/Linux

Открыть **Powersheell** или **Git-Bash**

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

### [Подробней о Git >>>](/content/Git/README.md)


### WSL 2.0 для Windows 10 (для работы с БД etc.)

Проверить поддержку CPU виртуализации

1. В BIOS **VTx** или **AMD-V** - `enable` (Advanced configuration CPU)

#### Основные этапы настройки и устновки WSL 2.0

1. Включение дополнения "Подсистема Windows для Linux"
    - Выполнить **Win + R**, в диалоговом окне ввести `appwiz.cpl` и нажать **Enter**.
    - Программы и компоненты -> Включение и отключение дополнительных компонентов Windows -> поставить флажок в *Подсистема Windows для Linux*
    - Перезагрузить компьютер
    - Запустить **Windows PowerShell** (Администратор)
    - Проверка подсистемы **WSL 2.0** командой `wsl --version`
    - Обновить **WSL 2.0** командой `wsl --update`
    - Установить **WSL 2.**0 `wsl --install`
    - Когда система предложит указать имя пользователя **UNIX**, надо указать `user` и Enter
    - Пароль польователя `user` - `123` (при наборе пароля он никак не отображается, но всё равно набирается) и **Enter**. Повтори пароль и **Enter**
    - Перезагрузить компьютер
    - После перезагрузки найти **Ubuntu** можно из **Главного меню** и запустить её как обычное приложение **Windows**
    - Обновить **Ubuntu**: в терминале **Ubuntu** запустить команду `sudo apt list --upgradable -a && sudo apt update && sudo apt full-upgrade -y`
    - Установить дополнительные утилиты в **Ubuntu**: в терминале **Ubuntu** запустить команду `sudo apt update && sudo apt install -y mc htop tree whois sl neofetch wget curl inxi ncdu micro xclip xsel cmatrix`
    - Установить поддержку `g++` и `clang++` в терминале **Ubuntu**: `sudo apt update && sudo apt install -y build-essential git gdb ascii clang mingw-w64`
    - Проверить работу **Ubuntu** командами:
        - `uname -a` - краткая информация о системе
        - `neofetch` - красивая информация о системе
        - `htop` - процессы в режиме реального времени. Выйти по **Q** или **Ctrl+C**
        - `sl`
        - `ascii -d`
        - `inxi -F`
    - (Не обязательно!)Если обновления **Ubuntu** завершаться ошибкой, то надо в **Windows PowerShell** (Администратор) задать версию **WSL 2** по умолчанию: `wsl --set-default-version 2`

[Основные команды для WSL](https://learn.microsoft.com/ru-ru/windows/wsl/basic-commands)

### Docker (Разработка, тестирование и запуск различтоного ПО)

1. [Загрузить и установить Docker-Desktop](https://www.docker.com/products/docker-desktop/)
1. Выполнять авторизацию в **Docker-Desktop** (можно через Google), указать `personal`;
1. Перезагрузить компьютер;
1. Запустить **Docker Desktop** (можно добавить в автозагрузку для удобства);
1. В **Powershell** выполнить ```docker images``` для показа установленных образов;
1. Установить тестовый контейнер ```docker run hello-world```

[Уроки по Docker для начинающих](/content/Docker/README.md)

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

Проверить систему Альт Образование 11

```shell
fastfetch
```

```shell
inxi -F
```

### Минимальные настройки `VSCode`

- Включить машстабирование по **Ctrl+WheelMouse**
    - **Settings** -> **Zoom** -> **Mouse Wheel Zoom**
- Отключить Миникарту в редакторе
    - **Settings** -> **Editor** -› **Minimap:**
- Велючить предложения в интегрированном терминале VSCdoe **Settings** -> `terminal.integrated.suggest.enabled`

Установка расширений

- LiveServer (**FiveServer**) - превью локального сайта
    - [LiveServer(FiveServer)](https://marketplace.visualstudio.com/items?itemName=yandeu.five-server)
- **CodeSnap** - скриншотер исходного кода
    - [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap)
- **Trailing Spaces** - удаление "паразитных" пробелов
    - [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)
  **Mermaid** - графики, блок-схемы и диаграммы в **Markdown**
- [Markdown Preview Mermaid Support](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
  **Markdown Syntax Highlighting** - подсветка синтаксиса в **Mermaid**
- [Mermaid Markdown Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting)


Открыть и закрыть встроенный в **VS Code** терминал по **Ctrl+~**

[Подробней о настройках VSCode](https://gitflic.ru/project/rurewa/education/blob?file=content%2FProgramming%2FVCode.md&commit=b7894efff8eadc1c1fc442028810b950c8d6a432&mode=markdown)

### Рекомендуемые навыки и умения

1. "Слепая печать" на стандартной клавиатуре
    - [Онлайн-клавиатурный тренажер](https://stamina-online.com/ru/)
1. Эффективная работа с текстом (важные клавиатурные сокращения)
1. Технический английский [Золотой плейлист А. Бербис](https://vkvideo.ru/playlist/-227037029_21?ysclid=mictnz3gl4831947556)
1. Читать тематические группы в Телеграм
1. Git+Markdown

## Вопросы к экзамену

[Вопросы к экзамену по дисциплине «ОСНОВЫ ПРОЕКТИРОВАНИЯ БАЗ ДАННЫХ»](/content/Basics_database_design/questions.md)

[Вопросы к экзамену по дисциплине «ПОДДЕРЖКА И ТЕСТИРОВАНИЕ ПРОГРАММНЫХ МОДУЛЕЙ»](/content/SupportAndTesting_of_software_modules/questions.md)

[Вопросы к экзамену по дисциплине «ОБЕСПЕЧЕНИЕ КАЧЕСТВА ФУНКЦИОНИРОВАНИЯ КОМПЬЮТЕРНЫХ СИСТЕМ»](/content/Ensuring_quality_computer_systems_functioning/questions.md)


[Вопросы к экзамену по дисциплине "Инструментальные средства разработки ПО"](/content/SoftwareDevelopmentTools/questions.md)

[Вопросы к экзамену по дисциплине "Информационные технологии"](/content/IT/questions.md)