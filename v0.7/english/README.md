Docker container image with [DBpedia Spotlight in English](http://dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2222 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t english_spotlight .

and finally

    docker run -i -p 2222:80 english_spotlight spotlight.sh


