FROM python:3.8 AS server-base

ENV PYTHONUNBUFFERED 1

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
        build-essential python-dev libmagic-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /srv/script/

EXPOSE 84

COPY requirements.txt /srv/script/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . /srv/script/

FROM server-base AS server

