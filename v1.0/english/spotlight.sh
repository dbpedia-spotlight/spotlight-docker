#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx20G -jar /opt/spotlight/dbpedia-spotlight-0.8-beta.jar /opt/spotlight/en  http://localhost:80/rest
