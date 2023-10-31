#!/bin/sh

LANG=$1

MODELFOLDER=/opt/spotlight
cd $MODELFOLDER

DIRECTORY=/opt/spotlight/models/$LANG
echo "Selected language: $LANG"
if [ -d "$DIRECTORY" ]
then
     echo "/opt/spotlight/$LANG http://0.0.0.0:80/rest/"
     if [[ $LANG == "en" ]]
     then
	 java -Dfile.encoding=UTF-8 -Xmx15G -jar /opt/spotlight/dbpedia-spotlight.jar /opt/spotlight/models/$LANG http://0.0.0.0:80/rest
     else
	 java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight.jar /opt/spotlight/models/$LANG http://0.0.0.0:80/rest
     fi

else
      QUERY="PREFIX dataid: <https://dataid.dbpedia.org/databus#>
      PREFIX dataid-cv: <https://dataid.dbpedia.org/databus-cv#>
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
                ?distribution dataid-cv:lang '$LANG' . 
	}
	?distribution dcat:downloadURL ?file .
       }"

      RESULT=`curl --data-urlencode query="$QUERY" -H 'accept:text/tab-separated-values' https://databus.dbpedia.org/sparql | sed 's/"//g' | grep -v "^file$" | head -n 1`
      echo $RESULT
      curl -LO  $RESULT
      tar -C /opt/spotlight/models -xvf spotlight-model_lang=$LANG.tar.gz
      rm spotlight-model_lang=$LANG.tar.gz
      echo "/opt/spotlight/models/$LANG http://0.0.0.0:80/rest/"
      if [[ $LANG == "en" ]]
      then
	java -Dfile.encoding=UTF-8 -Xmx15G -jar /opt/spotlight/dbpedia-spotlight.jar /opt/spotlight/models/$LANG http://0.0.0.0:80/rest
       else
	 java -Dfile.encoding=UTF-8 -Xmx10G -jar /opt/spotlight/dbpedia-spotlight.jar /opt/spotlight/models/$LANG http://0.0.0.0:80/rest
      fi

fi
