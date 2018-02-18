#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight-nightly-build.jar /opt/spotlight/en  http://0.0.0.0:80/rest
