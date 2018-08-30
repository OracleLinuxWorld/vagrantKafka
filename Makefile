PHONY: provision up brokers topics

provision:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook.yml

up:
	vagrant up

brokers:
	curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://172.28.129.204:8082/brokers' | jq '.'

topics:
	curl -s -XGET -H 'Accept: application/vnd.kafka.v2+json' 'http://172.28.129.204:8082/topics' | jq '.'
