.PHONY: all up-dc1 up-dc2 up provision-dc1 provision-dc2 provision restart-dc1 restart-dc2 restart brokers topics demo elastic_health elastic_indices elastic_allocation elastic all-dc1 all-dc2
.DEFAULT_GOAL := all

all: all-dc1 all-dc2 kafka-demo 

all-dc1: up-dc1 provision-dc1 restart-dc1

all-dc2: up-dc2 provision-dc2 restart-dc2

up-dc1:
	vagrant up kafka_broker_01
	vagrant up kafka_broker_02
	vagrant up kafka_broker_03
	vagrant up kafka_workernode_01
	vagrant up kafka_workernode_02
	vagrant up kafka_control_center_01
	vagrant up mysql_node_01
	vagrant up elasticsearch_node_01

up-dc2:
	vagrant up dc2_kafka_broker_01
	vagrant up dc2_kafka_broker_02
	vagrant up dc2_kafka_broker_03
	vagrant up dc2_kafka_workernode_01
	vagrant up dc2_kafka_workernode_02
	vagrant up dc2_kafka_control_center_01
	vagrant up dc2_mysql_node_01
	vagrant up dc2_elasticsearch_node_01

up:	up-dc1 up-dc2

provision-dc1:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook.yml --limit "dc1"

provision-dc2:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook.yml --limit "dc2"

provision:	provision-dc1 provision-dc2 kafka-demo

brokers:
	curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://172.28.129.204:8082/brokers' | jq '.'

topics:
	curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://172.28.129.204:8082/topics' | jq '.'

demo:
	cd scripts && ./demo.sh

elastic_health:
	curl -s -XGET -H 'Accept: application/json' -H 'Content-Type: application/json' 172.28.129.208:9200/_cat/health | jq '.'

elastic_indices:
	curl -s -XGET -H 'Accept: application/json' -H 'Content-Type: application/json' 172.28.129.208:9200/_cat/indices | jq '.'

elastic_allocation:
	curl -s -XGET -H 'Accept: application/json' -H 'Content-Type: application/json' 172.28.129.208:9200/_cat/allocation | jq '.'

elastic: elastic_health elastic_indices elastic_allocation

restart-dc1:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook_restart_kafka_services.yml  --limit "dc1"

restart-dc2:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook_restart_kafka_services.yml  --limit "dc2"

restart: restart-dc1 restart-dc2

kafka-demo:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook_demo_script.yml  --limit "dc1"
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook_demo_script.yml  --limit "dc2"
