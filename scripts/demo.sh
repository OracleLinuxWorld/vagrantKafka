#!/bin/sh

###
### Variables
###

ANSIBLE_INVENTORY="../vagrant/inventory/hosts"
ZK_HOSTS=`ansible-inventory --list -i $ANSIBLE_INVENTORY | jq -r '.kafka_brokers[] | @sh'`
FIRST_BROKER=`ansible-inventory --list -i $ANSIBLE_INVENTORY | jq -r '.kafka_brokers[] | [limit(1;.[])] | @sh' | sed s/\'//g`
FIRST_WORKERNODE=`ansible-inventory --list -i $ANSIBLE_INVENTORY | jq -r '.kafka_worker_nodes[] | [limit(1;.[])] | @sh' | sed s/\'//g`
TOPIC_NAME="test"
TXT_FEED="./demo.txt"

PORT_BROKER="9092"
PORT_REST_PROXY="8082"
PORT_ZOOKEEPER="2181"


###
### Create and verify a test topic
###

# Check if topic exists by checking the REST API on worker node
TOPIC_EXISTS=`curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://$FIRST_WORKER_NODE:$PORT_REST_PROXY/topics/$TOPIC_NAME' | jq  '.message | @text'`

# Create topic if not exists
if   [[ "$TOPIC_EXISTS" =~ "Topic not found" ]]; then
    echo "OK: Topic $TOPIC_NAME does not exist yet."
    echo "Creating test topic: $TOPIC_NAME"
    echo "Talking to broker: $FIRST_BROKER"
    kafka-topics --create --zookeeper $FIRST_BROKER:2181 --replication-factor 3 --partitions 1 --topic $TOPIC_NAME
    sleep 2
else
    echo "Topic $TOPIC_NAME already exists. Not creating again."
fi



###
### Verify topic
###

echo "Verify topic"

kafka-topics --zookeeper $FIRST_BROKER:$PORT_ZOOKEEPER --describe --topic $TOPIC_NAME

sleep 2


###
### Consume messages from a test topic:
###


# Check if consumer has already been started by checking local process list
CONSUMER_EXISTS=`ps aux | grep "ConsoleConsumer"`

# Start consumer if not already running
if   [[ "$CONSUMER_EXISTS" =~ "ConsoleConsumer --bootstrap-server $FIRST_BROKER:$PORT_BROKER --topic $TOPIC_NAME" ]]; then
    echo "Consumer already running. Not starting again."
else
    echo "OK: Consumer not yet running."
    echo "Starting consumer process in the background. Talking to broker: $FIRST_BROKER"
    kafka-console-consumer --bootstrap-server $FIRST_BROKER:$PORT_BROKER --topic $TOPIC_NAME --from-beginning &
    sleep 2
fi


###
### Produce messages to a test topic:
###

echo "Going to push 10000 test messages to Kafka.."
echo "Any messages you see scrolling by have been processed correctly by Kafka..."
echo "Sleeping for 3 seconds..."
sleep 3
cat $TXT_FEED | kafka-console-producer --broker-list $FIRST_BROKER:$PORT_BROKER --topic $TOPIC_NAME


