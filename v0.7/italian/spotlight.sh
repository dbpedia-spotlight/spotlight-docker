#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx8G -jar /opt/spotlight/dbpedia-spotlight-0.7.jar /opt/spotlight/it  http://localhost:80/rest
