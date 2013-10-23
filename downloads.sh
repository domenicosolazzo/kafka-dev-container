#! /usr/bin/env bash

#run before docker build, so if you are deving you dont have to keep redownloading stuff

curl -O https://dist.apache.org/repos/dist/release/kafka/kafka_2.8.0-0.8.0-beta1.tgz

curl -O https://raw.github.com/jpetazzo/pipework/master/pipework

chmod +x pipework
