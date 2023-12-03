# dbpedia on Kubernetes

Kubernetes deployment files for dbpedia spotlight instances.

The PODs have an init container which checks if the language file is in the PersistentVolume, if not it will download it to the PersistentVolume.
The language files are taken from the [DBPedia Databus](https://databus.dbpedia.org/dbpedia/spotlight/spotlight-model/).
If a language file is updated on the Databus just delete the deployment and the PersistentVolume, the initContainer will download the file from the Databus.

## Deployment

Using the deployment file skeleton in the example of Spanish (es):

```bash
sed 's/LANGUAGE/es/g' deployment > deployment-es.yaml`
```

Deploy to the namespace `dbpedia`

```bash
kubectl -n dbpedia apply -f deployment-es.yaml
```

This will create a deployment of a pod with an init container which downloads the language file if it is not present, creates a standard PersistentVolume and a service. The service can be used to port forward a connection to the local machine, or opened to outside with the provided `ingress.yaml` file.

After having started the POD the first time and the language file is downloaded you can set the `securityContext.readOnlyRootFilesystem` in the `deployment-.yaml` to `true`.

The dbpedia spotlight instances are very hungry for resources, it is recommended to use `resource.limits` and `resource.requests` to avoid having the pods evicted. At startup the pods will use more CPU than normal to load the files into memory.

Resource example for the Spanish deployment:

```yaml
        resources:
          limits:
            memory: "9Gi"
            cpu: "1000m"
          requests:
            memory: "8Gi"
            cpu: "30m"
```

The size of the PersistentVolume for all languages can have the size of 1GB, except German and English which need 3GB and 5GB of disk space respectively.

When the language file on the DataBus is updated you need to delete the deployment, change the URL in the initContainer command and re-apply the file. This will delete the PersistentVolume, POD and Service. The new deployment will download the new file through the initContainer.

```bash
kubectl -n dbpedia delete -f deployment-es.yaml
kubectl -n dbpedia apply -f deployment-es.yaml
```

## Ingress

To access the DBPedia instance from outside edit the `ingress.yaml` file to target the desired Service by configuring the `spec.rules.host.backend.service.name` and apply it to kubernetes.

If [cert-manager](https://cert-manager.io/docs/installation/) is running on the cluster make sure to use the correct `cluster-issuer` name.

The URL for the API call is: <https://dbpedia.example.com/LANGUAGE/rest/>