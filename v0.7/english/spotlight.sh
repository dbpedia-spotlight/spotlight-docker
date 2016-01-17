#!/bin/sh
java -Dfile.encoding=UTF-8 -Xms8G -Xmx16G -jar -jar /opt/spotlight/dbpedia-spotlight-0.7.jar /opt/spotlight/en_2+2  http://localhost:80/rest
