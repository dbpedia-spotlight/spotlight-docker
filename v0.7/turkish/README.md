Docker container image with [DBpedia Spotlight in Turkish](http://es.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2235 (change these values if you need).

Run 
    
    docker build -f Dockerfile  -t turkish_spotlight .

And finally

    docker run -i -p 2235:80 turkish_spotlight spotlight.sh


