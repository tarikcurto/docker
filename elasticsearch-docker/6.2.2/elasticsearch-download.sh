#!/bin/sh

url="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.rpm"
wget -q "${url}" -O "/tmp/elasticsearch-${ELASTICSEARCH_VERSION}.rpm"