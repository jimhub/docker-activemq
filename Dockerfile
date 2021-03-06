## ActiveMQ standalone
## VERSION 5.10.2

FROM anapsix/alpine-java:8

ENV AMQ_VERSION 5.10.2
ENV AMQ_HOME /opt/apache-activemq

# Install ActiveMQ
RUN apk add --update --no-cache bash curl ca-certificates && \
    ( curl -Lkjs http://mirror.sdunix.com/apache/activemq/$AMQ_VERSION/apache-activemq-$AMQ_VERSION-bin.tar.gz | \
		gunzip -c - | tar xf - ) && \
    mv /apache-activemq-$AMQ_VERSION /opt/ && \
    ln -s /opt/apache-activemq-$AMQ_VERSION $AMQ_HOME && \
    apk del curl ca-certificates

# expose below ports
EXPOSE 1883 5672 8161 61613 61614 61616

CMD ["/opt/apache-activemq/bin/activemq", "console"]
