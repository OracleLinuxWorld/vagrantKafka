#!/bin/sh

ANSIBLE_INVENTORY="../vagrant/inventory/hosts"

ZK_HOSTS=`ansible-inventory --list -i $ANSIBLE_INVENTORY | jq -r '.kafka_brokers[] | @sh'`

echo $ZK_HOSTS | sed s/\ /\\n/g | sed s/\'//g | while read line 
do 
 MODE=`echo stats | nc $line 2181 | grep Mode | sed s/Mode\:\ //g`
 echo "Zookeeper host $line is running as: $MODE"
done

