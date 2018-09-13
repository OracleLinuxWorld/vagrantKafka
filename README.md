# vagrantKafka
Vagrant set of VMs to run Confluent Kafka on Oracle Linux.

The complete setup consists of 2 'data centers' to be able to test things like MirrorMaker and Replicator.

A single DC consists of the following VMs:
* 3x Kafka brokers running the following components:
  * the ZooKeeper ensemble and
  * Kafka broker instances

* 2x Kafka worker nodes running the following components:
  * Kafka Connect (and Connect REST API on port 8083)
  * Kafka REST proxy (and API on port 8082)
  * Kafka Schema Registry (and Schema registry API on port 8081)

* 1x Confluent Control Center

* 1x MySQL node for testing MySQL source Connector

* 1x single node Elasticsearch for testing Elasticsearch sink Connector


# Makefile
In the root of the project you will find a Makefile.
This Makefile contains several options to control the environment.

The most common options have been described below:

* make (without arguments)
Will spin up a single DC setup. After spinning up the VMs for a single DC setup Ansible will be automatically called to provision the VMs.

* make [up-dc1 | up-dc2]
Will only spin up either dc1 or dc2. No Ansible scripting will be done.

* make up
Will spin up both dc1 and dc2.

* make [provision-dc1 | provision-dc2]
Will only (re-) provision VMs belonging to either dc1 or dc2.
Requires Vms to already be up.

* make provision
Will provision both dc1 and dc2.



# Regarding port numbers that Kafka uses

```
Component	                          Port
Apache Kafka brokers (plain text)	  9092
Confluent Control Center	          9021
Kafka Connect REST API	            8083
REST Proxy                          8082
Schema Registry REST API	          8081
ZooKeeper client port               2181
ZooKeeper leader port               2888
Zookeeper election port             3888
```

All these ports need to be opened up between all Kafka nodes.


# Note for MobaXterm users!

There is a 'bug' in MobaXterm that does not allow for the default 'vagrant ssh' commands.

Please perform the following command:

vagrant ssh-config

This will produce the following output:

```
Host kafka_node_01
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /cygdrive/d/Users/<USERNAME>/Documents/MobaXterm/home/Vagrant/Kafka/.vagrant/machines/kafka_node_01/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

Please create a seperate SSH session with abovementioned details.

In the tab "Advanced SSH settings" select "Use private key" and select the location of the "IdentityFile" as mentioned above.


# (re-) starting services

For convenience, you will find all the Confluent Kafka service names below.
The following services are available for use with systemctl:

* confluent-control-center
* confluent-kafka
* confluent-zookeeper
* confluent-kafka-connect
* confluent-ksql
* confluent-kafka-rest
* confluent-schema-registry

Example:

```
[vagrant@kafka_broker_01 ~]$ sudo systemctl status confluent-kafka
● confluent-kafka.service - Apache Kafka - broker
   Loaded: loaded (/usr/lib/systemd/system/confluent-kafka.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2018-09-13 07:56:24 UTC; 45min ago
     Docs: http://docs.confluent.io/
 Main PID: 4273 (java)
   CGroup: /system.slice/confluent-kafka.service
           └─4273 java -Xmx1G -Xms1G -server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -Djava.awt.headless=true -Xl...

(...)
Hint: Some lines were ellipsized, use -l to show in full.
[vagrant@kafka_broker_01 ~]$

```
