Docker container image with [DBpedia Spotlight in Czech](http://dbpedia.org)

### How to run

Assume your docker host is localhost and HTTP public port is 2222 (change these values if you need).

Run

    docker build -f Dockerfile  -t czech_spotlight .

and finally

    docker run -i -p 2253:80 czech_spotlight spotlight.sh


