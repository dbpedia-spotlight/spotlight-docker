Docker container image with [DBpedia Spotlight in Portuguese](http://pt.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2228 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t portuguese_spotlight .

And finally

    docker run -i -p 2228:80 portuguese_spotlight spotlight.sh


