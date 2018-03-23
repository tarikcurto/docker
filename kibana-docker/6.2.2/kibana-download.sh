#!/bin/sh

url="https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-x86_64.rpm"
wget -q "${url}" -O "/tmp/kibana-${KIBANA_VERSION}.rpm"
