FROM tarikcurto/java:8

ENV ELASTIC_SEARCH_VERSION 6.2.2

# Script files
COPY elasticsearch-download.sh /tmp/

# Download necessary packages
RUN yum install -y epel-release && yum install -y wget

# Download Elastic Search
RUN chmod +x /tmp/elasticsearch-download.sh && /tmp/elasticsearch-download.sh

# Install Elastic Search
RUN rpm --install /tmp/elasticsearch-${ELASTIC_SEARCH_VERSION}.rpm

# Copy client config
COPY elasticsearch.yml jvm.options log4j2.properties /etc/elasticsearch/
RUN chown elasticsearch:elasticsearch -R /etc/elasticsearch/

# Set elasticsearch as user container
USER elasticsearch

CMD /usr/share/elasticsearch/bin/elasticsearch