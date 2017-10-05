FROM openjdk:8-jre-alpine

ENV RELEASE_SERVER=spotlight.sztaki.hu
ENV VERSION=latest
ENV MEMORY=2g
ENV LANGUAGE_MODEL=${LANGUAGE}.tar.gz

ADD http://${RELEASE_SERVER}/downloads/dbpedia-spotlight-${VERSION}.jar /

ONBUILD RUN wget http://spotlight.sztaki.hu/downloads/latest_models/$LANGUAGE_MODEL /opt/spotlight \
    && tar -xvf /$LANGUAGE_MODEL \
    && rm -rf /$LANGUAGE_MODEL

CMD java -Xmx${MEMORY} -jar /dbpedia-spotlight-${VERSION}.jar /${LANGUAGE} http://localhost:80/rest/

EXPOSE 80
