# Transferring data between BigQuery and kdb+

This repository contains the code of technical blog post "Transferring data between BigQuery and kdb+". You download sample tables from BigQuery to kdb+, or the other way around, from kdb+ to BigQuery. I assume that you already have a GCP account and a project set up. Also, you will need an account with Cloud Storage access privileges to store temporal files.

You need to set up two environment variables
```
$ export project_id="myGCPProjectName"
$ export csbucketname="myCSBucketName"
```

then run `createBQTables.sh` to create sample tables.

The script creates a dataset called `bqkdb` and creates two BigQuery tables
   * `allBQSimpleTypes`, that contain columns of all types
   * `safeBQTypesArray`, that contains array columns of string, integer and float

Once your tables are set up, you can open the jupyter notebooks.

```
$ jupyter notebook simpleCSV.ipynb
```

Notebooks [simpleCSV.ipynb](https://github.com/BodonFerenc/BigQueryKdbInteroperability/blob/master/simpleCSV.ipynb), [simpleJSON.ipynb](https://github.com/BodonFerenc/BigQueryKdbInteroperability/blob/master/simpleJSON.ipynb) and simpleEmbedPy.ipynb work with simple table and demonstrate CSV, JSON and embedPy-based transfer respectively. Similarly, [arrayJSON.ipynb](https://github.com/BodonFerenc/BigQueryKdbInteroperability/blob/master/arrayJSON.ipynb) and arrayEmbedPy.ipynb demonstrate table transfer in which the table has array columns.
