ARG DOCKER_VERSION=latest
FROM docker:${DOCKER_VERSION}

ARG COMPOSE_VERSION=
ARG DOCKER_VERSION

# Install dependencies
RUN apk add --no-cache py-pip python-dev libffi-dev openssl-dev gcc libc-dev make
RUN apk add --update \
    bash \
    git \
    wget \
    curl \
    vim \
    build-base \
    readline-dev \
    openssl-dev \
    zlib-dev
RUN apk add --virtual build-deps python3-dev musl-dev \
    && apk add --no-cache mariadb-dev

# Install docker-compose
RUN pip install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"
RUN pip install mysqlclient

ENV PATH=/root/.rbenv/bin/:/root/.rbenv/shims:$PATH

# Install rbenv
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# Install ruby 2.6.3
RUN rbenv install 2.6.3
RUN rbenv global 2.6.3
