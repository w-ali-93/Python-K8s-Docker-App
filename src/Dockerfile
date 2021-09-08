FROM python:3.8.2-slim-buster

RUN pip install Flask

ADD ./toy_moderation.py /toy_moderation.py

ENV PYTHONIOENCODING=UTF-8
ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python", "/toy_moderation.py" ]