Docker container image with [DBpedia Spotlight in Hugarian](http://github.com/dbpedia-spotlight/) 

### How to run

Assume your docker host is localhost and HTTP public port is 2229 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t hugarian_spotlight .

and finally

    docker run -i -p 2229:80  hugarian_spotlight


