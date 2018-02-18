Docker container image with [DBpedia Spotlight in Japanese](http://ja.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2250 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t japanese_spotlight .

and finally

    docker run -i -p 2250:80 japanese_spotlight spotlight.sh


