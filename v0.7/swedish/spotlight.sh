#!/bin/sh
java -Dfile.encoding=UTF-8 -Xms4G -Xmx4G -jar -jar /opt/spotlight/dbpedia-spotlight-0.7.jar /opt/spotlight/sv  http://localhost:80/rest
