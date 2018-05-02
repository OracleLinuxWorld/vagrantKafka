Vagrant.configure("2") do |config|

  # Define first Kafka node
  config.vm.define "kafka_node_01" do |kafka_node_01|
    # synced_folder only used in ansible_local setting
    # kafka_node_01.vm.synced_folder "./vagrant", "/vagrant"
    kafka_node_01.vm.box = "ol7-latest"
    kafka_node_01.vm.hostname = 'kafka-node-01'
    kafka_node_01.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
    kafka_node_01.vm.network :"private_network", type: "dhcp"
    kafka_node_01.vm.network "forwarded_port", guest: 9092, host: 9092, protocol: "tcp"
    kafka_node_01.vm.network "forwarded_port", guest: 9021, host: 9021, protocol: "tcp"
    kafka_node_01.vm.network "forwarded_port", guest: 8083, host: 8083, protocol: "tcp"
    kafka_node_01.vm.network "forwarded_port", guest: 8082, host: 8082, protocol: "tcp"
    kafka_node_01.vm.network "forwarded_port", guest: 8081, host: 8081, protocol: "tcp"
    kafka_node_01.vm.network "forwarded_port", guest: 2181, host: 2181, protocol: "tcp"
    kafka_node_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_node_01"]
    end # End of "kafka_node_01.vm.provider"
  end   # End of config.vm.define "kafka_node_01"



  # Define Kafka worker node
  config.vm.define "kafka_workernode_01" do |kafka_workernode_01|
    # synced_folder only used in ansible_local setting
    # kafka_workernode_01.vm.synced_folder "./vagrant", "/vagrant"
    kafka_workernode_01.vm.box = "ol7-latest"
    kafka_workernode_01.vm.hostname = 'kafka-workernode-01'
    kafka_workernode_01.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
    kafka_workernode_01.vm.network :"private_network", type: "dhcp"
    kafka_workernode_01.vm.network "forwarded_port", guest: 3309, host: 3309, protocol: "tcp"
    kafka_workernode_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_workernode_01"]
    end # End of "kafka_workernode_01.vm.provider"
  end   # End of config.vm.define "kafka_workernode_01"


    # Run the same playbook on all hosts
    # :vars section provided as example on passing variables to
    # ansible in possible future versions
    config.vm.provision "ansible" do |ansible|
          ansible.verbose = "v"
          ansible.playbook = "vagrant/ansible-playbook.yml"
          ansible.limit = "all"
          ansible.groups = {
            "all" => ["kafka_node_01", "kafka_workernode_01"],
            "kafkabrokers" => ["kafka_node_01", "kafka_workernode_01"],
            "kafkabrokers:vars" => {"variable1" => "example1",
                                    "variable2" => "example2"}
          }
    end   # End of "config.vm.provision"

end       # End of "Vagrant.configure"
