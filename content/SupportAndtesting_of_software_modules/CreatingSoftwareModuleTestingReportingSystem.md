> Для выполнения этого задания надо познакомиться с программированием на Bash!

## Самостоятельная работа: "Создание системы отчетов о тестировании программного модуля"

### Цель работы
Освоить практические навыки автоматизации процессов тестирования, документирования результатов и контроля версий в рамках поддержки программных модулей.

---

### Задание

Студентам необходимо создать автоматизированную систему для тестирования простого программного модуля и генерации отчетов.

#### Часть 1: Подготовка репозитория и модуля (Git + Markdown)

**Задача:** Создать Git-репозиторий с базовой структурой проекта и документацией.

1. **Инициализация репозитория:**
   - Сервисы Gitflic.ru или Github.com
   - Создать публичный, клонировать себе на компьютера

2. **Создание структуры проекта:**
   ```
   module-testing-system/
   ├── src/                    # Исходный код модуля
   │   └── calculator.sh       # Тестируемый модуль
   ├── tests/                  # Тесты
   │   └── test_calculator.sh  # Скрипт тестирования
   ├── docs/                   # Документация
   │   └── README.md           # Основная документация
   ├── reports/                # Отчеты (генерируются автоматически)
   └── scripts/                # Вспомогательные скрипты
       └── run_tests.sh        # Основной скрипт запуска
   ```

3. **Создание тестируемого модуля (`src/calculator.sh`):**
   ```shell
   #!/bin/bash
   # Простой калькулятор для тестирования

   add() {
       echo $(($1 + $2))
   }

   subtract() {
       echo $(($1 - $2))
   }

   multiply() {
       echo $(($1 * $2))
   }

   divide() {
       if [ $2 -eq 0 ]; then
           echo "Error: Division by zero"
           return 1
       else
           echo $(($1 / $2))
       fi
   }
   ```

4. **Создание документации (`docs/README.md`):**
   ```markdown
   # Система тестирования модуля Calculator

   ## Описание
   Проект для автоматического тестирования bash-модуля калькулятора.

   ## Структура
   - `src/calculator.sh` - тестируемый модуль
   - `tests/test_calculator.sh` - скрипт тестирования
   - `scripts/run_tests.sh` - основной скрипт запуска
   - `reports/` - автоматически генерируемые отчеты

   ## Запуск тестов
   ```shell
   ./scripts/run_tests.sh
   ```

   ## Пример использования
   ```shell
   source src/calculator.sh
   add 5 3  # Результат: 8
   ```
   ```

#### Часть 2: Создание системы тестирования (Bash)

**Задача:** Написать скрипты для автоматического тестирования и генерации отчетов.

1. **Скрипт тестирования (`tests/test_calculator.sh`):**
   ```shell
   #!/bin/bash

   # Подключаем тестируемый модуль
   source ../src/calculator.sh

   # Переменные для отчетности
   PASSED=0
   FAILED=0
   TEST_RESULTS=""

   # Функция для проверки результатов
   assert_equal() {
       local test_name="$1"
       local expected="$2"
       local actual="$3"

       if [ "$expected" = "$actual" ]; then
           TEST_RESULTS+="✅ PASS: $test_name\n"
           ((PASSED++))
       else
           TEST_RESULTS+="❌ FAIL: $test_name (expected: $expected, got: $actual)\n"
           ((FAILED++))
       fi
   }

   # Тесты для функции сложения
   test_add() {
       echo "Running addition tests..."
       assert_equal "add 2+3" "5" "$(add 2 3)"
       assert_equal "add negative numbers" "-1" "$(add 2 -3)"
   }

   # Тесты для функции деления
   test_divide() {
       echo "Running division tests..."
       assert_equal "divide 6/2" "3" "$(divide 6 2)"
       assert_equal "divide by zero" "Error: Division by zero" "$(divide 6 0)"
   }

   # Запуск всех тестов
   run_all_tests() {
       test_add
       test_divide
       # Добавьте другие тестовые функции здесь
   }

   # Главная функция
   main() {
       echo "Starting Calculator Module Tests..."
       echo "====================================="

       run_all_tests

       echo "====================================="
       echo "Tests completed:"
       echo "✅ PASSED: $PASSED"
       echo "❌ FAILED: $FAILED"

       # Сохраняем сырые результаты для основного скрипта
       echo "$PASSED" > ../reports/passed_count.txt
       echo "$FAILED" > ../reports/failed_count.txt
       echo -e "$TEST_RESULTS" > ../reports/test_details.txt
   }

   main "$@"
   ```

