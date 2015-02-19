# couchbase-mongodb-benchmark
Repo for resources in our benchmarking project of Couchbase and MongoDB

Links
-----
* Original YCSB Framework Location: http://github.com/brianfrankcooper/YCSB
* Avalon YCSB Fork with Couchbase: https://github.com/kruthar/YCSB

Prerequisites
-------------
1. Install Virtualbox: https://www.virtualbox.org/wiki/Downloads

2. Install Vagrant: http://www.vagrantup.com/downloads.html

3. Install necessary Vagrant plugins:
    
    ```sh
    vagrant plugin install vagrant-hostmanager
    vagrant plugin install vagrant-cachier
    ```

4. Install Ansible

    ```sh
    brew install ansible
    ```

Getting Started
---------------
Once you hve the project pulled down you can bootup a Couchbase or MongoDB cluster with just a couple of commands, then run a sample workload with just a couple more.
NOTE: We are using the vagrant-cachier plugin to cache packages where we can, but they will still all have to be downloaded the first time you initialize a cluster, so it could take awhile.

Start a cluster for Couchbase:

```sh
cd couchbase-mongodb-benchmark/couchbase-cluster
./config_cluster.sh
```

For MongoDB:

```sh
cd couchbase-mongodb-benchmark/mongodb-cluster
./config_cluster.sh
```

To run a workload using YCSB you have to initilize the YCSB submodule, then build the YCSB project.

```sh
git submodule init
git submodule update
cd YCSB
mvn clean package
```

Run a sample workload for Couchbase:

```sh
cd couchbase-mongodb-benchmark/couchbase-cluster/workloads/workloada
./run_workloads.sh
```

For MongoDB:

```sh
couchbase-mongodb-benchmark/mongodb-cluster/workloads/workloads
./run_workloads.sh
```
