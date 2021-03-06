FROM tarikcurto/java:8

ARG dir_config=./default_config

ENV ZOOKEEPER_VERSION=3.4.11 \
    ZK_HOME=/opt/zookeeper-3.4.11

# Script files
COPY zookeeper-download.sh /tmp/

# Download necessary packages
RUN yum install -y epel-release && yum install -y wget jq

# Download Zookeeper
RUN chmod +x /tmp/zookeeper-download.sh && /tmp/zookeeper-download.sh

# Verify download
RUN wget -q https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.md5 -O /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.md5 && \
    cd /tmp && md5sum -c /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.md5

# Install Zookeeper folder
RUN tar -xzf /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt

# Delete unnecessary files
RUN rm -f /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz

# Configure
COPY ${dir_config}/zoo.cfg /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/
COPY ${dir_config}/zookeeper-start.sh /usr/bin/

## Replace zookeper data directory
#RUN mkdir $ZK_HOME/data && \
#    sed  -i "s|dataDir=/tmp/zookeeper|dataDir=$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg

## Allow zookeper auto purge
#RUN sed -i -r 's|#autopurge|autopurge|g' $ZK_HOME/conf/zoo.cfg

EXPOSE 2181 2888 3888
WORKDIR /opt/zookeeper-${ZOOKEEPER_VERSION}
#VOLUME ["/opt/zookeeper-${ZOOKEEPER_VERSION}/conf", "/opt/zookeeper-${ZOOKEEPER_VERSION}/data"]
VOLUME ["/opt/zookeeper-${ZOOKEEPER_VERSION}/conf", "/tmp/zookeeper"]

CMD bash /usr/bin/zookeeper-start.sh