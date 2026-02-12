## Получение и подготовка к работе Альт Линукс Образование 11


- [Прочитать документацию](https://docs.altlinux.org/ru-RU/alt-education/11.0/html-single/alt-education/index.html)
- [Обзор новинок в ОС «Альт Образование» 11.0](https://rutube.ru/video/37c21fa5a81245f65fd437026cc7dd1d/)
- [Получить дистрибутив](https://www.basealt.ru/alt-education)

Если вы ещё и пока на Windows...

Создать загрузочную флешку лучше программой [Alt Media Writer](https://github.com/altlinux/ALTMediaWriter/releases)

[Запись образов на DVD и USB Flash](https://www.altlinux.org/Запись_образов_на_DVD_и_USB_Flash)

### Установка Альт Линукс Образование в **Virtual Box**

> Рекомендую создавать пользователя ОС Альт с именем `user` и простым паролем (некоторые пользователи часто сразу забывают пароль)!

- [Как установить ОС «Альт» на VirtualBox](https://rutube.ru/video/3777d6f130e5d0991d980f571fd671cb/)
- [без UEFI](https://rutube.ru/video/8e0549a3a10f8881efb4260c77f4973b/)
- [c UEFI](https://rutube.ru/video/48bafa9c02194bfba4320c0ffee46073/)
- [Сброс пароля Linux](https://www.altlinux.org/Сброс_пароля_Linux)

### Установка **Альт Линукс Образование 11** рядом с Windows (Будьте осторожны, есть риск потерять свои данные на винде!)

- [Установка ОС Альт Рабочая станция рядом с ОС Windows](https://rutube.ru/video/a05baf8ff5d32d6471c7c6e7b1257c01/)
- [Установка Альт Образование 10 (altlinux) рядом с Windows](https://rutube.ru/video/6272835cb3f4876ed3afcc071c03d817/?utm_source=embed&utm_medium=referral&utm_campaign=logo&utm_content=6272835cb3f4876ed3afcc071c03d817&utm_term=yastatic.net&t=260)

### Установка Альт Линукс Образование вместо Windows (Будьте осторожны, все данные на винде будут потеряны!)

- [Установка ALT Linux Образование](https://rutube.ru/video/461732cb98c61c861cf70d0a3029dde6/?utm_source=embed&utm_medium=referral&utm_campaign=logo&utm_content=461732cb98c61c861cf70d0a3029dde6&utm_term=yastatic.net&t=424)

### Установить все необходимые приложения

#### Лучше воспользоваться скриптом, который установит необходимые приложения!

Открыть **Терминал** (можно по `Ctrl+T`)

Повысить привилегии:
```shell
su-
```
и выполнить команду:
```shell
apt-get update && apt-get install -y git && git clone https://gitflic.ru/project/rurewa/altlinux.git && cd altlinux/content/scripts/ ; ./11_mfua.sh
```

Обновить ОС и установленные в ней все приложения:
```shell
epm ei --auto && epm full-upgrade -y
```

**Git**
```shell
apt-get update && apt-get install -y git
```

**VS Code**
```shell
epmp --auto code
```

**Браузер Edge**
```shell
epmp --auto edge
```

**Docker**

Установка **Docker**
```shell
epmi --auto docker-engine docker-compose-v2
```
Добавление обычного пользователя ОС в группу
```shell
usermod user -aG docker
```
где `user` - имя вашего текущего пользователя

Добавление в автозагрузку
```shell
systemctl enable --now docker
```

Дополнительные полезные утилиты
```shell
epmi --auto newt52 lshw yt-dlp btop htop nvtop apt-repo apt-https NetworkManager-tui eget wget fd git ncdu micro xclip xsel mc tree glxgears glmark2 neofetch fastfetch whois curl inxi net-tools arp-scan aria2 alterator-grub mediainfo sysctl-conf-userns tmux nmap
```

Для программирования на **C/C++**
```shell
epmi --auto valgrind rpm-build llvm-common-clang-tools clang-devel gcc-c++ cppcheck ghex cmake gdb ascii kompare kdbg
```

Для программирования на **Python**
```shell
epmi --auto python3-module-pip python3-module-setuptools python3-tools
```

Для программирования на **Java**
```shell
epmi --auto java-25-openjdk
```