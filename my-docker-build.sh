#!/bin/bash

PROJECT_HOME=$(pwd)

# Java 8
cd ${PROJECT_HOME}/java-docker/8
docker build -t tarikcurto/java:8 .

# ElasticSerach 6.2.2
cd ${PROJECT_HOME}/elasticsearch-docker/6.2.2
docker build -t tarikcurto/elasticsearch:6.2.2 .

# Kibana 6.2.2
cd ${PROJECT_HOME}/kibana-docker/6.2.2
docker build -t tarikcurto/kiabana:6.2.2 .

#  Zookeeper 3.4.11
cd ${PROJECT_HOME}/zookeeper-docker/3.4.11
docker build -t tarikcurto/zookeeper:3.4.11 .

# Kafka 1.0.1
cd ${PROJECT_HOME}/kafka-docker/1.0.1
docker build -t tarikcurto/kafka:1.0.1 .