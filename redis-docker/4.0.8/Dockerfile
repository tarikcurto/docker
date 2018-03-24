FROM centos:7

ARG dir_config=./default_config
ARG redis_port=6379

ENV REDIS_VERSION=4.0.8 \
    REDIS_HOME=/opt/redis-4.0.8

# Script files
COPY redis-download.sh /tmp/

# Download necessary packages
RUN yum install -y wget gcc gcc-c++ kernel-devel make

# Download Redis
RUN chmod +x /tmp/redis-download.sh && /tmp/redis-download.sh

# Install Redis folder
RUN tar -xzf /tmp/redis-${REDIS_VERSION}.tar.gz -C /opt
RUN cd ${REDIS_HOME} && make distclean && make

# Delete uncessary files
RUN rm -f /tmp/redis-${REDIS_VERSION}.tar.gz

# Configure
COPY ${dir_config}/redis.conf ${REDIS_HOME}/

EXPOSE ${redis_port}
WORKDIR ${REDIS_HOME}

CMD ${REDIS_HOME}/src/redis-server ${REDIS_HOME}/redis.conf