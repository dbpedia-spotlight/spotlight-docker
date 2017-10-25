#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight-0.7.1.jar /opt/spotlight/en_2+2  http://0.0.0.0:80/rest
