Docker container image with [DBpedia Spotlight in Danish](http://github.com/dbpedia-spotlight/) 

### How to run

Assume your docker host is localhost and HTTP public port is 2240 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t danish_spotlight .


and finally

    docker run -i -p 2240:80 danish_spotlight



