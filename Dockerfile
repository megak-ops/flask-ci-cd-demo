FROM python:3.11-slim

WORKDIR /app

# Install system deps
RUN apt-get update && apt-get install -y curl

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"

# Copy everything
COPY . .

# Install dependencies
RUN poetry install --no-interaction --no-ansi

EXPOSE 5000


CMD ["poetry", "run", "python", "app.py"]
