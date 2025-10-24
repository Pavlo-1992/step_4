# Використовуємо офіційний образ Python
FROM python:3.9-slim

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо файл залежностей та встановлюємо залежності
COPY requirements.txt .

# Встановлення залежностей та інструментів збірки
RUN pip install --no-cache-dir -r requirements.txt \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        gcc \
        default-libmysqlclient-dev \
    && pip install mysqlclient

# Копіюємо файли програми
COPY app.py app.py
COPY shop.py shop.py
COPY mysql_connector.py mysql_connector.py
COPY templates templates

# Відкриваємо порт
EXPOSE 5000

# Команда для запуску програми за допомогою Gunicorn (продакшн-сервер)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
