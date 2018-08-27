# vagrantKafka
Vagrant VM set to run Confluent Kafka on Oracle Linux


# Regarding Ansible
Please run the following commands:
```
vagrant up
ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook.yml
```

The initial Vagrant step does *not* provision the VMs.
You need to explicitly run 'ansible-playbook'.

# Regarding port numbers that Kafka uses

```
Component	                          Port
Apache Kafka brokers (plain text)	  9092
Confluent Control Center	          9021
Kafka Connect REST API	            8083
REST Proxy	                        8082
Schema Registry REST API	          8081
ZooKeeper	                          2181
```


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

In the tab "Advanced SSH settings" select "Use private key" and select the location of the
"IdentityFile" as mentioned above.


# Notes on "Production Environment"

The confluent control script that is pre-installed by the Confluent packages
is very convenient for quickly setting up Kafka.

However! Confluent does not recommend this to be used on production setups
because a.o. it skips a number of important validation steps.

Please use the scripts below to control the start/stop of kafka and its components.

* Start ZooKeeper.  Run this command in its own terminal.
$ <path-to-confluent>/bin/zookeeper-server-start <path-to-confluent>/etc/kafka/zookeeper.properties

* Start Kafka.  Run this command in its own terminal.
$ <path-to-confluent>/bin/kafka-server-start <path-to-confluent>/etc/kafka/server.properties

* Start Schema Registry. Run this command in its own terminal.
$ <path-to-confluent>/bin/schema-registry-start \
<path-to-confluent>/etc/schema-registry/schema-registry.properties

* Start Connect in distributed mode. Run this command in its own terminal.
$ <path-to-confluent>/bin/connect-distributed \
<path-to-confluent>/etc/schema-registry/connect-avro-distributed.properties


Alternatively, use the Confluent controlscripts.
The following services are available for use with systemctl:

* confluent-control-center
* confluent-kafka
* confluent-zookeeper
* confluent-kafka-connect
* confluent-ksql
* confluent-kafka-rest
* confluent-schema-registry
