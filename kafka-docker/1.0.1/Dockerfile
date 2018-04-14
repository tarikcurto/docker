FROM tarikcurto/java:8

ARG dir_config=./default_config

ENV KAFKA_VERSION=1.0.1 \
    SCALA_VERSION=2.12 \
    KAFKA_HOME=/opt/kafka_2.12-1.0.1 \
    PATH=${PATH}:/opt/kafka_2.12-1.0.1/bin

#COPY download-kafka.sh start-kafka.sh broker-list.sh create-topics.sh /tmp/

# Script files
COPY kafka-download.sh /tmp/

# Download necessary packages
RUN yum install -y epel-release && yum install -y wget jq

# Download Kafka
RUN chmod +x /tmp/kafka-download.sh && /tmp/kafka-download.sh

## Verify download
#RUN wget -q https://www.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.md5 -O /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.md5 && \
#    cd /tmp && md5sum -c /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.md5

# Install kafka folder
RUN tar -xzf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt

# Delete uncessary files
RUN rm -f /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# Copy user config
COPY ${dir_config}/server.properties ${dir_config}/producer.properties ${dir_config}/consumer.properties /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/config/

EXPOSE 9092
VOLUME ["/opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}", "/tmp/kafka-log"]

CMD bash /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin/kafka-server-start.sh -daemon /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/config/server.properties && \
    mkdir -p /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/logs && \
    echo "" > /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/logs/server.log && \
    tail -f /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/logs/server.log