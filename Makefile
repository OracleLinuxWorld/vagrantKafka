PHONY: provision up

provision:
	ansible-playbook -i vagrant/inventory/hosts vagrant/ansible-playbook.yml

up:
	vagrant up
