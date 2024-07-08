# Используем базовый образ Python
FROM python:3.9-slim

# Установка зависимостей
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Копирование исходного кода в контейнер
COPY ./server.py /app/server.py

# Установка рабочей директории
WORKDIR /app

# Открытие порта для приложения
EXPOSE 80

# Запуск FastAPI сервера
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "80"]
