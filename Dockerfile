FROM debian:latest
MAINTAINER Lakmal Caldera <lakmal.developer@gmail.com>

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev \
postgresql-client-9.4 --fix-missing --no-install-recommends

#RUN useradd -ms /bin/bash admin
#USER admin

ENV INSTALL_PATH /orchestra
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY . .

RUN ['/bin/sh', './install.sh -s']

