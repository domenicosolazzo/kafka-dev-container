#! /usr/bin/env bash

set -e

echo "zookeeper.connect=$ZK_CONN" >> /kafka/conf/server.properties
echo "host.name=$HOSTNAME" >> /kafka/conf/server.properties
echo "broker.id=1" >> /kafka/conf/server.properties

/pipework --wait

/kafka/kafka_2.8.0-0.8.0-beta1/bin/kafka-server-start.sh /kafka/conf/server.properties
