Directory contains example epayloads retrieved from the list endpoints of each of
the resources, example command:

`o get migrationclusters -o json`

or

`o get migrationplans -o json`

There is also a detail get on a specific instance:

`o get migrationcluster my-new-cluster -o json`

The specific endpoints where these are retrieved from as well as the requests
can be viewed with a higher verbosity argument, for example:

`o get migrationcluster my-new-cluster -o json -v=8`

Shows the http request made:

`GET https://<CLUSTER_HOST>/apis/migrations.openshift.io/v1beta1/namespaces/mig/migrationclusters/my-new-cluster`
