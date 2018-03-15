#!/bin/sh
java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight-nightly-build.jar /opt/spotlight/cs  http://0.0.0.0:80/rest
