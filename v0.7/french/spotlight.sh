#!/bin/sh
java -Dfile.encoding=UTF-8 -Xms5G -Xmx5G -jar -jar /opt/spotlight/dbpedia-spotlight-0.7.jar /opt/spotlight/fr  http://localhost:80/rest
