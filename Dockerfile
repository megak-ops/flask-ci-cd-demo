FROM python:3.12-slim

WORKDIR /app

# Install curl
RUN apt-get update && apt-get install -y curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

# Disable virtualenv inside Docker
RUN poetry config virtualenvs.create false

COPY . .

RUN poetry install --no-interaction --no-ansi

CMD ["python", "app.py"]
