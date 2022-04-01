# What is DBpedia Spotlight?

[DBpedia Spotlight](https://www.dbpedia-spotlight.org/) is a tool for automatically annotating mentions of DBpedia resources in text, providing a solution for linking unstructured information sources to the Linked Open Data cloud through DBpedia.

The dbpedia/dbpedia-spotlight is a docker image to run the DBpedia Spotlight service with the most recent language models, downloaded from the [DBpedia Databus repository](https://databus.dbpedia.org/dbpedia/spotlight/spotlight-model/), e.g., English (en), German (nl), Italian (it), etc. 

# Run on Kubernetes

For instructions and files on how to run DBpedia Spotlight on Kubernetes check out the kubernetes directory.
# Available language models + quick-start command

The following table shows the available language models and the command line to start the DBpedia Spotlight service. The `--mount source=spotlight-model...` will automatically creates the `spotlight-model` volume. 

To run more than one DBpedia Spotlight service, just change the port number (`-p 222X:80`); for example, `-p 2222:80` for English language and `-p 2223:80` for German language.

| Language | Two-digit code | Aprox. size of language model |Quick-start (command line)   |
| :------- | :------------: | :---------------------------: |:--------------------------- |
| Catalan  | ca             | 161 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.ca --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh ca` |   
| Danish   | da             | 81 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.da --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh da` |
| German | de | 1 GB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.de --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh de` |
| English |	en | 2 GB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.en --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh en` |
| Spanish |	es | 483 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.es --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh es` |
| Finnish |	fi | 112 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.fi --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh fi` |
| French | fr | 663 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.fr --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh fr` |
| Hungarian | hu | 87 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.hu --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh hu` |
| Italian | it | 577 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.it --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh it` |
| Lithuanian | lt | 35 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.lt --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh lt` |
| Dutch | nl | 304 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.nl --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh nl` |
| Norwegian | no | 118 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.no --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh no` |
| Portuguese | pt | 241 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.pt --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh pt` |
| Romanian | ro | 63 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.ro --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh ro` |
| Russian |	ru | 138 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.ru --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh ru` |
| Swedish |	sv | 197 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.sv --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh sv` |
| Turkish |	tr | 66 MB |`docker run -tid --restart unless-stopped --name dbpedia-spotlight.tr --mount source=spotlight-model,target=/opt/spotlight -p 2222:80 dbpedia/dbpedia-spotlight spotlight.sh tr` |

## Test DBpedia Spotlight service

Consider changing the port number if necessary.

        curl http://localhost:2222/rest/annotate \
        --data-urlencode "text=President Obama called Wednesday on Congress to extend a tax break for students included in last year's economic stimulus package, arguing that the policy provides more generous assistance." \
        --data "confidence=0.35" \
        -H "Accept: text/turtle"

The "Accept: text/turtle" returns a NIF output but this option could be changed by "Accept: application/json" to returns a JSON output format.

## Stop the Docker container

Any of the following commands could be use to stop the DBpedia Spotlight service:

     docker kill dbpedia-spotlight.[LANG]
     docker rm dbpedia-spotlight.[LANG]

The `docker kill` command will stop the running container and the `docker rm` command will remove the container. The `dbpedia-spotlight` corresponds to the name given with the `--name` option of the docker run command.

# Additional options to run DBpedia Spotlight

## Run a single DBpedia Spotlight service (bash command)

This option could be used to persist the configuration used to run a DBpedia Spotlight service. It is recommended, but not restricted, to run a single DBpedia Spotlight service whose configuration differs from the default presented in the top table. 

1. Save the following code into a bash file (for example, `english-spotlight.sh`)

```
LANG=en
# Available languages: ca, da, de, en, es, fi, fr, hu, it, lt, nl, no, pt, ro, ru, sv, tr

# Create a volume to persist models
docker volume create spotlight-model

#Run docker image
docker run -tid \
 --restart unless-stopped \
 --name dbpedia-spotlight.$LANG \
 --mount source=spotlight-model,target=/opt/spotlight \
 -p 2222:80 \
 dbpedia/dbpedia-spotlight \
 spotlight.sh $LANG   
```

2. Grant execute permission to the file
`chmod a+x english-spotlight.sh`
3. Execute the bash file
`./english-spotlight.sh`

## Run one or more DBpedia Spotlight services (docker-compose)

[Docker-compose](https://docs.docker.com/compose/#:~:text=Compose%20is%20a%20tool%20for,the%20services%20from%20your%20configuration) is a tool to run multiple containers as a single service. It is based on the data sarialization language YAML to define the configuration for one or multiple services. 

Docker-compose could be used to define and run more than one DBpedia Spotlight service. The following instructions explain how to create a YAML configuration file to run a single DBpedia Spotlight service. A YAML configuration file example for multiple DBpedia Spotlight services is available [here](https://raw.githubusercontent.com/dbpedia/spotlight-docker/multilingual/spotlight-compose.yml).

1. Create a Docker Compose file:

   The docker compose file (for example, `spotlight-compose.yml`) defines one or more DBpedia Spotlight services through the following configuration block:

```        
version '3.5'
   services:
      spotlight.[LANG]:
         image: [DOCKER-IMAGE]
         container_name: dbepdia-spotlight.[LANG]
         volumes:
            - spotlight-model:/opt/spotlight
         restart: unless-stopped   
         ports:
           - "0.0.0.0:2222:80"  
         command: /bin/spotlight.sh [LANG]
   
   volumes:
      spotlight-model:
          external: true
```

 Where 

 - `[LANG]`: is a two digits code to define the language model. The available language models are: ca, da, de, en, es, fi, fr, hu, it, lt, nl, no, pt, ro, ru, sv, tr.
 - `[DOCKER-IMAGE]`: the name of the docker image.

 2. Run Docker Compose file

        docker-compose -f spotlight-compose.yml up -d

For example, the following docker-compose configuration runs the DBpedia Spotlight German language model:

 ```
 version: '3.5'
   services:
     spotlight.de:
       image: dbpedia/dbpedia-spotlight
       container_name: dbpedia-spotlight.de
       volumes:
          - spotlight-model:/opt/spotlight/models
       restart: unless-stopped
       ports:
         - "0.0.0.0:2222:80"
      command: /bin/spotlight.sh de
 
  volumes:
    dbp-model:
      external: true

 ```

After creating the file, the command `docker-compose -f spotlight-compose.yml up -d` will start the service.

## Stop Docker Compose

The following command could be use to stop the DBpedia Spotlight service:

    docker-compose -f spotlight-compose.yml stop
   
The `stop` instruction will stop the running containers. The `spotlight-compose.yml` corresponds to the file name used to run the compose file. 

# Monitor DBpedia Spotlight service(s) through Docker commands
    
The following docker commands could be used to show some information about the dbpedia-spotlight image: 

- `docker logs dbpedia-spotlight.[LANG]` : Displays the log information for the corresponding service
- `docker stats dbpedia-spotlight.[LANG]` :  Shows the statistics (e.g., the amount of memory and CPU) for the corresponding service


# Troubleshooting

## Memory problems

The DBpedia Spotlight service copies the language model to memory for efficient processing. The amount of memory needed depends on the selected language model; for example, the English model requires >8GB of memory to run.

Before running the DBpedia Spotlight service, it could be necessary to adjust the memory options from the docker configuration first. For example, for Mac users, by default, Docker is set up to use only [2GB of memory](https://docs.docker.com/desktop/mac/#:~:text=Memory%3A%20By%20default%2C%20Docker%20Desktop%20is%20set%20to%20use%202%20GB%20runtime%20memory%2C%20allocated%20from%20the%20total%20available%20memory%20on%20your%20Mac.%20To%20increase%20the%20RAM%2C%20set%20this%20to%20a%20higher%20number.%20To%20decrease%20it%2C%20lower%20the%20number.). By the contrary, Linux users do not have this problem; Docker could use the available memory of the host system which could lead to another kind of problems such as the [out of memory problems](https://docs.docker.com/config/containers/resource_constraints/#understand-the-risks-of-running-out-of-memory).

# Supported Docker versions
This image is officially supported on Docker version **`19.03.11`**.

Please see the [Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

# Documentation

Documentation for this image is stored in [GitHub repo](http://github.com/dbpedia-spotlight/dbpedia-spotlight/wiki).
