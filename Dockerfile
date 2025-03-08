FROM ubuntu:24.04

WORKDIR /app

COPY ./ /app

RUN <<DOCKERFILE_HERE_DOC
#!/bin/bash -ex
apt-get update -y
apt-get install -y supervisor python3 python3-pip python3-venv

cp /app/docker/docker-entrypoint.sh /docker-entrypoint.sh
mkdir -p /docker-entrypoint.d

cp /app/docker/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

python3 -m venv /app/venv
/app/venv/bin/pip install -e /app

mkdir -p /app/server1
mkdir -p /app/server2

DOCKERFILE_HERE_DOC

CMD [ "/usr/bin/supervisord" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]