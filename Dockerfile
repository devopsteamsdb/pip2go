FROM python:3.8-slim-buster

WORKDIR /app

RUN python3 -m pip install --upgrade pip && \
    python -m pip download docker docker-compose --dest .
