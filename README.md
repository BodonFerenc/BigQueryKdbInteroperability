# Transferring data between BigQuery and kdb+

This repository contains the code of technical blog post "Transferring data between BigQuery and kdb+". You download sample tables from BigQuey to kdb, or the other way around, from kdb+ to BigQuery. I assume that you already have a GCP accont and a project set up. Also you will need a Cloud Storage to store temporal files.

You need to set up two environment variables
```
$ export project_id="myGCPProjectName"
$ export csbucketname="myCSBucketName"
```

then run `createBQTables.sh` to create sample tables.