2. **Основной скрипт запуска (`scripts/run_tests.sh`):**
   ```shell
   #!/bin/bash

   # Создаем директорию для отчетов если её нет
   mkdir -p ../reports

   # Запускаем тесты и перехватываем вывод
   {
       echo "# Отчет о тестировании"
       echo "**Дата:** $(date '+%Y-%m-%d %H:%M:%S')"
       echo ""

       # Запускаем тесты и захватываем вывод
       TEST_OUTPUT=$(../tests/test_calculator.sh 2>&1)
       echo "## Результаты выполнения тестов"
       echo '```'
       echo "$TEST_OUTPUT"
       echo '```'
       echo ""

       # Читаем результаты из файлов
       PASSED=$(cat ../reports/passed_count.txt)
       FAILED=$(cat ../reports/failed_count.txt)
       TEST_DETAILS=$(cat ../reports/test_details.txt)

       echo "## Детализация тестов"
       echo -e "$TEST_DETAILS"
       echo ""

       # Генерируем сводку
       TOTAL=$((PASSED + FAILED))
       SUCCESS_RATE=0
       if [ $TOTAL -gt 0 ]; then
           SUCCESS_RATE=$((PASSED * 100 / TOTAL))
       fi

       echo "## Статистика"
       echo "- Всего тестов: $TOTAL"
       echo "- Успешных: $PASSED"
       echo "- Проваленных: $FAILED"
       echo "- Успешность: $SUCCESS_RATE%"

       # Определяем статус сборки
       if [ $FAILED -eq 0 ]; then
           echo "## Статус: ✅ **ВСЕ ТЕСТЫ ПРОЙДЕНЫ**"
           exit 0
       else
           echo "## Статус: ❌ **ОБНАРУЖЕНЫ ОШИБКИ**"
           exit 1
       fi

   } > ../reports/test_report.md

   # Выводим отчет в консоль
   cat ../reports/test_report.md
   ```

#### Часть 3: Автоматизация и документирование (Git + Markdown)

**Задача:** Настроить автоматическую генерацию отчетов и ведение истории тестирования.

1. **Создание скрипта инициализации (`scripts/setup.sh`):**
   ```shell
   #!/bin/bash
   # Скрипт первоначальной настройки проекта
   chmod +x ../scripts/*.sh
   chmod +x ../tests/*.sh
   chmod +x ../src/*.sh
   echo "Project setup completed!"
   ```

2. **Настройка Git: файл .gitignore:**
   ```shell
   # .gitignore
   reports/*.txt
   !reports/*.md
   ```

3. **Работа с Git:**
   ```shell
   # Добавляем файлы в репозиторий
   git add .
   git commit -m "Initial commit: Module testing system"
   git push

   # После запуска тестов
   git add reports/test_report.md
   git commit -m "Test report $(date '+%Y-%m-%d')"
   git push
   ```

---

### Критерии оценки

| **Критерий** | **Баллы** | **Описание** |
|--------------|-----------|--------------|
| **Корректность скриптов** | 30 | Все скрипты выполняются без ошибок, тесты работают корректно |
| **Структура проекта** | 20 | Логичная организация файлов и директорий |
| **Качество документации** | 20 | README.md содержит всю необходимую информацию, хорошо отформатирован |
| **Автоматизация** | 15 | Система автоматически генерирует подробные отчеты |
| **Работа с Git** | 15 | Корректные коммиты, осмысленные сообщения, правильный .gitignore |

### Дополнительные задания (для повышения оценки)

1. **Расширение функциональности:** Добавить функции вычисления степени, факториала в калькулятор и соответствующие тесты
2. **Улучшение отчетов:** Добавить цветовое форматирование в консольный вывод
3. **История тестирования:** Реализовать сохранение истории отчетов с возможностью сравнения результатов
4. **CI-эмуляция:** Написать скрипт, который имитирует работу CI-системы (автоматический запуск тестов при коммитах)

### Пример выполнения команды

```shell
# После настройки проекта
./scripts/run_tests.sh

# Результат - созданный Markdown-отчет в reports/test_report.md
# который можно просмотреть или сконвертировать в HTML
```

Эта работа позволяет студентам на практике освоить ключевые аспекты поддержки и тестирования: автоматизацию, документирование и контроль версий в реальном сценарии.