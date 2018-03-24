#!/bin/bash

PROJECT_HOME=$(pwd)

# Java 8
docker build -t tarikcurto/java:8 ${PROJECT_HOME}/java-docker/8

# ElasticSerach 6.2.2
docker build -t tarikcurto/elasticsearch:6.2.2 ${PROJECT_HOME}/elasticsearch-docker/6.2.2

# Kibana 6.2.2
docker build -t tarikcurto/kibana:6.2.2 ${PROJECT_HOME}/kibana-docker/6.2.2

#  Zookeeper 3.4.11
docker build -t tarikcurto/zookeeper:3.4.11 ${PROJECT_HOME}/zookeeper-docker/3.4.11

# Kafka 1.0.1
docker build -t tarikcurto/kafka:1.0.1 ${PROJECT_HOME}/kafka-docker/1.0.1

# Redis 4.0.8
docker build -t tarikcurto/redis:4.0.8 ${PROJECT_HOME}/redis-docker/4.0.8