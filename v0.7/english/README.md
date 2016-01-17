Docker container image with [DBpedia Spotlight in English](http://dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2222 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t english_spotlight .

and finally

    docker run -d -p 2222:80 --name english_spotlight english_spotlight


