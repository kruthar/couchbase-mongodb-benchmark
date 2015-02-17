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

5. Install YCSB Framework
    
    ```sh
    git clone https://github.com/kruthar/YCSB.git
    cd YCSB
    mvn clean package
    ```

6. Ensure that YCSB project is in the same directory as the couchbase-mongodb-benchmark project. They are required to be in the same directory for the predefined sample workloads to work correctly.

Getting Started
---------------
Once you have YCSB and the couchbase-mongodb-benchmark projects sitting in the same directory and the YCSB Framework project has been built you can fire up a Couchbase or MongoDB cluster with one command.

For Couchbase:

```sh
cd couchbase-mongodb-benchmark/couchbase-cluster
./config_cluster.sh
```

For MongoDB:

```sh
cd couchbase-mongodb-benchmark/mongodb-cluster
./config_cluster.sh
```

Running the sample workload is also a snap.

For Couchbase

```sh
cd couchbase-mongodb-benchmark/couchbase-cluster/workloads/workloada
./run_workloads.sh
```

For MongoDB:

```sh
couchbase-mongodb-benchmark/mongodb-cluster/workloads/workloads
./run_workloads.sh
```
