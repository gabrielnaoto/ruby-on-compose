ARG DOCKER_VERSION=latest
FROM docker:${DOCKER_VERSION}

ARG COMPOSE_VERSION=
ARG DOCKER_VERSION

# Install docker-compose
RUN apk add --no-cache py-pip python-dev libffi-dev openssl-dev gcc libc-dev make curl
RUN pip install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"

# Install rbenv
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
# Install rbenv-docker to check installation
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# Install ruby 2.6.3
RUN rbenv install 2.6.3
RUN rbenv global 2.6.3
