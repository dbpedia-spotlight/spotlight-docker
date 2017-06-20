Docker container image with [DBpedia Spotlight in German](http://de.dbpedia.org/) 

### How to run

Assume your docker host is localhost and HTTP public port is 2226 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t german_spotlight .

and finally

    docker run -i -p 2226:80 german_spotlight spotlight.sh


