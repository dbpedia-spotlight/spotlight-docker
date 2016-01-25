FROM debian:squeeze

MAINTAINER  DBpedia Spotlight Team <dbp-spotlight-developers@lists.sourceforge.net>

RUN apt-get update && apt-get install -y \
    curl \
    openjdk-6-jre

ENV RELEASE_SERVER    spotlight.sztaki.hu
ENV RELEASE_FILENAME  dbpedia-spotlight-latest.jar
ENV LANGUAGE_MODEL    ru.tar.gz	   

RUN mkdir -p /opt/spotlight && \
    cd /opt/spotlight && \
    curl -O "http://$RELEASE_SERVER/downloads/$RELEASE_FILENAME" && \
    curl -O "http://$RELEASE_SERVER/downloads/latest_models/$LANGUAGE_MODEL" && \
    tar xvf $LANGUAGE_MODEL  && \
    rm  $LANGUAGE_MODEL


ADD spotlight.sh /bin/spotlight.sh
RUN chmod +x /bin/spotlight.sh

EXPOSE 80

   
