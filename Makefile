PHONY: provision up brokers topics zookeeper connector demo elastic_health elastic_indices elastic_allocation elastic

provision:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook.yml

up:
	vagrant up

brokers:
	curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://172.28.129.204:8082/brokers' | jq '.'

topics:
	curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://172.28.129.204:8082/topics' | jq '.'

zookeeper:
	cd scripts && ./zookeeper_get_status.sh

connector:
	curl -s -XGET -H 'Accept: application/json' 'http://172.28.129.204:8083/connector-plugins' | jq '.'

test:	brokers topics zookeeper connector

demo:
	cd scripts && ./demo.sh

elastic_health:
	curl -s -XGET -H 'Accept: application/json' -H 'Content-Type: application/json' 172.28.129.208:9200/_cat/health | jq '.'

elastic_indices:
	curl -s -XGET -H 'Accept: application/json' -H 'Content-Type: application/json' 172.28.129.208:9200/_cat/indices | jq '.'

elastic_allocation:
	curl -s -XGET -H 'Accept: application/json' -H 'Content-Type: application/json' 172.28.129.208:9200/_cat/allocation | jq '.'

elastic: elastic_health elastic_indices elastic_allocation

restart:
	ansible-playbook -i vagrant/inventory/dc-1/hosts vagrant/ansible-playbook_restart_kafka_services.yml
	ansible-playbook -i vagrant/inventory/dc-2/hosts vagrant/ansible-playbook_restart_kafka_services.yml
