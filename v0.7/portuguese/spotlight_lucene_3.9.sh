#!/bin/sh
java -Dfile.encoding=UTF-8 -Xms4G -Xmx4G -jar -jar /opt/spotlight/dbpedia-spotlight-latest.jar /mnt/dbpedia/lucene-quickstarter/i18n/pt/server_3.9.properties  http://localhost:80/rest
