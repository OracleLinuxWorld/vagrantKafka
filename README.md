# vagrantKafka
Vagrant to setup Kafka on Oracle Linux


# Ansible in guest VM:

Because this Vagrant system is developed to work on both Windows and Mac
we will need Ansible to be available in the guest VM (Vagrant method: ansible_local).

Ansible will be installed on the guest VM automatically.


# VirtualBox file transfer mechanism:

To be able to use the VirtualBox default transfer mechanism for the
Ansible playbooks we need the VirtualBox utilities installed on the guest VM.

When using the default VirtualBox transfer mechanism to transfer the Ansible playbook files
to the Vagrant guest machine *without* the VirtualBox utilities the following error occurs:

```
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=1000,gid=1000 vagrant /vagrant

The error output from the command was:

/sbin/mount.vboxsf: mounting failed with the error: No such device
```

Using the VBOX image directly from Oracle instead of the Vagrantup.com image
gives us the VirtualBox utilities installed by default.



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
Host kafka_singlenode
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /cygdrive/d/Users/<USERNAME>/Documents/MobaXterm/home/Vagrant/Kafka/.vagrant/machines/kafka_singlenode/virtualbox/private_key
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


Alternatively, use the custom-made controlscript that uses abovementioned supported startup methods.

This script will be installed as:  /etc/init.d/kafka-control.sh
