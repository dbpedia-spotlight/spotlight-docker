Docker container image with [DBpedia Spotlight in French](http://fr.dbpedia.org/) 

### How to run

Assume your docker host is localhost and HTTP public port is 2225 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t french_spotlight .

and finally

    docker run -itd --restart unless-stopped -p 2225:80 french_spotlight spotlight.sh


