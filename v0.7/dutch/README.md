Docker container image with [DBpedia Spotlight in Dutch](http://github.com/dbpedia-spotlight/)

### How to run

Assume your docker host is localhost and HTTP public port is 2232 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t dutch_spotlight .

and finally

    docker run -i -p 2232:80 --name dutch_spotlight dutch_spotlight


