PHONY: provision up brokers topics zookeeper connector demo

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
