#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx20G -jar /opt/spotlight/dbpedia-spotlight-nightly-build.jar /opt/spotlight/en_2+2  http://0.0.0.0:80/rest
