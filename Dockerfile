FROM java:openjdk-8-jre

MAINTAINER  DBpedia Spotlight Team <dbp-spotlight-developers@lists.sourceforge.net>

ENV RELEASE_SERVER    model.dbpedia-spotlight.org
ENV RELEASE_FILENAME  dbpedia-spotlight-0.7.1.jar

RUN mkdir -p /mnt/dbpedia && \
    mkdir -p /mnt/dbpedia/spotlight && \
    cd /mnt/dbpedia && \
    curl -O "http://$RELEASE_SERVER/$RELEASE_FILENAME" && \
    apt-get update && \
    cd  /mnt/dbpedia && \
    apt-get install -y git && \
    git clone https://github.com/dbpedia-spotlight/lucene-quickstarter.git
    


