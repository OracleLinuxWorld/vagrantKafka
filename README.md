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
Will spin up a dual DC setup. After spinning up the VMs for a the DCs Ansible will be automatically called to provision the VMs.

* make [up-dc1 | up-dc2]
Will only spin up either dc1 or dc2. No Ansible scripting will be done.

* make up
Will spin up both dc1 and dc2.

* make [provision-dc1 | provision-dc2]
Will only (re-) provision VMs belonging to either dc1 or dc2.
Requires Vms to already be up.

* make provision
Will provision both dc1 and dc2.

* make mirrormaker
Will provision a MirrorMaker instance on the TARGET DC. In this case the process will be started on DC2. It will consume from DC1 and act as a producer for DC2.



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


# MirrorMaker

An additional service "confluence-mirrormaker" has been added. This newly added service can be managed through the regular systemctl commands.

Example:

```
[vagrant@dc2_kafka_workernode_01 ~]$ sudo systemctl status confluent-mirrormaker -l
● confluent-mirrormaker.service - Apache Kafka - MirrorMaker
   Loaded: loaded (/usr/lib/systemd/system/confluent-mirrormaker.service; static; vendor preset: disabled)
   Active: active (running) since Fri 2018-09-21 11:28:37 UTC; 2min 52s ago
 Main PID: 14189 (java)
   CGroup: /system.slice/confluent-mirrormaker.service
           └─14189 java -Xmx256M -server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -Djava.awt.headless=true -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dkafka.logs.dir=/var/log/kafka -Dlog4j.configuration=file:/etc/kafka/tools-log4j.properties -cp /bin/../share/java/kafka/*:/bin/../share/java/confluent-support-metrics/*:/usr/share/java/confluent-support-metrics/* kafka.tools.MirrorMaker --consumer.config /etc/kafka/consumer_dc1_to_dc2.properties --producer.config /etc/kafka/producer_dc1_to_dc2.properties --num.streams 3 --abort.on.send.failure true --whitelist test test2 test3 test4 test5

Sep 21 11:28:37 dc2_kafka_workernode_01 systemd[1]: Started Apache Kafka - MirrorMaker.
Sep 21 11:28:37 dc2_kafka_workernode_01 systemd[1]: Starting Apache Kafka - MirrorMaker...
[vagrant@dc2_kafka_workernode_01 ~]$

```

*NOTE!!!*
Do NOT start MirrorMaker on BOTH DCs. This will cause a neverending replication loop between both Kafka clusters!
MirrorMaker does NOT have support for preventing this.
Confluent Replicator is needed if you want to replicate both ways! 
