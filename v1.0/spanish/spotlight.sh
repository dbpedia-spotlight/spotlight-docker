#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx2G -jar /opt/spotlight/dbpedia-spotlight-1.0.0.jar /opt/spotlight/es  http://0.0.0.0:80/rest
