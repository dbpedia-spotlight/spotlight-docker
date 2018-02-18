Docker container image with [DBpedia Spotlight in Arabic](http://ar.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2251 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t arabic_spotlight .

and finally

    docker run -i -p 2251:80 arabic_spotlight spotlight.sh


