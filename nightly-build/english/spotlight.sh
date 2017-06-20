#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx20G -jar /opt/spotlight/dbpedia-spotlight-1.0.0.jar /opt/spotlight/en_2+2  http://0.0.0.0:80/rest
