FROM openjdk:8-slim
MAINTAINER Steve Sloka <slokas@upmc.edu>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV CEREBRO_VERSION=0.6.8
ADD https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VERSION}/cerebro-${CEREBRO_VERSION}.tgz /usr/local/

RUN mkdir -p /opt/cerebro && \ 
    tar -xf /usr/local/cerebro-${CEREBRO_VERSION}.tgz -C /usr/local && \
    mv /usr/local/cerebro-${CEREBRO_VERSION} /usr/local/cerebro

WORKDIR /usr/local/cerebro
CMD [ "bin/cerebro" ]