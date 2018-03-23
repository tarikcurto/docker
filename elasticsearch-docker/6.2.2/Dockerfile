FROM tarikcurto/java:8

ARG dir_config=./default_config

ENV ELASTICSEARCH_VERSION 6.2.2

# Script files
COPY elasticsearch-download.sh /tmp/

# Download necessary packages
RUN yum install -y epel-release && yum install -y wget

# Download ElasticSearch
RUN chmod +x /tmp/elasticsearch-download.sh && /tmp/elasticsearch-download.sh

# Install ElasticSearch
RUN rpm --install /tmp/elasticsearch-${ELASTICSEARCH_VERSION}.rpm

# Copy client config
COPY ${dir_config}/elasticsearch.yml ${dir_config}/jvm.options ${dir_config}/log4j2.properties /etc/elasticsearch/
RUN chown elasticsearch:elasticsearch -R /etc/elasticsearch/

# Set elasticsearch as user container
USER elasticsearch

CMD /usr/share/elasticsearch/bin/elasticsearch