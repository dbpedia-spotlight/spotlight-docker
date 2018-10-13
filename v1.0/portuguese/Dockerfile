FROM openjdk:8-jre-alpine

MAINTAINER  DBpedia Spotlight Team <dbp-spotlight-developers@lists.sourceforge.net>

ENV RELEASE_SERVER    ufpr.dl.sourceforge.net
ENV RELEASE_FILENAME  dbpedia-spotlight-1.0.0.jar 
ENV LANGUAGE_MODEL    pt.tar.gz

RUN apk add --no-cache curl && \
    mkdir -p /opt/spotlight && \
    cd /opt/spotlight && \
    curl -O "https://$RELEASE_SERVER/project/dbpedia-spotlight/spotlight/$RELEASE_FILENAME" && \
    curl -O "https://$RELEASE_SERVER/project/dbpedia-spotlight/2016-04/pt/model/$LANGUAGE_MODEL" && \
    tar xvf $LANGUAGE_MODEL  && \
    rm  $LANGUAGE_MODEL && \
    apk del curl


ADD spotlight.sh /bin/spotlight.sh
RUN chmod +x /bin/spotlight.sh

EXPOSE 80
