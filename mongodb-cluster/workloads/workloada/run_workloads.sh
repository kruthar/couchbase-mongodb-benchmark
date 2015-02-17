#!/usr/bin/env bash

# Script to run a workload on a couchbase cluster
DATE=$(date +"%Y%m%d%H%M")
workload=workloada

# We are dealing with local files so put the user in the right dir
cd ${0%/*}

ycsb=../../../../YCSB/bin/ycsb

vagrant ssh -c 'mongo ycsb --eval "db.dropDatabase()"' config1.benchmark
vagrant ssh -c 'mongo ycsb --eval "sh.enableSharding(\"ycsb\")"' config1.benchmark
vagrant ssh -c 'mongo ycsb --eval "sh.shardCollection(\"ycsb.usertable\", {\"_id\":1})"' config1.benchmark

if [ ! -d "results" ]; then
	mkdir results
fi

$ycsb load mongodb -P $workload.properties -P mongodb.properties -s > results/$workload-load-$DATE.txt
$ycsb run mongodb -P $workload.properties -P mongodb.properties -s > results/$workload-run-$DATE.txt
