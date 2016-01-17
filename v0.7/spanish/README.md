Docker container image with [DBpedia Spotlight in Spanish](http://es.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2231 (change these values if you need).

Run 
    
    docker build -f Dockerfile  -t spanish_spotlight .

And finally

    docker run -i -p 2231:80 spanish_spotlight spotlight.sh


