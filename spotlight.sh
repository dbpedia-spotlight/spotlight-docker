#!/bin/sh

LANG=$1

DIRECTORY=/opt/spotlight/models/$LANG
echo "Selected language: $LANG"

if [ -d "$DIRECTORY" ]
then
     echo "/opt/spotlight/models/$LANG http://0.0.0.0:80/rest/"
     java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight.jar /opt/spotlight/models/$LANG http://0.0.0.0:80/rest
else
      QUERY="PREFIX dataid: <http://dataid.dbpedia.org/ns/core#>
      PREFIX dataid-cv: <http://dataid.dbpedia.org/ns/cv#>
      PREFIX dct: <http://purl.org/dc/terms/>
      PREFIX dcat:  <http://www.w3.org/ns/dcat#>

      SELECT DISTINCT ?file WHERE {
 	?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/spotlight/spotlight-model> .
	?dataset dcat:distribution ?distribution .
	{
		?distribution dct:hasVersion ?latestVersion 
		{
			SELECT (?version as ?latestVersion) WHERE { 
				?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/spotlight/spotlight-model> . 
				?dataset dct:hasVersion ?version . 
			} ORDER BY DESC (?version) LIMIT 1 
		}
                ?distribution dataid:contentVariant '$LANG'^^xsd:string . 
	}
	?distribution dcat:downloadURL ?file .
       }"

      RESULT=`curl --data-urlencode query="$QUERY" --data-urlencode format="text/tab-separated-values" https://databus.dbpedia.org/repo/sparql | sed 's/"//g' | grep -v "^file$" | head -n 1 `
      echo $RESULT
      curl -O  $RESULT
      tar -C /opt/spotlight/models -xvf spotlight-model_lang=$LANG.tar.gz
      rm spotlight-model_lang=$LANG.tar.gz
      echo "/opt/spotlight/models/$LANG http://0.0.0.0:80/rest/"
      java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight.jar /opt/spotlight/models/$LANG http://0.0.0.0:80/rest
fi
