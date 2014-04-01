FROM ubuntu:13.10
MAINTAINER Michael Twomey, mick@twomeylee.name

RUN echo "deb http://ppa.launchpad.net/chris-lea/redis-server/ubuntu saucy main " > /etc/apt/sources.list.d/redis.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    redis-server \
    redis-tools \
    && apt-get autoremove \
    && apt-get clean

ADD redis.conf /etc/redis/redis.conf

VOLUME /redis/logs
VOLUME /redis/db

EXPOSE 6379

CMD ["/etc/redis/redis.conf"]

ENTRYPOINT ["/usr/bin/redis-server"]
