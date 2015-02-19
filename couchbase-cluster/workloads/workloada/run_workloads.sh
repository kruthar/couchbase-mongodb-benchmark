#!/usr/bin/env bash

# Script to run a workload on a couchbase cluster

DATE=$(date +"%Y%m%d%H%M")
workload=workloada
bucket=benchmark
user=couchbase
password=couchbase
ram=512
replicas=2

# We are dealing with local files so put the user in the right dir
cd ${0%/*}

ycsb="../../../YCSB/bin/ycsb"

vagrant ssh -c "/opt/couchbase/bin/couchbase-cli bucket-delete -c 127.0.0.1:8091 --bucket=$bucket -u $user -p $password" cb1.benchmark
sleep 2
vagrant ssh -c "/opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=$bucket --bucket-type=couchbase --bucket-port=11211 --bucket-ramsize=$ram  --bucket-replica=$replicas -u $user -p $password" cb1.benchmark
sleep 2
curl -X PUT -H 'Content-Type: application/json' http://couchbase:couchbase@cb1.benchmark:8092/$bucket/_design/indexes -d @workloada.ddoc
sleep 2

if [ ! -d "results" ]; then
	mkdir results
fi

$ycsb load couchbase -P $workload.properties -P couchbase.properties -s > results/$workload-load-$DATE.txt
$ycsb run couchbase -P $workload.properties -P couchbase.properties -s > results/$workload-run-$DATE.txt
