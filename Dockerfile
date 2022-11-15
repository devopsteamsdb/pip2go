FROM python:bullseye

WORKDIR /app

RUN pip download ansible

