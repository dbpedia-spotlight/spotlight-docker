#!/bin/sh
java -Dfile.encoding=UTF-8  -Xmx8G -jar /opt/spotlight/dbpedia-spotlight-nightly-build.jar /opt/spotlight/nl  http://0.0.0.0:80/rest
