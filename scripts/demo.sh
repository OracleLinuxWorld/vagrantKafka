#!/bin/sh

ANSIBLE_INVENTORY="../vagrant/inventory/hosts"

ZK_HOSTS=`ansible-inventory --list -i $ANSIBLE_INVENTORY | jq -r '.kafka_brokers[] | @sh'`

FIRST_BROKER=`ansible-inventory --list -i $ANSIBLE_INVENTORY | jq -r '.kafka_brokers[] | [limit(1;.[])] | @sh' | sed s/\'//g`

TOPIC_NAME="test"

TXT_FEED="./demo.txt"


#echo $ZK_HOSTS | sed s/\ /\\n/g | sed s/\'//g | while read line 
#do 
# MODE=`echo stats | nc $line 2181 | grep Mode | sed s/Mode\:\ //g`
# echo "Zookeeper host $line is running as: $MODE"
#done


###
### Create and verify a test topic
###

echo "Creating test topic: $TOPIC_NAME"
echo "Talking to broker: $FIRST_BROKER"

kafka-topics --create --zookeeper $FIRST_BROKER:2181 --replication-factor 3 --partitions 1 --topic $TOPIC_NAME

sleep 2


###
### Verify topic
###

echo "Verify topic"

kafka-topics --zookeeper $FIRST_BROKER:2181 --describe --topic $TOPIC_NAME

sleep 2


###
### Consume messages from a test topic:
###

# copy paste the following line as a whole:

echo "Starting consumer process in the background...."

kafka-console-consumer --bootstrap-server $FIRST_BROKER:9092 --topic $TOPIC_NAME --from-beginning &



###
### Produce messages to a test topic:
###

echo "Sleeping for 3 seconds... any messages you see scrolling by have been processed correctly by Kafka..."
sleep 3
cat $TXT_FEED | kafka-console-producer --broker-list $FIRST_BROKER:9092 --topic $TOPIC_NAME


