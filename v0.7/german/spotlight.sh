#!/bin/sh
java -Dfile.encoding=UTF-8 -Xms6G -Xmx6G -jar -jar /opt/spotlight/dbpedia-spotlight-0.7.jar /opt/spotlight/de  http://localhost:80/rest
