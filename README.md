# Конспект занятий

## Навигация по проекту

- [Bash](/content/Bash/README.md)
- [Git](/content/Git/README.md)
- [Markdown](/content/Markdown.md)
- [Mermaid](/content/Mermaid/README.md)
- [Docker](/content/Docker/README.md)
- [Практические задания](/content/StudentPracticalsLabs/README.md)
- [Инструментальные средства разработки ПО](/content/SoftwareDevelopmentTools/README.md)
- [Информационные технологии](/content/IT/README.md)
- [Основы проектирования баз данных](/content/Basics_database_design/README.md)
- [Обеспечение качества функционирования компьютерных систем](/content/Ensuring_quality_computer_systems_functioning/README.md)
- [Поддержка и тестирование программных модулей](/content/SupportAndTesting_of_software_modules/)

---

> [Минимальные и рекомендуемые технические требования для рабочего пространства современного it-студента](https://gitflic.ru/project/rurewa/cpp/file?branch=master)

## Навигация по документу

- [Git](#git)
- [WSL 2.0 для Windows 10/11](#wsl-20-для-windows-10-для-работы-с-бд)
- [Docker](#docker)
- [Virtual Box (Для организации контроллера домена)](#virtual-box-для-организации-контроллера-домена)
- [Минимальные настройки VSCode](#минимальные-настройки-vscode)
- [Рекомендуемые навыки и умения](#рекомендуемые-навыки-и-умения)
- [Вопросы к экзамену](#вопросы-к-экзамену)

**Минимальные требования к студентам:**

1. Персональный компьютер с монитором (лучше два монитора) и аудиогарнитура. Хороший интернет
1. Для изучения **IT** технологий лучше использовать какой-нибудь **Linux**, например [Альт Образование 11](https://www.basealt.ru/alt-education)
1. Для пользователей **Linux** [инструкция по получению и настройке Альт Линукс Образование 11](/content/Linux/README.md)
1. Для пользователей **Windows 10/11**
1. Для установки приложений в Windows рекомендуется использовать [**WinGet**](https://learn.microsoft.com/ru-ru/windows/package-manager/winget/)! Проверить у себя в **PowerShell** установленный **WinGet** командой `winget --info`. Если не установлен, то:
    - Установить [WinGet (Windows Package Manager)](https://apps.microsoft.com/detail/9nblggh4nns1?hl=ru-RU&gl=RU) или [с Github](https://github.com/microsoft/winget-cli/releases)
1. Приложение [Teams](https://teams.microsoft.com/v2/) или браузер [Edge](https://www.microsoft.com/ru-ru/edge/download?form=MA13FW) или в **PowerShell** - `winget install Microsoft.Teams` и `winget install Microsoft.Edge`
1. **Git** (Git-Bash) [Git-Bash](https://git-scm.com/) или в **PowerShell** - `winget install Git.Git`
1. Регистрация в [Яндекс](https://ya.ru/) или [VK](https://vk.com/)
1. Сервис [gitflic.ru](gitflic.ru) и [Github](github.com)
1. Создать публичный репозиторий на [gitflic.ru](gitflic.ru)
1. **Dia** [Dia](https://ru.wikipedia.org/wiki/Dia) - `winget install gnome.Dia` (не обязательно)
1. **VSCode** [VSCode](https://code.visualstudio.com/) или в **PowerShell** - `winget install Microsoft.VisualStudioCode`
1. **Termux** (для Андроид) [Termux](https://termux.dev/en/)
1. Компилятор **gcc** (Для Windows MSYS2) [MSYS2](https://www.msys2.org/) или [Clang](https://releases.llvm.org/download.html)  или в **PowerShell** - `winget install LLVM.LLVM` - не обязательно!
1. **WSL 2.0** - установить Ubuntu - для **Docker** etc. [WSL 2.0 для Windows 10/11](#wsl-20-для-windows-10-для-работы-с-бд)
1. **Docker** - [Загрузить и установить Docker-Desktop](https://www.docker.com/products/docker-desktop/) или в **PowerShell** - `winget install Docker.DockerDesktop`
1. **Virtual Box** - для установки **Alt Образование 11** - для контроллера домена (групповые политики) - пока не обязательно!
[Virtual Box](https://www.oracle.com/virtualization/virtualbox/) или в **PowerShell** - `winget install --id=Oracle.VirtualBox -e`
    - [Альт Образование 11 для виртуальной машины](https://download.basealt.ru/pub/distributions/ALTLinux/p11/images/education/x86_64/alt-education-11.0-x86_64.iso) - пока не обязательно!
1. Нейросети [DeepSeek](https://chat.deepseek.com/) и [Cursor](https://cursor.com/)

> Периодически следует обновлять все установленные пользователем приложения. Это удобней делать через **PowerShell** командой ` winget upgrade --all`

Кроме этого, с помощью **WinGet** можно одновременно устанавливать сразу несколько выбранных приложени, например так:

```shell
winget install Microsoft.Teams Git.Git Microsoft.VisualStudioCode LLVM.LLVM
```

---

### Git

#### Минимальные настройки Git в Windows/Linux

Открыть **Powersheell** или **Git-Bash**

Выбрать текстовый редактор **Nano** по умолчанию
```shell
git config --global core.editor "nano"
```
Представиться системе **Git**:
```shell
git config --global user.name "Rosa"
```
> где вместо **Rosa** - ваш **username**
```shell
git config --global user.email "rosa@mail.ru"
```
> где вместо `rosa@mail.ru` - ваша почта
### [Подробней о Git >>>](/content/Git/README.md)


---

### WSL 2.0 для Windows 10/11 (может понадобиться для работы с Docker etc.)

Проверить поддержку **CPU** виртуализации на вашем оборудовании

1. В BIOS **VTx** или **AMD-V** - `enable` (Advanced configuration CPU)

#### Основные этапы настройки и установки WSL 2.0

1. Включение дополнения "Подсистема Windows для Linux"
    - Выполнить `Win + R`, в диалоговом окне ввести `appwiz.cpl` и нажать **Enter**.
    - Программы и компоненты -> Включение и отключение дополнительных компонентов Windows -> поставить флажок в *Подсистема Windows для Linux*
    - Или выполните в **Windows PowerShell** (Администратор) команду: `Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform`
    - Перезагрузить компьютер в PowerShell командой `Restart-Computer`
    - Запустить **Windows PowerShell** (Администратор)
    - Проверка подсистемы **WSL 2.0** командой `wsl --version` и `wsl --status`
    - Обновить **WSL 2.0** командой `wsl --update`
    - (Не обязательно!) Установить **Ubuntu** `wsl --install`
        - Когда система предложит указать имя пользователя **UNIX**, надо указать `user` и **Enter**
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
    - (Не обязательно!) Если обновления **Ubuntu** завершаться ошибкой, то надо в **Windows PowerShell** (Администратор) задать версию **WSL 2** по умолчанию: `wsl --set-default-version 2`

> Если компьютер не тянет для **WSL 2.0** и **Docker**, то можно попробовать выполнять задачи в [**Codespace**](https://github.com/features/codespaces) (но не желательно, т.к. очень ограниченный функционал!)

[Основные команды для WSL](https://learn.microsoft.com/ru-ru/windows/wsl/basic-commands)

---

### Docker (Разработка, тестирование и запуск различного ПО)

1. [Сначал включите **WSL** на своём компьютере!](#wsl-20-для-windows-10-для-работы-с-бд)
1. [Загрузить и установить Docker-Desktop](https://www.docker.com/products/docker-desktop/) или командой в **PowerShell** `winget install Docker.DockerDesktop`
1. Выполнять авторизацию в **Docker-Desktop** (можно через Google), указать `personal`;
1. Перезагрузить компьютер;
1. Запустить **Docker Desktop** (можно добавить в автозагрузку для удобства);
1. Установить и запустить тестовый контейнер `docker run hello-world`
1. Если `docker run hello-world` не срабатывает, то в Ubuntu выполните `sudo service docker restart`

> Если компьютер не тянет в **WSL 2.0** и **Docker**, то можно ограничется [Codespace](https://github.com/features/codespaces) (но не желательно, т.к. очень ограниченный функционал!)

[Уроки по **Docker** для начинающих](/content/Docker/README.md)

---

### [Virtual Box (Для организации контроллера домена) - пока не обязательно!](/content/Linux/README.md)

---

### Минимальные настройки `VSCode`

- Включить машстабирование по **Ctrl+WheelMouse**
    - **Settings** -> **Zoom** -> **Mouse Wheel Zoom**
- Отключить Миникарту в редакторе
    - **Settings** -> **Editor** -› **Minimap:**
- Велючить предложения в интегрированном терминале VSCdoe **Settings** -> `terminal.integrated.suggest.enabled`

Установка расширений

> ### РКН заблокировал расширения для VS Code!

Временное решение:
- [Открываем сайт загрузчика расширений https://vsix.2i.gs/](https://vsix.2i.gs/)
- [Находим нужное вам расширение на https://marketplace.visualstudio.com/](https://marketplace.visualstudio.com/)
- Скачиваем нужные расширения в отдельную папку и устанавливаем их через `Install From VSIX` в `Extensions` редактора **VS Code**

![VSCOD](/content/img/VSCODE_ext.jpg)

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

[Подробней о настройках VSCode](https://gitflic.ru/project/rurewa/education/blob?file=content/Programming/VCode.md&branch=master&mode=markdown)

---

### Рекомендуемые навыки и умения

1. "Слепая печать" на стандартной клавиатуре
    - [Онлайн-клавиатурный тренажер](https://stamina-online.com/ru/)
1. Эффективная работа с текстом (важные клавиатурные сокращения)
1. Технический английский [Золотой плейлист А. Бербис](https://vkvideo.ru/playlist/-227037029_21?ysclid=mictnz3gl4831947556)
1. Читать тематические группы в Телеграм
1. Git+Markdown+Mermaid+Docker+CI/CD

---

## Вопросы к экзамену

* [Вопросы к экзамену по дисциплине «ОСНОВЫ ПРОЕКТИРОВАНИЯ БАЗ ДАННЫХ»](/content/Basics_database_design/questions.md)
* [Вопросы к экзамену по дисциплине «ПОДДЕРЖКА И ТЕСТИРОВАНИЕ ПРОГРАММНЫХ МОДУЛЕЙ»](/content/SupportAndTesting_of_software_modules/questions.md)
* [Вопросы к экзамену по дисциплине «ОБЕСПЕЧЕНИЕ КАЧЕСТВА ФУНКЦИОНИРОВАНИЯ КОМПЬЮТЕРНЫХ СИСТЕМ»](/content/Ensuring_quality_computer_systems_functioning/questions.md)
* [Вопросы к экзамену по дисциплине "Инструментальные средства разработки ПО"](/content/SoftwareDevelopmentTools/questions.md)
* [Вопросы к экзамену по дисциплине "Информационные технологии"](/content/IT/questions.md)