FROM tarikcurto/java:8

ARG dir_config=./default_config
ARG kibana_port=9200

ENV KIBANA_VERSION 6.2.2

# Script files
COPY kibana-download.sh /tmp/

# Download necessary packages
RUN yum install -y epel-release && yum install -y wget

# Download Kibana
RUN chmod +x /tmp/kibana-download.sh && /tmp/kibana-download.sh

# Install Kibana
RUN rpm --install /tmp/kibana-${KIBANA_VERSION}.rpm

## Copy client config
COPY ${dir_config}/kibana.yml  /etc/kibana/
RUN chown kibana:kibana -R /etc/kibana/

# Expose PORT
EXPOSE ${kibana_port}

# Set kibana as user container
USER kibana

#CMD /usr/share/elasticsearch/bin/elasticsearch