Docker container image with [DBpedia Spotlight in Chinese](http://zh.dbpedia.org) 

### How to run

Assume your docker host is localhost and HTTP public port is 2252 (change these values if you need).

Run
    
    docker build -f Dockerfile  -t chinese_spotlight .

and finally

    docker run -i -p 2252:80 achinese_spotlight spotlight.sh


