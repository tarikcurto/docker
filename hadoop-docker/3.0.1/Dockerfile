FROM tarikcurto/java:8

ARG dir_config=./default_config

ENV HADOOP_VERSION=3.0.1 \
    HADOOP_HOME=/opt/hadoop-3.0.1 \
    PATH=${PATH}:/opt/hadoop-3.0.1/bin:/opt/hadoop-3.0.1/sbin

# Script files
COPY hadoop-download.sh /tmp/

# Download necessary packages
RUN yum install -y epel-release && yum install -y wget jq openssh-server openssh-clients

# Passwordless SSH
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# Download Hadoop
RUN chmod +x /tmp/hadoop-download.sh && /tmp/hadoop-download.sh

# Install Hadoop folder
RUN tar -xzf /tmp/hadoop-${HADOOP_VERSION}.tar.gz -C /opt

# Delete unnecessary files
RUN rm -f /tmp/hadoop-${HADOOP_VERSION}.tar.gz

# Configure
COPY ${dir_config}/ ${HADOOP_HOME}/etc/