#!/bin/bash
# passGen.sh
# Генерация пароля из 8 символов одной строкой:
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n1