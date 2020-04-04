Docker container image with [DBpedia Spotlight in Swedish](http://es.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2241 (change these values if you need).

Run 
    
    docker build -f Dockerfile  -t swedish_spotlight .

And finally

    docker run -itd --restart unless-stopped -p 2241:80 swedish_spotlight spotlight.sh


