#!/bin/sh

# Download hadoop
mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
url="${mirror}hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz"
wget -q "${url}" -O "/tmp/hadoop-${HADOOP_VERSION}.tar.gz"