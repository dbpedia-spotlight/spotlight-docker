#!/bin/sh
java -Dfile.encoding=UTF-8 -Xms4G -Xmx4G -jar -jar /opt/spotlight/dbpedia-spotlight-latest.jar /opt/spotlight/es  http://localhost:80/rest
