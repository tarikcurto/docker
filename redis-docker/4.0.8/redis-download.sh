#!/bin/sh

# Download redis
url="http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz"
wget -q "${url}" -O "/tmp/redis-${REDIS_VERSION}.tar.gz"