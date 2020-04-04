Docker container image with [DBpedia Spotlight in Russian](http://dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2227 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t russian_spotlight .

And finally

    docker run -itd --restart unless-stopped -p 2227:80 russian_spotlight spotlight.sh


