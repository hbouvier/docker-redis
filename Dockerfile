FROM alpine:3.1
MAINTAINER Henri Bouvier

RUN apk update && apk update && apk add --update redis && rm -rf /var/cache/apk/*
RUN rm -f /etc/redis/redis.conf
ADD ./config /etc/redis/

# Define mountable directories.
VOLUME [ "/var/run/redis", "/var/log/redis", "/var/lib/redis" ]

# Define working directory.
WORKDIR /var

ENV REDIS_CONF redis.conf

CMD redis-server /etc/redis/${REDIS_CONF}

# Expose ports.
EXPOSE 6379
