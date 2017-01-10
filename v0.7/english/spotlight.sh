#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx20G -jar /opt/spotlight/dbpedia-spotlight-latest.jar /opt/spotlight/en  http://localhost:80/rest
