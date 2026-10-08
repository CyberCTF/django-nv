# django.nV ships no Dockerfile (upstream: Python 3.4+, `pip install -r requirements.txt`,
# `./reset_db.sh` to create the SQLite database from the fixtures, then `./runapp.sh`). This image
# does that on Python 3.5, the last Python that Django 1.8 supports: requirements.txt pins
# Django==1.8.3 (no other dependency), reset_db.sh runs at build so the image holds a fresh
# database, and the development server listens on all interfaces (upstream's runapp.sh binds
# 127.0.0.1:8000).
FROM docker.io/library/python:3.5.10-slim-buster

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ .
RUN bash reset_db.sh

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
