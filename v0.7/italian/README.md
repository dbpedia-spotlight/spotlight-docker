Docker container image with [DBpedia Spotlight in Italian](http://it.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2230 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t italian_spotlight .

and finally

    docker run -d -p 2230:80 italian_spotlight


