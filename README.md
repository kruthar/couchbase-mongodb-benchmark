# couchbase-mongodb-benchmark
Repo for resources in our benchmarking project of Couchbase and MongoDB

Links
-----
Original YCSB Framework Location: http://github.com/brianfrankcooper/YCSB
Avalon YCSB Fork with Couchbase: https://github.com/kruthar/YCSB

Prerequisites
-------------
1. Install Vagrant: http://www.vagrantup.com/downloads.html

2. Install necessary Vagrant plugins:
    
    ```sh
    vagrant plugin install vagrant-hostmanager
    vagrant plugin install vagrant-cachier
    ```

3. Install Ansible

    ```sh
    brew install ansible
    ```

4. Install YCSB Framework
    
    ```sh
    git clone https://github.com/kruthar/couchbase-mongodb-benchmark.git
    cd couchbase-mongodb-benchmark
    mvn clean package
    ```

5. Ensure that YCSB project is in the same directory as the couchbase-mongodb-benchmark project. They are required to be in the same directory for the predefined sample workloads to work correctly.
