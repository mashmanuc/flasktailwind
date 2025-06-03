# Flask з Tailwind CSS

Цей проект демонструє інтеграцію Flask з Tailwind CSS для створення сучасних веб-додатків.

## Вимоги

- Python 3.8+
- Node.js 16+
- npm або yarn

## Файли конфігурації

### package.json
Основний файл конфігурації Node.js, який містить залежності та скрипти для роботи з Tailwind CSS:

```json
{
  "name": "flask-tailwind",
  "version": "1.0.0",
  "description": "Flask з Tailwind CSS",
  "scripts": {
    "build": "tailwindcss -i ./src/input.css -o ./static/css/main.css",
    "watch": "tailwindcss -i ./src/input.css -o ./static/css/main.css --watch"
  },
  "dependencies": {
    "@tailwindcss/cli": "^4.1.8",
    "tailwindcss": "^4.1.8"
  }
}
```

### src/input.css
Вхідний файл CSS, де імпортуються директиви Tailwind:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Ваші кастомні стилі тут */
```

### static/css/main.css
Цей файл генерується автоматично під час збірки. Він містить усі стилі Tailwind та ваші кастомні стилі.

## Встановлення

1. Клонуйте репозиторій або створіть новий каталог проекту

2. Налаштуйте віртуальне середовище Python:
   ```bash
   python -m venv venv
   .\venv\Scripts\activate  # Windows
   # або
   source venv/bin/activate  # Linux/Mac
   ```

3. Встановіть залежності Python:
   ```bash
   pip install -r requirements.txt
   ```

4. Встановіть залежності Node.js:
   ```bash
   npm install
   ```

## Налаштування Tailwind CSS

### 1. Структура файлів
```
ваш_проект/
├── static/
│   └── css/
│       └── main.css        # Згенерований CSS (не редагувати вручну)
├── src/
│   └── input.css         # Вхідний CSS файл з директивами Tailwind
├── templates/            # Шаблони HTML
│   ├── base.html        # Базовий шаблон
│   └── index.html       # Головна сторінка
├── app.py               # Flask додаток
├── package.json         # Залежності Node.js
└── tailwind.config.js   # Конфігурація Tailwind
```

### 2. tailwind.config.js
Цей файл містить конфігурацію Tailwind. Приклад мінімальної конфігурації:

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./static/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

### 3. Збірка CSS

Для одноразової збірки CSS:
```bash
npm run build
```

Для автоматичного оновлення CSS під час розробки:
```bash
npm run watch
```

### 4. Використання в HTML
Підключіть згенерований CSS у вашому базовому шаблоні:

```html
<link href="{{ url_for('static', filename='css/main.css') }}" rel="stylesheet">
```

## Запуск проекту

1. У одному терміналі запустіть Flask сервер:
   ```bash
   python app.py
   ```

2. В іншому терміналі запустіть спостерігач Tailwind (якщо ще не запущений):
   ```bash
   npm run watch
   ```

3. Відкрийте браузер за адресою:
   ```
   http://localhost:5000
   ```

## Використання

- Додавайте свої HTML сторінки в каталог `templates/`
- Використовуйте класи Tailwind у своїх HTML файлах
- Всі стилі повинні бути імпортовані в `src/input.css`

## Додаткові налаштування

Для додавання власних кольорів, шрифтів або інших налаштувань Tailwind, відредагуйте файл `tailwind.config.js`.

## Допомога

Якщо виникли питання, будь ласка, звертайтеся до документації:
- [Flask](https://flask.palletsprojects.com/)
- [Tailwind CSS](https://tailwindcss.com/)
