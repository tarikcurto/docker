#!/bin/sh

url="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTIC_SEARCH_VERSION}.rpm"
wget -q "${url}" -O "/tmp/elasticsearch-${ELASTIC_SEARCH_VERSION}.rpm"
