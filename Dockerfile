# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements /code/requirements
RUN pip install -r requirements/prod.txt
COPY . /code/
RUN python manage.py collectstatic --no-input
