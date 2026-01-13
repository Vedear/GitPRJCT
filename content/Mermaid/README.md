## Mermaid — это инструмент для создания диаграмм и визуализаций с помощью простого текстового синтаксиса, подобного Markdown. Он поддерживает различные типы диаграмм: блок-схемы, последовательности, Gantt-диаграммы, графики зависимостей и другие.

### Задание студентам

- Создать новые публичные репозитории на `Github` или `Gitlab`
- Язык нового репозитория Markdown, README.md
- Склонировать себе и открыть в **VSCode**

Все типы диаграмм:

- **Блок-схемы**         - graph, flowchart
- **Последовательности** - sequenceDiagram
- **Классы**             - classDiagram
- **Ганта**              - gantt
- **Круговые**           - pie
- **Состояния**          - stateDiagram, stateDiagram-v2
- **ER-диаграммы**       - erDiagram
- **Юзер-джайрни**       - journey
- **Графы зависимостей** - graph, flowchart

### Синтаксис

- `graph TD` — направление сверху вниз (TD = Top-Down).
- `graph LR` — направление слева направо (LR = Left-Right).
- `|Текст|` — подпись стрелки.
- `A[Текст]` — прямоугольный блок.
- `B{Текст}` — ромб (условие).
- `-->` — стрелка связи.
- `->>` — сплошная стрелка (сообщение).
- `-->>` — пунктирная стрелка (ответ, ассоциация).
- `<|--` — наследование.
- `*--` - композиция
- `o--` - агрегация
- `participant` Имя — можно явно указать участников.
- `+` — public, `-` — private, `#` — protected, `~` - package/internal
- `dateFormat` — формат даты.
- `section` — раздел проекта.
- `:id`, `start`, `duration` — задача.
- `pie` - круговая диаграмма

### Установка планигов  поддержки Marmaid

Установить плагины в **VSCode**

[Markdown Preview Mermaid Support](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)

[Mermaid Markdown Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting)

Для установки в **VSCode** выполните **Ctrl-P** и в открывшемся вверху поле вставьте сл.строки по очереди, нажимая Enter:

```
ext install bierner.markdown-mermaid
```

и
```
ext install bpruitt-goddard.mermaid-markdown-syntax-highlighting
```

### Примеры втраиваемых в Markdown диаграмм Mermaid

### Как сделать диаграмму связей?
```mermaid
flowchart LR
    A[Вопрос: Как сделать список?] --> B["Ответ: Через `-` или `*`"]
    A --> C["Пример: \n- Пункт 1 \n- Пункт 2"]
```

***

### Блок-схемы

#### Базовая структура 1
```mermaid
graph TD
    A[Прямоугольник] --> B{Ромб}
    B -->|Да| C[Круг]
    B -->|Нет| D((Круг))
```

#### Базовая структура 2
```mermaid
graph TD
    A[Начало] --> B{Условие}
    B -->|Да| C[Действие 1]
    B -->|Нет| D[Действие 2]
    C --> E[Конец]
    D --> E
```

#### Полный синтаксис блок-схем
```mermaid
graph TD
    A[Прямоугольник]
    B(Скругленный)
    C{Ромб}
    D((Круг))
    E>Асимметричный]
    F{{Шестиугольник}}

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
```

### Диаграммы последовательности
```mermaid
sequenceDiagram
    participant A as Катя
    participant B as Дима
    A->>B: Привет, Дима!
    B->>A: Привет, Катя!
    A->>B: Как дела?
    Note right of B: Дима думает
    B-->>A: Отлично!

    loop Каждый день
        A->>B: Напоминание
    end

    alt Если занят
        B->>A: Перезвоню
    else Если свободен
        B->>A: Готов общаться
    end
```

### Диаграмма класса
```mermaid
classDiagram
    class Animal {
        +String name
        #int age
        -String species
        +makeSound() void
        +eat() abstract
    }

    class Dog {
        +String breed
        +bark() void
    }

    class Cat {
        +Boolean isIndoor
        +meow() void
    }

    Animal <|-- Dog
    Animal <|-- Cat
    Dog *-- Owner : has
```

### Диаграмма Ганта
```mermaid
gantt
    title План проекта
    dateFormat YYYY-MM-DD
    axisFormat %d/%m

    section Разработка
    Анализ требований :a1, 2024-01-01, 7d
    Проектирование :a2, after a1, 5d
    Реализация :a3, after a2, 14d

    section Тестирование
    Модульное тестирование :b1, after a2, 10d
    Интеграционное тестирование :b2, after a3, 7d
```


### Круговая диаграмма
```mermaid
pie
    title Доли рынка
    "Apple" : 45
    "Samsung" : 30
    "Xiaomi" : 15
    "Другие" : 10
```

```mermaid
pie title Распределение ОС
    "Windows" : 45.6
    "macOS" : 25.3
    "Linux" : 15.2
    "Другие" : 13.9
```

### Граф зависимостей
```mermaid
graph RL
    subgraph Frontend
        A[React]
        B[Vue.js]
    end

    subgraph Backend
        C[Node.js]
        D[Database]
    end

    A --> C
    B --> C
    C --> D
```

### Диаграмма состояний
```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Processing : start
    Processing --> Success : completed
    Processing --> Error : failed
    Success --> [*]
    Error --> [*]

    state Processing {
        [*] --> Initializing
        Initializing --> Working : initialized
        Working --> Finalizing : done
        Finalizing --> [*]
    }
```

### Юзер-джайрни
```mermaid
journey
    title Путь пользователя
    section Регистрация
      Заходит на сайт: 5: User
      Регистрируется: 4: User
    section Покупка
      Выбирает товар: 3: User
      Оплачивает: 1: User
    section Получение
      Получает товар: 2: User
```

### Кастомизация стилей
```mermaid
%%{init: {'theme':'dark'}}%%
graph LR
    A[Темная тема] --> B[Стилизовано]
```

#### Классы CSS
```mermaid
graph LR
    A:::red --> B:::blue

    classDef red fill:#f96
    classDef blue fill:#69f,color:#fff
```

#### Интерактивность
```mermaid
graph LR
    A[Кликни меня] --> B[Ссылка]

    click A "https://example.com" "Подсказка"
```

### Ещё пример

```mermaid
graph TD
    A[Начало] --> B[Кипячение воды]
    B --> C{Есть ли чай?}
    C -->|Да| D[Заварить чай]
    C -->|Нет| E[Купить чай]
    E --> D
    D --> F[Пить чай]
    F --> G[Конец]
```