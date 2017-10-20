FROM openjdk:7-jre-alpine

MAINTAINER  DBpedia Spotlight Team <dbp-spotlight-developers@lists.sourceforge.net>

ENV RELEASE_SERVER    downloads.dbpedia-spotlight.org
ENV RELEASE_FILENAME  dbpedia-spotlight-0.7.jar
ENV LANGUAGE_MODEL    it.tar.gz

RUN apk add --no-cache curl && \
    mkdir -p /opt/spotlight && \
    cd /opt/spotlight && \
    curl -O "http://$RELEASE_SERVER/spotlight/$RELEASE_FILENAME" && \
    curl -O "http://$RELEASE_SERVER/2016-04/it/model/$LANGUAGE_MODEL" && \
    tar xvf $LANGUAGE_MODEL  && \
    rm  $LANGUAGE_MODEL && \
    apk del curl


ADD spotlight.sh /bin/spotlight.sh
RUN chmod +x /bin/spotlight.sh

EXPOSE 80
