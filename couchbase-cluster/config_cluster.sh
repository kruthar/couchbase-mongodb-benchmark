#!/usr/bin/env bash
set -e

vagrant up
vagrant ssh -c "/opt/couchbase/bin/couchbase-cli cluster-init -c 127.0.0.1:8091 --cluster-init-username=couchbase --cluster-init-password=couchbase --cluster-init-port=8091 --cluster-init-ramsize=512" cb1.benchmark
sleep 1
vagrant ssh -c "/opt/couchbase/bin/couchbase-cli server-add -c 127.0.0.1:8091 -u couchbase -p couchbase --server-add=cb2.benchmark:8091 --server-add-username=couchbase --server-add-password=couchbase" cb1.benchmark
sleep 1
vagrant ssh -c "/opt/couchbase/bin/couchbase-cli server-add -c 127.0.0.1:8091 -u couchbase -p couchbase --server-add=cb3.benchmark:8091 --server-add-username=couchbase --server-add-password=couchbase" cb1.benchmark
sleep 1
vagrant ssh -c "/opt/couchbase/bin/couchbase-cli rebalance -c 127.0.0.1:8091 -u couchbase -p couchbase" cb1.benchmark
