FROM ubuntu
MAINTAINER Scott Clasen "scott@heroku.com"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -q -y curl telnet wget git 
# UGH THIS BLOCK IS FOR THE JDK
RUN apt-get install libfuse2
RUN cd /tmp ; apt-get download fuse
RUN cd /tmp ; dpkg-deb -x fuse_* .
RUN cd /tmp ; dpkg-deb -e fuse_*
RUN cd /tmp ; rm fuse_*.deb
RUN cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst
RUN cd /tmp ; dpkg-deb -b . /fuse.deb
RUN cd /tmp ; dpkg -i /fuse.deb

RUN apt-get install -q -y openjdk-7-jdk 


RUN mkdir -p /kafka/bin
RUN mkdir -p /kafka/conf


ADD http://mirrors.sonic.net/apache/kafka/0.8.1/kafka_2.9.2-0.8.1.tgz /kafka/kafka_2.9.2-0.8.1.tgz
RUN $(cd /kafka && tar xfz kafka_2.9.2-0.8.1.tgz)

ADD server.properties /kafka/conf/server.properties

ADD start-kafka.sh /kafka/bin/start-kafka.sh

RUN mkdir -p /kafka/data

RUN apt-get install  -q -y netcat

EXPOSE 9998 9999 
CMD ["/kafka/bin/start-kafka.sh"]

