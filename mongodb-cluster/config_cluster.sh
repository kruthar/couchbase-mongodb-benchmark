#!/usr/bin/env bash

vagrant up

# Start the Router Daemon on all three config servers
vagrant ssh -c 'sudo mongos --configdb config1.benchmark:27019,config2.benchmark:27019,config3.benchmark:27019 --fork --logpath /var/log/mongodb/mongos.log' config1.benchmark
vagrant ssh -c 'sudo mongos --configdb config1.benchmark:27019,config2.benchmark:27019,config3.benchmark:27019 --fork --logpath /var/log/mongodb/mongos.log' config2.benchmark
vagrant ssh -c 'sudo mongos --configdb config1.benchmark:27019,config2.benchmark:27019,config3.benchmark:27019 --fork --logpath /var/log/mongodb/mongos.log' config3.benchmark

# Configure Replica Set 1
vagrant ssh -c 'mongo --eval "rs.initiate()"' rep11.benchmark
vagrant ssh -c 'mongo --eval "rs.add(\"rep12.benchmark\")"' rep11.benchmark
vagrant ssh -c 'mongo --eval "rs.add(\"rep13.benchmark\")"' rep11.benchmark

# Configure Replica Set 2
vagrant ssh -c 'mongo --eval "rs.initiate()"' rep21.benchmark
vagrant ssh -c 'mongo --eval "rs.add(\"rep22.benchmark\")"' rep21.benchmark
vagrant ssh -c 'mongo --eval "rs.add(\"rep23.benchmark\")"' rep21.benchmark
sleep 2

# Add Shards to cluster
vagrant ssh -c 'mongo --eval "sh.addShard(\"rs1/rep21.benchmark:27017\")"' config1.benchmark
vagrant ssh -c 'mongo --eval "sh.addShard(\"rs2/rep21.benchmark:27017\")"' config1.benchmark

# Don't enable any collections. Wait to do that when you run the workloads.
