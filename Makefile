.PHONY: all up-dc1 up-dc2 up provision-dc1 provision-dc2 provision restart-dc1 restart-dc2 restart brokers topics demo elastic_health elastic_indices elastic_allocation elastic
.DEFAULT_GOAL := all

all:	up-dc1 provision-dc1 restart-dc1

up-dc1:
	vagrant up kafka_broker_01
	vagrant up kafka_broker_02
	vagrant up kafka_broker_03
	vagrant up kafka_workernode_01
	vagrant up kafka_workernode_02
	vagrant up mysql_node_01
	vagrant up elasticsearch_node_01

up-dc2:
	vagrant up dc2_kafka_broker_01
	vagrant up dc2_kafka_broker_02
	vagrant up dc2_kafka_broker_03
	vagrant up dc2_kafka_workernode_01
	vagrant up dc2_kafka_workernode_02
	vagrant up dc2_mysql_node_01
	vagrant up dc2_elasticsearch_node_01

up:	dc1 dc2

provision-dc1:
	ansible-playbook -i vagrant/inventory/dc-1/hosts vagrant/ansible-playbook.yml

provision-dc2:
	ansible-playbook -i vagrant/inventory/dc-2/hosts vagrant/ansible-playbook.yml

provision:	provision-dc1 provision-dc2

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
	ansible-playbook -i vagrant/inventory/dc-1/hosts vagrant/ansible-playbook_restart_kafka_services.yml

restart-dc2:
	ansible-playbook -i vagrant/inventory/dc-2/hosts vagrant/ansible-playbook_restart_kafka_services.yml

restart: restart-dc1 restart-dc2

kafka-demo:
	ansible-playbook -i vagrant/inventory/dc-1/hosts vagrant/ansible-playbook_demo_script.yml
	ansible-playbook -i vagrant/inventory/dc-2/hosts vagrant/ansible-playbook_demo_script.yml
