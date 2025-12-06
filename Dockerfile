FROM python:3.12-slim

WORKDIR /app

# تثبيت curl
RUN apt-get update && apt-get install -y curl

# تثبيت Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"

# انسخ ملفات الإعداد فقط أولًا
COPY pyproject.toml poetry.lock* ./

# قم بإعداد Poetry عشان ما يعملش virtualenv
RUN poetry config virtualenvs.create false

# انسخ باقي الكود بعد كده
COPY . .

# تثبيت dependencies بعد ما كل الكود موجود
RUN poetry install --no-interaction --no-ansi

# أمر تشغيل التطبيق
CMD ["python", "flask_ci_cd/app.py"]
