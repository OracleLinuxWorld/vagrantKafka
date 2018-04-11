Vagrant.configure("2") do |config|

  config.vm.define "kafka_singlenode" do |kafka_singlenode|
    kafka_singlenode.vm.synced_folder "./vagrant", "/vagrant"
    kafka_singlenode.vm.box = "ol74"
    kafka_singlenode.vm.hostname = 'kafka-node-01'
    kafka_singlenode.vm.box_url = "http://yum.oracle.com/boxes/oraclelinux/ol74/ol74.box"

    kafka_singlenode.vm.network :"private_network", type: "dhcp"
    kafka_singlenode.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "kafka_singlenode"]
    end
    # Run Ansible from the Vagrant VM
    kafka_singlenode.vm.provision "ansible_local" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "ansible-playbook.yml"
    end

  end
end
