Docker container image with [DBpedia Spotlight in Hungarian](http://github.com/dbpedia-spotlight/) 

### How to run

Assume your docker host is localhost and HTTP public port is 2229 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t hugarian_spotlight .

and finally

    docker run -itd --restart unless-stopped -p 2229:80  hugarian_spotlight spotlight.sh


