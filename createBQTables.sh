#!/bin/bash

project_id=$1
location=US

echo "Creating dataset..."
bq mk --dataset --location=$location --description "Test dataset for interoperability of BigQuery and kdb" $project_id:bqkdb

echo "Creating a simple table with all types of coluns"
bq mk --table $project_id:bqkdb.allBQSimpleTypes \
stringCol:STRING,intCol:INTEGER,floatCol:FLOAT,boolCol:BOOLEAN,tsCol:TIMESTAMP,dateCol:DATE,timeCol:TIME,dtCol:DATETIME

echo "Inserting some dummy data..."
bq query --use_legacy_sql=false \
"INSERT INTO \`$project_id.bqkdb.allBQSimpleTypes\` \
VALUES (\"GOOG\", 42, 100.3, True, TIMESTAMP(\"2019-11-05 17:45:00\", \"America/Los_Angeles\"), CURRENT_DATE(), CURRENT_TIME(), CURRENT_DATETIME()), \
(\"AAPL\", 200, 104.9, False, CURRENT_TIMESTAMP, CURRENT_DATE(), CURRENT_TIME(), CURRENT_DATETIME())"

echo "Creating a table with some array columns..."
bq mk --table $project_id:bqkdb.safeBQTypesArray mySchema.json

echo "Inserting some dummy data..."
bq query --use_legacy_sql=false \
"INSERT INTO \`$project_id.bqkdb.safeBQTypesArray\` \
VALUES ([\"GOOG\", \"AAPL\"], [100.3, 104.9], [42, 200]), \
([\"BGT\", \"MA\"], [98.3, 110.2], [4, 1000])"

echo "You are set up!"
